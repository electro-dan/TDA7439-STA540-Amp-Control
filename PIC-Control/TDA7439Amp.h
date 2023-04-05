#ifndef _TDA7439AMP_H_
#define _TDA7439AMP_H_

#include <system.h>
#include <stdio.h>
//#include <i2c_driver.h>

// tasks for the main routine
#define	TASKS_LIMIT			8
#define TASK_INT_EXT0		0
#define TASK_INT_PORTB		4
#define TASK_TIMER1_MUTE	5
#define TASK_TIMER1_FUNC	6
#define TASK_TIMER1_RSTDISP	7

// define TDA7439 address
#define	tda7439_addr	0x88 // Base address

// 25 for 200us
// 22 for 176us (doesn't work)
// 26 works
// 26 for 208us
#define IR_PR2_200US 26
// 111 for 888us
// 105 for 840us (doesn't work)
// 112 = no, 111 = misses last bit, 110 = works fine, but sometimes toggle bit missed, 109 = works fine
// 109 for 872us
#define IR_PR2_890US 108

// Pins
#define IR_PIN (portb.0)
#define IR_LED (portb.1)
#define RED (portc.0)
#define GREEN (portc.1)
#define BLUE (portc.2)
#define RLY_POWER (portb.5)
#define RLY_BLUETOOTH (portb.4)
#define EXT_POWER (portb.2)
#define LEDDATA (porta.0)
#define LEDCLOCK (porta.2)
#define LEDLATCH (porta.1)
#define LEDDISPON (portb.3) // v3.0 added this to control power Vss to MAX7219 - high = display on

#define LEDDELAYUS 30

// 6dB gain except for bluetooth
// order in3, in3, in2, in1
const char tda7439_gains[] = {3, 3, 3, 0}; 

// Global variables
char cTask = 0;
char iPower = 0;
char iPowerExternal = 0;
char iActiveInput = 1;
char iVolume = 55;
char iVolumeAfterMute;
char iMute = 0;
char iMuteHeld = 0;
char iAttenuateL = 0;
char iAttenuateR = 0;
char iBass = 7;
char iMid = 7;
char iTreble = 7;

char iFunctionMode = 0;

char ledData1[8];
// Original table
/***************************************************************************************

Characters:
    7 6 5 4  3 2 1 0
    p a b c  d e f g
  = 0 0 0 0  0 0 0 0  00
0 = 0 1 1 1  1 1 1 0  7E
1 = 0 0 1 1  0 0 0 0  30
2 = 0 1 1 0  1 1 0 1  6D
3 = 0 1 1 1  1 0 0 1  79
4 = 0 0 1 1  0 0 1 1  33
5 = 0 1 0 1  1 0 1 1  5B
6 = 0 1 0 1  1 1 1 1  5F
7 = 0 1 1 1  0 0 0 0  70
8 = 0 1 1 1  1 1 1 1  7F
9 = 0 1 1 1  1 0 1 1  7B
- = 0 0 0 0  0 0 0 1  01

A = 0 1 1 1  0 1 1 1  77
b = 0 0 0 1  1 1 1 1  1F
c = 0 0 0 0  1 1 0 1  0D
d = 0 0 1 1  1 1 0 1  3D
E = 0 1 0 0  1 1 1 1  4F
F = 0 1 0 0  0 1 1 1  47
g = 0 1 1 1  1 0 1 1  7B
h = 0 0 0 1  0 1 1 1  17
H = 0 0 1 1  0 1 1 1  37
i = 0 0 0 1  0 0 0 0  10
L = 0 0 0 0  1 1 1 0  0E
o = 0 0 0 1  1 1 0 1  1D
P = 0 1 1 0  0 1 1 1  67
r = 0 0 0 0  0 1 0 1  05
S = 0 1 0 1  1 0 1 1  5B
T = 0 1 0 0  0 1 1 0  46
t = 0 0 0 0  1 1 1 1  0F
u = 0 0 0 1  1 1 0 0  1C
y = 0 0 1 1  0 0 1 1  33

**************************************************************************************/


// This table, taken from http://www.ccsinfo.com/forum/viewtopic.php?p=57034 is ideal for writing the converted character out
// However as the dot is the MSB for the MAX7219 when writing, bit shift 1 to the right
// Converted using spreadsheet formula ="0x"&RIGHT("0"&DEC2HEX(BITRSHIFT(HEX2DEC(RIGHT(A1,2)),1)),2)
// Modification - capital T output differently
const char displayASCIItoSeg[] = {// ASCII to SEVEN-SEGMENT conversion table
    0x00,       // ' ', 
    0x00,       // '!', No seven-segment conversion for exclamation point
    0x22,       // '"', Double quote
    0x00,       // '#', Pound sign
    0x00,       // '$', No seven-segment conversion for dollar sign
    0x00,       // '%', No seven-segment conversion for percent sign
    0x00,       // '&', No seven-segment conversion for ampersand
    0x20,       // ''', Single quote
    0x4E,       // '(', Same as '['
    0x78,       // ')', Same as ']'
    0x00,       // '*', No seven-segment conversion for asterix
    0x00,       // '+', No seven-segment conversion for plus sign
    0x00,       // ', '
    0x01,       // '-', Minus sign
    0x00,       // '.', No seven-segment conversion for period
    0x00,       // '/', No seven-segment conversion for slash
    0x7E,       // '0', 
    0x30,       // '1', 
    0x6D,       // '2', 
    0x79,       // '3', 
    0x33,       // '4', 
    0x5B,       // '5', 
    0x5F,       // '6', 
    0x70,       // '7', 
    0x7F,       // '8', 
    0x7B,       // '9', 
    0x00,       // ':', No seven-segment conversion for colon
    0x00,       // ';', No seven-segment conversion for semi-colon
    0x00,       // '<', No seven-segment conversion for less-than sign
    0x09,       // '=', Equal sign
    0x00,       // '>', No seven-segment conversion for greater-than sign
    0x65,       //'?', Question mark
    0x00,       // '@', No seven-segment conversion for commercial at-sign
    0x77,       // 'A', 
    0x1F,       // 'B', Actually displayed as 'b'
    0x4E,       // 'C', 
    0x3D,       // 'D', Actually displayed as 'd'
    0x4F,       // 'E', 
    0x47,       // 'F', 
    0x5E,       // 'G', Actually displayed as 'g'
    0x37,       // 'H', 
    0x30,       // 'I', Same as '1'
    0x3C,       // 'J', 
    0x00,       // 'K', No seven-segment conversion
    0x0E,       // 'L', 
    0x00,       // 'M', No seven-segment conversion
    0x15,       // 'N', Actually displayed as 'n'
    0x7E,       // 'O', Same as '0'
    0x67,       // 'P', 
    0x00,       // 'Q', No seven-segment conversion
    0x05,       // 'R', Actually displayed as 'r'
    0x5B,       // 'S', Same as '5'
    0x70,       // 'T', Displayed as 7
    0x3E,       // 'U', 
    0x00,       // 'V', No seven-segment conversion
    0x00,       // 'W', No seven-segment conversion
    0x00,       // 'X', No seven-segment conversion
    0x3B,       // 'Y', 
    0x00,       // 'Z', No seven-segment conversion
    0x00,       // '[', 
    0x00,       // '\', No seven-segment conversion
    0x00,       // ']', 
    0x00,       // '^', No seven-segment conversion
    0x00,       // '_', Underscore
    0x00,       // '`', No seven-segment conversion for reverse quote
    0x7D,       // 'a', 
    0x1F,       // 'b', 
    0x0D,       // 'c', 
    0x3D,       // 'd', 
    0x6F,       // 'e', 
    0x47,       // 'f', Actually displayed as 'F'
    0x5E,       // 'g', 
    0x17,       // 'h', 
    0x10,       // 'i', 
    0x3C,       // 'j', Actually displayed as 'J'
    0x00,       // 'k', No seven-segment conversion
    0x0E,       // 'l', Actually displayed as 'L'
    0x00,       // 'm', No seven-segment conversion
    0x15,       // 'n', 
    0x1D,       // 'o', 
    0x67,       // 'p', Actually displayed as 'P'
    0x00,       // 'q', No seven-segment conversion
    0x05,       // 'r', 
    0x5B,       // 's', Actually displayed as 'S'
    0x0F,       // 't', 
    0x1C,       // 'u', 
    0x00,       // 'v', No seven-segment conversion
    0x00,       // 'w', No seven-segment conversion
    0x00,       // 'x', No seven-segment conversion
    0x3B,       // 'y', Actually displayed as 'Y'
    0x00        // 'z', No seven-segment conversion
}; 

// Methods
void saveData();
char eepromWrite(char address, char data);
void readData();
char eepromRead(char address);

void ledPrint(unsigned char *s, char iWrite);
void ledChar(char iCol, char iChar);
void ledSetDigits(signed char iValue, char iCol);
void ledTest();
void ledSetup();
void ledOn();
void ledOff();
void ledClear();
void ledWrite();
void ledSendChar(char iData);
void ledLatchUp();
void ledLatchDown();

void doPower();
void doMute();
void showVolAndInput();

void doVolumeUp();
void doVolumeDown();
void doInputUp();
void doInputDown();

void tda7439SetInput();
void tda7439SetVolume();
void tda7439SetBass();
void tda7439SetMid();
void tda7439SetTreble();
void tda7439SetBalance();
void tda7439WriteAll();

void functionValueDisplay(char iValue);
void functionDisplay();
char functionValueRaise(char iValue);
char functionValueLower(char iValue);
void functionRaise();
void functionLower();
void functionUp();
void functionDown();

void onTimer1();
void timer1Reset();
void rc5Process();

// For IR
char intfCounter = 0;
char rc5_Held = 0;
unsigned short rc5_inputData; // input data takes 12 bits?
char rc5_bitCount;
char rc5_logicInterval, rc5_logicChange;
enum {
        rc5_idleState,
        rc5_initialWaitState,
        rc5_startBitState,
        rc5_captureBitState
};

char rc5_currentState = rc5_idleState;
char rc5_pinState = 1;

char rc5_flickBit = 0;
char rc5_flickBitOld = 0;
char rc5_address = 0;
char rc5_command = 0;

#endif //_TDA7439AMP_H_
