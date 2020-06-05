//  square.c: Uses timer 2 interrupt to generate a square wave in pin
//  P2.0 and a 75% duty cycle wave in pin P2.1
//  Copyright (c) 2010-2018 Jesus Calvino-Fraga
//  ~C51~

#include <stdio.h>
#include <stdlib.h>
#include <EFM8LB1.h>
#include "Timer3Wait.c"

// ~C51~

#define SYSCLK 72000000L
#define BAUDRATE 115200L

#define OUT0 P1_1
#define OUT1 P1_2

volatile double centiseconds=0;
volatile unsigned int count_angle=0;
volatile unsigned char pwm_count=0;
volatile unsigned int PWM_TURN=50;
volatile unsigned int PWM_LIMIT=100;
volatile unsigned int PWM_MODE=0;
volatile unsigned int PWM_OFF=1;
volatile unsigned int PWM_TIME=0;
volatile unsigned int current_angle=0;

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

	// Configure Uart 0
	#if (((SYSCLK/BAUDRATE)/(2L*12L))>0xFFL)
		#error Timer 0 reload value is incorrect because (SYSCLK/BAUDRATE)/(2L*12L) > 0xFF
	#endif
	SCON0 = 0x10;
	TH1 = 0x100-((SYSCLK/BAUDRATE)/(2L*12L));
	TL1 = TH1;      // Init Timer1
	TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	TMOD |=  0x20;
	TR1 = 1; // START Timer1
	TI = 1;  // Indicate TX0 ready

	// Initialize timer 2 for periodic interrupts
	TMR2CN0=0x00;   // Stop Timer2; Clear TF2;
	CKCON0|=0b_0001_0000; // Timer 2 uses the system clock
	TMR2RL=(0x10000L-(SYSCLK/10000L)); // Initialize reload value
	TMR2=0xffff;   // Set to reload immediately
	ET2=1;         // Enable Timer2 interrupts
	TR2=1;         // Start Timer2 (TMR2CN is bit addressable)

	EA=1; // Enable interrupts


	return 0;
}

void Timer2_ISR (void) interrupt 5
{
	TF2H = 0; // Clear Timer2 interrupt flag

	pwm_count++;
	
	if(pwm_count>PWM_LIMIT) {
		pwm_count=0;
		if(count_angle==1 && PWM_TURN>50) centiseconds++;
		else if(count_angle==1 && PWM_TURN<50) centiseconds--;
	}
	if(PWM_OFF==0) {
		OUT0=pwm_count>PWM_TURN?1:0;
		OUT1=pwm_count>PWM_TURN?0:1;
	}
	else {
		OUT0=0;
		OUT1=0;
	}	
}

// get angle measurement from centisecond count
unsigned int getAngle(unsigned int current_angle, double centiRaw, unsigned int turnVal) {
	double angle_change;
	double mathVal;
	
	if(turnVal <50) turnVal = 100 - turnVal;	// absolute turnVal
	if(centiRaw ==0) return current_angle;
	else {
		centiRaw*=10; 							// convert to milliseconds
		printf("\nKnown Values: %i current, %f ms counted, %i turn power", current_angle, centiRaw, turnVal);
		mathVal = (0.00653846*turnVal*turnVal*turnVal*turnVal)-(2.24291375*turnVal*turnVal*turnVal)+(287.7103*turnVal*turnVal)-(16395.59*100)+352780;
		printf("\nTime per 360: %f", mathVal);
		centiRaw /= mathVal;					// find percentage of 360
		printf("\nMultiple of 360: %f", centiRaw);
		// add current value of angle
		mathVal = current_angle / 360.0;
		centiRaw += mathVal;
		while(centiRaw < 0) centiRaw += 1;
		while(centiRaw > 1) centiRaw -= 1;
		angle_change = 360.0 * centiRaw;		// find total angle change
		printf("\nangle_change: %f", centiRaw);
		return angle_change;
	}
}


void main (void)
{
	int temp=0;
	int direction=0;
	double tempD=0;
	
	printf("\x1b[2J"); // Clear screen using ANescapeSI  sequence.
	printf("Welcome to the motor controller! Please pick from the several modes below:");
	printf("\n(0) - Stop the Motor Controller");
	printf("\n(1) - Turn Counter-Clockwise at maximum speed");
	printf("\n(2) - Turn Clockwise at maximum speed");
	printf("\n(3) - Turn at variable speed and time");
	printf("\n(4) - Turn at variable speed and angle");
	printf("\n(5) - DJ/Screenwiper mode");
	printf("\n(6) - Python Angle");
	printf("\n(9) - Reset, the Motor Controller");
	
	while(1)
	{	
		printf("\n\nEnter mode: ");
		scanf(" %i", &PWM_MODE);		// code stops here to wait for next command
		switch(PWM_MODE) {
		
			// stop motor controller
			case 0:
				// reset centiseconds, fix angle position
				count_angle=0;  	// stop counting centiseconds
				current_angle = getAngle(current_angle, centiseconds, PWM_TURN);	// compute current angle
				printf("\nCurrent angle: %i", current_angle);
				centiseconds=0;		// reset centiseconds
				PWM_TURN=50;		// reset PWM_TURN
				PWM_OFF=1;			// turn of motor
				break;
				
			// max counterclockwise
			case 1:
				// Allow motor to run first
				PWM_TURN=50;
				PWM_OFF=0;
				waitms(500);
				
				count_angle=1;		// start counting centiseconds
				PWM_TURN=0;			// full speed counterclockwise
				// PWM_OFF=0;			// turn on motor
				break;
				
			// max clockwise
			case 2:
				PWM_TURN=50;
				PWM_OFF=0;
				waitms(500);
				
				count_angle=1;		// start counting angle
				PWM_TURN=100;		// full speed clockwise
				PWM_OFF=0;			// turn on motor
				break;
				
			// variable speed and time
			case 3:
				// Get values for motor speed, and time
				printf("\nEnter 1 for clockwise, 0 for counterclockwise(default): ");
				scanf(" %i", &direction);
				// printf("\nDirection=%i",direction);
				printf("\nEnter turn speed (0 to 10): ");
				if(direction == 0) {
					scanf(" %i", &temp);
					temp = 50-5*temp;
				}
				else {
					scanf(" %i", &temp);
					temp = 50 + 5*temp;
				}
				printf("\nEnter time: ");
				scanf(" %i", &PWM_TIME);
				waitms(500);
				// Allow motor to run first
				PWM_TURN=50;
				PWM_OFF=0;
				waitms(500);
				
				count_angle=1;		// start counting centiseconds
				PWM_TURN=temp;		// run motor
				while(PWM_TIME > 1000) {
					waitms(1000);
					PWM_TIME -= 1000;
				}
				waitms(PWM_TIME);
				PWM_OFF=1;			// turn off motor
				count_angle=0;		// stop counting centiseconds
				temp=0;
				
				// Calculate angle change
				current_angle = getAngle(current_angle, centiseconds, PWM_TURN);
				printf("\nCurrent angle: %i", current_angle);
				centiseconds = 0;
				PWM_MODE=0;			// reset to mode 0
				
				break;
				
			case 4:
				// Get values for motor speed, and angle
				printf("\nEnter 1 for clockwise, 0 for counterclockwise(default): ");
				scanf(" %i", &direction);
				// printf("\nDirection=%i",direction);
				printf("\nEnter turn speed (0 to 10): ");
				if(direction == 0) {
					scanf(" %i", &temp);
					temp = 50 - 5*temp;
				}
				else {
					scanf(" %i", &temp);
					temp = 50 + 5*temp;
				}
				// printf("\n\ntemp = %i", temp);
				printf("\nEnter angle: ");
				scanf(" %i", &PWM_TIME);
				if(temp <50) {
					temp = 100 - temp;
					tempD = (0.00653846*temp*temp*temp*temp)-(2.24291375*temp*temp*temp)+(287.7103*temp*temp)-(16395.59*100)+352780;
					temp = 100 - temp;
				}
				else {
					tempD = (0.00653846*temp*temp*temp*temp)-(2.24291375*temp*temp*temp)+(287.7103*temp*temp)-(16395.59*100)+352780;
				}
				// printf("\n\ntemp = %i, tempD = %f", temp, tempD);
				PWM_TIME *= tempD/360;
				// printf("\nPWM_TIME = %i", PWM_TIME);
				waitms(500);
				// Allow motor to run first
				PWM_TURN=50;
				PWM_OFF=0;
				waitms(500);
				
				count_angle=1;		// start counting centiseconds
				PWM_TURN=temp;		// run motor
				while(PWM_TIME > 1000) {
					waitms(1000);
					PWM_TIME -= 1000;
				}
				waitms(PWM_TIME);
				PWM_OFF=1;			// turn off motor
				count_angle=0;		// stop counting centiseconds
				temp=0;
				
				// Calculate angle change
				current_angle = getAngle(current_angle, centiseconds, PWM_TURN);
				printf("\nCurrent angle: %i", current_angle);
				centiseconds = 0;
				PWM_MODE=0;			// reset to mode 0
				
				break;
			
			// DJ MODE
			case 5:
				direction=0;
				srand(1238912831);
				printf("\n\n\n\nWarning! There is no return from disco mode.");
				waitms(500);
				printf("\n{  To back out, enter speed -1");
				printf("\n|  Fun mode is also available by entering -2!");
				printf("\n|  \n|  Once dancing, always dancing! Have fun!");
				printf("\n Speed? (0 to 1000)\n");
				
				scanf(" %i", &temp);
				if(temp == -1) break;
				else if(temp == -2) direction=1;
				else if(temp >= 0 && temp <= 1000) PWM_TIME = 550-temp/2;
				else PWM_TIME = 500;
				
				while(1) {
					if(direction==1) {
						PWM_OFF=0;
						printf("  DISCO **");
						PWM_TURN=(rand()%2)*100;
						PWM_TIME = rand()%100;
						waitms(PWM_TIME);
					}
					else {
						printf("  DISCO **");
						PWM_TURN=100;
						PWM_OFF=0;
						waitms(PWM_TIME);
						PWM_TURN=0;
						waitms(PWM_TIME);
					}
				}
				break;
				
			case 6:
				//while(1) {
				// 	scan new angle from python into temp (HAS TO PAUSE HERE)
				//	direction = temp;					// make backup
				//	tempD = 1256.25						// constant for 100
				// 	if(temp < current_angle) {
				//      temp = current_angle - temp;	//
				//		PWM_TIME = temp * tempD/360;	// calculate time to turn
				// 		temp=0;							// turn counterclockwise
				// 	}
				//	else {
				//		temp -= current_angle;			//
				//		PWM_TIME = temp * tempD/360;	// calculate time to turn
				//		temp=100;						// turn clockwise
				//	}
				//  	
				//	PWM_TURN=50;
				//	PWM_OFF=0;
				//	waitms(500);
				//
				//	// count_angle=1;		// start counting centiseconds (no need)
				//	PWM_TURN=temp;						// run motor
				//	while(PWM_TIME > 1000) {
				//		waitms(1000);
				//		PWM_TIME -= 1000;
				//	}
				//	waitms(PWM_TIME);
				//	PWM_OFF=1;							// turn off motor
				//	// count_angle=0;		// stop counting centiseconds (no need)
				//	current_angle = direction;
				//}
				direction=0;
				temp=0;
				break;
			
			case 9:
				count_angle=0;
				PWM_OFF=1;
				printf("\nResetting . . .");
				waitms(1000);
				current_angle = getAngle(current_angle, centiseconds, PWM_TURN);
				if(current_angle >= 180) {
					PWM_TIME=(360 - current_angle) * 3.5;
					PWM_TURN=100;
				}
				else {
					PWM_TIME=current_angle * 3.5;
					PWM_TURN=0;
				}
				PWM_TURN=0;
				PWM_OFF=0;
				if(PWM_TIME > 1000) {
					waitms(1000);
					PWM_TIME-=1000;
				}
				waitms(PWM_TIME);
				PWM_OFF=1;
				PWM_TURN=50;
				current_angle=0;
				break;
			default:
				break;
		}
	}
}
