// ADC.c:  Shows how to use the 14-bit ADC.  This program
// measures the voltage from some pins of the EFM8LB1 using the ADC.
//
// (c) 2008-2018, Jesus Calvino-Fraga
//
// Edited by Clarence Adrian, JoJo Windsor-Lewis

#include <stdio.h>
#include <stdlib.h>
#include <EFM8LB1.h>
#include <math.h>
#include "LCD_ops.c"

// ~C51~

#define SYSCLK 72000000L
#define BAUDRATE 115200L
#define TIMER_0_FREQ 2000L // For a 0.5ms tick

volatile unsigned int TR0_counter1 = 0;
volatile unsigned int counter1EN = 0;
volatile unsigned int TR0_counter2 = 0;
volatile unsigned int counter2EN = 0;
volatile unsigned int TR0_counter3 = 0;
volatile unsigned int counter3EN = 0;

volatile unsigned int signal_state = 0;
volatile unsigned int fsm_state = 0;

char _c51_external_startup (void)
{
	// Disable Watchdog with key sequence
	SFRPAGE = 0x00;
	WDTCN = 0xDE; //First key
	WDTCN = 0xAD; //Second key

	VDM0CN=0x80;       // enable VDD monitor
	RSTSRC=0x02|0x04;  // Enable reset on missing clock detector and VDD

	#if (SYSCLK == 48000000L)
		SFRPAGE = 0x10;
		PFE0CN  = 0x10; // SYSCLK < 50 MHz.
		SFRPAGE = 0x00;
	#elif (SYSCLK == 72000000L)
		SFRPAGE = 0x10;
		PFE0CN  = 0x20; // SYSCLK < 75 MHz.
		SFRPAGE = 0x00;
	#endif

	#if (SYSCLK == 12250000L)
		CLKSEL = 0x10;
		CLKSEL = 0x10;
		while ((CLKSEL & 0x80) == 0);
	#elif (SYSCLK == 24500000L)
		CLKSEL = 0x00;
		CLKSEL = 0x00;
		while ((CLKSEL & 0x80) == 0);
	#elif (SYSCLK == 48000000L)
		// Before setting clock to 48 MHz, must transition to 24.5 MHz first
		CLKSEL = 0x00;
		CLKSEL = 0x00;
		while ((CLKSEL & 0x80) == 0);
		CLKSEL = 0x07;
		CLKSEL = 0x07;
		while ((CLKSEL & 0x80) == 0);
	#elif (SYSCLK == 72000000L)
		// Before setting clock to 72 MHz, must transition to 24.5 MHz first
		CLKSEL = 0x00;
		CLKSEL = 0x00;
		while ((CLKSEL & 0x80) == 0);
		CLKSEL = 0x03;
		CLKSEL = 0x03;
		while ((CLKSEL & 0x80) == 0);
	#else
		#error SYSCLK must be either 12250000L, 24500000L, 48000000L, or 72000000L
	#endif

	P0MDOUT |= 0x10; // Enable UART0 TX as push-pull output
	XBR0     = 0x01; // Enable UART0 on P0.4(TX) and P0.5(RX)
	XBR1     = 0X00;
	XBR2     = 0x40; // Enable crossbar and weak pull-ups

	/*********************************************************************/
	// Initialize timer 0 for periodic interrupts
	TR0=0;
	TF0=0;
	CKCON0|=0b_0000_0100; // Timer 0 uses the system clock
	TMOD&=0xf0;
	TMOD|=0x01; // Timer 0 in mode 1: 16-bit timer

	#if (SYSCLK/(TIMER_0_FREQ)>0xFFFFL)
		#error Timer 0 reload value is incorrect because SYSCLK/(TIMER_0_FREQ) > 0xFFFFL
	#endif
	TMR0=0x10000L-(SYSCLK/(TIMER_0_FREQ)); // Initialize reload value
	ET0=1; // Enable Timer0 interrupts
	TR0=1; // Start Timer0
	EA=1;  // Enable global interrupts

	/*********************************************************************/

	// Configure Uart 0
	#if (((SYSCLK/BAUDRATE)/(2L*12L))>0xFFL)
		#error Timer 1 reload value is incorrect because (SYSCLK/BAUDRATE)/(2L*12L) > 0xFF
	#endif
	SCON0 = 0x10;
	TH1 = 0x100-((SYSCLK/BAUDRATE)/(2L*12L));
	TL1 = TH1;      // Init Timer1
	TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	TMOD |=  0x20;
	TR1 = 1; // START Timer1
	TI = 1;  // Indicate TX0 ready

	return 0;
}

void InitTimer0 (void) {
	TR0_counter1 = 0;
  counter1EN = 0;
	TR0_counter2 = 0;
	counter2EN = 0;


	ET0=1;         // Enable Timer2 interrupts
	TR0=1;         // Start Timer2 (TMR2CN is bit addressable)
}

void Timer0_ISR (void) interrupt INTERRUPT_TIMER0
{
	SFRPAGE=0x0;
	TMR0=0x10000L-(SYSCLK/(TIMER_0_FREQ));

	if(counter1EN == 1) {
		TR0_counter1++;
	}
	if(counter2EN == 1) {
		TR0_counter2++;
	}
	if(counter3EN == 1) {
		TR0_counter3++;
	}
}

void InitADC (void)
{
	SFRPAGE = 0x00;
	ADC0CN1 = 0b_10_000_000; //14-bit,  Right justified no shifting applied, perform and Accumulate 1 conversion.
	ADC0CF0 = 0b_11111_0_00; // SYSCLK/32
	ADC0CF1 = 0b_0_0_011110; // Same as default for now
	ADC0CN0 = 0b_0_0_0_0_0_00_0; // Same as default for now
	ADC0CF2 = 0b_0_01_11111 ; // GND pin, Vref=VDD
	ADC0CN2 = 0b_0_000_0000;  // Same as default for now. ADC0 conversion initiated on write of 1 to ADBUSY.
	ADEN=1; // Enable ADC
}

/* // Replaced in "LCD_ops.c" which contains all LCD operation functions
// Uses Timer3 to delay <us> micro-seconds.
void Timer3us(unsigned char us)
{
	unsigned char i;               // usec counter

	// The input for Timer 3 is selected as SYSCLK by setting T3ML (bit 6) of CKCON0:
	CKCON0|=0b_0100_0000;

	TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow

	TMR3CN0 = 0x04;                 // Sart Timer3 and clear overflow flag
	for (i = 0; i < us; i++)       // Count <us> overflows
	{
		while (!(TMR3CN0 & 0x80));  // Wait for overflow
		TMR3CN0 &= ~(0x80);         // Clear overflow indicator
	}
	TMR3CN0 = 0 ;                   // Stop Timer3 and clear overflow flag
}

void waitms (unsigned int ms)
{
	unsigned int j;
	unsigned char k;
	for(j=0; j<ms; j++)
		for (k=0; k<4; k++) Timer3us(250);
}
*/

#define VDD 3.3035 // The measured value of VDD in volts

void InitPinADC (unsigned char portno, unsigned char pinno)
{
	unsigned char mask;

	mask=1<<pinno;

	SFRPAGE = 0x20;
	switch (portno)
	{
		case 0:
			P0MDIN &= (~mask); // Set pin as analog input
			P0SKIP |= mask; // Skip Crossbar decoding for this pin
		break;
		case 1:
			P1MDIN &= (~mask); // Set pin as analog input
			P1SKIP |= mask; // Skip Crossbar decoding for this pin
		break;
		case 2:
			P2MDIN &= (~mask); // Set pin as analog input
			P2SKIP |= mask; // Skip Crossbar decoding for this pin
		break;
		default:
		break;
	}
	SFRPAGE = 0x00;
}

unsigned int ADC_at_Pin(unsigned char pin)
{
	ADC0MX = pin;   // Select input from pin
	ADBUSY=1;       // Dummy conversion first to select new pin
	while (ADBUSY); // Wait for dummy conversion to finish
	ADBUSY = 1;     // Convert voltage at the pin
	while (ADBUSY); // Wait for conversion to complete
	return (ADC0);
}

float Volts_at_Pin(unsigned char pin)
{
	 return ((ADC_at_Pin(pin)*VDD)/0b_0011_1111_1111_1111);
}

/*******************************************************************************/
float calc_phase(unsigned int interval, float period) {
	float pd;
	interval = interval - (int)(period/2);
	pd = interval * (360.0 / period);
	while(pd > 180 || pd < -180) {
		if(pd < -180) {
			pd += 360;
		}
		else if(pd > 180) {
			pd = 360 - pd;
		}
	}

	return pd;
}
/*******************************************************************************/

void main (void)
{
	float v[2] = {0};
	float p[2] = {0};
	unsigned int interval = 0;
	float phase_diff = 0;
	float frequency = 0;

	char buff[17];
	unsigned short int datanum = 0;
	unsigned short int lol = 100;

    waitms(500); // Give PuTTy a chance to start before sending
	printf("\x1b[2J"); // Clear screen using ANSI escape sequence.

	LCD_4BIT();
	InitTimer0();

	printf ("ADC test program\n"
	        "File: %s\n"
	        "Compiled: %s, %s\n\n",
	        __FILE__, __DATE__, __TIME__);

	/*****************************************************************************/

	InitPinADC(1, 1); // Configure P2.2 as analog input
	InitPinADC(1, 2); // Configure P2.3 as analog input
    InitADC();

	while(1)
	{
	    // Read 14-bit value from the pins configured as analog inputs
		v[0] = Volts_at_Pin(QFP32_MUX_P1_1);
		v[1] = Volts_at_Pin(QFP32_MUX_P1_2);

		  // Check counters and take period value
		if(v[0] > 0 && counter1EN == 0) counter1EN = 1;
		else if(v[0] <= 0 && counter1EN == 1) {
			p[0] = (float)TR0_counter1;
			counter1EN = 0;
		}
		else if(v[0] <= 0 && counter1EN == 0) {
			TR0_counter1 = 0;
		}

		if(v[1] > 0 && counter2EN == 0) counter2EN = 1;
		else if(v[1] <= 0 && counter2EN == 1) {
			p[1] = (float)TR0_counter2;
			counter2EN = 0;
		}
		else if(v[1] <= 0 && counter2EN == 0) {
			TR0_counter2 = 0;
		}

			// Detect sources and allow some value-taking before displaying
		if(datanum == lol) {
			  // both signals off (period = 0)
			if(p[0] == 0 && p[1] == 0) {
				printf("\rSignals NOT available! (wait 2 seconds)                       ");
				LCDprint("Error:", 1, 1, 1);
				LCDprint("Check console!", 2, 1, 1);
				waitms(2000);
				signal_state = 0;
			}
			  // either signals off (period = 0)
			else if(p[0] == 0 || p[1] == 0) {
				if(p[0] == 0) printf("\rNo signal at test source (wait 2 seconds)                             ");
				else printf("\rNo signal at reference source (wait 2 seconds)                         ");
				LCDprint("Error:", 1, 1, 1);
				LCDprint("Check console!", 2, 1, 1);
				waitms(2000);
				signal_state = 0;
			}
			  // periods hugely vary
			else if(p[1] > p[0] + 100000 || p[1] < p[0] - 100000) {
				printf("\rSignals have varying frequencies! (wait 2 seconds)                    ");
				LCDprint("Error:", 1, 1, 1);
				LCDprint("Check console!", 2, 1, 1);
				waitms(2000);
				signal_state = 0;
			}
			else {
					// calculate the time difference between zeros
				switch(fsm_state) {
			  // check so that both states will be zero
					case 0:
						if(v[0] <= 0 && v[1] <= 0) fsm_state = 1;
					break;
				// stage1: both zeros -> one rise
					case 1:
						if(v[0] > 0 || v[1] > 0) {
							fsm_state = 2;
							counter3EN = 1;
						}
					break;
				// stage2: one rise -> both rise
					case 2:
						if(v[0] > 1  &&  v[1] > 1) {
							fsm_state = 3;
						}
					break;
				// stage3: both rise (compute)
					case 3:
						if(v[0] <= 0 &&  v[1] <= 0) {
							counter3EN = 0;
							interval = TR0_counter3 / 2;
							fsm_state = 4;
						}
					break;
					case 4:
						TR0_counter3 = 0;
						phase_diff = calc_phase(interval, p[0]);
						fsm_state = 0;
					break;
				}
				frequency = 1000 / p[0];

				// Test Prints
				// printf ("\rCounter1=%4i, \nCoutner2=%4i     ", TR0_counter1, TR0_counter2);
				// printf ("\rCounter1=%5i, Period1=%7.5f,V@P1.1=%7.5f     ", TR0_counter1, p[0], v[0]);
				// printf ("\rV1=%7.5fV, V@P2=%7.5fV, Period1=%.5fms, Period2=%.5fms", v[0], v[1], p[0], p[1]);
				// printf("\rf=%4.2fHz, V1=3.2f (rms), V2=3.2f (rms), phase_diff=%4.2f", frequency, phase_diff);
				// printf("\rf=%4.2fHz, V1=%7.4f, V2=%7.4f, phase_diff=%4.2f deg                      ", frequency, v[0], v[1], phase_diff);

				printf("\rp=%7.0fms, f=%4.2fHz, V1=%7.5f, V2=%7.5f, counter=%i, interval=%i              ", p[0], frequency, v[0], v[1], TR0_counter3, interval);
				LCDprint("Phase diff (deg):", 1, 1, 1);
				sprintf(buff, "%f", phase_diff);
				LCDprint(buff, 2, 1, 1);
				signal_state = 1;

			}
			datanum = 0;
		}
		else {
			if(signal_state == 0) {
				printf("\rGathering data...                                                     ");
				lol = 2;
			}
			else lol = 2;
			datanum++;
		}
		/*
		LCDprint("Phase difference (deg):", 1, 1, 1);
		sprintf(freqstring, "%f", v[0]);
		getsn(freqstring, buff, sizeof(buff));
		LCDprint(buff, 1, 7, 0);
		sprintf(freqstring, "%f", v[1]);
		getsn(freqstring, buff, sizeof(buff));
		LCDprint(buff, 2, 7, 0);
		*/
		waitms(1);

		/***************************************************************************/
	 }
}
