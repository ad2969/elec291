;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1034 (May  5 2015) (MSVC)
; This file was generated Thu Mar 07 11:15:24 2019
;--------------------------------------------------------
$name EFM8_ADC_Adv
$optc51 --model-small
$printf_float
	R_DSEG    segment data
	R_CSEG    segment code
	R_BSEG    segment bit
	R_XSEG    segment xdata
	R_PSEG    segment xdata
	R_ISEG    segment idata
	R_OSEG    segment data overlay
	BIT_BANK  segment data overlay
	R_HOME    segment code
	R_GSINIT  segment code
	R_IXSEG   segment xdata
	R_CONST   segment code
	R_XINIT   segment code
	R_DINIT   segment code

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	public _InitPinADC_PARM_2
	public _getsn_PARM_3
	public _getsn_PARM_2
	public _main
	public _calc_phase
	public _Volts_at_Pin
	public _ADC_at_Pin
	public _InitPinADC
	public _InitADC
	public _Timer0_ISR
	public _InitTimer0
	public __c51_external_startup
	public _getsn
	public _LCDprint
	public _LCD_4BIT
	public _WriteCommand
	public _WriteData
	public _LCD_byte
	public _LCD_pulse
	public _waitms
	public _Timer3us
	public _LCDprint_PARM_4
	public _calc_phase_PARM_2
	public _fsm_state
	public _signal_state
	public _counter3EN
	public _TR0_counter3
	public _counter2EN
	public _TR0_counter2
	public _counter1EN
	public _TR0_counter1
	public _LCDprint_PARM_3
	public _LCDprint_PARM_2
;--------------------------------------------------------
; Special Function Registers
;--------------------------------------------------------
_ACC            DATA 0xe0
_ADC0ASAH       DATA 0xb6
_ADC0ASAL       DATA 0xb5
_ADC0ASCF       DATA 0xa1
_ADC0ASCT       DATA 0xc7
_ADC0CF0        DATA 0xbc
_ADC0CF1        DATA 0xb9
_ADC0CF2        DATA 0xdf
_ADC0CN0        DATA 0xe8
_ADC0CN1        DATA 0xb2
_ADC0CN2        DATA 0xb3
_ADC0GTH        DATA 0xc4
_ADC0GTL        DATA 0xc3
_ADC0H          DATA 0xbe
_ADC0L          DATA 0xbd
_ADC0LTH        DATA 0xc6
_ADC0LTL        DATA 0xc5
_ADC0MX         DATA 0xbb
_B              DATA 0xf0
_CKCON0         DATA 0x8e
_CKCON1         DATA 0xa6
_CLEN0          DATA 0xc6
_CLIE0          DATA 0xc7
_CLIF0          DATA 0xe8
_CLKSEL         DATA 0xa9
_CLOUT0         DATA 0xd1
_CLU0CF         DATA 0xb1
_CLU0FN         DATA 0xaf
_CLU0MX         DATA 0x84
_CLU1CF         DATA 0xb3
_CLU1FN         DATA 0xb2
_CLU1MX         DATA 0x85
_CLU2CF         DATA 0xb6
_CLU2FN         DATA 0xb5
_CLU2MX         DATA 0x91
_CLU3CF         DATA 0xbf
_CLU3FN         DATA 0xbe
_CLU3MX         DATA 0xae
_CMP0CN0        DATA 0x9b
_CMP0CN1        DATA 0x99
_CMP0MD         DATA 0x9d
_CMP0MX         DATA 0x9f
_CMP1CN0        DATA 0xbf
_CMP1CN1        DATA 0xac
_CMP1MD         DATA 0xab
_CMP1MX         DATA 0xaa
_CRC0CN0        DATA 0xce
_CRC0CN1        DATA 0x86
_CRC0CNT        DATA 0xd3
_CRC0DAT        DATA 0xcb
_CRC0FLIP       DATA 0xcf
_CRC0IN         DATA 0xca
_CRC0ST         DATA 0xd2
_DAC0CF0        DATA 0x91
_DAC0CF1        DATA 0x92
_DAC0H          DATA 0x85
_DAC0L          DATA 0x84
_DAC1CF0        DATA 0x93
_DAC1CF1        DATA 0x94
_DAC1H          DATA 0x8a
_DAC1L          DATA 0x89
_DAC2CF0        DATA 0x95
_DAC2CF1        DATA 0x96
_DAC2H          DATA 0x8c
_DAC2L          DATA 0x8b
_DAC3CF0        DATA 0x9a
_DAC3CF1        DATA 0x9c
_DAC3H          DATA 0x8e
_DAC3L          DATA 0x8d
_DACGCF0        DATA 0x88
_DACGCF1        DATA 0x98
_DACGCF2        DATA 0xa2
_DERIVID        DATA 0xad
_DEVICEID       DATA 0xb5
_DPH            DATA 0x83
_DPL            DATA 0x82
_EIE1           DATA 0xe6
_EIE2           DATA 0xf3
_EIP1           DATA 0xbb
_EIP1H          DATA 0xee
_EIP2           DATA 0xed
_EIP2H          DATA 0xf6
_EMI0CN         DATA 0xe7
_FLKEY          DATA 0xb7
_HFO0CAL        DATA 0xc7
_HFO1CAL        DATA 0xd6
_HFOCN          DATA 0xef
_I2C0ADM        DATA 0xff
_I2C0CN0        DATA 0xba
_I2C0DIN        DATA 0xbc
_I2C0DOUT       DATA 0xbb
_I2C0FCN0       DATA 0xad
_I2C0FCN1       DATA 0xab
_I2C0FCT        DATA 0xf5
_I2C0SLAD       DATA 0xbd
_I2C0STAT       DATA 0xb9
_IE             DATA 0xa8
_IP             DATA 0xb8
_IPH            DATA 0xf2
_IT01CF         DATA 0xe4
_LFO0CN         DATA 0xb1
_P0             DATA 0x80
_P0MASK         DATA 0xfe
_P0MAT          DATA 0xfd
_P0MDIN         DATA 0xf1
_P0MDOUT        DATA 0xa4
_P0SKIP         DATA 0xd4
_P1             DATA 0x90
_P1MASK         DATA 0xee
_P1MAT          DATA 0xed
_P1MDIN         DATA 0xf2
_P1MDOUT        DATA 0xa5
_P1SKIP         DATA 0xd5
_P2             DATA 0xa0
_P2MASK         DATA 0xfc
_P2MAT          DATA 0xfb
_P2MDIN         DATA 0xf3
_P2MDOUT        DATA 0xa6
_P2SKIP         DATA 0xcc
_P3             DATA 0xb0
_P3MDIN         DATA 0xf4
_P3MDOUT        DATA 0x9c
_PCA0CENT       DATA 0x9e
_PCA0CLR        DATA 0x9c
_PCA0CN0        DATA 0xd8
_PCA0CPH0       DATA 0xfc
_PCA0CPH1       DATA 0xea
_PCA0CPH2       DATA 0xec
_PCA0CPH3       DATA 0xf5
_PCA0CPH4       DATA 0x85
_PCA0CPH5       DATA 0xde
_PCA0CPL0       DATA 0xfb
_PCA0CPL1       DATA 0xe9
_PCA0CPL2       DATA 0xeb
_PCA0CPL3       DATA 0xf4
_PCA0CPL4       DATA 0x84
_PCA0CPL5       DATA 0xdd
_PCA0CPM0       DATA 0xda
_PCA0CPM1       DATA 0xdb
_PCA0CPM2       DATA 0xdc
_PCA0CPM3       DATA 0xae
_PCA0CPM4       DATA 0xaf
_PCA0CPM5       DATA 0xcc
_PCA0H          DATA 0xfa
_PCA0L          DATA 0xf9
_PCA0MD         DATA 0xd9
_PCA0POL        DATA 0x96
_PCA0PWM        DATA 0xf7
_PCON0          DATA 0x87
_PCON1          DATA 0xcd
_PFE0CN         DATA 0xc1
_PRTDRV         DATA 0xf6
_PSCTL          DATA 0x8f
_PSTAT0         DATA 0xaa
_PSW            DATA 0xd0
_REF0CN         DATA 0xd1
_REG0CN         DATA 0xc9
_REVID          DATA 0xb6
_RSTSRC         DATA 0xef
_SBCON1         DATA 0x94
_SBRLH1         DATA 0x96
_SBRLL1         DATA 0x95
_SBUF           DATA 0x99
_SBUF0          DATA 0x99
_SBUF1          DATA 0x92
_SCON           DATA 0x98
_SCON0          DATA 0x98
_SCON1          DATA 0xc8
_SFRPAGE        DATA 0xa7
_SFRPGCN        DATA 0xbc
_SFRSTACK       DATA 0xd7
_SMB0ADM        DATA 0xd6
_SMB0ADR        DATA 0xd7
_SMB0CF         DATA 0xc1
_SMB0CN0        DATA 0xc0
_SMB0DAT        DATA 0xc2
_SMB0FCN0       DATA 0xc3
_SMB0FCN1       DATA 0xc4
_SMB0FCT        DATA 0xef
_SMB0RXLN       DATA 0xc5
_SMB0TC         DATA 0xac
_SMOD1          DATA 0x93
_SP             DATA 0x81
_SPI0CFG        DATA 0xa1
_SPI0CKR        DATA 0xa2
_SPI0CN0        DATA 0xf8
_SPI0DAT        DATA 0xa3
_SPI0FCN0       DATA 0x9a
_SPI0FCN1       DATA 0x9b
_SPI0FCT        DATA 0xf7
_SPI0PCF        DATA 0xdf
_TCON           DATA 0x88
_TH0            DATA 0x8c
_TH1            DATA 0x8d
_TL0            DATA 0x8a
_TL1            DATA 0x8b
_TMOD           DATA 0x89
_TMR2CN0        DATA 0xc8
_TMR2CN1        DATA 0xfd
_TMR2H          DATA 0xcf
_TMR2L          DATA 0xce
_TMR2RLH        DATA 0xcb
_TMR2RLL        DATA 0xca
_TMR3CN0        DATA 0x91
_TMR3CN1        DATA 0xfe
_TMR3H          DATA 0x95
_TMR3L          DATA 0x94
_TMR3RLH        DATA 0x93
_TMR3RLL        DATA 0x92
_TMR4CN0        DATA 0x98
_TMR4CN1        DATA 0xff
_TMR4H          DATA 0xa5
_TMR4L          DATA 0xa4
_TMR4RLH        DATA 0xa3
_TMR4RLL        DATA 0xa2
_TMR5CN0        DATA 0xc0
_TMR5CN1        DATA 0xf1
_TMR5H          DATA 0xd5
_TMR5L          DATA 0xd4
_TMR5RLH        DATA 0xd3
_TMR5RLL        DATA 0xd2
_UART0PCF       DATA 0xd9
_UART1FCN0      DATA 0x9d
_UART1FCN1      DATA 0xd8
_UART1FCT       DATA 0xfa
_UART1LIN       DATA 0x9e
_UART1PCF       DATA 0xda
_VDM0CN         DATA 0xff
_WDTCN          DATA 0x97
_XBR0           DATA 0xe1
_XBR1           DATA 0xe2
_XBR2           DATA 0xe3
_XOSC0CN        DATA 0x86
_DPTR           DATA 0x8382
_TMR2RL         DATA 0xcbca
_TMR3RL         DATA 0x9392
_TMR4RL         DATA 0xa3a2
_TMR5RL         DATA 0xd3d2
_TMR0           DATA 0x8c8a
_TMR1           DATA 0x8d8b
_TMR2           DATA 0xcfce
_TMR3           DATA 0x9594
_TMR4           DATA 0xa5a4
_TMR5           DATA 0xd5d4
_SBRL1          DATA 0x9695
_PCA0           DATA 0xfaf9
_PCA0CP0        DATA 0xfcfb
_PCA0CP1        DATA 0xeae9
_PCA0CP2        DATA 0xeceb
_PCA0CP3        DATA 0xf5f4
_PCA0CP4        DATA 0x8584
_PCA0CP5        DATA 0xdedd
_ADC0ASA        DATA 0xb6b5
_ADC0GT         DATA 0xc4c3
_ADC0           DATA 0xbebd
_ADC0LT         DATA 0xc6c5
_DAC0           DATA 0x8584
_DAC1           DATA 0x8a89
_DAC2           DATA 0x8c8b
_DAC3           DATA 0x8e8d
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
_ACC_0          BIT 0xe0
_ACC_1          BIT 0xe1
_ACC_2          BIT 0xe2
_ACC_3          BIT 0xe3
_ACC_4          BIT 0xe4
_ACC_5          BIT 0xe5
_ACC_6          BIT 0xe6
_ACC_7          BIT 0xe7
_TEMPE          BIT 0xe8
_ADGN0          BIT 0xe9
_ADGN1          BIT 0xea
_ADWINT         BIT 0xeb
_ADBUSY         BIT 0xec
_ADINT          BIT 0xed
_IPOEN          BIT 0xee
_ADEN           BIT 0xef
_B_0            BIT 0xf0
_B_1            BIT 0xf1
_B_2            BIT 0xf2
_B_3            BIT 0xf3
_B_4            BIT 0xf4
_B_5            BIT 0xf5
_B_6            BIT 0xf6
_B_7            BIT 0xf7
_C0FIF          BIT 0xe8
_C0RIF          BIT 0xe9
_C1FIF          BIT 0xea
_C1RIF          BIT 0xeb
_C2FIF          BIT 0xec
_C2RIF          BIT 0xed
_C3FIF          BIT 0xee
_C3RIF          BIT 0xef
_D1SRC0         BIT 0x88
_D1SRC1         BIT 0x89
_D1AMEN         BIT 0x8a
_D01REFSL       BIT 0x8b
_D3SRC0         BIT 0x8c
_D3SRC1         BIT 0x8d
_D3AMEN         BIT 0x8e
_D23REFSL       BIT 0x8f
_D0UDIS         BIT 0x98
_D1UDIS         BIT 0x99
_D2UDIS         BIT 0x9a
_D3UDIS         BIT 0x9b
_EX0            BIT 0xa8
_ET0            BIT 0xa9
_EX1            BIT 0xaa
_ET1            BIT 0xab
_ES0            BIT 0xac
_ET2            BIT 0xad
_ESPI0          BIT 0xae
_EA             BIT 0xaf
_PX0            BIT 0xb8
_PT0            BIT 0xb9
_PX1            BIT 0xba
_PT1            BIT 0xbb
_PS0            BIT 0xbc
_PT2            BIT 0xbd
_PSPI0          BIT 0xbe
_P0_0           BIT 0x80
_P0_1           BIT 0x81
_P0_2           BIT 0x82
_P0_3           BIT 0x83
_P0_4           BIT 0x84
_P0_5           BIT 0x85
_P0_6           BIT 0x86
_P0_7           BIT 0x87
_P1_0           BIT 0x90
_P1_1           BIT 0x91
_P1_2           BIT 0x92
_P1_3           BIT 0x93
_P1_4           BIT 0x94
_P1_5           BIT 0x95
_P1_6           BIT 0x96
_P1_7           BIT 0x97
_P2_0           BIT 0xa0
_P2_1           BIT 0xa1
_P2_2           BIT 0xa2
_P2_3           BIT 0xa3
_P2_4           BIT 0xa4
_P2_5           BIT 0xa5
_P2_6           BIT 0xa6
_P3_0           BIT 0xb0
_P3_1           BIT 0xb1
_P3_2           BIT 0xb2
_P3_3           BIT 0xb3
_P3_4           BIT 0xb4
_P3_7           BIT 0xb7
_CCF0           BIT 0xd8
_CCF1           BIT 0xd9
_CCF2           BIT 0xda
_CCF3           BIT 0xdb
_CCF4           BIT 0xdc
_CCF5           BIT 0xdd
_CR             BIT 0xde
_CF             BIT 0xdf
_PARITY         BIT 0xd0
_F1             BIT 0xd1
_OV             BIT 0xd2
_RS0            BIT 0xd3
_RS1            BIT 0xd4
_F0             BIT 0xd5
_AC             BIT 0xd6
_CY             BIT 0xd7
_RI             BIT 0x98
_TI             BIT 0x99
_RB8            BIT 0x9a
_TB8            BIT 0x9b
_REN            BIT 0x9c
_CE             BIT 0x9d
_SMODE          BIT 0x9e
_RI1            BIT 0xc8
_TI1            BIT 0xc9
_RBX1           BIT 0xca
_TBX1           BIT 0xcb
_REN1           BIT 0xcc
_PERR1          BIT 0xcd
_OVR1           BIT 0xce
_SI             BIT 0xc0
_ACK            BIT 0xc1
_ARBLOST        BIT 0xc2
_ACKRQ          BIT 0xc3
_STO            BIT 0xc4
_STA            BIT 0xc5
_TXMODE         BIT 0xc6
_MASTER         BIT 0xc7
_SPIEN          BIT 0xf8
_TXNF           BIT 0xf9
_NSSMD0         BIT 0xfa
_NSSMD1         BIT 0xfb
_RXOVRN         BIT 0xfc
_MODF           BIT 0xfd
_WCOL           BIT 0xfe
_SPIF           BIT 0xff
_IT0            BIT 0x88
_IE0            BIT 0x89
_IT1            BIT 0x8a
_IE1            BIT 0x8b
_TR0            BIT 0x8c
_TF0            BIT 0x8d
_TR1            BIT 0x8e
_TF1            BIT 0x8f
_T2XCLK0        BIT 0xc8
_T2XCLK1        BIT 0xc9
_TR2            BIT 0xca
_T2SPLIT        BIT 0xcb
_TF2CEN         BIT 0xcc
_TF2LEN         BIT 0xcd
_TF2L           BIT 0xce
_TF2H           BIT 0xcf
_T4XCLK0        BIT 0x98
_T4XCLK1        BIT 0x99
_TR4            BIT 0x9a
_T4SPLIT        BIT 0x9b
_TF4CEN         BIT 0x9c
_TF4LEN         BIT 0x9d
_TF4L           BIT 0x9e
_TF4H           BIT 0x9f
_T5XCLK0        BIT 0xc0
_T5XCLK1        BIT 0xc1
_TR5            BIT 0xc2
_T5SPLIT        BIT 0xc3
_TF5CEN         BIT 0xc4
_TF5LEN         BIT 0xc5
_TF5L           BIT 0xc6
_TF5H           BIT 0xc7
_RIE            BIT 0xd8
_RXTO0          BIT 0xd9
_RXTO1          BIT 0xda
_RFRQ           BIT 0xdb
_TIE            BIT 0xdc
_TXHOLD         BIT 0xdd
_TXNF1          BIT 0xde
_TFRQ           BIT 0xdf
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	rbank0 segment data overlay
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_LCDprint_PARM_2:
	ds 1
_LCDprint_PARM_3:
	ds 2
_LCDprint_string_1_79:
	ds 3
_TR0_counter1:
	ds 2
_counter1EN:
	ds 2
_TR0_counter2:
	ds 2
_counter2EN:
	ds 2
_TR0_counter3:
	ds 2
_counter3EN:
	ds 2
_signal_state:
	ds 2
_fsm_state:
	ds 2
_calc_phase_PARM_2:
	ds 4
_main_v_1_112:
	ds 8
_main_p_1_112:
	ds 8
_main_interval_1_112:
	ds 2
_main_buff_1_112:
	ds 17
_main_datanum_1_112:
	ds 2
_main_lol_1_112:
	ds 2
_main_sloc0_1_0:
	ds 4
_main_sloc1_1_0:
	ds 4
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
	rseg	R_OSEG
_getsn_PARM_2:
	ds 3
_getsn_PARM_3:
	ds 2
_getsn_freqstring_1_83:
	ds 3
_getsn_j_1_84:
	ds 2
	rseg	R_OSEG
_InitPinADC_PARM_2:
	ds 1
	rseg	R_OSEG
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	rseg R_ISEG
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	DSEG
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	rseg R_BSEG
_LCDprint_PARM_4:
	DBIT	1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	rseg R_PSEG
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	rseg R_XSEG
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	XSEG
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	rseg R_IXSEG
	rseg R_HOME
	rseg R_GSINIT
	rseg R_CSEG
;--------------------------------------------------------
; Reset entry point and interrupt vectors
;--------------------------------------------------------
	CSEG at 0x0000
	ljmp	_crt0
	CSEG at 0x000b
	ljmp	_Timer0_ISR
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	rseg R_HOME
	rseg R_GSINIT
	rseg R_GSINIT
;--------------------------------------------------------
; data variables initialization
;--------------------------------------------------------
	rseg R_DINIT
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:19: volatile unsigned int TR0_counter1 = 0;
	clr	a
	mov	_TR0_counter1,a
	mov	(_TR0_counter1 + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:20: volatile unsigned int counter1EN = 0;
	clr	a
	mov	_counter1EN,a
	mov	(_counter1EN + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:21: volatile unsigned int TR0_counter2 = 0;
	clr	a
	mov	_TR0_counter2,a
	mov	(_TR0_counter2 + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:22: volatile unsigned int counter2EN = 0;
	clr	a
	mov	_counter2EN,a
	mov	(_counter2EN + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:23: volatile unsigned int TR0_counter3 = 0;
	clr	a
	mov	_TR0_counter3,a
	mov	(_TR0_counter3 + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:24: volatile unsigned int counter3EN = 0;
	clr	a
	mov	_counter3EN,a
	mov	(_counter3EN + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:26: volatile unsigned int signal_state = 0;
	clr	a
	mov	_signal_state,a
	mov	(_signal_state + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:27: volatile unsigned int fsm_state = 0;
	clr	a
	mov	_fsm_state,a
	mov	(_fsm_state + 1),a
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer3us'
;------------------------------------------------------------
;us                        Allocated to registers r2 
;i                         Allocated to registers r3 
;------------------------------------------------------------
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:17: void Timer3us(unsigned char us)
;	-----------------------------------------
;	 function Timer3us
;	-----------------------------------------
_Timer3us:
	using	0
	mov	r2,dpl
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:22: CKCON0|=0b_0100_0000;
	orl	_CKCON0,#0x40
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:24: TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	mov	_TMR3RL,#0xB8
	mov	(_TMR3RL >> 8),#0xFF
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:25: TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	mov	_TMR3,_TMR3RL
	mov	(_TMR3 >> 8),(_TMR3RL >> 8)
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:27: TMR3CN0 = 0x04;                 // Sart Timer3 and clear overflow flag
	mov	_TMR3CN0,#0x04
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:28: for (i = 0; i < us; i++)       // Count <us> overflows
	mov	r3,#0x00
L002004?:
	clr	c
	mov	a,r3
	subb	a,r2
	jnc	L002007?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:30: while (!(TMR3CN0 & 0x80));  // Wait for overflow
L002001?:
	mov	a,_TMR3CN0
	jnb	acc.7,L002001?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:31: TMR3CN0 &= ~(0x80);         // Clear overflow indicator
	anl	_TMR3CN0,#0x7F
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:28: for (i = 0; i < us; i++)       // Count <us> overflows
	inc	r3
	sjmp	L002004?
L002007?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:33: TMR3CN0 = 0 ;                   // Stop Timer3 and clear overflow flag
	mov	_TMR3CN0,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'waitms'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r4 r5 
;k                         Allocated to registers r6 
;------------------------------------------------------------
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:36: void waitms (unsigned int ms)
;	-----------------------------------------
;	 function waitms
;	-----------------------------------------
_waitms:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:40: for(j=0; j<ms; j++)
	mov	r4,#0x00
	mov	r5,#0x00
L003005?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L003009?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:41: for (k=0; k<4; k++) Timer3us(250);
	mov	r6,#0x00
L003001?:
	cjne	r6,#0x04,L003018?
L003018?:
	jnc	L003007?
	mov	dpl,#0xFA
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_Timer3us
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	inc	r6
	sjmp	L003001?
L003007?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:40: for(j=0; j<ms; j++)
	inc	r4
	cjne	r4,#0x00,L003005?
	inc	r5
	sjmp	L003005?
L003009?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_pulse'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:44: void LCD_pulse (void)
;	-----------------------------------------
;	 function LCD_pulse
;	-----------------------------------------
_LCD_pulse:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:46: LCD_E=1;
	setb	_P2_5
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:47: Timer3us(40);
	mov	dpl,#0x28
	lcall	_Timer3us
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:48: LCD_E=0;
	clr	_P2_5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_byte'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:51: void LCD_byte (unsigned char x)
;	-----------------------------------------
;	 function LCD_byte
;	-----------------------------------------
_LCD_byte:
	mov	r2,dpl
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:54: ACC=x; //Send high nible
	mov	_ACC,r2
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:55: LCD_D7=ACC_7;
	mov	c,_ACC_7
	mov	_P2_1,c
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:56: LCD_D6=ACC_6;
	mov	c,_ACC_6
	mov	_P2_2,c
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:57: LCD_D5=ACC_5;
	mov	c,_ACC_5
	mov	_P2_3,c
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:58: LCD_D4=ACC_4;
	mov	c,_ACC_4
	mov	_P2_4,c
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:59: LCD_pulse();
	push	ar2
	lcall	_LCD_pulse
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:60: Timer3us(40);
	mov	dpl,#0x28
	lcall	_Timer3us
	pop	ar2
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:61: ACC=x; //Send low nible
	mov	_ACC,r2
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:62: LCD_D7=ACC_3;
	mov	c,_ACC_3
	mov	_P2_1,c
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:63: LCD_D6=ACC_2;
	mov	c,_ACC_2
	mov	_P2_2,c
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:64: LCD_D5=ACC_1;
	mov	c,_ACC_1
	mov	_P2_3,c
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:65: LCD_D4=ACC_0;
	mov	c,_ACC_0
	mov	_P2_4,c
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:66: LCD_pulse();
	ljmp	_LCD_pulse
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteData'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:69: void WriteData (unsigned char x)
;	-----------------------------------------
;	 function WriteData
;	-----------------------------------------
_WriteData:
	mov	r2,dpl
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:71: LCD_RS=1;
	setb	_P2_6
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:72: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:73: waitms(2);
	mov	dptr,#0x0002
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'WriteCommand'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:76: void WriteCommand (unsigned char x)
;	-----------------------------------------
;	 function WriteCommand
;	-----------------------------------------
_WriteCommand:
	mov	r2,dpl
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:78: LCD_RS=0;
	clr	_P2_6
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:79: LCD_byte(x);
	mov	dpl,r2
	lcall	_LCD_byte
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:80: waitms(5);
	mov	dptr,#0x0005
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_4BIT'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:83: void LCD_4BIT (void)
;	-----------------------------------------
;	 function LCD_4BIT
;	-----------------------------------------
_LCD_4BIT:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:85: LCD_E=0; // Resting state of LCD's enable is zero
	clr	_P2_5
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:87: waitms(20);
	mov	dptr,#0x0014
	lcall	_waitms
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:89: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:90: WriteCommand(0x33);
	mov	dpl,#0x33
	lcall	_WriteCommand
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:91: WriteCommand(0x32); // Change to 4-bit mode
	mov	dpl,#0x32
	lcall	_WriteCommand
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:94: WriteCommand(0x28);
	mov	dpl,#0x28
	lcall	_WriteCommand
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:95: WriteCommand(0x0c);
	mov	dpl,#0x0C
	lcall	_WriteCommand
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:96: WriteCommand(0x01); // Clear screen command (takes some time)
	mov	dpl,#0x01
	lcall	_WriteCommand
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:97: waitms(20); // Wait for clear screen command to finsih.
	mov	dptr,#0x0014
	ljmp	_waitms
;------------------------------------------------------------
;Allocation info for local variables in function 'LCDprint'
;------------------------------------------------------------
;line                      Allocated with name '_LCDprint_PARM_2'
;col                       Allocated with name '_LCDprint_PARM_3'
;string                    Allocated with name '_LCDprint_string_1_79'
;j                         Allocated to registers r2 r3 
;L2                        Allocated to registers r5 r6 
;L1                        Allocated to registers r7 r0 
;------------------------------------------------------------
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:100: void LCDprint(char * string, unsigned char line, unsigned int col, bit clear)
;	-----------------------------------------
;	 function LCDprint
;	-----------------------------------------
_LCDprint:
	mov	_LCDprint_string_1_79,dpl
	mov	(_LCDprint_string_1_79 + 1),dph
	mov	(_LCDprint_string_1_79 + 2),b
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:105: L2 = 0xC0;
	mov	r5,#0xC0
	mov	r6,#0x00
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:106: L1 = 0x80;
	mov	r7,#0x80
	mov	r0,#0x00
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:108: if(col <= 1) {
	clr	c
	mov	a,#0x01
	subb	a,_LCDprint_PARM_3
	clr	a
	subb	a,(_LCDprint_PARM_3 + 1)
	jnc	L009003?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:111: L2 = L2 + (col - 1);
	mov	a,_LCDprint_PARM_3
	add	a,#0xff
	mov	r1,a
	mov	a,(_LCDprint_PARM_3 + 1)
	addc	a,#0xff
	mov	r2,a
	mov	a,#0xC0
	add	a,r1
	mov	r5,a
	clr	a
	addc	a,r2
	mov	r6,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:112: L1 = L1 + (col - 1);
	mov	a,#0x80
	add	a,r1
	mov	r7,a
	clr	a
	addc	a,r2
	mov	r0,a
L009003?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:115: WriteCommand(line==2?L2:L1);
	mov	a,#0x02
	cjne	a,_LCDprint_PARM_2,L009016?
	mov	ar2,r5
	mov	ar3,r6
	sjmp	L009017?
L009016?:
	mov	ar2,r7
	mov	ar3,r0
L009017?:
	mov	dpl,r2
	lcall	_WriteCommand
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:116: waitms(5);
	mov	dptr,#0x0005
	lcall	_waitms
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:117: for(j=0; string[j]!=0; j++)	WriteData(string[j]);// Write the message
	mov	r2,#0x00
	mov	r3,#0x00
L009006?:
	mov	a,r2
	add	a,_LCDprint_string_1_79
	mov	r4,a
	mov	a,r3
	addc	a,(_LCDprint_string_1_79 + 1)
	mov	r5,a
	mov	r6,(_LCDprint_string_1_79 + 2)
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	lcall	__gptrget
	mov	r4,a
	jz	L009009?
	mov	dpl,r4
	push	ar2
	push	ar3
	lcall	_WriteData
	pop	ar3
	pop	ar2
	inc	r2
	cjne	r2,#0x00,L009006?
	inc	r3
	sjmp	L009006?
L009009?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:118: if(clear) for(; j<CHARS_PER_LINE; j++) WriteData(' '); // Clear the rest of the line
	jnb	_LCDprint_PARM_4,L009014?
L009010?:
	clr	c
	mov	a,r2
	subb	a,#0x10
	mov	a,r3
	xrl	a,#0x80
	subb	a,#0x80
	jnc	L009014?
	mov	dpl,#0x20
	push	ar2
	push	ar3
	lcall	_WriteData
	pop	ar3
	pop	ar2
	inc	r2
	cjne	r2,#0x00,L009010?
	inc	r3
	sjmp	L009010?
L009014?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getsn'
;------------------------------------------------------------
;buff                      Allocated with name '_getsn_PARM_2'
;len                       Allocated with name '_getsn_PARM_3'
;freqstring                Allocated with name '_getsn_freqstring_1_83'
;j                         Allocated with name '_getsn_j_1_84'
;------------------------------------------------------------
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:121: int getsn (char * freqstring, char * buff, int len)
;	-----------------------------------------
;	 function getsn
;	-----------------------------------------
_getsn:
	mov	_getsn_freqstring_1_83,dpl
	mov	(_getsn_freqstring_1_83 + 1),dph
	mov	(_getsn_freqstring_1_83 + 2),b
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:125: for(j=0; j<(len-1); j++)
	clr	a
	mov	r5,a
	mov	r6,a
	mov	a,_getsn_PARM_3
	add	a,#0xff
	mov	r7,a
	mov	a,(_getsn_PARM_3 + 1)
	addc	a,#0xff
	mov	r0,a
	clr	a
	mov	_getsn_j_1_84,a
	mov	(_getsn_j_1_84 + 1),a
L010005?:
	clr	c
	mov	a,_getsn_j_1_84
	subb	a,r7
	mov	a,(_getsn_j_1_84 + 1)
	xrl	a,#0x80
	mov	b,r0
	xrl	b,#0x80
	subb	a,b
	jnc	L010008?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:128: if ( (freqstring[j]=='\n') || (freqstring[j]=='\r') )
	mov	a,_getsn_j_1_84
	add	a,_getsn_freqstring_1_83
	mov	r3,a
	mov	a,(_getsn_j_1_84 + 1)
	addc	a,(_getsn_freqstring_1_83 + 1)
	mov	r4,a
	mov	r2,(_getsn_freqstring_1_83 + 2)
	mov	dpl,r3
	mov	dph,r4
	mov	b,r2
	lcall	__gptrget
	mov	r2,a
	cjne	r2,#0x0A,L010015?
	sjmp	L010001?
L010015?:
	cjne	r2,#0x0D,L010002?
L010001?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:130: buff[j]=0;
	mov	a,r5
	add	a,_getsn_PARM_2
	mov	r3,a
	mov	a,r6
	addc	a,(_getsn_PARM_2 + 1)
	mov	r4,a
	mov	r1,(_getsn_PARM_2 + 2)
	mov	dpl,r3
	mov	dph,r4
	mov	b,r1
	clr	a
	lcall	__gptrput
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:131: return j;
	mov	dpl,r5
	mov	dph,r6
	ret
L010002?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:135: buff[j]=freqstring[j];
	mov	a,_getsn_j_1_84
	add	a,_getsn_PARM_2
	mov	r3,a
	mov	a,(_getsn_j_1_84 + 1)
	addc	a,(_getsn_PARM_2 + 1)
	mov	r4,a
	mov	r1,(_getsn_PARM_2 + 2)
	mov	dpl,r3
	mov	dph,r4
	mov	b,r1
	mov	a,r2
	lcall	__gptrput
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:125: for(j=0; j<(len-1); j++)
	inc	_getsn_j_1_84
	clr	a
	cjne	a,_getsn_j_1_84,L010018?
	inc	(_getsn_j_1_84 + 1)
L010018?:
	mov	r5,_getsn_j_1_84
	mov	r6,(_getsn_j_1_84 + 1)
	sjmp	L010005?
L010008?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:138: buff[j]=0;
	mov	a,r5
	add	a,_getsn_PARM_2
	mov	r5,a
	mov	a,r6
	addc	a,(_getsn_PARM_2 + 1)
	mov	r6,a
	mov	r2,(_getsn_PARM_2 + 2)
	mov	dpl,r5
	mov	dph,r6
	mov	b,r2
	clr	a
	lcall	__gptrput
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\/LCD_ops.c:139: return len;
	mov	dpl,_getsn_PARM_3
	mov	dph,(_getsn_PARM_3 + 1)
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:29: char _c51_external_startup (void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:32: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:33: WDTCN = 0xDE; //First key
	mov	_WDTCN,#0xDE
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:34: WDTCN = 0xAD; //Second key
	mov	_WDTCN,#0xAD
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:36: VDM0CN=0x80;       // enable VDD monitor
	mov	_VDM0CN,#0x80
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:37: RSTSRC=0x02|0x04;  // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:44: SFRPAGE = 0x10;
	mov	_SFRPAGE,#0x10
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:45: PFE0CN  = 0x20; // SYSCLK < 75 MHz.
	mov	_PFE0CN,#0x20
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:46: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:67: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:68: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:69: while ((CLKSEL & 0x80) == 0);
L011001?:
	mov	a,_CLKSEL
	jnb	acc.7,L011001?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:70: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:71: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:72: while ((CLKSEL & 0x80) == 0);
L011004?:
	mov	a,_CLKSEL
	jnb	acc.7,L011004?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:77: P0MDOUT |= 0x10; // Enable UART0 TX as push-pull output
	orl	_P0MDOUT,#0x10
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:78: XBR0     = 0x01; // Enable UART0 on P0.4(TX) and P0.5(RX)
	mov	_XBR0,#0x01
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:79: XBR1     = 0X00;
	mov	_XBR1,#0x00
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:80: XBR2     = 0x40; // Enable crossbar and weak pull-ups
	mov	_XBR2,#0x40
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:84: TR0=0;
	clr	_TR0
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:85: TF0=0;
	clr	_TF0
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:86: CKCON0|=0b_0000_0100; // Timer 0 uses the system clock
	orl	_CKCON0,#0x04
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:87: TMOD&=0xf0;
	anl	_TMOD,#0xF0
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:88: TMOD|=0x01; // Timer 0 in mode 1: 16-bit timer
	orl	_TMOD,#0x01
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:93: TMR0=0x10000L-(SYSCLK/(TIMER_0_FREQ)); // Initialize reload value
	mov	_TMR0,#0x60
	mov	(_TMR0 >> 8),#0x73
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:94: ET0=1; // Enable Timer0 interrupts
	setb	_ET0
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:95: TR0=1; // Start Timer0
	setb	_TR0
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:96: EA=1;  // Enable global interrupts
	setb	_EA
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:104: SCON0 = 0x10;
	mov	_SCON0,#0x10
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:105: TH1 = 0x100-((SYSCLK/BAUDRATE)/(2L*12L));
	mov	_TH1,#0xE6
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:106: TL1 = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:107: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	anl	_TMOD,#0x0F
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:108: TMOD |=  0x20;
	orl	_TMOD,#0x20
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:109: TR1 = 1; // START Timer1
	setb	_TR1
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:110: TI = 1;  // Indicate TX0 ready
	setb	_TI
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:112: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'InitTimer0'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:115: void InitTimer0 (void) {
;	-----------------------------------------
;	 function InitTimer0
;	-----------------------------------------
_InitTimer0:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:116: TR0_counter1 = 0;
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:117: counter1EN = 0;
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:118: TR0_counter2 = 0;
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:119: counter2EN = 0;
	clr	a
	mov	_TR0_counter1,a
	mov	(_TR0_counter1 + 1),a
	mov	_counter1EN,a
	mov	(_counter1EN + 1),a
	mov	_TR0_counter2,a
	mov	(_TR0_counter2 + 1),a
	mov	_counter2EN,a
	mov	(_counter2EN + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:122: ET0=1;         // Enable Timer2 interrupts
	setb	_ET0
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:123: TR0=1;         // Start Timer2 (TMR2CN is bit addressable)
	setb	_TR0
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer0_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:126: void Timer0_ISR (void) interrupt INTERRUPT_TIMER0
;	-----------------------------------------
;	 function Timer0_ISR
;	-----------------------------------------
_Timer0_ISR:
	push	acc
	push	psw
	mov	psw,#0x00
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:128: SFRPAGE=0x0;
	mov	_SFRPAGE,#0x00
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:129: TMR0=0x10000L-(SYSCLK/(TIMER_0_FREQ));
	mov	_TMR0,#0x60
	mov	(_TMR0 >> 8),#0x73
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:131: if(counter1EN == 1) {
	mov	a,#0x01
	cjne	a,_counter1EN,L013012?
	clr	a
	cjne	a,(_counter1EN + 1),L013012?
	sjmp	L013013?
L013012?:
	sjmp	L013002?
L013013?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:132: TR0_counter1++;
	mov	a,#0x01
	add	a,_TR0_counter1
	mov	_TR0_counter1,a
	clr	a
	addc	a,(_TR0_counter1 + 1)
	mov	(_TR0_counter1 + 1),a
L013002?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:134: if(counter2EN == 1) {
	mov	a,#0x01
	cjne	a,_counter2EN,L013014?
	clr	a
	cjne	a,(_counter2EN + 1),L013014?
	sjmp	L013015?
L013014?:
	sjmp	L013004?
L013015?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:135: TR0_counter2++;
	mov	a,#0x01
	add	a,_TR0_counter2
	mov	_TR0_counter2,a
	clr	a
	addc	a,(_TR0_counter2 + 1)
	mov	(_TR0_counter2 + 1),a
L013004?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:137: if(counter3EN == 1) {
	mov	a,#0x01
	cjne	a,_counter3EN,L013016?
	clr	a
	cjne	a,(_counter3EN + 1),L013016?
	sjmp	L013017?
L013016?:
	sjmp	L013007?
L013017?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:138: TR0_counter3++;
	mov	a,#0x01
	add	a,_TR0_counter3
	mov	_TR0_counter3,a
	clr	a
	addc	a,(_TR0_counter3 + 1)
	mov	(_TR0_counter3 + 1),a
L013007?:
	pop	psw
	pop	acc
	reti
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'InitADC'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:142: void InitADC (void)
;	-----------------------------------------
;	 function InitADC
;	-----------------------------------------
_InitADC:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:144: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:145: ADC0CN1 = 0b_10_000_000; //14-bit,  Right justified no shifting applied, perform and Accumulate 1 conversion.
	mov	_ADC0CN1,#0x80
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:146: ADC0CF0 = 0b_11111_0_00; // SYSCLK/32
	mov	_ADC0CF0,#0xF8
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:147: ADC0CF1 = 0b_0_0_011110; // Same as default for now
	mov	_ADC0CF1,#0x1E
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:148: ADC0CN0 = 0b_0_0_0_0_0_00_0; // Same as default for now
	mov	_ADC0CN0,#0x00
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:149: ADC0CF2 = 0b_0_01_11111 ; // GND pin, Vref=VDD
	mov	_ADC0CF2,#0x3F
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:150: ADC0CN2 = 0b_0_000_0000;  // Same as default for now. ADC0 conversion initiated on write of 1 to ADBUSY.
	mov	_ADC0CN2,#0x00
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:151: ADEN=1; // Enable ADC
	setb	_ADEN
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'InitPinADC'
;------------------------------------------------------------
;pinno                     Allocated with name '_InitPinADC_PARM_2'
;portno                    Allocated to registers r2 
;mask                      Allocated to registers r3 
;------------------------------------------------------------
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:186: void InitPinADC (unsigned char portno, unsigned char pinno)
;	-----------------------------------------
;	 function InitPinADC
;	-----------------------------------------
_InitPinADC:
	mov	r2,dpl
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:190: mask=1<<pinno;
	mov	b,_InitPinADC_PARM_2
	inc	b
	mov	a,#0x01
	sjmp	L015013?
L015011?:
	add	a,acc
L015013?:
	djnz	b,L015011?
	mov	r3,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:192: SFRPAGE = 0x20;
	mov	_SFRPAGE,#0x20
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:193: switch (portno)
	cjne	r2,#0x00,L015014?
	sjmp	L015001?
L015014?:
	cjne	r2,#0x01,L015015?
	sjmp	L015002?
L015015?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:195: case 0:
	cjne	r2,#0x02,L015005?
	sjmp	L015003?
L015001?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:196: P0MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P0MDIN,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:197: P0SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P0SKIP,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:198: break;
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:199: case 1:
	sjmp	L015005?
L015002?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:200: P1MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P1MDIN,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:201: P1SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P1SKIP,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:202: break;
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:203: case 2:
	sjmp	L015005?
L015003?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:204: P2MDIN &= (~mask); // Set pin as analog input
	mov	a,r3
	cpl	a
	mov	r2,a
	anl	_P2MDIN,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:205: P2SKIP |= mask; // Skip Crossbar decoding for this pin
	mov	a,r3
	orl	_P2SKIP,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:209: }
L015005?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:210: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ADC_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers 
;------------------------------------------------------------
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:213: unsigned int ADC_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function ADC_at_Pin
;	-----------------------------------------
_ADC_at_Pin:
	mov	_ADC0MX,dpl
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:216: ADBUSY=1;       // Dummy conversion first to select new pin
	setb	_ADBUSY
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:217: while (ADBUSY); // Wait for dummy conversion to finish
L016001?:
	jb	_ADBUSY,L016001?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:218: ADBUSY = 1;     // Convert voltage at the pin
	setb	_ADBUSY
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:219: while (ADBUSY); // Wait for conversion to complete
L016004?:
	jb	_ADBUSY,L016004?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:220: return (ADC0);
	mov	dpl,_ADC0
	mov	dph,(_ADC0 >> 8)
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Volts_at_Pin'
;------------------------------------------------------------
;pin                       Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:223: float Volts_at_Pin(unsigned char pin)
;	-----------------------------------------
;	 function Volts_at_Pin
;	-----------------------------------------
_Volts_at_Pin:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:225: return ((ADC_at_Pin(pin)*VDD)/0b_0011_1111_1111_1111);
	lcall	_ADC_at_Pin
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x6C8B
	mov	b,#0x53
	mov	a,#0x40
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	mov	a,#0xFC
	push	acc
	mov	a,#0x7F
	push	acc
	mov	a,#0x46
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'calc_phase'
;------------------------------------------------------------
;period                    Allocated with name '_calc_phase_PARM_2'
;interval                  Allocated to registers r2 r3 
;pd                        Allocated to registers r2 r3 r4 r5 
;------------------------------------------------------------
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:229: float calc_phase(unsigned int interval, float period) {
;	-----------------------------------------
;	 function calc_phase
;	-----------------------------------------
_calc_phase:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:231: interval = interval - (int)(period/2);
	push	ar2
	push	ar3
	clr	a
	push	acc
	push	acc
	push	acc
	mov	a,#0x40
	push	acc
	mov	dpl,_calc_phase_PARM_2
	mov	dph,(_calc_phase_PARM_2 + 1)
	mov	b,(_calc_phase_PARM_2 + 2)
	mov	a,(_calc_phase_PARM_2 + 3)
	lcall	___fsdiv
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r4
	mov	dph,r5
	mov	b,r6
	mov	a,r7
	lcall	___fs2sint
	mov	r4,dpl
	mov	r5,dph
	pop	ar3
	pop	ar2
	mov	a,r2
	clr	c
	subb	a,r4
	mov	r2,a
	mov	a,r3
	subb	a,r5
	mov	r3,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:232: pd = interval * (360.0 / period);
	push	ar2
	push	ar3
	push	_calc_phase_PARM_2
	push	(_calc_phase_PARM_2 + 1)
	push	(_calc_phase_PARM_2 + 2)
	push	(_calc_phase_PARM_2 + 3)
	mov	dptr,#0x0000
	mov	b,#0xB4
	mov	a,#0x43
	lcall	___fsdiv
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar3
	pop	ar2
	mov	dpl,r2
	mov	dph,r3
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	lcall	___uint2fs
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:233: while(pd > 180 || pd < -180) {
L018007?:
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	clr	a
	push	acc
	push	acc
	mov	a,#0x34
	push	acc
	mov	a,#0x43
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsgt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	mov	a,r6
	jnz	L018008?
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	clr	a
	push	acc
	push	acc
	mov	a,#0x34
	push	acc
	mov	a,#0xC3
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fslt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	mov	a,r6
	jnz	L018017?
	ljmp	L018009?
L018017?:
L018008?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:234: if(pd < -180) {
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	clr	a
	push	acc
	push	acc
	mov	a,#0x34
	push	acc
	mov	a,#0xC3
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fslt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	mov	a,r6
	jz	L018004?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:235: pd += 360;
	clr	a
	push	acc
	push	acc
	mov	a,#0xB4
	push	acc
	mov	a,#0x43
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	ljmp	L018007?
L018004?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:237: else if(pd > 180) {
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	clr	a
	push	acc
	push	acc
	mov	a,#0x34
	push	acc
	mov	a,#0x43
	push	acc
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	lcall	___fsgt
	mov	r6,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	mov	a,r6
	jnz	L018019?
	ljmp	L018007?
L018019?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:238: pd = 360 - pd;
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0xB4
	mov	a,#0x43
	lcall	___fssub
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	ljmp	L018007?
L018009?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:242: return pd;
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;v                         Allocated with name '_main_v_1_112'
;p                         Allocated with name '_main_p_1_112'
;interval                  Allocated with name '_main_interval_1_112'
;phase_diff                Allocated with name '_main_sloc1_1_0'
;frequency                 Allocated to registers r2 r3 r4 r5 
;buff                      Allocated with name '_main_buff_1_112'
;datanum                   Allocated with name '_main_datanum_1_112'
;lol                       Allocated with name '_main_lol_1_112'
;sloc0                     Allocated with name '_main_sloc0_1_0'
;sloc1                     Allocated with name '_main_sloc1_1_0'
;------------------------------------------------------------
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:246: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:248: float v[2] = {0};
	mov	_main_v_1_112,#0x00
	mov	(_main_v_1_112 + 1),#0x00
	mov	(_main_v_1_112 + 2),#0x00
	mov	(_main_v_1_112 + 3),#0x00
	mov	(_main_v_1_112 + 0x0004),#0x00
	mov	((_main_v_1_112 + 0x0004) + 1),#0x00
	mov	((_main_v_1_112 + 0x0004) + 2),#0x00
	mov	((_main_v_1_112 + 0x0004) + 3),#0x00
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:249: float p[2] = {0};
	mov	_main_p_1_112,#0x00
	mov	(_main_p_1_112 + 1),#0x00
	mov	(_main_p_1_112 + 2),#0x00
	mov	(_main_p_1_112 + 3),#0x00
	mov	(_main_p_1_112 + 0x0004),#0x00
	mov	((_main_p_1_112 + 0x0004) + 1),#0x00
	mov	((_main_p_1_112 + 0x0004) + 2),#0x00
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:250: unsigned int interval = 0;
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:251: float phase_diff = 0;
	clr a
	mov ((_main_p_1_112 + 0x0004) + 3),a
	mov _main_interval_1_112,a
	mov (_main_interval_1_112 + 1),a
	mov _main_sloc1_1_0,a
	mov (_main_sloc1_1_0 + 1),a
	mov (_main_sloc1_1_0 + 2),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:255: unsigned short int datanum = 0;
	clr	a
	mov	(_main_sloc1_1_0 + 3),a
	mov	_main_datanum_1_112,a
	mov	(_main_datanum_1_112 + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:256: unsigned short int lol = 100;
	mov	_main_lol_1_112,#0x64
	clr	a
	mov	(_main_lol_1_112 + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:258: waitms(500); // Give PuTTy a chance to start before sending
	mov	dptr,#0x01F4
	lcall	_waitms
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:259: printf("\x1b[2J"); // Clear screen using ANSI escape sequence.
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:261: LCD_4BIT();
	lcall	_LCD_4BIT
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:262: InitTimer0();
	lcall	_InitTimer0
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:267: __FILE__, __DATE__, __TIME__);
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:266: "Compiled: %s, %s\n\n",
	mov	a,#__str_4
	push	acc
	mov	a,#(__str_4 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#__str_3
	push	acc
	mov	a,#(__str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf4
	mov	sp,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:269: InitPinADC(1, 1); // Configure P2.2 as analog input
	mov	_InitPinADC_PARM_2,#0x01
	mov	dpl,#0x01
	lcall	_InitPinADC
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:270: InitPinADC(1, 2); // Configure P2.3 as analog input
	mov	_InitPinADC_PARM_2,#0x02
	mov	dpl,#0x01
	lcall	_InitPinADC
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:271: InitADC();
	lcall	_InitADC
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:273: while(1)
L019063?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:276: v[0] = Volts_at_Pin(QFP32_MUX_P1_1);
	mov	dpl,#0x07
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	_main_v_1_112,r2
	mov	(_main_v_1_112 + 1),r3
	mov	(_main_v_1_112 + 2),r4
	mov	(_main_v_1_112 + 3),r5
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:277: v[1] = Volts_at_Pin(QFP32_MUX_P1_2);
	mov	dpl,#0x08
	lcall	_Volts_at_Pin
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	(_main_v_1_112 + 0x0004),r2
	mov	((_main_v_1_112 + 0x0004) + 1),r3
	mov	((_main_v_1_112 + 0x0004) + 2),r4
	mov	((_main_v_1_112 + 0x0004) + 3),r5
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:280: if(v[0] > 0 && counter1EN == 0) counter1EN = 1;
	clr	a
	push	acc
	push	acc
	push	acc
	push	acc
	mov	dpl,_main_v_1_112
	mov	dph,(_main_v_1_112 + 1)
	mov	b,(_main_v_1_112 + 2)
	mov	a,(_main_v_1_112 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L019009?
	mov	a,_counter1EN
	orl	a,(_counter1EN + 1)
	jnz	L019009?
	mov	_counter1EN,#0x01
	clr	a
	mov	(_counter1EN + 1),a
	ljmp	L019010?
L019009?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:281: else if(v[0] <= 0 && counter1EN == 1) {
	clr	a
	push	acc
	push	acc
	push	acc
	push	acc
	mov	dpl,_main_v_1_112
	mov	dph,(_main_v_1_112 + 1)
	mov	b,(_main_v_1_112 + 2)
	mov	a,(_main_v_1_112 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L019005?
	mov	a,#0x01
	cjne	a,_counter1EN,L019098?
	clr	a
	cjne	a,(_counter1EN + 1),L019098?
	sjmp	L019099?
L019098?:
	sjmp	L019005?
L019099?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:282: p[0] = (float)TR0_counter1;
	mov	dpl,_TR0_counter1
	mov	dph,(_TR0_counter1 + 1)
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	_main_p_1_112,r2
	mov	(_main_p_1_112 + 1),r3
	mov	(_main_p_1_112 + 2),r4
	mov	(_main_p_1_112 + 3),r5
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:283: counter1EN = 0;
	clr	a
	mov	_counter1EN,a
	mov	(_counter1EN + 1),a
	sjmp	L019010?
L019005?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:285: else if(v[0] <= 0 && counter1EN == 0) {
	clr	a
	push	acc
	push	acc
	push	acc
	push	acc
	mov	dpl,_main_v_1_112
	mov	dph,(_main_v_1_112 + 1)
	mov	b,(_main_v_1_112 + 2)
	mov	a,(_main_v_1_112 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L019010?
	mov	a,_counter1EN
	orl	a,(_counter1EN + 1)
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:286: TR0_counter1 = 0;
	jnz	L019010?
	mov	_TR0_counter1,a
	mov	(_TR0_counter1 + 1),a
L019010?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:289: if(v[1] > 0 && counter2EN == 0) counter2EN = 1;
	clr	a
	push	acc
	push	acc
	push	acc
	push	acc
	mov	dpl,(_main_v_1_112 + 0x0004)
	mov	dph,((_main_v_1_112 + 0x0004) + 1)
	mov	b,((_main_v_1_112 + 0x0004) + 2)
	mov	a,((_main_v_1_112 + 0x0004) + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L019020?
	mov	a,_counter2EN
	orl	a,(_counter2EN + 1)
	jnz	L019020?
	mov	_counter2EN,#0x01
	clr	a
	mov	(_counter2EN + 1),a
	ljmp	L019021?
L019020?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:290: else if(v[1] <= 0 && counter2EN == 1) {
	clr	a
	push	acc
	push	acc
	push	acc
	push	acc
	mov	dpl,(_main_v_1_112 + 0x0004)
	mov	dph,((_main_v_1_112 + 0x0004) + 1)
	mov	b,((_main_v_1_112 + 0x0004) + 2)
	mov	a,((_main_v_1_112 + 0x0004) + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L019016?
	mov	a,#0x01
	cjne	a,_counter2EN,L019105?
	clr	a
	cjne	a,(_counter2EN + 1),L019105?
	sjmp	L019106?
L019105?:
	sjmp	L019016?
L019106?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:291: p[1] = (float)TR0_counter2;
	mov	dpl,_TR0_counter2
	mov	dph,(_TR0_counter2 + 1)
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	(_main_p_1_112 + 0x0004),r2
	mov	((_main_p_1_112 + 0x0004) + 1),r3
	mov	((_main_p_1_112 + 0x0004) + 2),r4
	mov	((_main_p_1_112 + 0x0004) + 3),r5
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:292: counter2EN = 0;
	clr	a
	mov	_counter2EN,a
	mov	(_counter2EN + 1),a
	sjmp	L019021?
L019016?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:294: else if(v[1] <= 0 && counter2EN == 0) {
	clr	a
	push	acc
	push	acc
	push	acc
	push	acc
	mov	dpl,(_main_v_1_112 + 0x0004)
	mov	dph,((_main_v_1_112 + 0x0004) + 1)
	mov	b,((_main_v_1_112 + 0x0004) + 2)
	mov	a,((_main_v_1_112 + 0x0004) + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L019021?
	mov	a,_counter2EN
	orl	a,(_counter2EN + 1)
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:295: TR0_counter2 = 0;
	jnz	L019021?
	mov	_TR0_counter2,a
	mov	(_TR0_counter2 + 1),a
L019021?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:299: if(datanum == lol) {
	mov	a,_main_lol_1_112
	cjne	a,_main_datanum_1_112,L019109?
	mov	a,(_main_lol_1_112 + 1)
	cjne	a,(_main_datanum_1_112 + 1),L019109?
	sjmp	L019110?
L019109?:
	ljmp	L019060?
L019110?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:301: if(p[0] == 0 && p[1] == 0) {
	mov	a,_main_p_1_112
	orl	a,(_main_p_1_112 + 1)
	orl	a,(_main_p_1_112 + 2)
	mov	b,(_main_p_1_112 + 3)
	clr	b.7 ; Clear the sign bit
	orl	a,b
	jnz	L019053?
	mov	a,(_main_p_1_112 + 0x0004)
	orl	a,((_main_p_1_112 + 0x0004) + 1)
	orl	a,((_main_p_1_112 + 0x0004) + 2)
	mov	b,((_main_p_1_112 + 0x0004) + 3)
	clr	b.7 ; Clear the sign bit
	orl	a,b
	jnz	L019053?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:302: printf("\rSignals NOT available! (wait 2 seconds)                       ");
	mov	a,#__str_5
	push	acc
	mov	a,#(__str_5 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:303: LCDprint("Error:", 1, 1, 1);
	mov	_LCDprint_PARM_2,#0x01
	mov	_LCDprint_PARM_3,#0x01
	clr	a
	mov	(_LCDprint_PARM_3 + 1),a
	setb	_LCDprint_PARM_4
	mov	dptr,#__str_6
	mov	b,#0x80
	lcall	_LCDprint
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:304: LCDprint("Check console!", 2, 1, 1);
	mov	_LCDprint_PARM_2,#0x02
	mov	_LCDprint_PARM_3,#0x01
	clr	a
	mov	(_LCDprint_PARM_3 + 1),a
	setb	_LCDprint_PARM_4
	mov	dptr,#__str_7
	mov	b,#0x80
	lcall	_LCDprint
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:305: waitms(2000);
	mov	dptr,#0x07D0
	lcall	_waitms
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:306: signal_state = 0;
	clr	a
	mov	_signal_state,a
	mov	(_signal_state + 1),a
	ljmp	L019054?
L019053?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:309: else if(p[0] == 0 || p[1] == 0) {
	mov	a,_main_p_1_112
	orl	a,(_main_p_1_112 + 1)
	orl	a,(_main_p_1_112 + 2)
	mov	b,(_main_p_1_112 + 3)
	clr	b.7 ; Clear the sign bit
	orl	a,b
	jz	L019048?
	mov	a,(_main_p_1_112 + 0x0004)
	orl	a,((_main_p_1_112 + 0x0004) + 1)
	orl	a,((_main_p_1_112 + 0x0004) + 2)
	mov	b,((_main_p_1_112 + 0x0004) + 3)
	clr	b.7 ; Clear the sign bit
	orl	a,b
	jnz	L019049?
L019048?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:310: if(p[0] == 0) printf("\rNo signal at test source (wait 2 seconds)                             ");
	mov	a,_main_p_1_112
	orl	a,(_main_p_1_112 + 1)
	orl	a,(_main_p_1_112 + 2)
	mov	b,(_main_p_1_112 + 3)
	clr	b.7 ; Clear the sign bit
	orl	a,b
	jnz	L019024?
	mov	a,#__str_8
	push	acc
	mov	a,#(__str_8 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
	sjmp	L019025?
L019024?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:311: else printf("\rNo signal at reference source (wait 2 seconds)                         ");
	mov	a,#__str_9
	push	acc
	mov	a,#(__str_9 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
L019025?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:312: LCDprint("Error:", 1, 1, 1);
	mov	_LCDprint_PARM_2,#0x01
	mov	_LCDprint_PARM_3,#0x01
	clr	a
	mov	(_LCDprint_PARM_3 + 1),a
	setb	_LCDprint_PARM_4
	mov	dptr,#__str_6
	mov	b,#0x80
	lcall	_LCDprint
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:313: LCDprint("Check console!", 2, 1, 1);
	mov	_LCDprint_PARM_2,#0x02
	mov	_LCDprint_PARM_3,#0x01
	clr	a
	mov	(_LCDprint_PARM_3 + 1),a
	setb	_LCDprint_PARM_4
	mov	dptr,#__str_7
	mov	b,#0x80
	lcall	_LCDprint
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:314: waitms(2000);
	mov	dptr,#0x07D0
	lcall	_waitms
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:315: signal_state = 0;
	clr	a
	mov	_signal_state,a
	mov	(_signal_state + 1),a
	ljmp	L019054?
L019049?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:318: else if(p[1] > p[0] + 100000 || p[1] < p[0] - 100000) {
	mov	_main_sloc0_1_0,(_main_p_1_112 + 0x0004)
	mov	(_main_sloc0_1_0 + 1),((_main_p_1_112 + 0x0004) + 1)
	mov	(_main_sloc0_1_0 + 2),((_main_p_1_112 + 0x0004) + 2)
	mov	(_main_sloc0_1_0 + 3),((_main_p_1_112 + 0x0004) + 3)
	clr	a
	push	acc
	mov	a,#0x50
	push	acc
	mov	a,#0xC3
	push	acc
	mov	a,#0x47
	push	acc
	mov	dpl,_main_p_1_112
	mov	dph,(_main_p_1_112 + 1)
	mov	b,(_main_p_1_112 + 2)
	mov	a,(_main_p_1_112 + 3)
	lcall	___fsadd
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar6
	push	ar7
	push	ar2
	push	ar3
	mov	dpl,_main_sloc0_1_0
	mov	dph,(_main_sloc0_1_0 + 1)
	mov	b,(_main_sloc0_1_0 + 2)
	mov	a,(_main_sloc0_1_0 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L019044?
	mov	_main_sloc0_1_0,(_main_p_1_112 + 0x0004)
	mov	(_main_sloc0_1_0 + 1),((_main_p_1_112 + 0x0004) + 1)
	mov	(_main_sloc0_1_0 + 2),((_main_p_1_112 + 0x0004) + 2)
	mov	(_main_sloc0_1_0 + 3),((_main_p_1_112 + 0x0004) + 3)
	clr	a
	push	acc
	mov	a,#0x50
	push	acc
	mov	a,#0xC3
	push	acc
	mov	a,#0x47
	push	acc
	mov	dpl,_main_p_1_112
	mov	dph,(_main_p_1_112 + 1)
	mov	b,(_main_p_1_112 + 2)
	mov	a,(_main_p_1_112 + 3)
	lcall	___fssub
	mov	r6,dpl
	mov	r7,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar6
	push	ar7
	push	ar2
	push	ar3
	mov	dpl,_main_sloc0_1_0
	mov	dph,(_main_sloc0_1_0 + 1)
	mov	b,(_main_sloc0_1_0 + 2)
	mov	a,(_main_sloc0_1_0 + 3)
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L019045?
L019044?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:319: printf("\rSignals have varying frequencies! (wait 2 seconds)                    ");
	mov	a,#__str_10
	push	acc
	mov	a,#(__str_10 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:320: LCDprint("Error:", 1, 1, 1);
	mov	_LCDprint_PARM_2,#0x01
	mov	_LCDprint_PARM_3,#0x01
	clr	a
	mov	(_LCDprint_PARM_3 + 1),a
	setb	_LCDprint_PARM_4
	mov	dptr,#__str_6
	mov	b,#0x80
	lcall	_LCDprint
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:321: LCDprint("Check console!", 2, 1, 1);
	mov	_LCDprint_PARM_2,#0x02
	mov	_LCDprint_PARM_3,#0x01
	clr	a
	mov	(_LCDprint_PARM_3 + 1),a
	setb	_LCDprint_PARM_4
	mov	dptr,#__str_7
	mov	b,#0x80
	lcall	_LCDprint
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:322: waitms(2000);
	mov	dptr,#0x07D0
	lcall	_waitms
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:323: signal_state = 0;
	clr	a
	mov	_signal_state,a
	mov	(_signal_state + 1),a
	ljmp	L019054?
L019045?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:327: switch(fsm_state) {
	mov	r2,_fsm_state
	mov	r3,(_fsm_state + 1)
	clr	c
	mov	a,#0x04
	subb	a,r2
	clr	a
	subb	a,r3
	jnc	L019118?
	ljmp	L019043?
L019118?:
	mov	a,r2
	add	a,r2
	add	a,r2
	mov	dptr,#L019119?
	jmp	@a+dptr
L019119?:
	ljmp	L019026?
	ljmp	L019030?
	ljmp	L019034?
	ljmp	L019038?
	ljmp	L019042?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:329: case 0:
L019026?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:330: if(v[0] <= 0 && v[1] <= 0) fsm_state = 1;
	clr	a
	push	acc
	push	acc
	push	acc
	push	acc
	mov	dpl,_main_v_1_112
	mov	dph,(_main_v_1_112 + 1)
	mov	b,(_main_v_1_112 + 2)
	mov	a,(_main_v_1_112 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L019120?
	ljmp	L019043?
L019120?:
	clr	a
	push	acc
	push	acc
	push	acc
	push	acc
	mov	dpl,(_main_v_1_112 + 0x0004)
	mov	dph,((_main_v_1_112 + 0x0004) + 1)
	mov	b,((_main_v_1_112 + 0x0004) + 2)
	mov	a,((_main_v_1_112 + 0x0004) + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L019121?
	ljmp	L019043?
L019121?:
	mov	_fsm_state,#0x01
	clr	a
	mov	(_fsm_state + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:331: break;
	ljmp	L019043?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:333: case 1:
L019030?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:334: if(v[0] > 0 || v[1] > 0) {
	clr	a
	push	acc
	push	acc
	push	acc
	push	acc
	mov	dpl,_main_v_1_112
	mov	dph,(_main_v_1_112 + 1)
	mov	b,(_main_v_1_112 + 2)
	mov	a,(_main_v_1_112 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L019031?
	push	acc
	push	acc
	push	acc
	push	acc
	mov	dpl,(_main_v_1_112 + 0x0004)
	mov	dph,((_main_v_1_112 + 0x0004) + 1)
	mov	b,((_main_v_1_112 + 0x0004) + 2)
	mov	a,((_main_v_1_112 + 0x0004) + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L019123?
	ljmp	L019043?
L019123?:
L019031?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:335: fsm_state = 2;
	mov	_fsm_state,#0x02
	clr	a
	mov	(_fsm_state + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:336: counter3EN = 1;
	mov	_counter3EN,#0x01
	clr	a
	mov	(_counter3EN + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:338: break;
	ljmp	L019043?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:340: case 2:
L019034?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:341: if(v[0] > 1  &&  v[1] > 1) {
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_main_v_1_112
	mov	dph,(_main_v_1_112 + 1)
	mov	b,(_main_v_1_112 + 2)
	mov	a,(_main_v_1_112 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L019124?
	ljmp	L019043?
L019124?:
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,(_main_v_1_112 + 0x0004)
	mov	dph,((_main_v_1_112 + 0x0004) + 1)
	mov	b,((_main_v_1_112 + 0x0004) + 2)
	mov	a,((_main_v_1_112 + 0x0004) + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L019125?
	ljmp	L019043?
L019125?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:342: fsm_state = 3;
	mov	_fsm_state,#0x03
	clr	a
	mov	(_fsm_state + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:344: break;
	ljmp	L019043?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:346: case 3:
L019038?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:347: if(v[0] <= 0 &&  v[1] <= 0) {
	clr	a
	push	acc
	push	acc
	push	acc
	push	acc
	mov	dpl,_main_v_1_112
	mov	dph,(_main_v_1_112 + 1)
	mov	b,(_main_v_1_112 + 2)
	mov	a,(_main_v_1_112 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jnz	L019043?
	push	acc
	push	acc
	push	acc
	push	acc
	mov	dpl,(_main_v_1_112 + 0x0004)
	mov	dph,((_main_v_1_112 + 0x0004) + 1)
	mov	b,((_main_v_1_112 + 0x0004) + 2)
	mov	a,((_main_v_1_112 + 0x0004) + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:348: counter3EN = 0;
	jnz	L019043?
	mov	_counter3EN,a
	mov	(_counter3EN + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:349: interval = TR0_counter3 / 2;
	mov	_main_interval_1_112,_TR0_counter3
	mov	a,(_TR0_counter3 + 1)
	clr	c
	rrc	a
	xch	a,_main_interval_1_112
	rrc	a
	xch	a,_main_interval_1_112
	mov	(_main_interval_1_112 + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:350: fsm_state = 4;
	mov	_fsm_state,#0x04
	clr	a
	mov	(_fsm_state + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:352: break;
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:353: case 4:
	sjmp	L019043?
L019042?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:354: TR0_counter3 = 0;
	clr	a
	mov	_TR0_counter3,a
	mov	(_TR0_counter3 + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:355: phase_diff = calc_phase(interval, p[0]);
	mov	_calc_phase_PARM_2,_main_p_1_112
	mov	(_calc_phase_PARM_2 + 1),(_main_p_1_112 + 1)
	mov	(_calc_phase_PARM_2 + 2),(_main_p_1_112 + 2)
	mov	(_calc_phase_PARM_2 + 3),(_main_p_1_112 + 3)
	mov	dpl,_main_interval_1_112
	mov	dph,(_main_interval_1_112 + 1)
	lcall	_calc_phase
	mov	_main_sloc1_1_0,dpl
	mov	(_main_sloc1_1_0 + 1),dph
	mov	(_main_sloc1_1_0 + 2),b
	mov	(_main_sloc1_1_0 + 3),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:356: fsm_state = 0;
	clr	a
	mov	_fsm_state,a
	mov	(_fsm_state + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:358: }
L019043?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:359: frequency = 1000 / p[0];
	push	_main_p_1_112
	push	(_main_p_1_112 + 1)
	push	(_main_p_1_112 + 2)
	push	(_main_p_1_112 + 3)
	mov	dptr,#0x0000
	mov	b,#0x7A
	mov	a,#0x44
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:365: printf("\rp=%7.0fms, f=%4.2fHz, V1=%7.5f, V2=%7.5f, counter=%i, interval=%i              ", p[0], frequency, v[0], v[1], TR0_counter3, interval);
	push	_main_interval_1_112
	push	(_main_interval_1_112 + 1)
	push	_TR0_counter3
	push	(_TR0_counter3 + 1)
	push	(_main_v_1_112 + 0x0004)
	push	((_main_v_1_112 + 0x0004) + 1)
	push	((_main_v_1_112 + 0x0004) + 2)
	push	((_main_v_1_112 + 0x0004) + 3)
	push	_main_v_1_112
	push	(_main_v_1_112 + 1)
	push	(_main_v_1_112 + 2)
	push	(_main_v_1_112 + 3)
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	_main_p_1_112
	push	(_main_p_1_112 + 1)
	push	(_main_p_1_112 + 2)
	push	(_main_p_1_112 + 3)
	mov	a,#__str_11
	push	acc
	mov	a,#(__str_11 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xe9
	mov	sp,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:366: LCDprint("Phase diff (deg):", 1, 1, 1);
	mov	_LCDprint_PARM_2,#0x01
	mov	_LCDprint_PARM_3,#0x01
	clr	a
	mov	(_LCDprint_PARM_3 + 1),a
	setb	_LCDprint_PARM_4
	mov	dptr,#__str_12
	mov	b,#0x80
	lcall	_LCDprint
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:367: sprintf(buff, "%f", phase_diff);
	push	_main_sloc1_1_0
	push	(_main_sloc1_1_0 + 1)
	push	(_main_sloc1_1_0 + 2)
	push	(_main_sloc1_1_0 + 3)
	mov	a,#__str_13
	push	acc
	mov	a,#(__str_13 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#_main_buff_1_112
	push	acc
	mov	a,#(_main_buff_1_112 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	lcall	_sprintf
	mov	a,sp
	add	a,#0xf6
	mov	sp,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:368: LCDprint(buff, 2, 1, 1);
	mov	_LCDprint_PARM_2,#0x02
	mov	_LCDprint_PARM_3,#0x01
	clr	a
	mov	(_LCDprint_PARM_3 + 1),a
	setb	_LCDprint_PARM_4
	mov	dptr,#_main_buff_1_112
	mov	b,#0x40
	lcall	_LCDprint
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:369: signal_state = 1;
	mov	_signal_state,#0x01
	clr	a
	mov	(_signal_state + 1),a
L019054?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:372: datanum = 0;
	clr	a
	mov	_main_datanum_1_112,a
	mov	(_main_datanum_1_112 + 1),a
	sjmp	L019061?
L019060?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:375: if(signal_state == 0) {
	mov	a,_signal_state
	orl	a,(_signal_state + 1)
	jnz	L019057?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:376: printf("\rGathering data...                                                     ");
	mov	a,#__str_14
	push	acc
	mov	a,#(__str_14 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:377: lol = 2;
	mov	_main_lol_1_112,#0x02
	clr	a
	mov	(_main_lol_1_112 + 1),a
	sjmp	L019058?
L019057?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:379: else lol = 2;
	mov	_main_lol_1_112,#0x02
	clr	a
	mov	(_main_lol_1_112 + 1),a
L019058?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:380: datanum++;
	inc	_main_datanum_1_112
	clr	a
	cjne	a,_main_datanum_1_112,L019129?
	inc	(_main_datanum_1_112 + 1)
L019129?:
L019061?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 5\Attempt 1\EFM8_ADC_Adv.c:391: waitms(1);
	mov	dptr,#0x0001
	lcall	_waitms
	ljmp	L019063?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 0x1B
	db '[2J'
	db 0x00
__str_1:
	db 'ADC test program'
	db 0x0A
	db 'File: %s'
	db 0x0A
	db 'Compiled: %s, %s'
	db 0x0A
	db 0x0A
	db 0x00
__str_2:
	db 'C:'
	db 0x5C
	db 'Users'
	db 0x5C
	db 'Clare'
	db 0x5C
	db 'OneDrive'
	db 0x5C
	db '[UBC] Undegraduate Sophomore'
	db 0x5C
	db 'ELEC291'
	db ' (Calvino-Fraga, Jesus)'
	db 0x5C
	db 'Lab 5'
	db 0x5C
	db 'Attempt 1'
	db 0x5C
	db 'EFM8_ADC_Adv.c'
	db 0x00
__str_3:
	db 'Mar  7 2019'
	db 0x00
__str_4:
	db '11:15:24'
	db 0x00
__str_5:
	db 0x0D
	db 'Signals NOT available! (wait 2 seconds)                    '
	db '   '
	db 0x00
__str_6:
	db 'Error:'
	db 0x00
__str_7:
	db 'Check console!'
	db 0x00
__str_8:
	db 0x0D
	db 'No signal at test source (wait 2 seconds)                  '
	db '           '
	db 0x00
__str_9:
	db 0x0D
	db 'No signal at reference source (wait 2 seconds)             '
	db '            '
	db 0x00
__str_10:
	db 0x0D
	db 'Signals have varying frequencies! (wait 2 seconds)         '
	db '           '
	db 0x00
__str_11:
	db 0x0D
	db 'p=%7.0fms, f=%4.2fHz, V1=%7.5f, V2=%7.5f, counter=%i, inter'
	db 'val=%i              '
	db 0x00
__str_12:
	db 'Phase diff (deg):'
	db 0x00
__str_13:
	db '%f'
	db 0x00
__str_14:
	db 0x0D
	db 'Gathering data...                                          '
	db '           '
	db 0x00

	CSEG

end
