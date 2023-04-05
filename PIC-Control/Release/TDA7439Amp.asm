;/////////////////////////////////////////////////////////////////////////////////
;// Code Generator: BoostC Compiler - http://www.sourceboost.com
;// Version       : 8.01
;// License Type  : Pro License
;// Limitations   : PIC12,PIC16 max code size:Unlimited, max RAM banks:Unlimited
;/////////////////////////////////////////////////////////////////////////////////

	include "P16F873.inc"
; Heap block 0, size:39 (0x000000D8 - 0x000000FE)
__HEAP_BLOCK0_BANK               EQU	0x00000001
__HEAP_BLOCK0_START_OFFSET       EQU	0x00000058
__HEAP_BLOCK0_END_OFFSET         EQU	0x0000007E
; Heap block 1, size:0 (0x00000000 - 0x00000000)
__HEAP_BLOCK1_BANK               EQU	0x00000000
__HEAP_BLOCK1_START_OFFSET       EQU	0x00000000
__HEAP_BLOCK1_END_OFFSET         EQU	0x00000000
; Heap block 2, size:0 (0x00000000 - 0x00000000)
__HEAP_BLOCK2_BANK               EQU	0x00000000
__HEAP_BLOCK2_START_OFFSET       EQU	0x00000000
__HEAP_BLOCK2_END_OFFSET         EQU	0x00000000
; Heap block 3, size:0 (0x00000000 - 0x00000000)
__HEAP_BLOCK3_BANK               EQU	0x00000000
__HEAP_BLOCK3_START_OFFSET       EQU	0x00000000
__HEAP_BLOCK3_END_OFFSET         EQU	0x00000000
gbl_status                       EQU	0x00000003 ; bytes:1
gbl_indf                         EQU	0x00000000 ; bytes:1
gbl_tmr0                         EQU	0x00000001 ; bytes:1
gbl_pcl                          EQU	0x00000002 ; bytes:1
gbl_fsr                          EQU	0x00000004 ; bytes:1
gbl_porta                        EQU	0x00000005 ; bytes:1
gbl_portb                        EQU	0x00000006 ; bytes:1
gbl_portc                        EQU	0x00000007 ; bytes:1
gbl_pclath                       EQU	0x0000000A ; bytes:1
gbl_intcon                       EQU	0x0000000B ; bytes:1
gbl_pir1                         EQU	0x0000000C ; bytes:1
gbl_pir2                         EQU	0x0000000D ; bytes:1
gbl_tmr1l                        EQU	0x0000000E ; bytes:1
gbl_tmr1h                        EQU	0x0000000F ; bytes:1
gbl_t1con                        EQU	0x00000010 ; bytes:1
gbl_tmr2                         EQU	0x00000011 ; bytes:1
gbl_t2con                        EQU	0x00000012 ; bytes:1
gbl_sspbuf                       EQU	0x00000013 ; bytes:1
gbl_sspcon                       EQU	0x00000014 ; bytes:1
gbl_ccpr1l                       EQU	0x00000015 ; bytes:1
gbl_ccpr1h                       EQU	0x00000016 ; bytes:1
gbl_ccp1con                      EQU	0x00000017 ; bytes:1
gbl_rcsta                        EQU	0x00000018 ; bytes:1
gbl_txreg                        EQU	0x00000019 ; bytes:1
gbl_rcreg                        EQU	0x0000001A ; bytes:1
gbl_ccpr2l                       EQU	0x0000001B ; bytes:1
gbl_ccpr2h                       EQU	0x0000001C ; bytes:1
gbl_ccp2con                      EQU	0x0000001D ; bytes:1
gbl_adresh                       EQU	0x0000001E ; bytes:1
gbl_adcon0                       EQU	0x0000001F ; bytes:1
gbl_option_reg                   EQU	0x00000081 ; bytes:1
gbl_trisa                        EQU	0x00000085 ; bytes:1
gbl_trisb                        EQU	0x00000086 ; bytes:1
gbl_trisc                        EQU	0x00000087 ; bytes:1
gbl_pie1                         EQU	0x0000008C ; bytes:1
gbl_pie2                         EQU	0x0000008D ; bytes:1
gbl_pcon                         EQU	0x0000008E ; bytes:1
gbl_sspcon2                      EQU	0x00000091 ; bytes:1
gbl_pr2                          EQU	0x00000092 ; bytes:1
gbl_sspadd                       EQU	0x00000093 ; bytes:1
gbl_sspstat                      EQU	0x00000094 ; bytes:1
gbl_txsta                        EQU	0x00000098 ; bytes:1
gbl_spbrg                        EQU	0x00000099 ; bytes:1
gbl_adresl                       EQU	0x0000009E ; bytes:1
gbl_adcon1                       EQU	0x0000009F ; bytes:1
gbl_eedata                       EQU	0x0000010C ; bytes:1
gbl_eeadr                        EQU	0x0000010D ; bytes:1
gbl_eedath                       EQU	0x0000010E ; bytes:1
gbl_eeadrh                       EQU	0x0000010F ; bytes:1
gbl_eecon1                       EQU	0x0000018C ; bytes:1
gbl_eecon2                       EQU	0x0000018D ; bytes:1
gbl_tda7439_gains                EQU	0x0000007B ; bytes:4
gbl_cTask                        EQU	0x000000AD ; bytes:1
gbl_iPower                       EQU	0x000000AE ; bytes:1
gbl_iPowerExternal               EQU	0x000000AF ; bytes:1
gbl_iActiveInput                 EQU	0x000000B0 ; bytes:1
gbl_iVolume                      EQU	0x000000B1 ; bytes:1
gbl_iMute                        EQU	0x000000B2 ; bytes:1
gbl_iMuteHeld                    EQU	0x000000B3 ; bytes:1
gbl_iAttenuateL                  EQU	0x000000B4 ; bytes:1
gbl_iAttenuateR                  EQU	0x000000B5 ; bytes:1
gbl_iBass                        EQU	0x000000B6 ; bytes:1
gbl_iMid                         EQU	0x000000B7 ; bytes:1
gbl_iTreble                      EQU	0x000000B8 ; bytes:1
gbl_iFunctionMode                EQU	0x000000B9 ; bytes:1
gbl_ledData1                     EQU	0x000000A0 ; bytes:8
gbl_displayASCIItoSeg            EQU	0x00000020 ; bytes:91
gbl_intfCounter                  EQU	0x000000BA ; bytes:1
gbl_rc5_Held                     EQU	0x000000BB ; bytes:1
gbl_rc5_inputData                EQU	0x000000AB ; bytes:2
gbl_rc5_bitCount                 EQU	0x000000BC ; bytes:1
gbl_rc5_logicInterval            EQU	0x000000BD ; bytes:1
gbl_rc5_logicChange              EQU	0x000000BE ; bytes:1
gbl_rc5_currentState             EQU	0x000000BF ; bytes:1
gbl_rc5_pinState                 EQU	0x000000C0 ; bytes:1
gbl_rc5_flickBit                 EQU	0x000000C1 ; bytes:1
gbl_rc5_flickBitOld              EQU	0x000000C2 ; bytes:1
gbl_rc5_address                  EQU	0x000000C3 ; bytes:1
gbl_rc5_command                  EQU	0x000000C4 ; bytes:1
saveData_00000_1_didWrite        EQU	0x000000C5 ; bytes:1
CompTempVarRet550                EQU	0x000000C9 ; bytes:1
eepromWrit_00014_arg_address     EQU	0x000000C6 ; bytes:1
eepromWrit_00014_arg_data        EQU	0x000000C7 ; bytes:1
eepromWrit_00014_1_didWrite      EQU	0x000000C8 ; bytes:1
CompTempVarRet551                EQU	0x000000CA ; bytes:1
eepromWrit_00014_4_intconsave    EQU	0x000000C9 ; bytes:1
eepromRead_00000_arg_address     EQU	0x000000C9 ; bytes:1
ledChar_00000_arg_iCol           EQU	0x000000D3 ; bytes:1
ledChar_00000_arg_iChar          EQU	0x000000D4 ; bytes:1
ledChar_00000_1_iDecoded         EQU	0x000000D5 ; bytes:1
CompTempVar554                   EQU	0x000000CA ; bytes:8
ledWrite_00000_1_n               EQU	0x000000C8 ; bytes:1
ledWrite_00000_1_d               EQU	0x000000C9 ; bytes:1
ledSendCha_00016_arg_iData       EQU	0x000000CA ; bytes:1
ledSendCha_00016_2_cBitSelect    EQU	0x000000CB ; bytes:1
CompTempVar560                   EQU	0x000000CA ; bytes:8
doPower_00000_34_l               EQU	0x000000C5 ; bytes:1
CompTempVar562                   EQU	0x000000CA ; bytes:6
CompTempVar568                   EQU	0x000000CA ; bytes:8
showVolAnd_00019_8_cGain         EQU	0x000000C6 ; bytes:1
showVolAnd_00019_8_cGainAdj      EQU	0x000000C7 ; bytes:1
CompTempVar571                   EQU	0x000000CA ; bytes:4
CompTempVar573                   EQU	0x000000CA ; bytes:4
CompTempVar575                   EQU	0x000000CA ; bytes:4
CompTempVar577                   EQU	0x000000CA ; bytes:4
CompTempVar582                   EQU	0x000000C5 ; bytes:1
CompTempVar564                   EQU	0x000000C6 ; bytes:1
functionVa_00024_arg_iValue      EQU	0x000000C5 ; bytes:1
functionVa_00024_1_isCut         EQU	0x000000C6 ; bytes:1
CompTempVar587                   EQU	0x000000C7 ; bytes:1
CompTempVar589                   EQU	0x000000C7 ; bytes:1
CompTempVar590                   EQU	0x000000CA ; bytes:5
CompTempVar592                   EQU	0x000000CA ; bytes:5
CompTempVar594                   EQU	0x000000CA ; bytes:5
CompTempVar596                   EQU	0x000000CA ; bytes:6
CompTempVar598                   EQU	0x000000CA ; bytes:6
CompTempVar600                   EQU	0x000000CA ; bytes:8
functionVa_00026_arg_iValue      EQU	0x000000C5 ; bytes:1
CompTempVarRet602                EQU	0x000000C6 ; bytes:1
functionVa_00027_arg_iValue      EQU	0x000000C5 ; bytes:1
CompTempVarRet603                EQU	0x000000C6 ; bytes:1
interrupt_15_iReset              EQU	0x000000D6 ; bytes:1
CompTempVar604                   EQU	0x000000D7 ; bytes:1
CompTempVar605                   EQU	0x000000D7 ; bytes:1
ledPrint_00001_arg_s             EQU	0x000000C8 ; bytes:2
ledPrint_00001_1_dig             EQU	0x000000D2 ; bytes:1
ledSetDigi_0001B_arg_iValue      EQU	0x000000C8 ; bytes:1
ledSetDigi_0001B_arg_iCol        EQU	0x000000C9 ; bytes:1
ledSetDigi_0001B_1_dig2          EQU	0x000000CA ; bytes:1
i2cWrite_00000_arg_data          EQU	0x000000C7 ; bytes:1
tda7439Wri_0001F_arg_bSubAddress EQU	0x000000C5 ; bytes:1
tda7439Wri_0001F_arg_bData       EQU	0x000000C6 ; bytes:1
delay_us_00000_arg_del           EQU	0x000000CA ; bytes:1
delay_ms_00000_arg_del           EQU	0x000000C6 ; bytes:1
delay_s_00000_arg_del            EQU	0x000000C5 ; bytes:1
Int1Context                      EQU	0x0000007F ; bytes:1
Int1BContext                     EQU	0x000000A8 ; bytes:3
	ORG 0x00000000
	GOTO	_startup
	ORG 0x00000004
	MOVWF Int1Context
	SWAPF STATUS, W
	BSF STATUS, RP0
	BCF STATUS, RP1
	MOVWF Int1BContext
	SWAPF PCLATH, W
	MOVWF Int1BContext+D'1'
	SWAPF FSR, W
	MOVWF Int1BContext+D'2'
	BCF PCLATH,3
	BCF PCLATH,4
	GOTO	interrupt
	ORG 0x00000010
delay_us_00000
; { delay_us ; function begin
	MOVLW 0x03
	ADDWF delay_us_00000_arg_del, F
	RRF delay_us_00000_arg_del, F
	RRF delay_us_00000_arg_del, F
	MOVLW 0x7F
	ANDWF delay_us_00000_arg_del, F
label1
	NOP
	DECFSZ delay_us_00000_arg_del, F
	GOTO	label1
	RETURN
; } delay_us function end

	ORG 0x0000001A
delay_ms_00000
; { delay_ms ; function begin
	MOVF delay_ms_00000_arg_del, F
	BTFSS STATUS,Z
	GOTO	label2
	RETURN
label2
	MOVLW 0xF9
label3
	ADDLW 0xFF
	BTFSS STATUS,Z
	GOTO	label3
	NOP
	DECFSZ delay_ms_00000_arg_del, F
	GOTO	label2
	RETURN
; } delay_ms function end

	ORG 0x00000026
delay_s_00000
; { delay_s ; function begin
label4
	MOVLW 0xFA
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	MOVLW 0xFA
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	MOVLW 0xFA
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	MOVLW 0xFA
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	DECFSZ delay_s_00000_arg_del, F
	GOTO	label4
	RETURN
; } delay_s function end

	ORG 0x00000035
ledChar_00000
; { ledChar ; function begin
	BCF	STATUS,IRP
	MOVLW LOW(gbl_displayASCIItoSeg+D'0')
	MOVWF FSR
	MOVLW 0x20
	SUBWF ledChar_00000_arg_iChar, W
	ADDWF FSR, F
	MOVF INDF, W
	MOVWF ledChar_00000_1_iDecoded
	BCF	STATUS,IRP
	MOVLW LOW(gbl_ledData1+D'0')
	MOVWF FSR
	MOVF ledChar_00000_arg_iCol, W
	ADDWF FSR, F
	MOVF ledChar_00000_1_iDecoded, W
	MOVWF INDF
	RETURN
; } ledChar function end

	ORG 0x00000045
i2cWait_00000
; { i2cWait ; function begin
label5
	MOVLW 0x1F
	BSF STATUS, RP0
	BCF STATUS, RP1
	ANDWF gbl_sspcon2, W
	BTFSC STATUS,Z
	BTFSC gbl_sspstat,2
	GOTO	label5
	RETURN
; } i2cWait function end

	ORG 0x0000004D
ledSetDigi_0001B
; { ledSetDigits ; function begin
	BCF	STATUS,IRP
	MOVLW LOW(gbl_ledData1+D'0')
	MOVWF FSR
	MOVF ledSetDigi_0001B_arg_iCol, W
	ADDWF FSR, F
	MOVLW 0x00
	MOVWF INDF
	CLRF ledSetDigi_0001B_1_dig2
label6
	MOVLW 0x0A
	SUBWF ledSetDigi_0001B_arg_iValue, W
	BTFSS STATUS,C
	GOTO	label7
	MOVLW 0x0A
	SUBWF ledSetDigi_0001B_arg_iValue, F
	INCF ledSetDigi_0001B_1_dig2, F
	GOTO	label6
label7
	MOVF ledSetDigi_0001B_1_dig2, F
	BTFSC STATUS,Z
	GOTO	label8
	MOVF ledSetDigi_0001B_arg_iCol, W
	MOVWF ledChar_00000_arg_iCol
	MOVLW 0x30
	ADDWF ledSetDigi_0001B_1_dig2, W
	MOVWF ledChar_00000_arg_iChar
	CALL ledChar_00000
label8
	INCF ledSetDigi_0001B_arg_iCol, W
	MOVWF ledChar_00000_arg_iCol
	MOVLW 0x30
	ADDWF ledSetDigi_0001B_arg_iValue, W
	MOVWF ledChar_00000_arg_iChar
	CALL ledChar_00000
	RETURN
; } ledSetDigits function end

	ORG 0x0000006D
ledSendCha_00016
; { ledSendChar ; function begin
	MOVLW 0x80
	MOVWF ledSendCha_00016_2_cBitSelect
label9
	MOVF ledSendCha_00016_2_cBitSelect, F
	BTFSC STATUS,Z
	RETURN
	BCF STATUS, RP0
	BCF gbl_porta,2
	BSF STATUS, RP0
	MOVF ledSendCha_00016_2_cBitSelect, W
	ANDWF ledSendCha_00016_arg_iData, W
	BTFSC STATUS,Z
	GOTO	label10
	BCF STATUS, RP0
	BSF gbl_porta,0
	GOTO	label11
label10
	BCF STATUS, RP0
	BCF gbl_porta,0
label11
	BSF gbl_porta,2
	BCF STATUS,C
	BSF STATUS, RP0
	RRF ledSendCha_00016_2_cBitSelect, F
	GOTO	label9
; } ledSendChar function end

	ORG 0x00000083
ledLatchUp_00000
; { ledLatchUp ; function begin
	BCF STATUS, RP0
	BCF STATUS, RP1
	BSF gbl_porta,1
	BCF gbl_porta,2
	BCF gbl_porta,0
	MOVLW 0x1E
	BSF STATUS, RP0
	MOVWF delay_us_00000_arg_del
	CALL delay_us_00000
	RETURN
; } ledLatchUp function end

	ORG 0x0000008D
ledLatchDo_00015
; { ledLatchDown ; function begin
	BCF STATUS, RP0
	BCF STATUS, RP1
	BCF gbl_porta,0
	BCF gbl_porta,2
	BCF gbl_porta,1
	RETURN
; } ledLatchDown function end

	ORG 0x00000093
i2cWrite_00000
; { i2cWrite ; function begin
	CALL i2cWait_00000
	MOVF i2cWrite_00000_arg_data, W
	BCF STATUS, RP0
	MOVWF gbl_sspbuf
	RETURN
; } i2cWrite function end

	ORG 0x00000098
i2cStop_00000
; { i2cStop ; function begin
	CALL i2cWait_00000
	BSF gbl_sspcon2,2
	RETURN
; } i2cStop function end

	ORG 0x0000009B
i2cStart_00000
; { i2cStart ; function begin
	CALL i2cWait_00000
	BSF gbl_sspcon2,0
	RETURN
; } i2cStart function end

	ORG 0x0000009E
eepromRead_00000
; { eepromRead ; function begin
	MOVF eepromRead_00000_arg_address, W
	BCF STATUS, RP0
	BSF STATUS, RP1
	MOVWF gbl_eeadr
	BSF STATUS, RP0
	BCF gbl_eecon1,7
	BSF gbl_eecon1,0
	BCF STATUS, RP0
	MOVF gbl_eedata, W
	BSF STATUS, RP0
	BCF STATUS, RP1
	MOVWF CompTempVarRet551
	RETURN
; } eepromRead function end

	ORG 0x000000AB
tda7439Wri_0001F
; { tda7439Write ; function begin
	CALL i2cStart_00000
	MOVLW 0x88
	MOVWF i2cWrite_00000_arg_data
	CALL i2cWrite_00000
	BSF STATUS, RP0
	MOVF tda7439Wri_0001F_arg_bSubAddress, W
	MOVWF i2cWrite_00000_arg_data
	CALL i2cWrite_00000
	BSF STATUS, RP0
	MOVF tda7439Wri_0001F_arg_bData, W
	MOVWF i2cWrite_00000_arg_data
	CALL i2cWrite_00000
	CALL i2cStop_00000
	RETURN
; } tda7439Write function end

	ORG 0x000000B9
ledWrite_00000
; { ledWrite ; function begin
	MOVLW 0x07
	BSF STATUS, RP0
	BCF STATUS, RP1
	MOVWF ledWrite_00000_1_d
	MOVLW 0x01
	MOVWF ledWrite_00000_1_n
label12
	MOVLW 0x09
	SUBWF ledWrite_00000_1_n, W
	BTFSC STATUS,C
	RETURN
	CALL ledLatchDo_00015
	BSF STATUS, RP0
	MOVF ledWrite_00000_1_n, W
	MOVWF ledSendCha_00016_arg_iData
	CALL ledSendCha_00016
	BCF	STATUS,IRP
	MOVLW LOW(gbl_ledData1+D'0')
	MOVWF FSR
	MOVF ledWrite_00000_1_d, W
	ADDWF FSR, F
	MOVF INDF, W
	MOVWF ledSendCha_00016_arg_iData
	CALL ledSendCha_00016
	CALL ledLatchUp_00000
	DECF ledWrite_00000_1_d, F
	INCF ledWrite_00000_1_n, F
	GOTO	label12
; } ledWrite function end

	ORG 0x000000D4
ledSetup_00000
; { ledSetup ; function begin
	CALL ledLatchDo_00015
	MOVLW 0x0B
	BSF STATUS, RP0
	MOVWF ledSendCha_00016_arg_iData
	CALL ledSendCha_00016
	MOVLW 0x07
	MOVWF ledSendCha_00016_arg_iData
	CALL ledSendCha_00016
	CALL ledLatchUp_00000
	CALL ledLatchDo_00015
	MOVLW 0x09
	BSF STATUS, RP0
	MOVWF ledSendCha_00016_arg_iData
	CALL ledSendCha_00016
	CLRF ledSendCha_00016_arg_iData
	CALL ledSendCha_00016
	CALL ledLatchUp_00000
	CALL ledLatchDo_00015
	MOVLW 0x0A
	BSF STATUS, RP0
	MOVWF ledSendCha_00016_arg_iData
	CALL ledSendCha_00016
	MOVLW 0x05
	MOVWF ledSendCha_00016_arg_iData
	CALL ledSendCha_00016
	CALL ledLatchUp_00000
	RETURN
; } ledSetup function end

	ORG 0x000000EF
ledPrint_00001
; { ledPrint ; function begin
	CLRF ledPrint_00001_1_dig
label13
	MOVLW 0x08
	SUBWF ledPrint_00001_1_dig, W
	BTFSC STATUS,C
	RETURN
	BCF STATUS,IRP
	BTFSC ledPrint_00001_arg_s+D'1',0
	BSF STATUS,IRP
	MOVF ledPrint_00001_arg_s, W
	MOVWF FSR
	MOVF INDF, F
	BTFSC STATUS,Z
	GOTO	label14
	MOVF ledPrint_00001_1_dig, W
	MOVWF ledChar_00000_arg_iCol
	BCF STATUS,IRP
	BTFSC ledPrint_00001_arg_s+D'1',0
	BSF STATUS,IRP
	MOVF ledPrint_00001_arg_s, W
	MOVWF FSR
	INCF ledPrint_00001_arg_s, F
	BTFSC STATUS,Z
	INCF ledPrint_00001_arg_s+D'1', F
	MOVF INDF, W
	MOVWF ledChar_00000_arg_iChar
	CALL ledChar_00000
	GOTO	label15
label14
	BCF	STATUS,IRP
	MOVLW LOW(gbl_ledData1+D'0')
	MOVWF FSR
	MOVF ledPrint_00001_1_dig, W
	ADDWF FSR, F
	MOVLW 0x00
	MOVWF INDF
label15
	INCF ledPrint_00001_1_dig, F
	GOTO	label13
; } ledPrint function end

	ORG 0x00000113
functionVa_00024
; { functionValueDisplay ; function begin
	CLRF functionVa_00024_1_isCut
	MOVF functionVa_00024_arg_iValue, W
	XORLW 0x07
	BTFSS STATUS,Z
	GOTO	label16
	CLRF functionVa_00024_arg_iValue
	GOTO	label18
label16
	MOVF functionVa_00024_arg_iValue, W
	SUBLW 0x07
	BTFSC STATUS,C
	GOTO	label17
	MOVF functionVa_00024_arg_iValue, W
	SUBLW 0x0F
	MOVWF CompTempVar587
	BCF STATUS,C
	RLF CompTempVar587, W
	MOVWF functionVa_00024_arg_iValue
	GOTO	label18
label17
	MOVLW 0x01
	MOVWF functionVa_00024_1_isCut
	MOVF functionVa_00024_arg_iValue, W
	SUBLW 0x07
	MOVWF CompTempVar589
	BCF STATUS,C
	RLF CompTempVar589, W
	MOVWF functionVa_00024_arg_iValue
label18
	MOVF functionVa_00024_1_isCut, F
	BTFSC STATUS,Z
	GOTO	label19
	MOVLW 0x04
	MOVWF ledChar_00000_arg_iCol
	MOVLW 0x2D
	MOVWF ledChar_00000_arg_iChar
	CALL ledChar_00000
label19
	MOVF functionVa_00024_arg_iValue, W
	MOVWF ledSetDigi_0001B_arg_iValue
	MOVLW 0x05
	MOVWF ledSetDigi_0001B_arg_iCol
	CALL ledSetDigi_0001B
	RETURN
; } functionValueDisplay function end

	ORG 0x0000013B
eepromWrit_00014
; { eepromWrite ; function begin
	CLRF eepromWrit_00014_1_didWrite
	MOVF eepromWrit_00014_arg_address, W
	MOVWF eepromRead_00000_arg_address
	CALL eepromRead_00000
	MOVF eepromWrit_00014_arg_data, W
	XORWF CompTempVarRet551, W
	BTFSC STATUS,Z
	GOTO	label21
	MOVF gbl_intcon, W
	MOVWF eepromWrit_00014_4_intconsave
	MOVF eepromWrit_00014_arg_address, W
	BCF STATUS, RP0
	BSF STATUS, RP1
	MOVWF gbl_eeadr
	BSF STATUS, RP0
	BCF STATUS, RP1
	MOVF eepromWrit_00014_arg_data, W
	BCF STATUS, RP0
	BSF STATUS, RP1
	MOVWF gbl_eedata
	BSF STATUS, RP0
	BCF gbl_eecon1,7
	BSF gbl_eecon1,2
	CLRF gbl_intcon
	MOVLW 0x55
	MOVWF gbl_eecon2
	MOVLW 0xAA
	MOVWF gbl_eecon2
	BSF gbl_eecon1,1
	BCF STATUS, RP1
	MOVF eepromWrit_00014_4_intconsave, W
	MOVWF gbl_intcon
	BSF STATUS, RP1
	BCF gbl_eecon1,2
label20
	BCF STATUS, RP0
	BCF STATUS, RP1
	BTFSS gbl_pir2,4
	GOTO	label20
	BCF gbl_pir2,4
	MOVLW 0x01
	BSF STATUS, RP0
	MOVWF eepromWrit_00014_1_didWrite
label21
	MOVF eepromWrit_00014_1_didWrite, W
	MOVWF CompTempVarRet550
	RETURN
; } eepromWrite function end

	ORG 0x00000168
timer1Rese_00017
; { timer1Reset ; function begin
	BCF STATUS, RP0
	BCF STATUS, RP1
	BCF gbl_t1con,0
	CLRF gbl_tmr1h
	CLRF gbl_tmr1l
	RETURN
; } timer1Reset function end

	ORG 0x0000016E
tda7439Wri_00018
; { tda7439WriteAll ; function begin
	BSF STATUS, RP0
	BCF STATUS, RP1
	CLRF CompTempVar564
	MOVLW 0x03
	SUBWF gbl_iActiveInput, W
	BTFSC STATUS,Z
	INCF CompTempVar564, F
	BTFSS CompTempVar564,0
	GOTO	label22
	BCF STATUS, RP0
	BSF gbl_portb,4
label22
	BSF STATUS, RP0
	BTFSC CompTempVar564,0
	GOTO	label23
	BCF STATUS, RP0
	BCF gbl_portb,4
label23
	CALL i2cStart_00000
	MOVLW 0x88
	MOVWF i2cWrite_00000_arg_data
	CALL i2cWrite_00000
	MOVLW 0x10
	BSF STATUS, RP0
	MOVWF i2cWrite_00000_arg_data
	CALL i2cWrite_00000
	BSF STATUS, RP0
	MOVF gbl_iActiveInput, W
	MOVWF i2cWrite_00000_arg_data
	CALL i2cWrite_00000
	BCF	STATUS,IRP
	MOVLW LOW(gbl_tda7439_gains+D'0')
	MOVWF FSR
	BSF STATUS, RP0
	MOVF gbl_iActiveInput, W
	ADDWF FSR, F
	MOVF INDF, W
	MOVWF i2cWrite_00000_arg_data
	CALL i2cWrite_00000
	BSF STATUS, RP0
	MOVF gbl_iVolume, W
	MOVWF i2cWrite_00000_arg_data
	CALL i2cWrite_00000
	BSF STATUS, RP0
	MOVF gbl_iBass, W
	MOVWF i2cWrite_00000_arg_data
	CALL i2cWrite_00000
	BSF STATUS, RP0
	MOVF gbl_iMid, W
	MOVWF i2cWrite_00000_arg_data
	CALL i2cWrite_00000
	BSF STATUS, RP0
	MOVF gbl_iTreble, W
	MOVWF i2cWrite_00000_arg_data
	CALL i2cWrite_00000
	BSF STATUS, RP0
	MOVF gbl_iAttenuateL, W
	SUBLW 0x00
	BTFSC STATUS,C
	GOTO	label24
	CLRF i2cWrite_00000_arg_data
	CALL i2cWrite_00000
	BSF STATUS, RP0
	MOVF gbl_iAttenuateL, W
	MOVWF i2cWrite_00000_arg_data
	CALL i2cWrite_00000
	GOTO	label25
label24
	MOVF gbl_iAttenuateR, W
	MOVWF i2cWrite_00000_arg_data
	CALL i2cWrite_00000
	BSF STATUS, RP0
	CLRF i2cWrite_00000_arg_data
	CALL i2cWrite_00000
label25
	CALL i2cStop_00000
	RETURN
; } tda7439WriteAll function end

	ORG 0x000001B7
tda7439Set_00023
; { tda7439SetBalance ; function begin
	CALL i2cStart_00000
	MOVLW 0x88
	MOVWF i2cWrite_00000_arg_data
	CALL i2cWrite_00000
	MOVLW 0x16
	BSF STATUS, RP0
	MOVWF i2cWrite_00000_arg_data
	CALL i2cWrite_00000
	BSF STATUS, RP0
	MOVF gbl_iAttenuateL, W
	SUBLW 0x00
	BTFSC STATUS,C
	GOTO	label26
	CLRF i2cWrite_00000_arg_data
	CALL i2cWrite_00000
	BSF STATUS, RP0
	MOVF gbl_iAttenuateL, W
	MOVWF i2cWrite_00000_arg_data
	CALL i2cWrite_00000
	GOTO	label27
label26
	MOVF gbl_iAttenuateR, W
	MOVWF i2cWrite_00000_arg_data
	CALL i2cWrite_00000
	BSF STATUS, RP0
	CLRF i2cWrite_00000_arg_data
	CALL i2cWrite_00000
label27
	CALL i2cStop_00000
	RETURN
; } tda7439SetBalance function end

	ORG 0x000001D3
tda7439Set_00022
; { tda7439SetTreble ; function begin
	MOVLW 0x05
	BSF STATUS, RP0
	BCF STATUS, RP1
	MOVWF tda7439Wri_0001F_arg_bSubAddress
	MOVF gbl_iTreble, W
	MOVWF tda7439Wri_0001F_arg_bData
	CALL tda7439Wri_0001F
	RETURN
; } tda7439SetTreble function end

	ORG 0x000001DB
tda7439Set_00021
; { tda7439SetMid ; function begin
	MOVLW 0x04
	BSF STATUS, RP0
	BCF STATUS, RP1
	MOVWF tda7439Wri_0001F_arg_bSubAddress
	MOVF gbl_iMid, W
	MOVWF tda7439Wri_0001F_arg_bData
	CALL tda7439Wri_0001F
	RETURN
; } tda7439SetMid function end

	ORG 0x000001E3
tda7439Set_00020
; { tda7439SetBass ; function begin
	MOVLW 0x03
	BSF STATUS, RP0
	BCF STATUS, RP1
	MOVWF tda7439Wri_0001F_arg_bSubAddress
	MOVF gbl_iBass, W
	MOVWF tda7439Wri_0001F_arg_bData
	CALL tda7439Wri_0001F
	RETURN
; } tda7439SetBass function end

	ORG 0x000001EB
tda7439Set_0001D
; { tda7439SetInput ; function begin
	BSF STATUS, RP0
	BCF STATUS, RP1
	CLRF CompTempVar582
	MOVLW 0x03
	SUBWF gbl_iActiveInput, W
	BTFSC STATUS,Z
	INCF CompTempVar582, F
	BTFSS CompTempVar582,0
	GOTO	label28
	BCF STATUS, RP0
	BSF gbl_portb,4
label28
	BSF STATUS, RP0
	BTFSC CompTempVar582,0
	GOTO	label29
	BCF STATUS, RP0
	BCF gbl_portb,4
label29
	CALL i2cStart_00000
	MOVLW 0x88
	MOVWF i2cWrite_00000_arg_data
	CALL i2cWrite_00000
	MOVLW 0x10
	BSF STATUS, RP0
	MOVWF i2cWrite_00000_arg_data
	CALL i2cWrite_00000
	BSF STATUS, RP0
	MOVF gbl_iActiveInput, W
	MOVWF i2cWrite_00000_arg_data
	CALL i2cWrite_00000
	BCF	STATUS,IRP
	MOVLW LOW(gbl_tda7439_gains+D'0')
	MOVWF FSR
	BSF STATUS, RP0
	MOVF gbl_iActiveInput, W
	ADDWF FSR, F
	MOVF INDF, W
	MOVWF i2cWrite_00000_arg_data
	CALL i2cWrite_00000
	CALL i2cStop_00000
	RETURN
; } tda7439SetInput function end

	ORG 0x00000212
tda7439Set_0001A
; { tda7439SetVolume ; function begin
	BSF STATUS, RP0
	BCF STATUS, RP1
	MOVF gbl_iMute, F
	BTFSC STATUS,Z
	GOTO	label30
	MOVLW 0x02
	MOVWF tda7439Wri_0001F_arg_bSubAddress
	MOVLW 0x38
	MOVWF tda7439Wri_0001F_arg_bData
	CALL tda7439Wri_0001F
	RETURN
label30
	MOVLW 0x02
	MOVWF tda7439Wri_0001F_arg_bSubAddress
	MOVF gbl_iVolume, W
	MOVWF tda7439Wri_0001F_arg_bData
	CALL tda7439Wri_0001F
	RETURN
; } tda7439SetVolume function end

	ORG 0x00000223
showVolAnd_00019
; { showVolAndInput ; function begin
	BSF STATUS, RP0
	BCF STATUS, RP1
	MOVF gbl_iMute, F
	BTFSC STATUS,Z
	GOTO	label31
	MOVLW 0x53
	MOVWF CompTempVar568
	MOVLW 0x6E
	MOVWF CompTempVar568+D'1'
	MOVLW 0x64
	MOVWF CompTempVar568+D'2'
	MOVLW 0x20
	MOVWF CompTempVar568+D'3'
	MOVLW 0x4F
	MOVWF CompTempVar568+D'4'
	MOVLW 0x46
	MOVWF CompTempVar568+D'5'
	MOVWF CompTempVar568+D'6'
	CLRF CompTempVar568+D'7'
	MOVLW HIGH(CompTempVar568+D'0')
	MOVWF ledPrint_00001_arg_s+D'1'
	MOVLW LOW(CompTempVar568+D'0')
	MOVWF ledPrint_00001_arg_s
	CALL ledPrint_00001
	CALL ledWrite_00000
	GOTO	label39
label31
	MOVF gbl_iActiveInput, W
	XORLW 0x00
	BTFSC STATUS,Z
	GOTO	label32
	XORLW 0x01
	BTFSC STATUS,Z
	GOTO	label33
	XORLW 0x03
	BTFSC STATUS,Z
	GOTO	label34
	XORLW 0x01
	BTFSC STATUS,Z
	GOTO	label35
	GOTO	label36
label32
	MOVLW 0x49
	MOVWF CompTempVar571
	MOVLW 0x6E
	MOVWF CompTempVar571+D'1'
	MOVLW 0x33
	MOVWF CompTempVar571+D'2'
	CLRF CompTempVar571+D'3'
	MOVLW HIGH(CompTempVar571+D'0')
	MOVWF ledPrint_00001_arg_s+D'1'
	MOVLW LOW(CompTempVar571+D'0')
	MOVWF ledPrint_00001_arg_s
	CALL ledPrint_00001
	GOTO	label36
label33
	MOVLW 0x49
	MOVWF CompTempVar573
	MOVLW 0x6E
	MOVWF CompTempVar573+D'1'
	MOVLW 0x32
	MOVWF CompTempVar573+D'2'
	CLRF CompTempVar573+D'3'
	MOVLW HIGH(CompTempVar573+D'0')
	MOVWF ledPrint_00001_arg_s+D'1'
	MOVLW LOW(CompTempVar573+D'0')
	MOVWF ledPrint_00001_arg_s
	CALL ledPrint_00001
	GOTO	label36
label34
	MOVLW 0x49
	MOVWF CompTempVar575
	MOVLW 0x6E
	MOVWF CompTempVar575+D'1'
	MOVLW 0x31
	MOVWF CompTempVar575+D'2'
	CLRF CompTempVar575+D'3'
	MOVLW HIGH(CompTempVar575+D'0')
	MOVWF ledPrint_00001_arg_s+D'1'
	MOVLW LOW(CompTempVar575+D'0')
	MOVWF ledPrint_00001_arg_s
	CALL ledPrint_00001
	GOTO	label36
label35
	MOVLW 0x62
	MOVWF CompTempVar577
	MOVLW 0x6C
	MOVWF CompTempVar577+D'1'
	MOVLW 0x75
	MOVWF CompTempVar577+D'2'
	CLRF CompTempVar577+D'3'
	MOVLW HIGH(CompTempVar577+D'0')
	MOVWF ledPrint_00001_arg_s+D'1'
	MOVLW LOW(CompTempVar577+D'0')
	MOVWF ledPrint_00001_arg_s
	CALL ledPrint_00001
label36
	MOVF gbl_iVolume, W
	MOVWF showVolAnd_00019_8_cGain
	BCF	STATUS,IRP
	MOVLW LOW(gbl_tda7439_gains+D'0')
	MOVWF FSR
	MOVF gbl_iActiveInput, W
	ADDWF FSR, F
	MOVF INDF, W
	MOVWF showVolAnd_00019_8_cGainAdj
	BCF STATUS,C
	RLF showVolAnd_00019_8_cGainAdj, F
	MOVF showVolAnd_00019_8_cGainAdj, W
	SUBWF showVolAnd_00019_8_cGain, W
	BTFSC STATUS,C
	GOTO	label37
	CLRF gbl_ledData1+D'3'
	MOVF showVolAnd_00019_8_cGain, W
	SUBWF showVolAnd_00019_8_cGainAdj, W
	MOVWF showVolAnd_00019_8_cGain
	GOTO	label38
label37
	MOVLW 0x03
	MOVWF ledChar_00000_arg_iCol
	MOVLW 0x2D
	MOVWF ledChar_00000_arg_iChar
	CALL ledChar_00000
	MOVF showVolAnd_00019_8_cGainAdj, W
	SUBWF showVolAnd_00019_8_cGain, F
label38
	MOVF showVolAnd_00019_8_cGain, W
	MOVWF ledSetDigi_0001B_arg_iValue
	MOVLW 0x04
	MOVWF ledSetDigi_0001B_arg_iCol
	CALL ledSetDigi_0001B
	MOVLW 0x06
	MOVWF ledChar_00000_arg_iCol
	MOVLW 0x64
	MOVWF ledChar_00000_arg_iChar
	CALL ledChar_00000
	MOVLW 0x07
	MOVWF ledChar_00000_arg_iCol
	MOVLW 0x62
	MOVWF ledChar_00000_arg_iChar
	CALL ledChar_00000
	CALL ledWrite_00000
label39
	MOVF gbl_iVolume, W
	XORLW 0x38
	BTFSC STATUS,Z
	GOTO	label40
	MOVF gbl_iMute, F
	BTFSC STATUS,Z
	GOTO	label41
label40
	BCF STATUS, RP0
	BCF gbl_portc,2
	BSF gbl_portc,1
	RETURN
label41
	BCF STATUS, RP0
	BSF gbl_portc,2
	BCF gbl_portc,1
	RETURN
; } showVolAndInput function end

	ORG 0x000002B8
saveData_00000
; { saveData ; function begin
	BSF STATUS, RP0
	BCF STATUS, RP1
	CLRF saveData_00000_1_didWrite
	MOVLW 0x01
	MOVWF eepromWrit_00014_arg_address
	MOVF gbl_iVolume, W
	MOVWF eepromWrit_00014_arg_data
	CALL eepromWrit_00014
	MOVF CompTempVarRet550, W
	ADDWF saveData_00000_1_didWrite, F
	MOVLW 0x02
	MOVWF eepromWrit_00014_arg_address
	MOVF gbl_iAttenuateL, W
	MOVWF eepromWrit_00014_arg_data
	CALL eepromWrit_00014
	MOVF CompTempVarRet550, W
	ADDWF saveData_00000_1_didWrite, F
	MOVLW 0x03
	MOVWF eepromWrit_00014_arg_address
	MOVF gbl_iAttenuateR, W
	MOVWF eepromWrit_00014_arg_data
	CALL eepromWrit_00014
	MOVF CompTempVarRet550, W
	ADDWF saveData_00000_1_didWrite, F
	MOVLW 0x04
	MOVWF eepromWrit_00014_arg_address
	MOVF gbl_iBass, W
	MOVWF eepromWrit_00014_arg_data
	CALL eepromWrit_00014
	MOVF CompTempVarRet550, W
	ADDWF saveData_00000_1_didWrite, F
	MOVLW 0x05
	MOVWF eepromWrit_00014_arg_address
	MOVF gbl_iMid, W
	MOVWF eepromWrit_00014_arg_data
	CALL eepromWrit_00014
	MOVF CompTempVarRet550, W
	ADDWF saveData_00000_1_didWrite, F
	MOVLW 0x06
	MOVWF eepromWrit_00014_arg_address
	MOVF gbl_iTreble, W
	MOVWF eepromWrit_00014_arg_data
	CALL eepromWrit_00014
	MOVF CompTempVarRet550, W
	ADDWF saveData_00000_1_didWrite, F
	MOVLW 0x07
	MOVWF eepromWrit_00014_arg_address
	MOVF gbl_iActiveInput, W
	MOVWF eepromWrit_00014_arg_data
	CALL eepromWrit_00014
	MOVF CompTempVarRet550, W
	ADDWF saveData_00000_1_didWrite, F
	MOVF saveData_00000_1_didWrite, F
	BTFSC STATUS,Z
	RETURN
	CLRF eepromWrit_00014_arg_address
	MOVLW 0x0A
	MOVWF eepromWrit_00014_arg_data
	CALL eepromWrit_00014
	RETURN
; } saveData function end

	ORG 0x000002F4
ledOn_00000
; { ledOn ; function begin
	BCF STATUS, RP0
	BCF STATUS, RP1
	BCF gbl_porta,0
	BCF gbl_porta,2
	BSF gbl_porta,1
	BCF gbl_portb,3
	MOVLW 0xFA
	BSF STATUS, RP0
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	CALL ledSetup_00000
	CALL ledLatchDo_00015
	MOVLW 0x0C
	BSF STATUS, RP0
	MOVWF ledSendCha_00016_arg_iData
	CALL ledSendCha_00016
	MOVLW 0x01
	MOVWF ledSendCha_00016_arg_iData
	CALL ledSendCha_00016
	CALL ledLatchUp_00000
	MOVLW 0xFA
	MOVWF delay_us_00000_arg_del
	CALL delay_us_00000
	RETURN
; } ledOn function end

	ORG 0x0000030C
ledOff_00000
; { ledOff ; function begin
	CALL ledLatchDo_00015
	MOVLW 0x0C
	BSF STATUS, RP0
	MOVWF ledSendCha_00016_arg_iData
	CALL ledSendCha_00016
	CLRF ledSendCha_00016_arg_iData
	CALL ledSendCha_00016
	CALL ledLatchUp_00000
	BCF STATUS, RP0
	BCF gbl_portb,3
	MOVLW 0x64
	BSF STATUS, RP0
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	RETURN
; } ledOff function end

	ORG 0x0000031B
functionVa_00027
; { functionValueLower ; function begin
	MOVF functionVa_00027_arg_iValue, W
	XORLW 0x0E
	BTFSS STATUS,Z
	GOTO	label42
	MOVLW 0x07
	MOVWF functionVa_00027_arg_iValue
	GOTO	label44
label42
	MOVF functionVa_00027_arg_iValue, W
	SUBLW 0x07
	BTFSC STATUS,C
	GOTO	label43
	INCF functionVa_00027_arg_iValue, F
	GOTO	label44
label43
	MOVF functionVa_00027_arg_iValue, F
	BTFSS STATUS,Z
	DECF functionVa_00027_arg_iValue, F
label44
	MOVF functionVa_00027_arg_iValue, W
	MOVWF CompTempVarRet603
	RETURN
; } functionValueLower function end

	ORG 0x0000032E
functionVa_00026
; { functionValueRaise ; function begin
	MOVF functionVa_00026_arg_iValue, W
	XORLW 0x07
	BTFSS STATUS,Z
	GOTO	label45
	MOVLW 0x0E
	MOVWF functionVa_00026_arg_iValue
	GOTO	label47
label45
	MOVF functionVa_00026_arg_iValue, W
	SUBLW 0x08
	BTFSC STATUS,C
	GOTO	label46
	DECF functionVa_00026_arg_iValue, F
	GOTO	label47
label46
	MOVLW 0x07
	SUBWF functionVa_00026_arg_iValue, W
	BTFSS STATUS,C
	INCF functionVa_00026_arg_iValue, F
label47
	MOVF functionVa_00026_arg_iValue, W
	MOVWF CompTempVarRet602
	RETURN
; } functionValueRaise function end

	ORG 0x00000342
functionDi_00025
; { functionDisplay ; function begin
	BSF STATUS, RP0
	BCF STATUS, RP1
	MOVF gbl_iFunctionMode, W
	XORLW 0x01
	BTFSC STATUS,Z
	GOTO	label48
	XORLW 0x03
	BTFSC STATUS,Z
	GOTO	label49
	XORLW 0x01
	BTFSC STATUS,Z
	GOTO	label50
	XORLW 0x07
	BTFSC STATUS,Z
	GOTO	label51
	GOTO	label54
label48
	MOVLW 0x62
	MOVWF CompTempVar590
	MOVLW 0x41
	MOVWF CompTempVar590+D'1'
	MOVLW 0x53
	MOVWF CompTempVar590+D'2'
	MOVWF CompTempVar590+D'3'
	CLRF CompTempVar590+D'4'
	MOVLW HIGH(CompTempVar590+D'0')
	MOVWF ledPrint_00001_arg_s+D'1'
	MOVLW LOW(CompTempVar590+D'0')
	MOVWF ledPrint_00001_arg_s
	CALL ledPrint_00001
	MOVF gbl_iMid, W
	MOVWF functionVa_00024_arg_iValue
	CALL functionVa_00024
	GOTO	label54
label49
	MOVLW 0x54
	MOVWF CompTempVar592
	MOVLW 0x72
	MOVWF CompTempVar592+D'1'
	MOVLW 0x65
	MOVWF CompTempVar592+D'2'
	MOVLW 0x62
	MOVWF CompTempVar592+D'3'
	CLRF CompTempVar592+D'4'
	MOVLW HIGH(CompTempVar592+D'0')
	MOVWF ledPrint_00001_arg_s+D'1'
	MOVLW LOW(CompTempVar592+D'0')
	MOVWF ledPrint_00001_arg_s
	CALL ledPrint_00001
	MOVF gbl_iTreble, W
	MOVWF functionVa_00024_arg_iValue
	CALL functionVa_00024
	GOTO	label54
label50
	MOVLW 0x4C
	MOVWF CompTempVar594
	MOVLW 0x6F
	MOVWF CompTempVar594+D'1'
	MOVLW 0x20
	MOVWF CompTempVar594+D'2'
	MOVLW 0x62
	MOVWF CompTempVar594+D'3'
	CLRF CompTempVar594+D'4'
	MOVLW HIGH(CompTempVar594+D'0')
	MOVWF ledPrint_00001_arg_s+D'1'
	MOVLW LOW(CompTempVar594+D'0')
	MOVWF ledPrint_00001_arg_s
	CALL ledPrint_00001
	MOVF gbl_iBass, W
	MOVWF functionVa_00024_arg_iValue
	CALL functionVa_00024
	GOTO	label54
label51
	MOVF gbl_iAttenuateL, W
	SUBLW 0x00
	BTFSC STATUS,C
	GOTO	label52
	MOVLW 0x4C
	MOVWF CompTempVar596
	MOVLW 0x20
	MOVWF CompTempVar596+D'1'
	MOVWF CompTempVar596+D'2'
	MOVWF CompTempVar596+D'3'
	MOVLW 0x2D
	MOVWF CompTempVar596+D'4'
	CLRF CompTempVar596+D'5'
	MOVLW HIGH(CompTempVar596+D'0')
	MOVWF ledPrint_00001_arg_s+D'1'
	MOVLW LOW(CompTempVar596+D'0')
	MOVWF ledPrint_00001_arg_s
	CALL ledPrint_00001
	MOVF gbl_iAttenuateL, W
	MOVWF ledSetDigi_0001B_arg_iValue
	MOVLW 0x05
	MOVWF ledSetDigi_0001B_arg_iCol
	CALL ledSetDigi_0001B
	GOTO	label54
label52
	MOVF gbl_iAttenuateR, W
	SUBLW 0x00
	BTFSC STATUS,C
	GOTO	label53
	MOVLW 0x72
	MOVWF CompTempVar598
	MOVLW 0x20
	MOVWF CompTempVar598+D'1'
	MOVWF CompTempVar598+D'2'
	MOVWF CompTempVar598+D'3'
	MOVLW 0x2D
	MOVWF CompTempVar598+D'4'
	CLRF CompTempVar598+D'5'
	MOVLW HIGH(CompTempVar598+D'0')
	MOVWF ledPrint_00001_arg_s+D'1'
	MOVLW LOW(CompTempVar598+D'0')
	MOVWF ledPrint_00001_arg_s
	CALL ledPrint_00001
	MOVF gbl_iAttenuateR, W
	MOVWF ledSetDigi_0001B_arg_iValue
	MOVLW 0x05
	MOVWF ledSetDigi_0001B_arg_iCol
	CALL ledSetDigi_0001B
	GOTO	label54
label53
	MOVLW 0x42
	MOVWF CompTempVar600
	MOVLW 0x41
	MOVWF CompTempVar600+D'1'
	MOVLW 0x4C
	MOVWF CompTempVar600+D'2'
	MOVLW 0x20
	MOVWF CompTempVar600+D'3'
	MOVWF CompTempVar600+D'4'
	MOVWF CompTempVar600+D'5'
	MOVLW 0x30
	MOVWF CompTempVar600+D'6'
	CLRF CompTempVar600+D'7'
	MOVLW HIGH(CompTempVar600+D'0')
	MOVWF ledPrint_00001_arg_s+D'1'
	MOVLW LOW(CompTempVar600+D'0')
	MOVWF ledPrint_00001_arg_s
	CALL ledPrint_00001
label54
	MOVLW 0x07
	MOVWF ledChar_00000_arg_iCol
	MOVLW 0x64
	MOVWF ledChar_00000_arg_iChar
	CALL ledChar_00000
	CALL ledWrite_00000
	RETURN
; } functionDisplay function end

	ORG 0x000003D0
readData_00000
; { readData ; function begin
	BSF STATUS, RP0
	BCF STATUS, RP1
	CLRF eepromRead_00000_arg_address
	CALL eepromRead_00000
	MOVF CompTempVarRet551, W
	XORLW 0x0A
	BTFSS STATUS,Z
	RETURN
	MOVLW 0x01
	MOVWF eepromRead_00000_arg_address
	CALL eepromRead_00000
	MOVF CompTempVarRet551, W
	MOVWF gbl_iVolume
	MOVLW 0x02
	MOVWF eepromRead_00000_arg_address
	CALL eepromRead_00000
	MOVF CompTempVarRet551, W
	MOVWF gbl_iAttenuateL
	MOVLW 0x03
	MOVWF eepromRead_00000_arg_address
	CALL eepromRead_00000
	MOVF CompTempVarRet551, W
	MOVWF gbl_iAttenuateR
	MOVLW 0x04
	MOVWF eepromRead_00000_arg_address
	CALL eepromRead_00000
	MOVF CompTempVarRet551, W
	MOVWF gbl_iBass
	MOVLW 0x05
	MOVWF eepromRead_00000_arg_address
	CALL eepromRead_00000
	MOVF CompTempVarRet551, W
	MOVWF gbl_iMid
	MOVLW 0x06
	MOVWF eepromRead_00000_arg_address
	CALL eepromRead_00000
	MOVF CompTempVarRet551, W
	MOVWF gbl_iTreble
	MOVLW 0x07
	MOVWF eepromRead_00000_arg_address
	CALL eepromRead_00000
	MOVF CompTempVarRet551, W
	MOVWF gbl_iActiveInput
	RETURN
; } readData function end

	ORG 0x000003FC
ledTest_00000
; { ledTest ; function begin
	MOVLW 0x20
	BSF STATUS, RP0
	BCF STATUS, RP1
	MOVWF CompTempVar554+D'4'
	MOVLW 0x49
	MOVWF CompTempVar554
	MOVLW 0x69
	MOVWF CompTempVar554+D'2'
	MOVLW 0x6E
	MOVWF CompTempVar554+D'1'
	MOVWF CompTempVar554+D'6'
	MOVLW 0x6F
	MOVWF CompTempVar554+D'5'
	MOVLW 0x74
	MOVWF CompTempVar554+D'3'
	CLRF CompTempVar554+D'7'
	MOVLW HIGH(CompTempVar554+D'0')
	MOVWF ledPrint_00001_arg_s+D'1'
	MOVLW LOW(CompTempVar554+D'0')
	MOVWF ledPrint_00001_arg_s
	CALL ledPrint_00001
	CALL ledWrite_00000
	RETURN
; } ledTest function end

	ORG 0x00000413
functionUp_00000
; { functionUp ; function begin
	BSF STATUS, RP0
	BCF STATUS, RP1
	INCF gbl_iFunctionMode, F
	MOVF gbl_iFunctionMode, W
	SUBLW 0x04
	BTFSC STATUS,C
	GOTO	label55
	MOVLW 0x01
	MOVWF gbl_iFunctionMode
label55
	CALL functionDi_00025
	RETURN
; } functionUp function end

	ORG 0x0000041E
functionRa_00028
; { functionRaise ; function begin
	BSF STATUS, RP0
	BCF STATUS, RP1
	MOVF gbl_iFunctionMode, W
	XORLW 0x01
	BTFSC STATUS,Z
	GOTO	label56
	XORLW 0x03
	BTFSC STATUS,Z
	GOTO	label57
	XORLW 0x01
	BTFSC STATUS,Z
	GOTO	label58
	XORLW 0x07
	BTFSC STATUS,Z
	GOTO	label59
	GOTO	label62
label56
	MOVF gbl_iMid, W
	MOVWF functionVa_00026_arg_iValue
	CALL functionVa_00026
	MOVF CompTempVarRet602, W
	MOVWF gbl_iMid
	CALL tda7439Set_00021
	GOTO	label62
label57
	MOVF gbl_iTreble, W
	MOVWF functionVa_00026_arg_iValue
	CALL functionVa_00026
	MOVF CompTempVarRet602, W
	MOVWF gbl_iTreble
	CALL tda7439Set_00022
	GOTO	label62
label58
	MOVF gbl_iBass, W
	MOVWF functionVa_00026_arg_iValue
	CALL functionVa_00026
	MOVF CompTempVarRet602, W
	MOVWF gbl_iBass
	CALL tda7439Set_00020
	GOTO	label62
label59
	MOVF gbl_iAttenuateL, F
	BTFSS STATUS,Z
	GOTO	label60
	INCF gbl_iAttenuateR, F
	MOVF gbl_iAttenuateR, W
	SUBLW 0x4E
	BTFSC STATUS,C
	GOTO	label61
	MOVLW 0x4E
	MOVWF gbl_iAttenuateR
	GOTO	label61
label60
	DECF gbl_iAttenuateL, F
label61
	CALL tda7439Set_00023
label62
	CALL functionDi_00025
	RETURN
; } functionRaise function end

	ORG 0x00000452
functionLo_00029
; { functionLower ; function begin
	BSF STATUS, RP0
	BCF STATUS, RP1
	MOVF gbl_iFunctionMode, W
	XORLW 0x01
	BTFSC STATUS,Z
	GOTO	label63
	XORLW 0x03
	BTFSC STATUS,Z
	GOTO	label64
	XORLW 0x01
	BTFSC STATUS,Z
	GOTO	label65
	XORLW 0x07
	BTFSC STATUS,Z
	GOTO	label66
	GOTO	label69
label63
	MOVF gbl_iMid, W
	MOVWF functionVa_00027_arg_iValue
	CALL functionVa_00027
	MOVF CompTempVarRet603, W
	MOVWF gbl_iMid
	CALL tda7439Set_00021
	GOTO	label69
label64
	MOVF gbl_iTreble, W
	MOVWF functionVa_00027_arg_iValue
	CALL functionVa_00027
	MOVF CompTempVarRet603, W
	MOVWF gbl_iTreble
	CALL tda7439Set_00022
	GOTO	label69
label65
	MOVF gbl_iBass, W
	MOVWF functionVa_00027_arg_iValue
	CALL functionVa_00027
	MOVF CompTempVarRet603, W
	MOVWF gbl_iBass
	CALL tda7439Set_00020
	GOTO	label69
label66
	MOVF gbl_iAttenuateR, F
	BTFSS STATUS,Z
	GOTO	label67
	INCF gbl_iAttenuateL, F
	MOVF gbl_iAttenuateL, W
	SUBLW 0x4E
	BTFSC STATUS,C
	GOTO	label68
	MOVLW 0x4E
	MOVWF gbl_iAttenuateL
	GOTO	label68
label67
	DECF gbl_iAttenuateR, F
label68
	CALL tda7439Set_00023
label69
	CALL functionDi_00025
	RETURN
; } functionLower function end

	ORG 0x00000486
functionDo_0002A
; { functionDown ; function begin
	BSF STATUS, RP0
	BCF STATUS, RP1
	DECF gbl_iFunctionMode, F
	MOVLW 0x01
	SUBWF gbl_iFunctionMode, W
	BTFSC STATUS,C
	GOTO	label70
	MOVLW 0x04
	MOVWF gbl_iFunctionMode
label70
	CALL functionDi_00025
	RETURN
; } functionDown function end

	ORG 0x00000491
doVolumeUp_00000
; { doVolumeUp ; function begin
	BSF STATUS, RP0
	BCF STATUS, RP1
	MOVF gbl_iVolume, W
	XORLW 0x38
	BTFSS STATUS,Z
	GOTO	label71
	CLRF gbl_iMute
	MOVLW 0x2F
	MOVWF gbl_iVolume
	GOTO	label72
label71
	DECF gbl_iVolume, F
label72
	MOVF gbl_iVolume, W
	SUBLW 0x38
	BTFSS STATUS,C
	CLRF gbl_iVolume
	CALL tda7439Set_0001A
	RETURN
; } doVolumeUp function end

	ORG 0x000004A2
doVolumeDo_0001C
; { doVolumeDown ; function begin
	BSF STATUS, RP0
	BCF STATUS, RP1
	INCF gbl_iVolume, F
	MOVF gbl_iVolume, W
	SUBLW 0x2F
	BTFSC STATUS,C
	GOTO	label73
	MOVLW 0x01
	MOVWF gbl_iMute
	MOVLW 0x38
	MOVWF gbl_iVolume
label73
	CALL tda7439Set_0001A
	RETURN
; } doVolumeDown function end

	ORG 0x000004AF
doPower_00000
; { doPower ; function begin
	BSF STATUS, RP0
	BCF STATUS, RP1
	MOVF gbl_iPower, F
	BTFSC STATUS,Z
	GOTO	label74
	BCF STATUS, RP0
	BCF gbl_portc,2
	BSF gbl_portc,1
	BCF gbl_portc,0
	CALL timer1Rese_00017
	MOVLW 0x47
	BSF STATUS, RP0
	MOVWF CompTempVar560
	MOVLW 0x6F
	MOVWF CompTempVar560+D'1'
	MOVWF CompTempVar560+D'2'
	MOVLW 0x64
	MOVWF CompTempVar560+D'3'
	MOVLW 0x62
	MOVWF CompTempVar560+D'4'
	MOVLW 0x79
	MOVWF CompTempVar560+D'5'
	MOVLW 0x65
	MOVWF CompTempVar560+D'6'
	CLRF CompTempVar560+D'7'
	MOVLW HIGH(CompTempVar560+D'0')
	MOVWF ledPrint_00001_arg_s+D'1'
	MOVLW LOW(CompTempVar560+D'0')
	MOVWF ledPrint_00001_arg_s
	CALL ledPrint_00001
	CALL ledWrite_00000
	CLRF gbl_iPower
	BCF STATUS, RP0
	BCF gbl_portb,5
	BCF gbl_portb,4
	MOVLW 0x06
	BSF STATUS, RP0
	MOVWF delay_s_00000_arg_del
	CALL delay_s_00000
	CALL ledOff_00000
	CALL saveData_00000
	BCF STATUS, RP0
	BCF gbl_portc,2
	BCF gbl_portc,1
	BSF gbl_portc,0
	RETURN
label74
	BCF STATUS, RP0
	BCF gbl_portc,2
	BSF gbl_portc,1
	BCF gbl_portc,0
	CALL ledOn_00000
	MOVLW 0x48
	MOVWF CompTempVar562
	MOVLW 0x45
	MOVWF CompTempVar562+D'1'
	MOVLW 0x4C
	MOVWF CompTempVar562+D'2'
	MOVWF CompTempVar562+D'3'
	MOVLW 0x4F
	MOVWF CompTempVar562+D'4'
	CLRF CompTempVar562+D'5'
	MOVLW HIGH(CompTempVar562+D'0')
	MOVWF ledPrint_00001_arg_s+D'1'
	MOVLW LOW(CompTempVar562+D'0')
	MOVWF ledPrint_00001_arg_s
	CALL ledPrint_00001
	CALL ledWrite_00000
	MOVLW 0x64
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	BCF STATUS, RP0
	BSF gbl_portb,5
	MOVLW 0x01
	BSF STATUS, RP0
	MOVWF gbl_iPower
	CLRF doPower_00000_34_l
label75
	MOVLW 0x1B
	SUBWF doPower_00000_34_l, W
	BTFSC STATUS,C
	GOTO	label76
	BCF STATUS, RP0
	BSF gbl_portc,2
	BCF gbl_portc,1
	MOVLW 0x64
	BSF STATUS, RP0
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	BCF STATUS, RP0
	BCF gbl_portc,2
	BSF gbl_portc,1
	MOVLW 0x64
	BSF STATUS, RP0
	MOVWF delay_ms_00000_arg_del
	CALL delay_ms_00000
	INCF doPower_00000_34_l, F
	GOTO	label75
label76
	CALL tda7439Wri_00018
	CALL showVolAnd_00019
	RETURN
; } doPower function end

	ORG 0x00000512
doInputUp_00000
; { doInputUp ; function begin
	BSF STATUS, RP0
	BCF STATUS, RP1
	DECF gbl_iActiveInput, F
	MOVF gbl_iActiveInput, W
	SUBLW 0x04
	BTFSC STATUS,C
	GOTO	label77
	MOVLW 0x03
	MOVWF gbl_iActiveInput
label77
	CALL tda7439Set_0001D
	RETURN
; } doInputUp function end

	ORG 0x0000051D
doInputDow_0001E
; { doInputDown ; function begin
	BSF STATUS, RP0
	BCF STATUS, RP1
	INCF gbl_iActiveInput, F
	MOVLW 0x04
	SUBWF gbl_iActiveInput, W
	BTFSC STATUS,C
	CLRF gbl_iActiveInput
	CALL tda7439Set_0001D
	RETURN
; } doInputDown function end

	ORG 0x00000526
rc5Process_00000
; { rc5Process ; function begin
	BCF STATUS, RP0
	BCF STATUS, RP1
	BCF gbl_portb,1
	BSF STATUS, RP0
	MOVF gbl_rc5_address, F
	BTFSS STATUS,Z
	RETURN
	MOVF gbl_iPower, F
	BTFSC STATUS,Z
	GOTO	label90
	MOVF gbl_rc5_command, W
	XORLW 0x0D
	BTFSC STATUS,Z
	GOTO	label78
	XORLW 0x1D
	BTFSC STATUS,Z
	GOTO	label82
	XORLW 0x01
	BTFSC STATUS,Z
	GOTO	label84
	XORLW 0x31
	BTFSC STATUS,Z
	GOTO	label86
	XORLW 0x01
	BTFSC STATUS,Z
	GOTO	label88
	GOTO	label90
label78
	MOVF gbl_rc5_flickBit, W
	XORWF gbl_rc5_flickBitOld, W
	BTFSC STATUS,Z
	GOTO	label80
	CLRF gbl_iMuteHeld
	MOVF gbl_iFunctionMode, F
	BTFSS STATUS,Z
	GOTO	label79
	CALL timer1Rese_00017
	BSF gbl_t1con,0
	GOTO	label90
label79
	CLRF gbl_iFunctionMode
	CALL showVolAnd_00019
	CALL timer1Rese_00017
	GOTO	label90
label80
	INCF gbl_iMuteHeld, F
	CALL timer1Rese_00017
	BSF STATUS, RP0
	MOVF gbl_iMuteHeld, W
	SUBLW 0x0E
	BTFSC STATUS,C
	GOTO	label81
	BSF gbl_cTask,6
	GOTO	label90
label81
	BCF STATUS, RP0
	BSF gbl_t1con,0
	GOTO	label90
label82
	MOVF gbl_iFunctionMode, F
	BTFSS STATUS,Z
	GOTO	label83
	CALL doVolumeUp_00000
	CALL showVolAnd_00019
	GOTO	label90
label83
	CALL functionRa_00028
	GOTO	label90
label84
	MOVF gbl_iFunctionMode, F
	BTFSS STATUS,Z
	GOTO	label85
	CALL doVolumeDo_0001C
	CALL showVolAnd_00019
	GOTO	label90
label85
	CALL functionLo_00029
	GOTO	label90
label86
	MOVF gbl_rc5_flickBit, W
	XORWF gbl_rc5_flickBitOld, W
	BTFSC STATUS,Z
	GOTO	label90
	MOVF gbl_iFunctionMode, F
	BTFSS STATUS,Z
	GOTO	label87
	CALL doInputUp_00000
	CALL showVolAnd_00019
	GOTO	label90
label87
	CALL functionUp_00000
	GOTO	label90
label88
	MOVF gbl_rc5_flickBit, W
	XORWF gbl_rc5_flickBitOld, W
	BTFSC STATUS,Z
	GOTO	label90
	MOVF gbl_iFunctionMode, F
	BTFSS STATUS,Z
	GOTO	label89
	CALL doInputDow_0001E
	CALL showVolAnd_00019
	GOTO	label90
label89
	CALL functionDo_0002A
label90
	BSF STATUS, RP0
	MOVF gbl_rc5_command, W
	XORLW 0x0C
	BTFSS STATUS,Z
	GOTO	label91
	MOVF gbl_rc5_flickBit, W
	XORWF gbl_rc5_flickBitOld, W
	BTFSC STATUS,Z
	GOTO	label91
	CLRF gbl_iFunctionMode
	CALL doPower_00000
label91
	BSF STATUS, RP0
	MOVF gbl_rc5_flickBit, W
	MOVWF gbl_rc5_flickBitOld
	RETURN
; } rc5Process function end

	ORG 0x00000592
initialise_00000
; { initialise ; function begin
	BSF STATUS, RP0
	BCF STATUS, RP1
	CLRF gbl_trisa
	MOVLW 0x02
	BCF STATUS, RP0
	MOVWF gbl_porta
	MOVLW 0x05
	BSF STATUS, RP0
	MOVWF gbl_trisb
	MOVLW 0x08
	BCF STATUS, RP0
	MOVWF gbl_portb
	MOVLW 0x18
	BSF STATUS, RP0
	MOVWF gbl_trisc
	BCF STATUS, RP0
	MOVWF gbl_portc
	BSF STATUS, RP0
	BSF gbl_option_reg,7
	BCF STATUS, RP0
	CLRF gbl_adcon0
	MOVLW 0x07
	BSF STATUS, RP0
	MOVWF gbl_adcon1
	BCF STATUS, RP0
	BCF gbl_t1con,5
	BSF gbl_t1con,4
	BCF gbl_t1con,3
	BSF gbl_t1con,2
	BCF gbl_t1con,1
	BCF gbl_t1con,0
	CLRF gbl_tmr1h
	CLRF gbl_tmr1l
	BSF STATUS, RP0
	BSF gbl_pie1,0
	BCF STATUS, RP0
	BCF gbl_pir1,0
	MOVLW 0x38
	IORWF gbl_t2con, F
	BCF gbl_t2con,2
	BCF gbl_t2con,1
	BCF gbl_t2con,0
	MOVLW 0x6C
	BSF STATUS, RP0
	MOVWF gbl_pr2
	BCF STATUS, RP0
	BCF gbl_pir1,1
	BSF STATUS, RP0
	BSF gbl_pie1,1
	BSF gbl_intcon,4
	BCF gbl_option_reg,6
	BCF gbl_intcon,1
	MOVLW 0x38
	BCF STATUS, RP0
	MOVWF gbl_sspcon
	BSF STATUS, RP0
	CLRF gbl_sspcon2
	MOVLW 0x09
	MOVWF gbl_sspadd
	BSF gbl_sspstat,7
	BCF gbl_sspstat,6
	BCF STATUS, RP0
	BCF gbl_pir2,3
	CALL readData_00000
	MOVLW 0x01
	MOVWF delay_s_00000_arg_del
	CALL delay_s_00000
	BCF STATUS, RP0
	BSF gbl_portc,0
	CALL ledOn_00000
	CALL ledTest_00000
	MOVLW 0x02
	MOVWF delay_s_00000_arg_del
	CALL delay_s_00000
	CALL ledOff_00000
	BSF gbl_intcon,6
	BSF gbl_intcon,7
	CLRF gbl_cTask
	RETURN
; } initialise function end

	ORG 0x000005E1
doMute_00000
; { doMute ; function begin
	BSF STATUS, RP0
	BCF STATUS, RP1
	DECF gbl_iMute, W
	BTFSS STATUS,Z
	GOTO	label92
	CLRF gbl_iMute
	GOTO	label93
label92
	MOVLW 0x01
	MOVWF gbl_iMute
label93
	CALL tda7439Set_0001A
	RETURN
; } doMute function end

	ORG 0x000005EC
main
; { main ; function begin
	CALL initialise_00000
label94
	BSF STATUS, RP0
	MOVF gbl_cTask, W
	SUBLW 0x00
	BTFSC STATUS,C
	GOTO	label97
	BTFSS gbl_cTask,0
	GOTO	label95
	CALL rc5Process_00000
	BCF gbl_cTask,0
label95
	BTFSS gbl_cTask,5
	GOTO	label96
	CALL doMute_00000
	CALL showVolAnd_00019
	CALL timer1Rese_00017
	BSF STATUS, RP0
	BCF gbl_cTask,5
label96
	BTFSS gbl_cTask,6
	GOTO	label94
	MOVLW 0x01
	MOVWF gbl_iFunctionMode
	CALL functionDi_00025
	CALL timer1Rese_00017
	BSF STATUS, RP0
	BCF gbl_cTask,6
	GOTO	label94
label97
	BCF STATUS, RP0
	BTFSC gbl_portb,2
	GOTO	label98
	BSF STATUS, RP0
	MOVF gbl_iPower, F
	BTFSS STATUS,Z
	GOTO	label98
	MOVF gbl_iPowerExternal, F
	BTFSS STATUS,Z
	GOTO	label98
	MOVLW 0x01
	MOVWF gbl_iPowerExternal
	MOVLW 0x02
	MOVWF gbl_iActiveInput
	CALL doPower_00000
label98
	BCF STATUS, RP0
	BTFSS gbl_portb,2
	GOTO	label99
	BSF STATUS, RP0
	MOVF gbl_iPower, F
	BTFSC STATUS,Z
	GOTO	label99
	MOVF gbl_iPowerExternal, F
	BTFSC STATUS,Z
	GOTO	label99
	CALL doPower_00000
label99
	BCF STATUS, RP0
	BTFSS gbl_portb,2
	GOTO	label94
	BSF STATUS, RP0
	MOVF gbl_iPower, F
	BTFSS STATUS,Z
	GOTO	label94
	CLRF gbl_iPowerExternal
	GOTO	label94
; } main function end

	ORG 0x00000629
_startup
	MOVLW 0x03
	BCF STATUS, RP0
	BCF STATUS, RP1
	MOVWF gbl_tda7439_gains
	MOVLW 0x03
	MOVWF gbl_tda7439_gains+D'1'
	MOVLW 0x03
	MOVWF gbl_tda7439_gains+D'2'
	CLRF gbl_tda7439_gains+D'3'
	BSF STATUS, RP0
	CLRF gbl_cTask
	CLRF gbl_iPower
	CLRF gbl_iPowerExternal
	MOVLW 0x01
	MOVWF gbl_iActiveInput
	MOVLW 0x37
	MOVWF gbl_iVolume
	CLRF gbl_iMute
	CLRF gbl_iMuteHeld
	CLRF gbl_iAttenuateL
	CLRF gbl_iAttenuateR
	MOVLW 0x07
	MOVWF gbl_iBass
	MOVLW 0x07
	MOVWF gbl_iMid
	MOVLW 0x07
	MOVWF gbl_iTreble
	CLRF gbl_iFunctionMode
	BCF STATUS, RP0
	CLRF gbl_displayASCIItoSeg
	CLRF gbl_displayASCIItoSeg+D'1'
	MOVLW 0x22
	MOVWF gbl_displayASCIItoSeg+D'2'
	CLRF gbl_displayASCIItoSeg+D'3'
	CLRF gbl_displayASCIItoSeg+D'4'
	CLRF gbl_displayASCIItoSeg+D'5'
	CLRF gbl_displayASCIItoSeg+D'6'
	MOVLW 0x20
	MOVWF gbl_displayASCIItoSeg+D'7'
	MOVLW 0x4E
	MOVWF gbl_displayASCIItoSeg+D'8'
	MOVLW 0x78
	MOVWF gbl_displayASCIItoSeg+D'9'
	CLRF gbl_displayASCIItoSeg+D'10'
	CLRF gbl_displayASCIItoSeg+D'11'
	CLRF gbl_displayASCIItoSeg+D'12'
	MOVLW 0x01
	MOVWF gbl_displayASCIItoSeg+D'13'
	CLRF gbl_displayASCIItoSeg+D'14'
	CLRF gbl_displayASCIItoSeg+D'15'
	MOVLW 0x7E
	MOVWF gbl_displayASCIItoSeg+D'16'
	MOVLW 0x30
	MOVWF gbl_displayASCIItoSeg+D'17'
	MOVLW 0x6D
	MOVWF gbl_displayASCIItoSeg+D'18'
	MOVLW 0x79
	MOVWF gbl_displayASCIItoSeg+D'19'
	MOVLW 0x33
	MOVWF gbl_displayASCIItoSeg+D'20'
	MOVLW 0x5B
	MOVWF gbl_displayASCIItoSeg+D'21'
	MOVLW 0x5F
	MOVWF gbl_displayASCIItoSeg+D'22'
	MOVLW 0x70
	MOVWF gbl_displayASCIItoSeg+D'23'
	MOVLW 0x7F
	MOVWF gbl_displayASCIItoSeg+D'24'
	MOVLW 0x7B
	MOVWF gbl_displayASCIItoSeg+D'25'
	CLRF gbl_displayASCIItoSeg+D'26'
	CLRF gbl_displayASCIItoSeg+D'27'
	CLRF gbl_displayASCIItoSeg+D'28'
	MOVLW 0x09
	MOVWF gbl_displayASCIItoSeg+D'29'
	CLRF gbl_displayASCIItoSeg+D'30'
	MOVLW 0x65
	MOVWF gbl_displayASCIItoSeg+D'31'
	CLRF gbl_displayASCIItoSeg+D'32'
	MOVLW 0x77
	MOVWF gbl_displayASCIItoSeg+D'33'
	MOVLW 0x1F
	MOVWF gbl_displayASCIItoSeg+D'34'
	MOVLW 0x4E
	MOVWF gbl_displayASCIItoSeg+D'35'
	MOVLW 0x3D
	MOVWF gbl_displayASCIItoSeg+D'36'
	MOVLW 0x4F
	MOVWF gbl_displayASCIItoSeg+D'37'
	MOVLW 0x47
	MOVWF gbl_displayASCIItoSeg+D'38'
	MOVLW 0x5E
	MOVWF gbl_displayASCIItoSeg+D'39'
	MOVLW 0x37
	MOVWF gbl_displayASCIItoSeg+D'40'
	MOVLW 0x30
	MOVWF gbl_displayASCIItoSeg+D'41'
	MOVLW 0x3C
	MOVWF gbl_displayASCIItoSeg+D'42'
	CLRF gbl_displayASCIItoSeg+D'43'
	MOVLW 0x0E
	MOVWF gbl_displayASCIItoSeg+D'44'
	CLRF gbl_displayASCIItoSeg+D'45'
	MOVLW 0x15
	MOVWF gbl_displayASCIItoSeg+D'46'
	MOVLW 0x7E
	MOVWF gbl_displayASCIItoSeg+D'47'
	MOVLW 0x67
	MOVWF gbl_displayASCIItoSeg+D'48'
	CLRF gbl_displayASCIItoSeg+D'49'
	MOVLW 0x05
	MOVWF gbl_displayASCIItoSeg+D'50'
	MOVLW 0x5B
	MOVWF gbl_displayASCIItoSeg+D'51'
	MOVLW 0x70
	MOVWF gbl_displayASCIItoSeg+D'52'
	MOVLW 0x3E
	MOVWF gbl_displayASCIItoSeg+D'53'
	CLRF gbl_displayASCIItoSeg+D'54'
	CLRF gbl_displayASCIItoSeg+D'55'
	CLRF gbl_displayASCIItoSeg+D'56'
	MOVLW 0x3B
	MOVWF gbl_displayASCIItoSeg+D'57'
	CLRF gbl_displayASCIItoSeg+D'58'
	CLRF gbl_displayASCIItoSeg+D'59'
	CLRF gbl_displayASCIItoSeg+D'60'
	CLRF gbl_displayASCIItoSeg+D'61'
	CLRF gbl_displayASCIItoSeg+D'62'
	CLRF gbl_displayASCIItoSeg+D'63'
	CLRF gbl_displayASCIItoSeg+D'64'
	MOVLW 0x7D
	MOVWF gbl_displayASCIItoSeg+D'65'
	MOVLW 0x1F
	MOVWF gbl_displayASCIItoSeg+D'66'
	MOVLW 0x0D
	MOVWF gbl_displayASCIItoSeg+D'67'
	MOVLW 0x3D
	MOVWF gbl_displayASCIItoSeg+D'68'
	MOVLW 0x6F
	MOVWF gbl_displayASCIItoSeg+D'69'
	MOVLW 0x47
	MOVWF gbl_displayASCIItoSeg+D'70'
	MOVLW 0x5E
	MOVWF gbl_displayASCIItoSeg+D'71'
	MOVLW 0x17
	MOVWF gbl_displayASCIItoSeg+D'72'
	MOVLW 0x10
	MOVWF gbl_displayASCIItoSeg+D'73'
	MOVLW 0x3C
	MOVWF gbl_displayASCIItoSeg+D'74'
	CLRF gbl_displayASCIItoSeg+D'75'
	MOVLW 0x0E
	MOVWF gbl_displayASCIItoSeg+D'76'
	CLRF gbl_displayASCIItoSeg+D'77'
	MOVLW 0x15
	MOVWF gbl_displayASCIItoSeg+D'78'
	MOVLW 0x1D
	MOVWF gbl_displayASCIItoSeg+D'79'
	MOVLW 0x67
	MOVWF gbl_displayASCIItoSeg+D'80'
	CLRF gbl_displayASCIItoSeg+D'81'
	MOVLW 0x05
	MOVWF gbl_displayASCIItoSeg+D'82'
	MOVLW 0x5B
	MOVWF gbl_displayASCIItoSeg+D'83'
	MOVLW 0x0F
	MOVWF gbl_displayASCIItoSeg+D'84'
	MOVLW 0x1C
	MOVWF gbl_displayASCIItoSeg+D'85'
	CLRF gbl_displayASCIItoSeg+D'86'
	CLRF gbl_displayASCIItoSeg+D'87'
	CLRF gbl_displayASCIItoSeg+D'88'
	MOVLW 0x3B
	MOVWF gbl_displayASCIItoSeg+D'89'
	CLRF gbl_displayASCIItoSeg+D'90'
	BSF STATUS, RP0
	CLRF gbl_intfCounter
	CLRF gbl_rc5_Held
	CLRF gbl_rc5_currentState
	MOVLW 0x01
	MOVWF gbl_rc5_pinState
	CLRF gbl_rc5_flickBit
	CLRF gbl_rc5_flickBitOld
	CLRF gbl_rc5_address
	CLRF gbl_rc5_command
	BCF PCLATH,3
	BCF PCLATH,4
	GOTO	main
	ORG 0x000006E5
interrupt
; { interrupt ; function begin
	BTFSS gbl_intcon,1
	GOTO	label103
	BSF STATUS, RP0
	BCF STATUS, RP1
	BTFSS gbl_intfCounter,0
	GOTO	label101
	BSF gbl_option_reg,6
label101
	BTFSS gbl_intfCounter,0
	BCF gbl_option_reg,6
	INCF gbl_intfCounter, F
	INCF gbl_rc5_logicChange, F
	MOVF gbl_rc5_currentState, F
	BTFSS STATUS,Z
	GOTO	label102
	CLRF gbl_rc5_logicInterval
	CLRF gbl_rc5_logicChange
	BCF STATUS, RP0
	CLRF gbl_tmr2
	MOVLW 0x1A
	BSF STATUS, RP0
	MOVWF gbl_pr2
	BCF STATUS, RP0
	BCF gbl_pir1,1
	BSF gbl_t2con,2
	MOVLW 0x01
	BSF STATUS, RP0
	MOVWF gbl_rc5_currentState
label102
	BCF gbl_intcon,1
label103
	BCF STATUS, RP0
	BCF STATUS, RP1
	BTFSS gbl_pir1,1
	GOTO	label120
	BSF STATUS, RP0
	CLRF gbl_rc5_pinState
	BCF STATUS, RP0
	BTFSS gbl_portb,0
	GOTO	label104
	BSF STATUS, RP0
	INCF gbl_rc5_pinState, F
label104
	BSF STATUS, RP0
	DECF gbl_rc5_currentState, W
	BTFSC STATUS,Z
	GOTO	label106
	INCF gbl_rc5_logicInterval, F
	BTFSS gbl_rc5_logicInterval,0
	GOTO	label105
	BCF STATUS, RP0
	BSF gbl_portb,1
label105
	BSF STATUS, RP0
	BTFSC gbl_rc5_logicInterval,0
	GOTO	label106
	BCF STATUS, RP0
	BCF gbl_portb,1
label106
	BSF STATUS, RP0
	CLRF interrupt_15_iReset
	MOVF gbl_rc5_currentState, W
	XORLW 0x01
	BTFSC STATUS,Z
	GOTO	label107
	XORLW 0x03
	BTFSC STATUS,Z
	GOTO	label108
	XORLW 0x01
	BTFSC STATUS,Z
	GOTO	label110
	GOTO	label117
label107
	BCF STATUS, RP0
	CLRF gbl_tmr2
	MOVLW 0x6C
	BSF STATUS, RP0
	MOVWF gbl_pr2
	MOVLW 0x02
	MOVWF gbl_rc5_currentState
	GOTO	label118
label108
	DECF gbl_rc5_logicInterval, W
	BTFSS STATUS,Z
	GOTO	label109
	DECF gbl_rc5_logicChange, W
	BTFSS STATUS,Z
	GOTO	label109
	CLRF gbl_rc5_logicInterval
	CLRF gbl_rc5_logicChange
	CLRF gbl_rc5_bitCount
	CLRF gbl_rc5_inputData
	CLRF gbl_rc5_inputData+D'1'
	MOVLW 0x03
	MOVWF gbl_rc5_currentState
	GOTO	label118
label109
	MOVLW 0x01
	MOVWF interrupt_15_iReset
	GOTO	label118
label110
	MOVF gbl_rc5_logicInterval, W
	XORLW 0x02
	BTFSS STATUS,Z
	GOTO	label118
	MOVF gbl_rc5_logicChange, W
	SUBLW 0x02
	BTFSS STATUS,C
	GOTO	label116
	CLRF gbl_rc5_logicInterval
	CLRF gbl_rc5_logicChange
	MOVLW 0x0C
	SUBWF gbl_rc5_bitCount, W
	BTFSC STATUS,C
	GOTO	label111
	INCF gbl_rc5_bitCount, F
	BCF STATUS,C
	RLF gbl_rc5_inputData, F
	RLF gbl_rc5_inputData+D'1', F
	DECF gbl_rc5_pinState, W
	BTFSC STATUS,Z
	BSF gbl_rc5_inputData,0
	GOTO	label118
label111
	MOVLW 0x3F
	ANDWF gbl_rc5_inputData, W
	MOVWF gbl_rc5_command
	MOVLW 0x06
	MOVWF CompTempVar604
	MOVF CompTempVar604, F
label112
	BTFSC STATUS,Z
	GOTO	label113
	BCF STATUS,C
	RRF gbl_rc5_inputData+D'1', F
	RRF gbl_rc5_inputData, F
	DECF CompTempVar604, F
	GOTO	label112
label113
	MOVLW 0x1F
	ANDWF gbl_rc5_inputData, W
	MOVWF gbl_rc5_address
	MOVLW 0x05
	MOVWF CompTempVar605
	MOVF CompTempVar605, F
label114
	BTFSC STATUS,Z
	GOTO	label115
	BCF STATUS,C
	RRF gbl_rc5_inputData+D'1', F
	RRF gbl_rc5_inputData, F
	DECF CompTempVar605, F
	GOTO	label114
label115
	MOVF gbl_rc5_inputData, W
	MOVWF gbl_rc5_flickBit
	BSF gbl_cTask,0
	MOVLW 0x01
	MOVWF interrupt_15_iReset
	GOTO	label118
label116
	MOVLW 0x01
	MOVWF interrupt_15_iReset
	GOTO	label118
label117
	MOVLW 0x01
	MOVWF interrupt_15_iReset
label118
	MOVF interrupt_15_iReset, F
	BTFSC STATUS,Z
	GOTO	label119
	CLRF gbl_rc5_currentState
	BCF STATUS, RP0
	BCF gbl_t2con,2
	BSF STATUS, RP0
	BCF gbl_option_reg,6
	BCF STATUS, RP0
	BCF gbl_portb,1
label119
	BCF STATUS, RP0
	BCF gbl_pir1,1
label120
	BTFSS gbl_pir1,0
	GOTO	label121
	MOVLW 0x0F
	BSF STATUS, RP0
	SUBWF gbl_iMuteHeld, W
	BTFSS STATUS,C
	BSF gbl_cTask,5
	BCF STATUS, RP0
	BCF gbl_pir1,0
label121
	BSF STATUS, RP0
	SWAPF Int1BContext+D'2', W
	MOVWF FSR
	SWAPF Int1BContext+D'1', W
	MOVWF PCLATH
	SWAPF Int1BContext, W
	MOVWF STATUS
	SWAPF Int1Context, F
	SWAPF Int1Context, W
	RETFIE
; } interrupt function end

	ORG 0x00002007
	DW 0x3FB9
	END
