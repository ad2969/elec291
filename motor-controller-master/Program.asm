;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1034 (May  5 2015) (MSVC)
; This file was generated Wed Mar 13 01:59:31 2019
;--------------------------------------------------------
$name Program
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
	public _main
	public _getAngle
	public _Timer2_ISR
	public __c51_external_startup
	public _waitms
	public _Timer3us
	public _getAngle_PARM_3
	public _getAngle_PARM_2
	public _current_angle
	public _PWM_TIME
	public _PWM_OFF
	public _PWM_MODE
	public _PWM_LIMIT
	public _PWM_TURN
	public _pwm_count
	public _count_angle
	public _centiseconds
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
; overlayable bit register bank
;--------------------------------------------------------
	rseg BIT_BANK
bits:
	ds 1
	b0 equ  bits.0 
	b1 equ  bits.1 
	b2 equ  bits.2 
	b3 equ  bits.3 
	b4 equ  bits.4 
	b5 equ  bits.5 
	b6 equ  bits.6 
	b7 equ  bits.7 
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_centiseconds:
	ds 4
_count_angle:
	ds 2
_pwm_count:
	ds 1
_PWM_TURN:
	ds 2
_PWM_LIMIT:
	ds 2
_PWM_MODE:
	ds 2
_PWM_OFF:
	ds 2
_PWM_TIME:
	ds 2
_current_angle:
	ds 2
_getAngle_PARM_2:
	ds 4
_getAngle_PARM_3:
	ds 2
_getAngle_current_angle_1_54:
	ds 2
_getAngle_sloc0_1_0:
	ds 4
_main_temp_1_58:
	ds 2
_main_direction_1_58:
	ds 2
_main_sloc0_1_0:
	ds 4
_main_sloc1_1_0:
	ds 4
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
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
_Timer2_ISR_sloc0_1_0:
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
	CSEG at 0x002b
	ljmp	_Timer2_ISR
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
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:19: volatile double centiseconds=0;
	mov	_centiseconds,#0x00
	mov	(_centiseconds + 1),#0x00
	mov	(_centiseconds + 2),#0x00
	mov	(_centiseconds + 3),#0x00
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:20: volatile unsigned int count_angle=0;
	clr	a
	mov	_count_angle,a
	mov	(_count_angle + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:21: volatile unsigned char pwm_count=0;
	mov	_pwm_count,#0x00
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:22: volatile unsigned int PWM_TURN=50;
	mov	_PWM_TURN,#0x32
	clr	a
	mov	(_PWM_TURN + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:23: volatile unsigned int PWM_LIMIT=100;
	mov	_PWM_LIMIT,#0x64
	clr	a
	mov	(_PWM_LIMIT + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:24: volatile unsigned int PWM_MODE=0;
	clr	a
	mov	_PWM_MODE,a
	mov	(_PWM_MODE + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:25: volatile unsigned int PWM_OFF=1;
	mov	_PWM_OFF,#0x01
	clr	a
	mov	(_PWM_OFF + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:26: volatile unsigned int PWM_TIME=0;
	clr	a
	mov	_PWM_TIME,a
	mov	(_PWM_TIME + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:27: volatile unsigned int current_angle=0;
	clr	a
	mov	_current_angle,a
	mov	(_current_angle + 1),a
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
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\/Timer3Wait.c:7: void Timer3us(unsigned char us)
;	-----------------------------------------
;	 function Timer3us
;	-----------------------------------------
_Timer3us:
	using	0
	mov	r2,dpl
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\/Timer3Wait.c:12: CKCON0|=0b_0100_0000;
	orl	_CKCON0,#0x40
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\/Timer3Wait.c:14: TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	mov	_TMR3RL,#0xB8
	mov	(_TMR3RL >> 8),#0xFF
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\/Timer3Wait.c:15: TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	mov	_TMR3,_TMR3RL
	mov	(_TMR3 >> 8),(_TMR3RL >> 8)
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\/Timer3Wait.c:17: TMR3CN0 = 0x04;                 // Sart Timer3 and clear overflow flag
	mov	_TMR3CN0,#0x04
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\/Timer3Wait.c:18: for (i = 0; i < us; i++)       // Count <us> overflows
	mov	r3,#0x00
L002004?:
	clr	c
	mov	a,r3
	subb	a,r2
	jnc	L002007?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\/Timer3Wait.c:20: while (!(TMR3CN0 & 0x80));  // Wait for overflow
L002001?:
	mov	a,_TMR3CN0
	jnb	acc.7,L002001?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\/Timer3Wait.c:21: TMR3CN0 &= ~(0x80);         // Clear overflow indicator
	anl	_TMR3CN0,#0x7F
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\/Timer3Wait.c:18: for (i = 0; i < us; i++)       // Count <us> overflows
	inc	r3
	sjmp	L002004?
L002007?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\/Timer3Wait.c:23: TMR3CN0 = 0 ;                   // Stop Timer3 and clear overflow flag
	mov	_TMR3CN0,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'waitms'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r4 r5 
;k                         Allocated to registers r6 
;------------------------------------------------------------
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\/Timer3Wait.c:26: void waitms (unsigned int ms)
;	-----------------------------------------
;	 function waitms
;	-----------------------------------------
_waitms:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\/Timer3Wait.c:30: for(j=0; j<ms; j++)
	mov	r4,#0x00
	mov	r5,#0x00
L003005?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L003009?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\/Timer3Wait.c:31: for (k=0; k<4; k++) Timer3us(250);
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
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\/Timer3Wait.c:30: for(j=0; j<ms; j++)
	inc	r4
	cjne	r4,#0x00,L003005?
	inc	r5
	sjmp	L003005?
L003009?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:29: char _c51_external_startup (void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:32: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:33: WDTCN = 0xDE; //First key
	mov	_WDTCN,#0xDE
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:34: WDTCN = 0xAD; //Second key
	mov	_WDTCN,#0xAD
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:36: VDM0CN=0x80;       // enable VDD monitor
	mov	_VDM0CN,#0x80
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:37: RSTSRC=0x02|0x04;  // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:44: SFRPAGE = 0x10;
	mov	_SFRPAGE,#0x10
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:45: PFE0CN  = 0x20; // SYSCLK < 75 MHz.
	mov	_PFE0CN,#0x20
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:46: SFRPAGE = 0x00;
	mov	_SFRPAGE,#0x00
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:67: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:68: CLKSEL = 0x00;
	mov	_CLKSEL,#0x00
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:69: while ((CLKSEL & 0x80) == 0);
L004001?:
	mov	a,_CLKSEL
	jnb	acc.7,L004001?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:70: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:71: CLKSEL = 0x03;
	mov	_CLKSEL,#0x03
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:72: while ((CLKSEL & 0x80) == 0);
L004004?:
	mov	a,_CLKSEL
	jnb	acc.7,L004004?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:77: P0MDOUT |= 0x10; // Enable UART0 TX as push-pull output
	orl	_P0MDOUT,#0x10
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:78: XBR0     = 0x01; // Enable UART0 on P0.4(TX) and P0.5(RX)
	mov	_XBR0,#0x01
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:79: XBR1     = 0X00;
	mov	_XBR1,#0x00
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:80: XBR2     = 0x40; // Enable crossbar and weak pull-ups
	mov	_XBR2,#0x40
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:86: SCON0 = 0x10;
	mov	_SCON0,#0x10
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:87: TH1 = 0x100-((SYSCLK/BAUDRATE)/(2L*12L));
	mov	_TH1,#0xE6
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:88: TL1 = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:89: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	anl	_TMOD,#0x0F
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:90: TMOD |=  0x20;
	orl	_TMOD,#0x20
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:91: TR1 = 1; // START Timer1
	setb	_TR1
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:92: TI = 1;  // Indicate TX0 ready
	setb	_TI
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:95: TMR2CN0=0x00;   // Stop Timer2; Clear TF2;
	mov	_TMR2CN0,#0x00
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:96: CKCON0|=0b_0001_0000; // Timer 2 uses the system clock
	orl	_CKCON0,#0x10
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:97: TMR2RL=(0x10000L-(SYSCLK/10000L)); // Initialize reload value
	mov	_TMR2RL,#0xE0
	mov	(_TMR2RL >> 8),#0xE3
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:98: TMR2=0xffff;   // Set to reload immediately
	mov	_TMR2,#0xFF
	mov	(_TMR2 >> 8),#0xFF
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:99: ET2=1;         // Enable Timer2 interrupts
	setb	_ET2
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:100: TR2=1;         // Start Timer2 (TMR2CN is bit addressable)
	setb	_TR2
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:102: EA=1; // Enable interrupts
	setb	_EA
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:105: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer2_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:108: void Timer2_ISR (void) interrupt 5
;	-----------------------------------------
;	 function Timer2_ISR
;	-----------------------------------------
_Timer2_ISR:
	push	bits
	push	acc
	push	b
	push	dpl
	push	dph
	push	(0+2)
	push	(0+3)
	push	(0+4)
	push	(0+5)
	push	(0+6)
	push	(0+7)
	push	(0+0)
	push	(0+1)
	push	psw
	mov	psw,#0x00
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:110: TF2H = 0; // Clear Timer2 interrupt flag
	clr	_TF2H
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:112: pwm_count++;
	inc	_pwm_count
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:114: if(pwm_count>PWM_LIMIT) {
	mov	r2,_pwm_count
	mov	r3,#0x00
	clr	c
	mov	a,_PWM_LIMIT
	subb	a,r2
	mov	a,(_PWM_LIMIT + 1)
	subb	a,r3
	jc	L005021?
	ljmp	L005009?
L005021?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:115: pwm_count=0;
	mov	_pwm_count,#0x00
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:116: if(count_angle==1 && PWM_TURN>50) centiseconds++;
	mov	a,#0x01
	cjne	a,_count_angle,L005022?
	clr	a
	cjne	a,(_count_angle + 1),L005022?
	sjmp	L005023?
L005022?:
	sjmp	L005005?
L005023?:
	clr	c
	mov	a,#0x32
	subb	a,_PWM_TURN
	clr	a
	subb	a,(_PWM_TURN + 1)
	jnc	L005005?
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_centiseconds
	mov	dph,(_centiseconds + 1)
	mov	b,(_centiseconds + 2)
	mov	a,(_centiseconds + 3)
	lcall	___fsadd
	mov	_centiseconds,dpl
	mov	(_centiseconds + 1),dph
	mov	(_centiseconds + 2),b
	mov	(_centiseconds + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	sjmp	L005009?
L005005?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:117: else if(count_angle==1 && PWM_TURN<50) centiseconds--;
	mov	a,#0x01
	cjne	a,_count_angle,L005025?
	clr	a
	cjne	a,(_count_angle + 1),L005025?
	sjmp	L005026?
L005025?:
	sjmp	L005009?
L005026?:
	clr	c
	mov	a,_PWM_TURN
	subb	a,#0x32
	mov	a,(_PWM_TURN + 1)
	subb	a,#0x00
	jnc	L005009?
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_centiseconds
	mov	dph,(_centiseconds + 1)
	mov	b,(_centiseconds + 2)
	mov	a,(_centiseconds + 3)
	lcall	___fssub
	mov	_centiseconds,dpl
	mov	(_centiseconds + 1),dph
	mov	(_centiseconds + 2),b
	mov	(_centiseconds + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
L005009?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:119: if(PWM_OFF==0) {
	mov	a,_PWM_OFF
	orl	a,(_PWM_OFF + 1)
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:120: OUT0=pwm_count>PWM_TURN?1:0;
	jnz	L005011?
	mov	r2,_pwm_count
	mov	r3,a
	clr	c
	mov	a,_PWM_TURN
	subb	a,r2
	mov	a,(_PWM_TURN + 1)
	subb	a,r3
	mov	_P1_1,c
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:121: OUT1=pwm_count>PWM_TURN?0:1;
	mov	r2,_pwm_count
	mov	r3,#0x00
	clr	c
	mov	a,_PWM_TURN
	subb	a,r2
	mov	a,(_PWM_TURN + 1)
	subb	a,r3
	mov  _Timer2_ISR_sloc0_1_0,c
	cpl	c
	mov	_P1_2,c
	sjmp	L005013?
L005011?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:124: OUT0=0;
	clr	_P1_1
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:125: OUT1=0;
	clr	_P1_2
L005013?:
	pop	psw
	pop	(0+1)
	pop	(0+0)
	pop	(0+7)
	pop	(0+6)
	pop	(0+5)
	pop	(0+4)
	pop	(0+3)
	pop	(0+2)
	pop	dph
	pop	dpl
	pop	b
	pop	acc
	pop	bits
	reti
;------------------------------------------------------------
;Allocation info for local variables in function 'getAngle'
;------------------------------------------------------------
;centiRaw                  Allocated with name '_getAngle_PARM_2'
;turnVal                   Allocated with name '_getAngle_PARM_3'
;current_angle             Allocated with name '_getAngle_current_angle_1_54'
;angle_change              Allocated to registers r2 r3 r4 r5 
;mathVal                   Allocated to registers r2 r3 r4 r5 
;sloc0                     Allocated with name '_getAngle_sloc0_1_0'
;------------------------------------------------------------
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:130: unsigned int getAngle(unsigned int current_angle, double centiRaw, unsigned int turnVal) {
;	-----------------------------------------
;	 function getAngle
;	-----------------------------------------
_getAngle:
	mov	_getAngle_current_angle_1_54,dpl
	mov	(_getAngle_current_angle_1_54 + 1),dph
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:134: if(turnVal <50) turnVal = 100 - turnVal;	// absolute turnVal
	clr	c
	mov	a,_getAngle_PARM_3
	subb	a,#0x32
	mov	a,(_getAngle_PARM_3 + 1)
	subb	a,#0x00
	jnc	L006002?
	mov	a,#0x64
	clr	c
	subb	a,_getAngle_PARM_3
	mov	_getAngle_PARM_3,a
	clr	a
	subb	a,(_getAngle_PARM_3 + 1)
	mov	(_getAngle_PARM_3 + 1),a
L006002?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:135: if(centiRaw ==0) return current_angle;
	mov	a,_getAngle_PARM_2
	orl	a,(_getAngle_PARM_2 + 1)
	orl	a,(_getAngle_PARM_2 + 2)
	mov	b,(_getAngle_PARM_2 + 3)
	clr	b.7 ; Clear the sign bit
	orl	a,b
	jnz	L006010?
	mov	dpl,_getAngle_current_angle_1_54
	mov	dph,(_getAngle_current_angle_1_54 + 1)
	ret
L006010?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:137: centiRaw*=10; 							// convert to milliseconds
	push	_getAngle_PARM_2
	push	(_getAngle_PARM_2 + 1)
	push	(_getAngle_PARM_2 + 2)
	push	(_getAngle_PARM_2 + 3)
	mov	dptr,#0x0000
	mov	b,#0x20
	mov	a,#0x41
	lcall	___fsmul
	mov	_getAngle_PARM_2,dpl
	mov	(_getAngle_PARM_2 + 1),dph
	mov	(_getAngle_PARM_2 + 2),b
	mov	(_getAngle_PARM_2 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:138: printf("\nKnown Values: %i current, %f ms counted, %i turn power", current_angle, centiRaw, turnVal);
	push	_getAngle_PARM_3
	push	(_getAngle_PARM_3 + 1)
	push	_getAngle_PARM_2
	push	(_getAngle_PARM_2 + 1)
	push	(_getAngle_PARM_2 + 2)
	push	(_getAngle_PARM_2 + 3)
	push	_getAngle_current_angle_1_54
	push	(_getAngle_current_angle_1_54 + 1)
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf5
	mov	sp,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:139: mathVal = (0.00653846*turnVal*turnVal*turnVal*turnVal)-(2.24291375*turnVal*turnVal*turnVal)+(287.7103*turnVal*turnVal)-(16395.59*100)+352780;
	mov	dpl,_getAngle_PARM_3
	mov	dph,(_getAngle_PARM_3 + 1)
	lcall	___uint2fs
	mov	r4,dpl
	mov	r5,dph
	mov	r6,b
	mov	r7,a
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#0x4094
	mov	b,#0xD6
	mov	a,#0x3B
	lcall	___fsmul
	mov	r0,dpl
	mov	r1,dph
	mov	r2,b
	mov	r3,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,r0
	mov	dph,r1
	mov	b,r2
	mov	a,r3
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r0
	mov	a,r1
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r0
	mov	a,r1
	lcall	___fsmul
	mov	_getAngle_sloc0_1_0,dpl
	mov	(_getAngle_sloc0_1_0 + 1),dph
	mov	(_getAngle_sloc0_1_0 + 2),b
	mov	(_getAngle_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#0x8BE6
	mov	b,#0x0F
	mov	a,#0x40
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r0
	mov	a,r1
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r0
	mov	a,r1
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar0
	push	ar1
	mov	dpl,_getAngle_sloc0_1_0
	mov	dph,(_getAngle_sloc0_1_0 + 1)
	mov	b,(_getAngle_sloc0_1_0 + 2)
	mov	a,(_getAngle_sloc0_1_0 + 3)
	lcall	___fssub
	mov	_getAngle_sloc0_1_0,dpl
	mov	(_getAngle_sloc0_1_0 + 1),dph
	mov	(_getAngle_sloc0_1_0 + 2),b
	mov	(_getAngle_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	mov	dptr,#0xDAEB
	mov	b,#0x8F
	mov	a,#0x43
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r2
	mov	dph,r3
	mov	b,r0
	mov	a,r1
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dpl,_getAngle_sloc0_1_0
	mov	dph,(_getAngle_sloc0_1_0 + 1)
	mov	b,(_getAngle_sloc0_1_0 + 2)
	mov	a,(_getAngle_sloc0_1_0 + 3)
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0xD8
	push	acc
	mov	a,#0x13
	push	acc
	mov	a,#0x9D
	push	acc
	mov	a,#0xC9
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
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:140: printf("\nTime per 360: %f", mathVal);
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:141: centiRaw /= mathVal;					// find percentage of 360
	mov	dpl,_getAngle_PARM_2
	mov	dph,(_getAngle_PARM_2 + 1)
	mov	b,(_getAngle_PARM_2 + 2)
	mov	a,(_getAngle_PARM_2 + 3)
	lcall	___fsdiv
	mov	_getAngle_PARM_2,dpl
	mov	(_getAngle_PARM_2 + 1),dph
	mov	(_getAngle_PARM_2 + 2),b
	mov	(_getAngle_PARM_2 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:142: printf("\nMultiple of 360: %f", centiRaw);
	push	_getAngle_PARM_2
	push	(_getAngle_PARM_2 + 1)
	push	(_getAngle_PARM_2 + 2)
	push	(_getAngle_PARM_2 + 3)
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:144: mathVal = current_angle / 360.0;
	mov	dpl,_getAngle_current_angle_1_54
	mov	dph,(_getAngle_current_angle_1_54 + 1)
	lcall	___uint2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	clr	a
	push	acc
	push	acc
	mov	a,#0xB4
	push	acc
	mov	a,#0x43
	push	acc
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:145: centiRaw += mathVal;
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dpl,_getAngle_PARM_2
	mov	dph,(_getAngle_PARM_2 + 1)
	mov	b,(_getAngle_PARM_2 + 2)
	mov	a,(_getAngle_PARM_2 + 3)
	lcall	___fsadd
	mov	_getAngle_PARM_2,dpl
	mov	(_getAngle_PARM_2 + 1),dph
	mov	(_getAngle_PARM_2 + 2),b
	mov	(_getAngle_PARM_2 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:146: while(centiRaw < 0) centiRaw += 1;
L006003?:
	clr	a
	push	acc
	push	acc
	push	acc
	push	acc
	mov	dpl,_getAngle_PARM_2
	mov	dph,(_getAngle_PARM_2 + 1)
	mov	b,(_getAngle_PARM_2 + 2)
	mov	a,(_getAngle_PARM_2 + 3)
	lcall	___fslt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L006006?
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_getAngle_PARM_2
	mov	dph,(_getAngle_PARM_2 + 1)
	mov	b,(_getAngle_PARM_2 + 2)
	mov	a,(_getAngle_PARM_2 + 3)
	lcall	___fsadd
	mov	_getAngle_PARM_2,dpl
	mov	(_getAngle_PARM_2 + 1),dph
	mov	(_getAngle_PARM_2 + 2),b
	mov	(_getAngle_PARM_2 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:147: while(centiRaw > 1) centiRaw -= 1;
	sjmp	L006003?
L006006?:
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_getAngle_PARM_2
	mov	dph,(_getAngle_PARM_2 + 1)
	mov	b,(_getAngle_PARM_2 + 2)
	mov	a,(_getAngle_PARM_2 + 3)
	lcall	___fsgt
	mov	r2,dpl
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,r2
	jz	L006008?
	clr	a
	push	acc
	push	acc
	mov	a,#0x80
	push	acc
	mov	a,#0x3F
	push	acc
	mov	dpl,_getAngle_PARM_2
	mov	dph,(_getAngle_PARM_2 + 1)
	mov	b,(_getAngle_PARM_2 + 2)
	mov	a,(_getAngle_PARM_2 + 3)
	lcall	___fssub
	mov	_getAngle_PARM_2,dpl
	mov	(_getAngle_PARM_2 + 1),dph
	mov	(_getAngle_PARM_2 + 2),b
	mov	(_getAngle_PARM_2 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	sjmp	L006006?
L006008?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:148: angle_change = 360.0 * centiRaw;		// find total angle change
	push	_getAngle_PARM_2
	push	(_getAngle_PARM_2 + 1)
	push	(_getAngle_PARM_2 + 2)
	push	(_getAngle_PARM_2 + 3)
	mov	dptr,#0x0000
	mov	b,#0xB4
	mov	a,#0x43
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:149: printf("\nangle_change: %f", centiRaw);
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	_getAngle_PARM_2
	push	(_getAngle_PARM_2 + 1)
	push	(_getAngle_PARM_2 + 2)
	push	(_getAngle_PARM_2 + 3)
	mov	a,#__str_3
	push	acc
	mov	a,#(__str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:150: return angle_change;
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r5
	ljmp	___fs2uint
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;temp                      Allocated with name '_main_temp_1_58'
;direction                 Allocated with name '_main_direction_1_58'
;tempD                     Allocated to registers r2 r3 r4 r5 
;sloc0                     Allocated with name '_main_sloc0_1_0'
;sloc1                     Allocated with name '_main_sloc1_1_0'
;------------------------------------------------------------
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:155: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:157: int temp=0;
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:158: int direction=0;
	clr	a
	mov	_main_temp_1_58,a
	mov	(_main_temp_1_58 + 1),a
	mov	_main_direction_1_58,a
	mov	(_main_direction_1_58 + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:161: printf("\x1b[2J"); // Clear screen using ANescapeSI  sequence.
	mov	a,#__str_4
	push	acc
	mov	a,#(__str_4 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:162: printf("Welcome to the motor controller! Please pick from the several modes below:");
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
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:163: printf("\n(0) - Stop the Motor Controller");
	mov	a,#__str_6
	push	acc
	mov	a,#(__str_6 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:164: printf("\n(1) - Turn Counter-Clockwise at maximum speed");
	mov	a,#__str_7
	push	acc
	mov	a,#(__str_7 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:165: printf("\n(2) - Turn Clockwise at maximum speed");
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
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:166: printf("\n(3) - Turn at variable speed and time");
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
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:167: printf("\n(4) - Turn at variable speed and angle");
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
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:168: printf("\n(5) - DJ/Screenwiper mode");
	mov	a,#__str_11
	push	acc
	mov	a,#(__str_11 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:169: printf("\n(6) - Python Angle");
	mov	a,#__str_12
	push	acc
	mov	a,#(__str_12 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:170: printf("\n(9) - Reset, the Motor Controller");
	mov	a,#__str_13
	push	acc
	mov	a,#(__str_13 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:172: while(1)
L007048?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:174: printf("\n\nEnter mode: ");
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
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:175: scanf(" %i", &PWM_MODE);		// code stops here to wait for next command
	mov	a,#_PWM_MODE
	push	acc
	mov	a,#(_PWM_MODE >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	mov	a,#__str_15
	push	acc
	mov	a,#(__str_15 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_scanf
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:176: switch(PWM_MODE) {
	mov	r2,_PWM_MODE
	mov	r3,(_PWM_MODE + 1)
	clr	c
	mov	a,#0x09
	subb	a,r2
	clr	a
	subb	a,r3
	jc	L007048?
	mov	a,r2
	add	a,r2
	add	a,r2
	mov	dptr,#L007070?
	jmp	@a+dptr
L007070?:
	ljmp	L007001?
	ljmp	L007002?
	ljmp	L007003?
	ljmp	L007004?
	ljmp	L007011?
	ljmp	L007021?
	ljmp	L007038?
	ljmp	L007045?
	ljmp	L007045?
	ljmp	L007039?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:179: case 0:
L007001?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:181: count_angle=0;  	// stop counting centiseconds
	clr	a
	mov	_count_angle,a
	mov	(_count_angle + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:182: current_angle = getAngle(current_angle, centiseconds, PWM_TURN);	// compute current angle
	mov	_getAngle_PARM_2,_centiseconds
	mov	(_getAngle_PARM_2 + 1),(_centiseconds + 1)
	mov	(_getAngle_PARM_2 + 2),(_centiseconds + 2)
	mov	(_getAngle_PARM_2 + 3),(_centiseconds + 3)
	mov	_getAngle_PARM_3,_PWM_TURN
	mov	(_getAngle_PARM_3 + 1),(_PWM_TURN + 1)
	mov	dpl,_current_angle
	mov	dph,(_current_angle + 1)
	lcall	_getAngle
	mov	_current_angle,dpl
	mov	(_current_angle + 1),dph
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:183: printf("\nCurrent angle: %i", current_angle);
	push	_current_angle
	push	(_current_angle + 1)
	mov	a,#__str_16
	push	acc
	mov	a,#(__str_16 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:184: centiseconds=0;		// reset centiseconds
	mov	_centiseconds,#0x00
	mov	(_centiseconds + 1),#0x00
	mov	(_centiseconds + 2),#0x00
	mov	(_centiseconds + 3),#0x00
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:185: PWM_TURN=50;		// reset PWM_TURN
	mov	_PWM_TURN,#0x32
	clr	a
	mov	(_PWM_TURN + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:186: PWM_OFF=1;			// turn of motor
	mov	_PWM_OFF,#0x01
	clr	a
	mov	(_PWM_OFF + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:187: break;
	ljmp	L007048?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:190: case 1:
L007002?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:192: PWM_TURN=50;
	mov	_PWM_TURN,#0x32
	clr	a
	mov	(_PWM_TURN + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:193: PWM_OFF=0;
	clr	a
	mov	_PWM_OFF,a
	mov	(_PWM_OFF + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:194: waitms(500);
	mov	dptr,#0x01F4
	lcall	_waitms
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:196: count_angle=1;		// start counting centiseconds
	mov	_count_angle,#0x01
	clr	a
	mov	(_count_angle + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:197: PWM_TURN=0;			// full speed counterclockwise
	clr	a
	mov	_PWM_TURN,a
	mov	(_PWM_TURN + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:199: break;
	ljmp	L007048?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:202: case 2:
L007003?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:203: PWM_TURN=50;
	mov	_PWM_TURN,#0x32
	clr	a
	mov	(_PWM_TURN + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:204: PWM_OFF=0;
	clr	a
	mov	_PWM_OFF,a
	mov	(_PWM_OFF + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:205: waitms(500);
	mov	dptr,#0x01F4
	lcall	_waitms
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:207: count_angle=1;		// start counting angle
	mov	_count_angle,#0x01
	clr	a
	mov	(_count_angle + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:208: PWM_TURN=100;		// full speed clockwise
	mov	_PWM_TURN,#0x64
	clr	a
	mov	(_PWM_TURN + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:209: PWM_OFF=0;			// turn on motor
	clr	a
	mov	_PWM_OFF,a
	mov	(_PWM_OFF + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:210: break;
	ljmp	L007048?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:213: case 3:
L007004?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:215: printf("\nEnter 1 for clockwise, 0 for counterclockwise(default): ");
	mov	a,#__str_17
	push	acc
	mov	a,#(__str_17 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:216: scanf(" %i", &direction);
	mov	a,#_main_direction_1_58
	push	acc
	mov	a,#(_main_direction_1_58 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	mov	a,#__str_15
	push	acc
	mov	a,#(__str_15 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_scanf
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:218: printf("\nEnter turn speed (0 to 10): ");
	mov	a,#__str_18
	push	acc
	mov	a,#(__str_18 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:219: if(direction == 0) {
	mov	a,_main_direction_1_58
	orl	a,(_main_direction_1_58 + 1)
	jnz	L007006?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:220: scanf(" %i", &temp);
	mov	a,#_main_temp_1_58
	push	acc
	mov	a,#(_main_temp_1_58 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	mov	a,#__str_15
	push	acc
	mov	a,#(__str_15 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_scanf
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:221: temp = 50-5*temp;
	mov	__mulint_PARM_2,_main_temp_1_58
	mov	(__mulint_PARM_2 + 1),(_main_temp_1_58 + 1)
	mov	dptr,#0x0005
	lcall	__mulint
	mov	r2,dpl
	mov	r3,dph
	mov	a,#0x32
	clr	c
	subb	a,r2
	mov	_main_temp_1_58,a
	clr	a
	subb	a,r3
	mov	(_main_temp_1_58 + 1),a
	sjmp	L007007?
L007006?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:224: scanf(" %i", &temp);
	mov	a,#_main_temp_1_58
	push	acc
	mov	a,#(_main_temp_1_58 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	mov	a,#__str_15
	push	acc
	mov	a,#(__str_15 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_scanf
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:225: temp = 50 + 5*temp;
	mov	__mulint_PARM_2,_main_temp_1_58
	mov	(__mulint_PARM_2 + 1),(_main_temp_1_58 + 1)
	mov	dptr,#0x0005
	lcall	__mulint
	mov	a,dpl
	mov	b,dph
	add	a,#0x32
	mov	_main_temp_1_58,a
	clr	a
	addc	a,b
	mov	(_main_temp_1_58 + 1),a
L007007?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:227: printf("\nEnter time: ");
	mov	a,#__str_19
	push	acc
	mov	a,#(__str_19 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:228: scanf(" %i", &PWM_TIME);
	mov	a,#_PWM_TIME
	push	acc
	mov	a,#(_PWM_TIME >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	mov	a,#__str_15
	push	acc
	mov	a,#(__str_15 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_scanf
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:229: waitms(500);
	mov	dptr,#0x01F4
	lcall	_waitms
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:231: PWM_TURN=50;
	mov	_PWM_TURN,#0x32
	clr	a
	mov	(_PWM_TURN + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:232: PWM_OFF=0;
	clr	a
	mov	_PWM_OFF,a
	mov	(_PWM_OFF + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:233: waitms(500);
	mov	dptr,#0x01F4
	lcall	_waitms
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:235: count_angle=1;		// start counting centiseconds
	mov	_count_angle,#0x01
	clr	a
	mov	(_count_angle + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:236: PWM_TURN=temp;		// run motor
	mov	_PWM_TURN,_main_temp_1_58
	mov	(_PWM_TURN + 1),(_main_temp_1_58 + 1)
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:237: while(PWM_TIME > 1000) {
L007008?:
	clr	c
	mov	a,#0xE8
	subb	a,_PWM_TIME
	mov	a,#0x03
	subb	a,(_PWM_TIME + 1)
	jnc	L007010?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:238: waitms(1000);
	mov	dptr,#0x03E8
	lcall	_waitms
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:239: PWM_TIME -= 1000;
	mov	a,_PWM_TIME
	add	a,#0x18
	mov	_PWM_TIME,a
	mov	a,(_PWM_TIME + 1)
	addc	a,#0xfc
	mov	(_PWM_TIME + 1),a
	sjmp	L007008?
L007010?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:241: waitms(PWM_TIME);
	mov	dpl,_PWM_TIME
	mov	dph,(_PWM_TIME + 1)
	lcall	_waitms
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:242: PWM_OFF=1;			// turn off motor
	mov	_PWM_OFF,#0x01
	clr	a
	mov	(_PWM_OFF + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:243: count_angle=0;		// stop counting centiseconds
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:244: temp=0;
	clr	a
	mov	_count_angle,a
	mov	(_count_angle + 1),a
	mov	_main_temp_1_58,a
	mov	(_main_temp_1_58 + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:247: current_angle = getAngle(current_angle, centiseconds, PWM_TURN);
	mov	_getAngle_PARM_2,_centiseconds
	mov	(_getAngle_PARM_2 + 1),(_centiseconds + 1)
	mov	(_getAngle_PARM_2 + 2),(_centiseconds + 2)
	mov	(_getAngle_PARM_2 + 3),(_centiseconds + 3)
	mov	_getAngle_PARM_3,_PWM_TURN
	mov	(_getAngle_PARM_3 + 1),(_PWM_TURN + 1)
	mov	dpl,_current_angle
	mov	dph,(_current_angle + 1)
	lcall	_getAngle
	mov	_current_angle,dpl
	mov	(_current_angle + 1),dph
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:248: printf("\nCurrent angle: %i", current_angle);
	push	_current_angle
	push	(_current_angle + 1)
	mov	a,#__str_16
	push	acc
	mov	a,#(__str_16 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:249: centiseconds = 0;
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:250: PWM_MODE=0;			// reset to mode 0
	clr	a
	mov	_centiseconds,a
	mov	(_centiseconds + 1),a
	mov	(_centiseconds + 2),a
	mov	(_centiseconds + 3),a
	mov	_PWM_MODE,a
	mov	(_PWM_MODE + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:252: break;
	ljmp	L007048?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:254: case 4:
L007011?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:256: printf("\nEnter 1 for clockwise, 0 for counterclockwise(default): ");
	mov	a,#__str_17
	push	acc
	mov	a,#(__str_17 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:257: scanf(" %i", &direction);
	mov	a,#_main_direction_1_58
	push	acc
	mov	a,#(_main_direction_1_58 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	mov	a,#__str_15
	push	acc
	mov	a,#(__str_15 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_scanf
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:259: printf("\nEnter turn speed (0 to 10): ");
	mov	a,#__str_18
	push	acc
	mov	a,#(__str_18 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:260: if(direction == 0) {
	mov	a,_main_direction_1_58
	orl	a,(_main_direction_1_58 + 1)
	jnz	L007013?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:261: scanf(" %i", &temp);
	mov	a,#_main_temp_1_58
	push	acc
	mov	a,#(_main_temp_1_58 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	mov	a,#__str_15
	push	acc
	mov	a,#(__str_15 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_scanf
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:262: temp = 50 - 5*temp;
	mov	__mulint_PARM_2,_main_temp_1_58
	mov	(__mulint_PARM_2 + 1),(_main_temp_1_58 + 1)
	mov	dptr,#0x0005
	lcall	__mulint
	mov	r2,dpl
	mov	r3,dph
	mov	a,#0x32
	clr	c
	subb	a,r2
	mov	_main_temp_1_58,a
	clr	a
	subb	a,r3
	mov	(_main_temp_1_58 + 1),a
	sjmp	L007014?
L007013?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:265: scanf(" %i", &temp);
	mov	a,#_main_temp_1_58
	push	acc
	mov	a,#(_main_temp_1_58 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	mov	a,#__str_15
	push	acc
	mov	a,#(__str_15 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_scanf
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:266: temp = 50 + 5*temp;
	mov	__mulint_PARM_2,_main_temp_1_58
	mov	(__mulint_PARM_2 + 1),(_main_temp_1_58 + 1)
	mov	dptr,#0x0005
	lcall	__mulint
	mov	a,dpl
	mov	b,dph
	add	a,#0x32
	mov	_main_temp_1_58,a
	clr	a
	addc	a,b
	mov	(_main_temp_1_58 + 1),a
L007014?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:269: printf("\nEnter angle: ");
	mov	a,#__str_20
	push	acc
	mov	a,#(__str_20 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:270: scanf(" %i", &PWM_TIME);
	mov	a,#_PWM_TIME
	push	acc
	mov	a,#(_PWM_TIME >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	mov	a,#__str_15
	push	acc
	mov	a,#(__str_15 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_scanf
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:271: if(temp <50) {
	clr	c
	mov	a,_main_temp_1_58
	subb	a,#0x32
	mov	a,(_main_temp_1_58 + 1)
	xrl	a,#0x80
	subb	a,#0x80
	jc	L007074?
	ljmp	L007016?
L007074?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:272: temp = 100 - temp;
	mov	a,#0x64
	clr	c
	subb	a,_main_temp_1_58
	mov	_main_temp_1_58,a
	clr	a
	subb	a,(_main_temp_1_58 + 1)
	mov	(_main_temp_1_58 + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:273: tempD = (0.00653846*temp*temp*temp*temp)-(2.24291375*temp*temp*temp)+(287.7103*temp*temp)-(16395.59*100)+352780;
	mov	dpl,_main_temp_1_58
	mov	dph,(_main_temp_1_58 + 1)
	lcall	___sint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x4094
	mov	b,#0xD6
	mov	a,#0x3B
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fsmul
	mov	_main_sloc0_1_0,dpl
	mov	(_main_sloc0_1_0 + 1),dph
	mov	(_main_sloc0_1_0 + 2),b
	mov	(_main_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x8BE6
	mov	b,#0x0F
	mov	a,#0x40
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,_main_sloc0_1_0
	mov	dph,(_main_sloc0_1_0 + 1)
	mov	b,(_main_sloc0_1_0 + 2)
	mov	a,(_main_sloc0_1_0 + 3)
	lcall	___fssub
	mov	_main_sloc0_1_0,dpl
	mov	(_main_sloc0_1_0 + 1),dph
	mov	(_main_sloc0_1_0 + 2),b
	mov	(_main_sloc0_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0xDAEB
	mov	b,#0x8F
	mov	a,#0x43
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dpl,_main_sloc0_1_0
	mov	dph,(_main_sloc0_1_0 + 1)
	mov	b,(_main_sloc0_1_0 + 2)
	mov	a,(_main_sloc0_1_0 + 3)
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0xD8
	push	acc
	mov	a,#0x13
	push	acc
	mov	a,#0x9D
	push	acc
	mov	a,#0xC9
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
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:274: temp = 100 - temp;
	mov	a,#0x64
	clr	c
	subb	a,_main_temp_1_58
	mov	_main_temp_1_58,a
	clr	a
	subb	a,(_main_temp_1_58 + 1)
	mov	(_main_temp_1_58 + 1),a
	ljmp	L007017?
L007016?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:277: tempD = (0.00653846*temp*temp*temp*temp)-(2.24291375*temp*temp*temp)+(287.7103*temp*temp)-(16395.59*100)+352780;
	mov	dpl,_main_temp_1_58
	mov	dph,(_main_temp_1_58 + 1)
	lcall	___sint2fs
	mov	_main_sloc0_1_0,dpl
	mov	(_main_sloc0_1_0 + 1),dph
	mov	(_main_sloc0_1_0 + 2),b
	mov	(_main_sloc0_1_0 + 3),a
	push	_main_sloc0_1_0
	push	(_main_sloc0_1_0 + 1)
	push	(_main_sloc0_1_0 + 2)
	push	(_main_sloc0_1_0 + 3)
	mov	dptr,#0x4094
	mov	b,#0xD6
	mov	a,#0x3B
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_sloc0_1_0
	push	(_main_sloc0_1_0 + 1)
	push	(_main_sloc0_1_0 + 2)
	push	(_main_sloc0_1_0 + 3)
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_sloc0_1_0
	push	(_main_sloc0_1_0 + 1)
	push	(_main_sloc0_1_0 + 2)
	push	(_main_sloc0_1_0 + 3)
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_sloc0_1_0
	push	(_main_sloc0_1_0 + 1)
	push	(_main_sloc0_1_0 + 2)
	push	(_main_sloc0_1_0 + 3)
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fsmul
	mov	_main_sloc1_1_0,dpl
	mov	(_main_sloc1_1_0 + 1),dph
	mov	(_main_sloc1_1_0 + 2),b
	mov	(_main_sloc1_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_sloc0_1_0
	push	(_main_sloc0_1_0 + 1)
	push	(_main_sloc0_1_0 + 2)
	push	(_main_sloc0_1_0 + 3)
	mov	dptr,#0x8BE6
	mov	b,#0x0F
	mov	a,#0x40
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_sloc0_1_0
	push	(_main_sloc0_1_0 + 1)
	push	(_main_sloc0_1_0 + 2)
	push	(_main_sloc0_1_0 + 3)
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_sloc0_1_0
	push	(_main_sloc0_1_0 + 1)
	push	(_main_sloc0_1_0 + 2)
	push	(_main_sloc0_1_0 + 3)
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,_main_sloc1_1_0
	mov	dph,(_main_sloc1_1_0 + 1)
	mov	b,(_main_sloc1_1_0 + 2)
	mov	a,(_main_sloc1_1_0 + 3)
	lcall	___fssub
	mov	_main_sloc1_1_0,dpl
	mov	(_main_sloc1_1_0 + 1),dph
	mov	(_main_sloc1_1_0 + 2),b
	mov	(_main_sloc1_1_0 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_sloc0_1_0
	push	(_main_sloc0_1_0 + 1)
	push	(_main_sloc0_1_0 + 2)
	push	(_main_sloc0_1_0 + 3)
	mov	dptr,#0xDAEB
	mov	b,#0x8F
	mov	a,#0x43
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	_main_sloc0_1_0
	push	(_main_sloc0_1_0 + 1)
	push	(_main_sloc0_1_0 + 2)
	push	(_main_sloc0_1_0 + 3)
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dpl,_main_sloc1_1_0
	mov	dph,(_main_sloc1_1_0 + 1)
	mov	b,(_main_sloc1_1_0 + 2)
	mov	a,(_main_sloc1_1_0 + 3)
	lcall	___fsadd
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	a,#0xD8
	push	acc
	mov	a,#0x13
	push	acc
	mov	a,#0x9D
	push	acc
	mov	a,#0xC9
	push	acc
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fsadd
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
L007017?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:280: PWM_TIME *= tempD/360;
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
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	mov	dpl,_PWM_TIME
	mov	dph,(_PWM_TIME + 1)
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	___uint2fs
	lcall	___fsmul
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
	lcall	___fs2uint
	mov	_PWM_TIME,dpl
	mov	(_PWM_TIME + 1),dph
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:282: waitms(500);
	mov	dptr,#0x01F4
	lcall	_waitms
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:284: PWM_TURN=50;
	mov	_PWM_TURN,#0x32
	clr	a
	mov	(_PWM_TURN + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:285: PWM_OFF=0;
	clr	a
	mov	_PWM_OFF,a
	mov	(_PWM_OFF + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:286: waitms(500);
	mov	dptr,#0x01F4
	lcall	_waitms
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:288: count_angle=1;		// start counting centiseconds
	mov	_count_angle,#0x01
	clr	a
	mov	(_count_angle + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:289: PWM_TURN=temp;		// run motor
	mov	_PWM_TURN,_main_temp_1_58
	mov	(_PWM_TURN + 1),(_main_temp_1_58 + 1)
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:290: while(PWM_TIME > 1000) {
L007018?:
	clr	c
	mov	a,#0xE8
	subb	a,_PWM_TIME
	mov	a,#0x03
	subb	a,(_PWM_TIME + 1)
	jnc	L007020?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:291: waitms(1000);
	mov	dptr,#0x03E8
	lcall	_waitms
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:292: PWM_TIME -= 1000;
	mov	a,_PWM_TIME
	add	a,#0x18
	mov	_PWM_TIME,a
	mov	a,(_PWM_TIME + 1)
	addc	a,#0xfc
	mov	(_PWM_TIME + 1),a
	sjmp	L007018?
L007020?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:294: waitms(PWM_TIME);
	mov	dpl,_PWM_TIME
	mov	dph,(_PWM_TIME + 1)
	lcall	_waitms
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:295: PWM_OFF=1;			// turn off motor
	mov	_PWM_OFF,#0x01
	clr	a
	mov	(_PWM_OFF + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:296: count_angle=0;		// stop counting centiseconds
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:297: temp=0;
	clr	a
	mov	_count_angle,a
	mov	(_count_angle + 1),a
	mov	_main_temp_1_58,a
	mov	(_main_temp_1_58 + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:300: current_angle = getAngle(current_angle, centiseconds, PWM_TURN);
	mov	_getAngle_PARM_2,_centiseconds
	mov	(_getAngle_PARM_2 + 1),(_centiseconds + 1)
	mov	(_getAngle_PARM_2 + 2),(_centiseconds + 2)
	mov	(_getAngle_PARM_2 + 3),(_centiseconds + 3)
	mov	_getAngle_PARM_3,_PWM_TURN
	mov	(_getAngle_PARM_3 + 1),(_PWM_TURN + 1)
	mov	dpl,_current_angle
	mov	dph,(_current_angle + 1)
	lcall	_getAngle
	mov	_current_angle,dpl
	mov	(_current_angle + 1),dph
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:301: printf("\nCurrent angle: %i", current_angle);
	push	_current_angle
	push	(_current_angle + 1)
	mov	a,#__str_16
	push	acc
	mov	a,#(__str_16 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:302: centiseconds = 0;
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:303: PWM_MODE=0;			// reset to mode 0
	clr	a
	mov	_centiseconds,a
	mov	(_centiseconds + 1),a
	mov	(_centiseconds + 2),a
	mov	(_centiseconds + 3),a
	mov	_PWM_MODE,a
	mov	(_PWM_MODE + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:305: break;
	ljmp	L007048?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:308: case 5:
L007021?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:309: direction=0;
	clr	a
	mov	_main_direction_1_58,a
	mov	(_main_direction_1_58 + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:310: srand(1238912831);
	mov	dptr,#0x4F3F
	lcall	_srand
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:311: printf("\n\n\n\nWarning! There is no return from disco mode.");
	mov	a,#__str_21
	push	acc
	mov	a,#(__str_21 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:312: waitms(500);
	mov	dptr,#0x01F4
	lcall	_waitms
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:313: printf("\n{  To back out, enter speed -1");
	mov	a,#__str_22
	push	acc
	mov	a,#(__str_22 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:314: printf("\n|  Fun mode is also available by entering -2!");
	mov	a,#__str_23
	push	acc
	mov	a,#(__str_23 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:315: printf("\n|  \n|  Once dancing, always dancing! Have fun!");
	mov	a,#__str_24
	push	acc
	mov	a,#(__str_24 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:316: printf("\n Speed? (0 to 1000)\n");
	mov	a,#__str_25
	push	acc
	mov	a,#(__str_25 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:318: scanf(" %i", &temp);
	mov	a,#_main_temp_1_58
	push	acc
	mov	a,#(_main_temp_1_58 >> 8)
	push	acc
	mov	a,#0x40
	push	acc
	mov	a,#__str_15
	push	acc
	mov	a,#(__str_15 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_scanf
	mov	a,sp
	add	a,#0xfa
	mov	sp,a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:319: if(temp == -1) break;
	mov	a,#0xFF
	cjne	a,_main_temp_1_58,L007076?
	mov	a,#0xFF
	cjne	a,(_main_temp_1_58 + 1),L007076?
	ljmp	L007048?
L007076?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:320: else if(temp == -2) direction=1;
	mov	a,#0xFE
	cjne	a,_main_temp_1_58,L007027?
	mov	a,#0xFF
	cjne	a,(_main_temp_1_58 + 1),L007027?
	mov	_main_direction_1_58,#0x01
	clr	a
	mov	(_main_direction_1_58 + 1),a
	sjmp	L007036?
L007027?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:321: else if(temp >= 0 && temp <= 1000) PWM_TIME = 550-temp/2;
	mov	a,(_main_temp_1_58 + 1)
	jb	acc.7,L007023?
	clr	c
	mov	a,#0xE8
	subb	a,_main_temp_1_58
	mov	a,#(0x03 ^ 0x80)
	mov	b,(_main_temp_1_58 + 1)
	xrl	b,#0x80
	subb	a,b
	jc	L007023?
	mov	__divsint_PARM_2,#0x02
	clr	a
	mov	(__divsint_PARM_2 + 1),a
	mov	dpl,_main_temp_1_58
	mov	dph,(_main_temp_1_58 + 1)
	lcall	__divsint
	mov	r2,dpl
	mov	r3,dph
	mov	a,#0x26
	clr	c
	subb	a,r2
	mov	_PWM_TIME,a
	mov	a,#0x02
	subb	a,r3
	mov	(_PWM_TIME + 1),a
	sjmp	L007036?
L007023?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:322: else PWM_TIME = 500;
	mov	_PWM_TIME,#0xF4
	mov	(_PWM_TIME + 1),#0x01
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:324: while(1) {
L007036?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:325: if(direction==1) {
	mov	a,#0x01
	cjne	a,_main_direction_1_58,L007081?
	clr	a
	cjne	a,(_main_direction_1_58 + 1),L007081?
	sjmp	L007082?
L007081?:
	sjmp	L007033?
L007082?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:326: PWM_OFF=0;
	clr	a
	mov	_PWM_OFF,a
	mov	(_PWM_OFF + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:327: printf("  DISCO **");
	mov	a,#__str_26
	push	acc
	mov	a,#(__str_26 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:328: PWM_TURN=(rand()%2)*100;
	lcall	_rand
	mov	__modsint_PARM_2,#0x02
	clr	a
	mov	(__modsint_PARM_2 + 1),a
	lcall	__modsint
	mov	__mulint_PARM_2,dpl
	mov	(__mulint_PARM_2 + 1),dph
	mov	dptr,#0x0064
	lcall	__mulint
	mov	_PWM_TURN,dpl
	mov	(_PWM_TURN + 1),dph
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:329: PWM_TIME = rand()%100;
	lcall	_rand
	mov	__modsint_PARM_2,#0x64
	clr	a
	mov	(__modsint_PARM_2 + 1),a
	lcall	__modsint
	mov	_PWM_TIME,dpl
	mov	(_PWM_TIME + 1),dph
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:330: waitms(PWM_TIME);
	mov	dpl,_PWM_TIME
	mov	dph,(_PWM_TIME + 1)
	lcall	_waitms
	sjmp	L007036?
L007033?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:333: printf("  DISCO **");
	mov	a,#__str_26
	push	acc
	mov	a,#(__str_26 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:334: PWM_TURN=100;
	mov	_PWM_TURN,#0x64
	clr	a
	mov	(_PWM_TURN + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:335: PWM_OFF=0;
	clr	a
	mov	_PWM_OFF,a
	mov	(_PWM_OFF + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:336: waitms(PWM_TIME);
	mov	dpl,_PWM_TIME
	mov	dph,(_PWM_TIME + 1)
	lcall	_waitms
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:337: PWM_TURN=0;
	clr	a
	mov	_PWM_TURN,a
	mov	(_PWM_TURN + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:338: waitms(PWM_TIME);
	mov	dpl,_PWM_TIME
	mov	dph,(_PWM_TIME + 1)
	lcall	_waitms
	ljmp	L007036?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:343: case 6:
L007038?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:374: direction=0;
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:375: temp=0;
	clr	a
	mov	_main_direction_1_58,a
	mov	(_main_direction_1_58 + 1),a
	mov	_main_temp_1_58,a
	mov	(_main_temp_1_58 + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:376: break;
	ljmp	L007048?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:378: case 9:
L007039?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:379: count_angle=0;
	clr	a
	mov	_count_angle,a
	mov	(_count_angle + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:380: PWM_OFF=1;
	mov	_PWM_OFF,#0x01
	clr	a
	mov	(_PWM_OFF + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:381: printf("\nResetting . . .");
	mov	a,#__str_27
	push	acc
	mov	a,#(__str_27 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:382: waitms(1000);
	mov	dptr,#0x03E8
	lcall	_waitms
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:383: current_angle = getAngle(current_angle, centiseconds, PWM_TURN);
	mov	_getAngle_PARM_2,_centiseconds
	mov	(_getAngle_PARM_2 + 1),(_centiseconds + 1)
	mov	(_getAngle_PARM_2 + 2),(_centiseconds + 2)
	mov	(_getAngle_PARM_2 + 3),(_centiseconds + 3)
	mov	_getAngle_PARM_3,_PWM_TURN
	mov	(_getAngle_PARM_3 + 1),(_PWM_TURN + 1)
	mov	dpl,_current_angle
	mov	dph,(_current_angle + 1)
	lcall	_getAngle
	mov	_current_angle,dpl
	mov	(_current_angle + 1),dph
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:384: if(current_angle >= 180) {
	clr	c
	mov	a,_current_angle
	subb	a,#0xB4
	mov	a,(_current_angle + 1)
	subb	a,#0x00
	jc	L007041?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:385: PWM_TIME=(360 - current_angle) * 3.5;
	mov	a,#0x68
	clr	c
	subb	a,_current_angle
	mov	dpl,a
	mov	a,#0x01
	subb	a,(_current_angle + 1)
	mov	dph,a
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x60
	mov	a,#0x40
	lcall	___fsmul
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
	lcall	___fs2uint
	mov	_PWM_TIME,dpl
	mov	(_PWM_TIME + 1),dph
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:386: PWM_TURN=100;
	mov	_PWM_TURN,#0x64
	clr	a
	mov	(_PWM_TURN + 1),a
	sjmp	L007042?
L007041?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:389: PWM_TIME=current_angle * 3.5;
	mov	dpl,_current_angle
	mov	dph,(_current_angle + 1)
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x60
	mov	a,#0x40
	lcall	___fsmul
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
	lcall	___fs2uint
	mov	_PWM_TIME,dpl
	mov	(_PWM_TIME + 1),dph
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:390: PWM_TURN=0;
	clr	a
	mov	_PWM_TURN,a
	mov	(_PWM_TURN + 1),a
L007042?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:392: PWM_TURN=0;
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:393: PWM_OFF=0;
	clr	a
	mov	_PWM_TURN,a
	mov	(_PWM_TURN + 1),a
	mov	_PWM_OFF,a
	mov	(_PWM_OFF + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:394: if(PWM_TIME > 1000) {
	clr	c
	mov	a,#0xE8
	subb	a,_PWM_TIME
	mov	a,#0x03
	subb	a,(_PWM_TIME + 1)
	jnc	L007044?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:395: waitms(1000);
	mov	dptr,#0x03E8
	lcall	_waitms
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:396: PWM_TIME-=1000;
	mov	a,_PWM_TIME
	add	a,#0x18
	mov	_PWM_TIME,a
	mov	a,(_PWM_TIME + 1)
	addc	a,#0xfc
	mov	(_PWM_TIME + 1),a
L007044?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:398: waitms(PWM_TIME);
	mov	dpl,_PWM_TIME
	mov	dph,(_PWM_TIME + 1)
	lcall	_waitms
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:399: PWM_OFF=1;
	mov	_PWM_OFF,#0x01
	clr	a
	mov	(_PWM_OFF + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:400: PWM_TURN=50;
	mov	_PWM_TURN,#0x32
	clr	a
	mov	(_PWM_TURN + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:401: current_angle=0;
	clr	a
	mov	_current_angle,a
	mov	(_current_angle + 1),a
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:402: break;
	ljmp	L007048?
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:403: default:
L007045?:
;	C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c:405: }
	ljmp	L007048?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 0x0A
	db 'Known Values: %i current, %f ms counted, %i turn power'
	db 0x00
__str_1:
	db 0x0A
	db 'Time per 360: %f'
	db 0x00
__str_2:
	db 0x0A
	db 'Multiple of 360: %f'
	db 0x00
__str_3:
	db 0x0A
	db 'angle_change: %f'
	db 0x00
__str_4:
	db 0x1B
	db '[2J'
	db 0x00
__str_5:
	db 'Welcome to the motor controller! Please pick from the severa'
	db 'l modes below:'
	db 0x00
__str_6:
	db 0x0A
	db '(0) - Stop the Motor Controller'
	db 0x00
__str_7:
	db 0x0A
	db '(1) - Turn Counter-Clockwise at maximum speed'
	db 0x00
__str_8:
	db 0x0A
	db '(2) - Turn Clockwise at maximum speed'
	db 0x00
__str_9:
	db 0x0A
	db '(3) - Turn at variable speed and time'
	db 0x00
__str_10:
	db 0x0A
	db '(4) - Turn at variable speed and angle'
	db 0x00
__str_11:
	db 0x0A
	db '(5) - DJ/Screenwiper mode'
	db 0x00
__str_12:
	db 0x0A
	db '(6) - Python Angle'
	db 0x00
__str_13:
	db 0x0A
	db '(9) - Reset, the Motor Controller'
	db 0x00
__str_14:
	db 0x0A
	db 0x0A
	db 'Enter mode: '
	db 0x00
__str_15:
	db ' %i'
	db 0x00
__str_16:
	db 0x0A
	db 'Current angle: %i'
	db 0x00
__str_17:
	db 0x0A
	db 'Enter 1 for clockwise, 0 for counterclockwise(default): '
	db 0x00
__str_18:
	db 0x0A
	db 'Enter turn speed (0 to 10): '
	db 0x00
__str_19:
	db 0x0A
	db 'Enter time: '
	db 0x00
__str_20:
	db 0x0A
	db 'Enter angle: '
	db 0x00
__str_21:
	db 0x0A
	db 0x0A
	db 0x0A
	db 0x0A
	db 'Warning! There is no return from disco mode.'
	db 0x00
__str_22:
	db 0x0A
	db '{  To back out, enter speed -1'
	db 0x00
__str_23:
	db 0x0A
	db '|  Fun mode is also available by entering -2!'
	db 0x00
__str_24:
	db 0x0A
	db '|  '
	db 0x0A
	db '|  Once dancing, always dancing! Have fun!'
	db 0x00
__str_25:
	db 0x0A
	db ' Speed? (0 to 1000)'
	db 0x0A
	db 0x00
__str_26:
	db '  DISCO **'
	db 0x00
__str_27:
	db 0x0A
	db 'Resetting . . .'
	db 0x00

	CSEG

end
