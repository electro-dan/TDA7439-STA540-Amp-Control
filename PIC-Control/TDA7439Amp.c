/*****************************************************************************************************************
 Copyright Daniel Clarke https://electro-dan.co.uk, 9th January 2021
 Free to use and adapt but NO guarantees or support
 For PIC16F873
 
 To fix:
 t mute hold not working - toggles mute
 t mute not applied
 t bluetooth power not toggled
*****************************************************************************************************************/

#include "TDA7439Amp.h"

#define DELAY delay_s(2)
#define DELAY_SHORT    delay_ms(100)

// Configuration registers - PIC16F873
#pragma DATA _CONFIG, _BODEN_OFF & _PWRTE_OFF & _WDT_OFF & _CP_OFF & _XT_OSC // Brown out reset off, Power-up Timer off, Watchdog timer off, Code Protection off, XT oscillator

// Set clock frequency - 4MHz Crystal
#pragma CLOCK_FREQ  4000000

/***********************************************************************************
  Function called once only to initialise variables and setup the PIC registers
************************************************************************************/
void initialise() {
    // IO ports setup
    trisa = 0x00; // all ouptuts
    porta = 0x02; // set to off except LEDLATCH
    //porta = 0x00; // set to off
    trisb = 0x05; // RB0, RB2 are inputs
    portb = 0x08; // set to off, except LEDDISPON (RB3)
    trisc = 0x18; // RC4[SDA] and RC3[SCL] are inputs (for I2C), rest outputs
    portc = 0x18; // set to off, except RC4, RC3 for I2C

    option_reg.NOT_RBPU = 1; // Port B pull-ups disabled
    
    // ADC setup
    adcon0 = 0x00; //  ADC off
    adcon1 = 0x07; // All digital I/O
    
    // Timer calculator: http://eng-serve.com/pic/pic_timer.html
    // Timer 1 setup - interrupt every 131ms seconds 4MHz
    // Timer1 Registers Prescaler= 2 - TMR1 Preset = 0 - Freq = 7.63 Hz - Period = 0.131072 seconds
    t1con.T1CKPS1 = 0;   // bits 5-4  Prescaler Rate Select bits
    t1con.T1CKPS0 = 1;   // bit 4
    t1con.T1OSCEN = 0;   // bit 3 Timer1 Oscillator Enable Control bit 1 = off
    t1con.NOT_T1SYNC = 1;// bit 2 Timer1 External Clock Input Synchronization Control bit...1 = Do not synchronize external clock input
    t1con.TMR1CS = 0;    // bit 1 Timer1 Clock Source Select bit...0 = Internal clock (FOSC/4)
    t1con.TMR1ON = 0;    // bit 0 enables timer
    tmr1h = 0;           // preset for timer1 MSB register
    tmr1l = 0;           // preset for timer1 LSB register

    pie1.TMR1IE = 1; // Timer 1 interrupt
    pir1.TMR1IF = 0; // Clear timer 1 interrupt flag bit

    // Timer 2 setup - interrupt every 890us (0.00088800)
    // 4MHz settings
    // Timer2 Registers Prescaler= 1 - TMR2 PostScaler = 8 - PR2 = 110 - Freq = 1136.36 Hz - Period = 0.000880 seconds
    t2con |= 56;       // bits 6-3 Post scaler 1:1 thru 1:16
    t2con.TMR2ON = 0;  // bit 2 turn timer2 off;
    t2con.T2CKPS1 = 0; // bits 1-0  Prescaler Rate Select bits
    t2con.T2CKPS0 = 0;
    pr2 = IR_PR2_890US;// Preload timer2 comparator value - 0.00088800s
    pir1.TMR2IF = 0;   // Clear timer 2 interrupt flag bit
    pie1.TMR2IE = 1;   // Timer 2 interrupt enabled

    // Setup for RB0 Interrupt [IR Sensor]
    intcon.INTE = 1; // RB0 Interrupt (for IR receive)
    option_reg.INTEDG = 0; // RB0 interrupt should occur on falling edge
    intcon.INTF = 0; // Clear RB0 interrupt flag bit
    
    // Initialise I2C MSSP
    // Master 100KHz
    // TRISC set SCL and SDA pins as inputs above
    // SSPEN (I2C), CKP (clock polarity), SSPM3:SSPM0 -> 1000 = I2C Master mode, 
    sspcon = 0x38; // I2C enabled (SSPEN), Master mode
    sspcon2 = 0x00;
    sspadd = 9; // Clock 100Khz @ 4Mhz Fosc - 4000000 / (4 * (9 + 1))
    sspstat.SMP = 1; // Slew rate disabled
    sspstat.CKE = 0;
    pir2.BCLIF = 0;
    
    // Read in variables from EEPROM
    readData(); 

    delay_s(1);
    RED = 1; // Standby LED

    // Setup and test the MAX7219 8 digit display
    // v1.2 change this to allow for display on pin
    ledOn();
    ledTest();
    delay_s(2);
    // v1.2 clear not needed before off
    ledOff();

    // Interrupt setup
    intcon.PEIE = 1; // Enables all unmasked peripheral interrupts (required for RS232 and I2C)

    // Enable global interrupts
    intcon.GIE = 1;

    // No task at initialisation
    cTask = 0;
}

/***********************************************************************************
  Interrupt handler
************************************************************************************/
void interrupt(void) {
    // external interrupt on RB0 - IR sensor
    if (intcon.INTF) {
        option_reg.INTEDG = intfCounter.0;
        intfCounter++;
        rc5_logicChange++;
        if (rc5_currentState == rc5_idleState) {
            // If the state was idle, start the timer
            rc5_logicInterval = 0;
            rc5_logicChange = 0;
            // Timer 2 should run for about 200us at first
            tmr2 = 0;
            // 4MHz settings
            pr2 = IR_PR2_200US;
            pir1.TMR2IF = 0; // Clear interrupt flag
            t2con.TMR2ON = 1; // Timer 2 is on
            rc5_currentState = rc5_initialWaitState;
        }
        intcon.INTF = 0; //clear interrupt flag.
    }
    // Interrupt on timer2 - IR code https://tamilarduino.blogspot.com/2014/06/ir-remote-philips-rc5-decoding-using.html
    if(pir1.TMR2IF) {
        rc5_pinState = IR_PIN;
        if (rc5_currentState != rc5_initialWaitState) {
            rc5_logicInterval++;
            IR_LED = rc5_logicInterval.0; // Flick IR LED
        }
        char iReset = 0;
        // Switch statement to process IR depending on where/state of the command timer currently expects to be
        switch (rc5_currentState){
            // If in initial wait state - timer completed the first 200us, switch to the normal 890us
            case rc5_initialWaitState:
                // Timer 2 interrupt every 890us
                tmr2 = 0;
                // 111 for exactly 888us
                pr2 = IR_PR2_890US; // Preload timer2 comparator value - 888us (0.000888s)
                // Switch to start bit state
                rc5_currentState = rc5_startBitState;
                break;
            // If in start bit state - check for (second) start bit, Logic on RB0 must change in 890us or considers as a fault signal.
            case rc5_startBitState:
                if ((rc5_logicInterval == 1) && (rc5_logicChange == 1)) {
                    // Valid start bits were found
                    rc5_logicInterval = 0;
                    rc5_logicChange = 0;
                    rc5_bitCount = 0;
                    rc5_inputData = 0;
                    rc5_currentState = rc5_captureBitState; // Switch to capturing state
                } else {
                    iReset = 1;
                }
                break;
            // If in capture bit state - sample RB0 logic every 1780us (rc5_logicInterval = 2)
            // Data is only valid if the logic on RB0 changed
            // Data is stored in rc5_command and rc5_address
            case rc5_captureBitState:
                // Logic interval must be 2 - 1780us
                if(rc5_logicInterval == 2) {
                    // Logic change must occur 2 times or less, otherwise it is invalid
                    if(rc5_logicChange <= 2) {
                        rc5_logicInterval = 0;
                        rc5_logicChange = 0;
                        // If the number of bits received is less than 12, shift the new bit into the inputData
                        if(rc5_bitCount < 12) {
                            rc5_bitCount++;
                            rc5_inputData <<= 1; // Shift recorded bits to the left
                            if(rc5_pinState == 1) {
                                rc5_inputData.0 = 1; // Add the new bit in
                            }
                        } else {
                            // All 12 bits received
                            rc5_command = rc5_inputData & 0x3F; // 00111111 - command is the last 6 bits
                            rc5_inputData >>= 6; // Shift 6 bits right, clearing command
                            rc5_address = rc5_inputData & 0x1F; // 00011111 - address is now the last 5 bits
                            rc5_inputData >>= 5; // Shift 5 bits right, clearing address
                            // Last bit is the flick bit
                            rc5_flickBit = rc5_inputData;
                            
                            // Flag this task to the task array - IR command will be processed in the main loop
                            cTask.TASK_INT_EXT0 = 1;

                            // Command finished - reset status
                            iReset = 1;
                        }
                    } else {
                        // Not valid - reset status
                        iReset = 1;
                    }
                }
                break;
            default: 
                iReset = 1;
        }
        
        // Reset status if not valid
        if (iReset) {
            // Not valid - reset status
            rc5_currentState = rc5_idleState;
            t2con.TMR2ON = 0; // Disable Timer 2
            option_reg.INTEDG = 0; // Interrupt on falling edge
            IR_LED = 0; // switch off IR LED
        }
        pir1.TMR2IF = 0; // Clear interrupt flag
    }
    // timer 1 interrupt - process mute button released
    if (pir1.TMR1IF) {
        // timer 1 will interrupt every 131ms with a 1:2 prescaler at 4MHz
        // This is just longer than an RC5 message
        
        // If held more than 14 times (114ms * 14 is just over 1.5 seconds), enter function mode
        if (iMuteHeld < 15) {
            // flag for muting
            cTask.TASK_TIMER1_MUTE = 1;
        }
        
        pir1.TMR1IF = 0; // Clear interrupt flag
    }
}

void timer1Reset() {
    // switch off timer, and reset counters
    t1con.TMR1ON = 0;
    tmr1h = 0;
    tmr1l = 0;
}

/***********************************************************************************
  EEPROM read and write methods
************************************************************************************/
void saveData() {
    char didWrite = 0;
    // only write value if it is different
    didWrite += eepromWrite(1, iVolume);
    didWrite += eepromWrite(2, iAttenuateL);
    didWrite += eepromWrite(3, iAttenuateR);
    didWrite += eepromWrite(4, iBass);
    didWrite += eepromWrite(5, iMid);
    didWrite += eepromWrite(6, iTreble);
    didWrite += eepromWrite(7, iActiveInput);
    
    if (didWrite)
        eepromWrite(0, 10); // To indicate EEPROM has been saved
}

char eepromWrite(char address, char data) {
    char didWrite = 0;
    if (eepromRead(address) != data) {
        char intconsave = intcon;
        
        // Load address and data
        eeadr = address;
        eedata = data;
    
        eecon1.EEPGD = 0; // Point to DATA memory
        //eecon1.CFGS = 0; // Access EEPROM
        eecon1.WREN = 1; // Enable writes
        
        // Required write sequence
        intcon = 0;
        eecon2 = 0x55; // Write 55h
        eecon2 = 0xAA; // Write 0AAh
        eecon1.WR = 1; // Set WR bit to begin write
        intcon = intconsave;
        eecon1.WREN = 0; // Disable writes on write complete (EEIF set)
        while(!pir2.EEIF); // Wait for the interrupt bit EEIF to be set
        pir2.EEIF = 0; // Clear EEIF
        didWrite = 1;
    }
    return didWrite;
}

/******************************************************
  Function to read the current variables from ROM
*******************************************************/
void readData() {
    // Read initial values from EEPROM
    // Do not read other variables if the EEPROM has not been saved before
    // as all default will be 0xFF
    if (eepromRead(0) == 10) {
        iVolume = eepromRead(1);
        iAttenuateL = eepromRead(2);
        iAttenuateR = eepromRead(3);
        iBass = eepromRead(4);
        iMid = eepromRead(5);
        iTreble = eepromRead(6);
        iActiveInput = eepromRead(7);
    }
}

char eepromRead(char address) {
    // Load address
    eeadr = address;
    eecon1.EEPGD = 0; // Point to DATA memory
    //eecon1.CFGS = 0; // Access EEPROM
    
    // Read, data is available in eedata the next cycle.
    eecon1.RD = 1;
    
    // Return value
    return eedata;
}
    
/***********************************************************************************
  LED Display Functions
************************************************************************************/
// Converts a string of characters into decoded 7 segment bytes for LED character array
// Optionally writes these bytes to LED displays
void ledPrint(unsigned char *s) {
    char dig;
    for (dig = 0; dig < 8; dig++) {
        if (*s) {
            ledChar(dig, *s++);
        } else {
            ledData1[dig] = 0;
        }
    }
}

// Converts an ASCII char to decoded byte and places it in LED array
// Support decimal places
//void ledChar(char iCol, char iChar, char iHasDot) {
void ledChar(char iCol, char iChar) {
    char iDecoded = displayASCIItoSeg[iChar - 0x20];
    // dot is unused in this implementation
    //if (iHasDot)
    //    iDecoded = iDecoded | 0x80;
    ledData1[iCol] = iDecoded;
}

void ledSetDigits(char iValue, char iCol) {
    // start by left filling
    ledData1[iCol] = 0;
    
    // determine to second (left most) digit
    char dig2 = 0;
    // take off 10 from the value until it's less than 10
    while (iValue >= 10) {
       iValue -= 10;
       // each time we take off 10, the left most digit is incremented
       dig2++;
    }
    
    // if the left most digit is greater than zero, set the value into the array, adding on 48 to get the ascii value
    if (dig2 != 0)
        ledChar(iCol, dig2 + 48);
    // set the unit value in the array (what's left on iValue), adding on 48 to get the ascii value
    ledChar(iCol + 1, iValue + 48);
}

// LED test function
void ledTest() {
    ledPrint("Init on");
    ledWrite();
}


// Setup the MAX7219 LED displays by sending the required configuration bytes
void ledSetup() {
    // Scan limit
    ledLatchDown();
    ledSendChar(0x0B);
    ledSendChar(0x07); // Scan all 8 digits
    ledLatchUp();
    
    // Set no decode mode
    ledLatchDown();
    ledSendChar(0x09);
    ledSendChar(0);
    ledLatchUp();
    
    // Set intensity
    ledLatchDown();
    ledSendChar(0x0A);
    //ledSendChar(0x08); // 8: 17/32
    ledSendChar(0x05); // 4: 9/32
    ledLatchUp();
}

// Start LED display
void ledOn() {
    // v1.2 Power on and setup
    LEDDATA = 0;
    LEDCLOCK = 0;
    LEDLATCH = 1;
    LEDDISPON = 0;
    delay_ms(250);
    ledSetup();
    // No shutdown
    ledLatchDown();
    ledSendChar(0x0C);
    ledSendChar(0x01); // no shutdown
    ledLatchUp();
    // Startup time delay
    delay_us(250);
}

// Shutdown LED display
void ledOff() {
    // Shutdown
    ledLatchDown();
    ledSendChar(0x0C);
    ledSendChar(0x00); // shutdown
    ledLatchUp();
    // v1.2, remove the power
    LEDDISPON = 0;
    delay_ms(100);
}

// Write the bytes set in each array to the MAX7219 LED displays
void ledWrite() {
    char n;
    char d = 7; // Characters in array are written out backwards so start from furthest (7)
    
    // Loop through digits 0 to 8 (addressed as 1 to 9)
    for (n = 1; n < 9; n++) { 
        ledLatchDown();
        // Writing character to device
        ledSendChar(n); // Digit to write
        ledSendChar(ledData1[d]); // Digit to write
        ledLatchUp();
        d--; // Decrement array counter
    }
}

void ledLatchDown() {
    // Load the new register
    LEDDATA = 0;
    LEDCLOCK = 0;
    LEDLATCH = 0; // Clock must fall so that last bit is clocked out
}

void ledLatchUp() {
    // Load the new register
    LEDLATCH = 1;
    LEDCLOCK = 0; // Clock must fall after latch raised
    LEDDATA = 0; // v1.2 Data to default
    delay_us(LEDDELAYUS); // Need to delay before starting again
}

// Write a single piece of data (byte) out serially
// Uses bit-banging to control protocol and delays
void ledSendChar(char iData) {
    // v1.2 made bit-bang loop more efficient
    for (char cBitSelect = 0x80; cBitSelect; cBitSelect >>= 1) { // This code puts the byte onto the shift register output
        LEDCLOCK = 0; // Clock cleared
        // LEDDATA pin set to the result of testing the bit in iData with logical AND
        if (iData & cBitSelect)
            LEDDATA = 1;
        else
            LEDDATA = 0;
        LEDCLOCK = 1; // Clock set high, so bit is loaded onto the shift register
    }
}

/***********************************************************************************
  Power on or off routine
************************************************************************************/
void doPower() {
    if (iPower) {
        // Switch on green (for muted)
        BLUE = 0;
        GREEN = 1;
        RED = 0;
        
        // Disable timer 1
        timer1Reset();

        // Goodbye!
        ledPrint("Goodbye");
        ledWrite();
        
        iPower = 0;

        RLY_POWER = 0; // Power off amps
        RLY_BLUETOOTH = 0; // Power off bluetooth
        delay_s(6); // Force a 6 second wait before the ability to switch on again (allows electronics to drain)
        
        ledOff();
        
        saveData(); // save data to eeprom to restore after power loss
        
        // Switch on red (for standby)
        BLUE = 0;
        GREEN = 0;
        RED = 1;
    } else {
        // Power on sequence
        // Switch on green (for muted)
        BLUE = 0;
        GREEN = 1;
        RED = 0;
        
        ledOn();
        ledPrint("HELLO");
        ledWrite();
        
        // v1.2 add delay after switching LED but before switching amp
        DELAY_SHORT;

        // Power on amps
        RLY_POWER = 1;
        iPower = 1;

        // Delay mute
        // Flash Green/Blue for 2.6 seconds
        char l;
        for (l=0; l<27; l++) {
            // Green off, blue on
            BLUE = 1;
            GREEN = 0;
            DELAY_SHORT;
            // Blue off, green on
            BLUE = 0;
            GREEN = 1;
            DELAY_SHORT;
        }
        
        // Write all values to TDA7439 (since it is now powered) - this will also unmute the volume
        tda7439WriteAll();
        // show the volume and input
        showVolAndInput();
    }
}

/***********************************************************************************
  Functions to change selected input
************************************************************************************/
void doInputUp() {
    // Decrement the active input
    iActiveInput--;
    if (iActiveInput > 4) // If overflowed (less than 0)
        iActiveInput = 3;
    tda7439SetInput();
}

void doInputDown() {
    // Increment the active input
    iActiveInput++;
    if (iActiveInput >= 4)
        iActiveInput = 0;
    tda7439SetInput();
}

/***********************************************************************************
  I2C methods using MSSP
  https://www.hobbytronics.co.uk/tutorials-code/tutorials-microchip/hi-tech-c-i2c-master
************************************************************************************/
// i2c_Wait - wait for I2C transfer to finish
void i2cWait(void) {
    // sspcon2 bit 4 ACKEN: Initiate Acknowledge sequence on SDA and SCL pins and transmit ACKDT data bit. Automatically cleared by hardware.
    // sspcon2 bit 3 RCEN: Enables Receive mode for I2C
    // sspcon2 bit 2 PEN: Initiate STOP condition on SDA and SCL pins. Automatically cleared by hardware
    // sspcon2 bit 1 RSEN: Initiate Repeated START condition on SDA and SCL pins. Automatically cleared by hardware.
    // sspcon2 bit 0 SEN: Initiate START condition on SDA and SCL pins. Automatically cleared by hardware.
    // sspstat bit 3: Indicates that a START bit has been detected last
    while ((sspcon2 & 0x1F) || (sspstat & 0x04));
}

// i2c_Start - Start I2C communication
void i2cStart(void) {
    i2cWait();
    sspcon2.SEN = 1;
}

// i2c_Stop - Stop I2C communication
void i2cStop(void) {
    i2cWait();
    sspcon2.PEN = 1;
}

// i2cWrite - Sends one byte of data
void i2cWrite(char data) {
    i2cWait();
    sspbuf = data;
}

/***********************************************************************************
  TDA7439 methods
  Sub addresses:
  0x00 = input selector (data 0x00 to 0x03)
  0x01 = input gain (data 0x00 to 0x0F - for 0dB to 30dB)
  0x02 = volume (data 0x00 to 0x38  or 0 to 56 for attenuation in 1dB steps. 56 = mute)
  0x03 = bass gain (data 0x00 to 0x06 for -14dB to -2dB, 0x07 for 0dB, 0x08 to 0x0E for 14dB to 2dB)
  0x04 = mid gain (data 0x00 to 0x06 for -14dB to -2dB, 0x07 for 0dB, 0x08 to 0x0E for 14dB to 2dB)
  0x05 = treble gain (data 0x00 to 0x06 for -14dB to -2dB, 0x07 for 0dB, 0x08 to 0x0E for 14dB to 2dB)
  0x06 = R speaker attenuation (data 0x00 to 0x78 or 0 to 120 in 1dB steps. >=78 = mute)
  0x07 = L speaker attenuation (data 0x00 to 0x78 or 0 to 120 in 1dB steps. >=78 = mute)
************************************************************************************/
void tda7439Write(char bSubAddress, char bData) {
    i2cStart();
    i2cWrite(tda7439_addr); // send TDA7439 i2c address
    i2cWrite(bSubAddress); // send TDA7439 sub address
    i2cWrite(bData); // send data byte
    i2cStop();
}

void tda7439SetVolume() {
    if (iMute)
        tda7439Write(0x02, 56);
    else
        tda7439Write(0x02, iVolume);
}

void tda7439SetInput() {
    RLY_BLUETOOTH = (iActiveInput == 3);
    i2cStart();
    i2cWrite(tda7439_addr); // send TDA7439 i2c address
    i2cWrite(0x10); // send TDA7439 sub address - 0x10 will increment address from 0 to 7 (all of them)
    i2cWrite(iActiveInput); // send data byte
    i2cWrite(tda7439_gains[iActiveInput]); // send data byte
    i2cStop();
}

void tda7439SetBass() {
    tda7439Write(0x03, iBass);
}

void tda7439SetMid() {
    tda7439Write(0x04, iMid);
}

void tda7439SetTreble() {
    tda7439Write(0x05, iTreble);
}

void tda7439SetBalance() {
    // use address incrementing
    i2cStart();
    i2cWrite(tda7439_addr); // send TDA7439 i2c address
    i2cWrite(0x16); // send TDA7439 sub address - 0x16 will increment address from 6 to 7 (r+l attenuation)
    if (iAttenuateL > 0) {
        // If balance is negative, attenuate L speaker
        i2cWrite(0);
        i2cWrite(iAttenuateL);
    } else {
        // otherwise attenuate R speaker
        i2cWrite(iAttenuateR);
        i2cWrite(0);
    }
    i2cStop();
}

void tda7439WriteAll() {
    RLY_BLUETOOTH = (iActiveInput == 3);
    // use address incrementing
    i2cStart();
    i2cWrite(tda7439_addr); // send TDA7439 i2c address
    i2cWrite(0x10); // send TDA7439 sub address - 0x10 will increment address from 0 to 7 (all of them)
    i2cWrite(iActiveInput); // send data byte
    i2cWrite(tda7439_gains[iActiveInput]); // send data byte
    i2cWrite(iVolume); // send data byte
    i2cWrite(iBass); // send data byte
    i2cWrite(iMid); // send data byte
    i2cWrite(iTreble); // send data byte
    if (iAttenuateL > 0) {
        // If balance is negative, attenuate L speaker
        i2cWrite(0);
        i2cWrite(iAttenuateL);
    } else {
        // otherwise attenuate R speaker
        i2cWrite(iAttenuateR);
        i2cWrite(0);
    }
    i2cStop();
}

/***********************************************************************************
  Functions for volume control
************************************************************************************/
void doVolumeUp() {
    // Increase level (decrease attenuation --)
    if (iVolume == 56) { // come out of mute
        iMute = 0;
        iVolume = 47;
    } else {
        iVolume--;
    }
    
    if (iVolume > 56) { // overflowed
        iVolume = 0;
    }
    tda7439SetVolume();
}

void doVolumeDown() {
    // Decrease level (increase attenuation ++)
    iVolume++;
    if (iVolume > 47) { // muted
        iMute = 1;
        iVolume = 56;
    }
    tda7439SetVolume();
}

/***********************************************************************************
  Function to toggle muting on/off
************************************************************************************/
void doMute() {
    // toggle mute status
    if (iMute == 1) 
        iMute = 0;
    else
        iMute = 1;
    // set the volume
    tda7439SetVolume();
}


/***********************************************************************************
  Function to print the current input and volume to the LED display
************************************************************************************/
void showVolAndInput() {
    if (iMute) {
        ledPrint("Snd OFF"); // Media Centre PC
        ledWrite();
    } else {
        // show the input on the first 3 characters
        switch (iActiveInput) {
            case 0:
                ledPrint("In3"); // Bluetooth
                break;
            case 1:
                ledPrint("In2"); // Input 1
                break;
            case 2:
                ledPrint("In1"); // Input 1
                break;
            case 3:
                ledPrint("blu"); // Input 3
                break;
        }
        // show volume on next 5 characters e.g. -18db
        // Volume can be 0 to 55
        // Invert the volume to a negative gain (as a positive number) i.e. -56 to 0
        char cGain = iVolume;
        // work out an adjustment to gain based on the input gain value
        char cGainAdj = (tda7439_gains[iActiveInput] * 2);
        // adjust the final gain
        if (cGain < cGainAdj) {
            ledData1[3] = 0;
            cGain = cGainAdj - cGain;
        } else {
            // negative gain (attenuation)
            ledChar(3, '-');
            cGain -= cGainAdj;
        }
        
        ledSetDigits(cGain, 4);
        
        ledChar(6, 'd'); 
        ledChar(7, 'b'); 
        // Write Result to LED display
        ledWrite();
    }
    
    // Display green LED if volume is 0 (effectively mute) or mute is on
    if ((iVolume == 56) || iMute) {
        // Green on, blue off
        BLUE = 0;
        GREEN = 1;
    } else {
        // Green off, blue on
        BLUE = 1;
        GREEN = 0;
    }
}

/***********************************************************************************
  Functions to display and adjust amp functions i.e. bass, treble, balance
************************************************************************************/
void functionValueDisplay(char iValue) {
    // translate value to dB
    char isCut = 0;//(iValue < 7);
    if (iValue == 7) {
        // flat
        iValue = 0;
    } else if (iValue > 7) {
        // boost
        // 14=2dB 13=4dB ... 8=14dB
        iValue = (15 - iValue) * 2;
    } else {
        // cut 0=-14dB 1=-12db ... 6=-2dB
        isCut = 1;
        iValue = (7 - iValue) * 2;
    }
    // write characters to array
    if (isCut)
        ledChar(4, '-');
    ledSetDigits(iValue, 5);
}

void functionDisplay() {
    switch (iFunctionMode) {
        case 1: // Bass
            ledPrint("bASS"); // Bass
            functionValueDisplay(iMid);
            break;
        case 2: // Treble
            ledPrint("Treb"); // Treble
            functionValueDisplay(iTreble);
            break;
        case 3: // Lo Bass
            ledPrint("Lo b"); // Lo Bass
            functionValueDisplay(iBass);
            break;
        case 4: // Balance
            if (iAttenuateL > 0) { // left attenuation
                ledPrint("L   -"); // Balance
                ledSetDigits(iAttenuateL, 5);
            } else if (iAttenuateR > 0) {
                ledPrint("r   -"); // Balance
                ledSetDigits(iAttenuateR, 5);
            } else {
                ledPrint("BAL   0"); // Balance
            }
            break;
    }
    ledChar(7, 'd'); 
    // Write Result to LED display
    ledWrite();
}

char functionValueRaise(char iValue) {
    if (iValue == 7) // if flat, adjust to the 2dB position
        iValue = 14;
    else if (iValue > 8) // if boost, adjust to the next 2dB position (minus), stop at 8
        iValue--;
    else if (iValue < 7) // if cut, adjust to the next -2dB position (plus)
        iValue++;
    return iValue;
}

char functionValueLower(char iValue) {
    if (iValue == 14) // if 2dB boost, adjust to the flat position
        iValue = 7;
    else if (iValue > 7) // if boost, adjust to the next -2dB position (plus)
        iValue++;
    else if (iValue != 0) // if cut, adjust to the next 2dB position (negative), stop at 0
        iValue--;
    return iValue;
}

void functionRaise() {
    switch (iFunctionMode) {
        case 1: // Bass
            iMid = functionValueRaise(iMid);
            tda7439SetMid();
            break;
        case 2: // Treble
            iTreble = functionValueRaise(iTreble);
            tda7439SetTreble();
            break;
        case 3: // Lo Bass
            iBass = functionValueRaise(iBass);
            tda7439SetBass();
            break;
        case 4: // Balance
            if (iAttenuateL == 0) {
                // If left is zero, attentuate right
                iAttenuateR++;
                if (iAttenuateR > 78)
                    iAttenuateR = 78;
            } else {
                // otherwise reduce attentuation on left
                iAttenuateL--;
            }
            tda7439SetBalance();
            break;
    }
    
    functionDisplay();
}

void functionLower() {
    switch (iFunctionMode) {
        case 1: // Bass
            iMid = functionValueLower(iMid);
            tda7439SetMid();
            break;
        case 2: // Treble
            iTreble = functionValueLower(iTreble);
            tda7439SetTreble();
            break;
        case 3: // Lo Bass
            iBass = functionValueLower(iBass);
            tda7439SetBass();
            break;
        case 4: // Balance
            if (iAttenuateR == 0) {
                // If right is zero, attentuate left
                iAttenuateL++;
                if (iAttenuateL > 78)
                    iAttenuateL = 78;
            } else {
                // otherwise reduce attentuation on right
                iAttenuateR--;
            }
            tda7439SetBalance();
            break;
    }

    functionDisplay();
}

void functionUp() {
    iFunctionMode++;
    if (iFunctionMode > 4)
        iFunctionMode = 1;
    functionDisplay();
}

void functionDown() {
    iFunctionMode--;
    if (iFunctionMode < 1)
        iFunctionMode = 4;
    functionDisplay();
}

/***********************************************************************************
  Read and process remote control RC5 commands
************************************************************************************/
void rc5Process() {
    IR_LED = 0; // switch off IR LED
    if (rc5_address == 0) { // Addresses above zero are not for this device
        // Process commands
        if (iPower) { // Don't process the following if power is off
            // Get current volume level
            switch (rc5_command) {
                // For each command, cause the correct action 
                case 13: // Mute (13 / 0x0D / D)
                    if (rc5_flickBitOld != rc5_flickBit) { // Prevent repeated muting when holding the button
                        // reset mute held flag
                        iMuteHeld = 0;
                        if (iFunctionMode == 0) {
                            // reset timer
                            timer1Reset();
                            // start call timer
                            t1con.TMR1ON = 1;
                        } else {
                            // exit function mode
                            iFunctionMode = 0;
                            showVolAndInput();
                            // turn off the timer
                            timer1Reset();
                        }
                    } else {
                        // Button held - this should reset timer1 before it interrupts, therefore avoiding processing the command until the button is released
                        iMuteHeld++;
                        // Reset timer
                        timer1Reset();
                        if (iMuteHeld > 14) {
                            // flag for entering function mode
                            cTask.TASK_TIMER1_FUNC = 1;
                        } else {
                            // Turn on the timer again
                            t1con.TMR1ON = 1;
                        }
                    }
                    break;
                case 16: // Volume up (16 / 0x10 / E)
                    if (iFunctionMode == 0) {
                        doVolumeUp();
                        showVolAndInput();
                    } else {
                        functionRaise();
                    }
                    break;
                case 17: // Volume down (17 / 0x11 / F)
                    if (iFunctionMode == 0) {
                        doVolumeDown();
                        showVolAndInput();
                    } else {
                        functionLower();
                    }
                    break;
                case 32: // Input right (32 / 0x20 / V)
                    if (rc5_flickBitOld != rc5_flickBit) { // Prevent repeated input changing when holding the button
                        if (iFunctionMode == 0) {
                            doInputUp();
                            showVolAndInput();
                        } else {
                            functionUp();
                        }
                    }
                    break;
                case 33: // Input left (33 / 0x21 / U)
                    if (rc5_flickBitOld != rc5_flickBit) { // Prevent repeated input changing when holding the button
                        if (iFunctionMode == 0) {
                            doInputDown();
                            showVolAndInput();
                        } else {
                            functionDown();
                        }
                    }
                    break;
            }
        }
        // Process power button regardless of power state
        if (rc5_command == 12) { // Power (12 / 0x0C / A)
            if (rc5_flickBitOld != rc5_flickBit) { // Prevent repeated power when holding the button
                // exit function mode
                iFunctionMode = 0;
                //iPowerExternal = 0; v1.1 removed this to allow forced power off
                // power up or down
                doPower();
            }
        }
        rc5_flickBitOld = rc5_flickBit;
    }
}

/***********************************************************************************
  MAIN PROGRAM
************************************************************************************/
void main() {
    initialise();
    
    while (1) {
        // Task scheduler
        // If there are tasks to be performed, find out the
        // most recent task from the array and execute it
        while (cTask > 0) {
            if (cTask.TASK_INT_EXT0) {
                rc5Process(); // IR sensor received a signal
                cTask.TASK_INT_EXT0 = 0;
            } 
            if (cTask.TASK_TIMER1_MUTE) {
                // Mute and update display
                doMute();
                showVolAndInput();
                // turn off the timer
                timer1Reset();
                cTask.TASK_TIMER1_MUTE = 0;
            }
            if (cTask.TASK_TIMER1_FUNC) {
                // enter function mode
                iFunctionMode = 1;
                // Show first function
                functionDisplay();
                // turn off the timer
                timer1Reset();
                cTask.TASK_TIMER1_FUNC = 0;
            }
        }
        // Poll for EXT_POWER
        // if EXT_POWER is low (USB trigger high), iPower is off
        // v1.1 and not previously powered on externally
        if (!EXT_POWER && !iPower && !iPowerExternal) {
            // Powered on by external appliance
            iPowerExternal = 1;
            // set the input to the trigged input (input 1) = in2 on the tda7439
            iActiveInput = 2;
            doPower();
        }
        // if EXT_POWER is high (USB trigger low), iPower is on, and was powered on externally
        // ..then power off
        if (EXT_POWER && iPower && iPowerExternal) {
            // Powered off by external appliance
            // don't power off if iPowerExternal is zero (i.e. powered on by IR)
            doPower();
        }
        // v1.1 If no external power signal, and power is off anyway, reset the iPowerExternal indicator
        if (EXT_POWER && !iPower) {
            iPowerExternal = 0;
        }
    }
}
