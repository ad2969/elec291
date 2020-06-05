#include "stm32f05xxx.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "serial.h"

#define SYSCLK 8000000L
#define SYSCLKTIM3 48000000L
#define TICK_FREQ 1000L
#define CLOCKWISE 0
#define COUNTERCLOCKWISE 1
#define LEFT_TURNING_TIME 3 // in seconds
#define RIGHT_TURNING_TIME 3
#define DEF_F 100000L
#define ON 1
#define OFF 0
#define F_CPU 48000000L
#define PIN_PERIOD_18 (GPIOA_IDR&BIT8)
#define FREQ_TRESHOLD 72700

volatile unsigned char pwm_count=0;
volatile unsigned int time_count=0;
volatile unsigned int time_count_3=0;
volatile unsigned int left_wheel_speed;
volatile unsigned int right_wheel_speed;
volatile unsigned int left_wheel;
volatile unsigned int right_wheel;
volatile unsigned int left_wheel_dir;
volatile unsigned int right_wheel_dir;
volatile unsigned int interrupt_count;
volatile unsigned int ISR_cnt_top;
volatile unsigned int ISR_cnt_bottom;
volatile unsigned int servo_status;

// servo control variables
volatile int topServo;
volatile int bottomServo;
volatile unsigned int ISR_frc=0;
volatile unsigned int ISR_pw_top=0, ISR_pw_bottom=0;

/*************************** ROBOTO *********************************/
volatile unsigned robot_mode;
volatile int freq;
volatile float freq_1;

char HexDigit[]="0123456789ABCDEF";

void both_wheel_speed_change (int);
void left_wheel_speed_change (int);
void right_wheel_speed_change (int);
void go_straight(void);
void go_backwards(void);
void turnLeft(void);
void turnRight(void);
void turn_off(void);
void turn_on(void);
void pin25(int);
void pin26(int);
void pin21(int);
void pin22(int);
void waitms(int);
void turn_deg(int);
long int GetPeriod(int);
float pin18period(void);
void delay_ms (int);

// servo control
int egets(char *s, int Max);
void magnet(int);
void servoPulseTop(int);
void servoPulseBottom(int);
void pickup(void);
void initServoPos(void);

// coin detector (ADC)
void initADC(void);
int readADC(void);

void Timer3ISR(void){

		TIM3_SR &= ~BIT0; // clear update interrupt flag

		ISR_cnt_top++;
		ISR_cnt_bottom++;

		if(topServo == ON){
		if(ISR_cnt_top<ISR_pw_top)
		{
			GPIOA_ODR |= BIT4; // PA4=1 pin 10
		}
		else
		{
			GPIOA_ODR &= ~(BIT4); // PA4=1 10
		}
		if(ISR_cnt_top>=2000)
		{
			ISR_cnt_top=0; // 2000 * 10us=20ms
			ISR_frc++;

		}
	}

		if (bottomServo==ON){
			if(ISR_cnt_bottom<ISR_pw_bottom)
			{
				GPIOA_ODR |= BIT5; // PA5=1 pin 11
			}
			else
			{
				GPIOA_ODR &= ~(BIT5); // PA5=1 pin 11
			}
			if(ISR_cnt_bottom>=2000)
			{
				ISR_cnt_bottom=0; // 2000 * 10us=20ms
				ISR_frc++;
			}
		}

	}

void Timer1ISR(void) // interrupts every 1ms
{
	TIM1_SR &= ~BIT0; // clear update interrupt flag
  pwm_count+=10;
	time_count++;

	if(pwm_count>100) pwm_count = 0;

  if(left_wheel==ON)  // currently only left wheel code written
	{
  	if(left_wheel_dir == CLOCKWISE)
		{
    	if(pwm_count>left_wheel_speed) // OUT0 = pwmcount>left_wheel_speed? 0:1;
			{
  			pin25(0);
  		}
    		else
			{
    		pin25(1);
  		}
  		pin26(0);
		}
		if(left_wheel_dir == COUNTERCLOCKWISE)
		{
  		if(pwm_count>left_wheel_speed)
			{
  			pin26(0);
  		}
  		else
			{
  			pin26(1);
  		}
				pin25(0); 													//  OUT1 = 0;
		}
	}

	if(right_wheel==ON)
	{
		if(right_wheel_dir == COUNTERCLOCKWISE)
		{
	 		if(pwm_count>right_wheel_speed) // OUT0 = pwmcount>left_wheel_speed? 0:1;
			{
	 			pin21(0);
	 		}
	 		else
			{
    		pin21(1);
			}
	 		pin22(0);
		} 																		//  OUT1 = 0;

		if(right_wheel_dir == CLOCKWISE)
		{
  		if(pwm_count>right_wheel_speed)
			{
	   		pin22(0);
			}
	 		else
			{
	 			pin22(1);
	 		}
			pin21(0);                          //  OUT1 = 0;
		}
	}

	if(right_wheel==OFF)
	{
		pin22(0);
		pin21(0);
	}

	if(left_wheel==OFF)
	{
		pin25(0);
		pin26(0);
	}
}


void SysInit()
{
	// Set up output port bit for blinking LED
	RCC_AHBENR |= 0x00020000;  // peripheral clock enable for port A
	RCC_AHBENR |= 0x00040000; // peripheral clock enable for port B
	GPIOA_MODER |= BIT8; // Make pin PA4 output (pin 10)
	GPIOA_MODER |= BIT10; // Make pin PA5 output (pin 11)
	// Information here: http://hertaville.com/stm32f0-gpio-tutorial-part-1.html
	GPIOA_MODER &= ~(BIT16 | BIT17); // Make pin PA8 input
	GPIOA_MODER |= BIT22; // Make pin PA11 output (pin 21)
	GPIOA_MODER |= BIT24; // Make pin PA12 output (pin 22)
	GPIOA_MODER |= BIT30; // Make pin 25 output
	GPIOB_MODER |= BIT6; // Make pin 26 output
	GPIOB_MODER |= BIT8; // Make pin 27 output

	// Activate pull up for pin PA8:
	GPIOA_PUPDR |= BIT16;
	GPIOA_PUPDR &= ~(BIT17);

	// Set up timer 1 (first timer)
	RCC_APB2ENR |= BIT11; // turn on clock for timer1
	TIM1_ARR = SYSCLK/TICK_FREQ;
	ISER |= BIT13;        // enable timer interrupts in the NVIC
	TIM1_CR1 |= BIT4;     // Downcounting
  TIM1_CR1 |= BIT0;     // enable counting
	TIM1_DIER |= BIT0;    // enable update event (reload event) interrupt

	// Set up output port bit for blinking LED
	RCC_AHBENR |= 0x00020000;  // peripheral clock enable for port A
	// GPIOA_MODER |= 0x00000001; // Make pin PA0 output (pin 6)

	// Set up timer 3 (second timer)
	RCC_APB1ENR |= BIT1;  // TIM 3 timer clock enable
	TIM3_ARR = SYSCLKTIM3/DEF_F;
	ISER |= BIT16;        // enable timer interrupts in the NVIC
	TIM3_CR1 |= BIT4;     //downcounting
 	TIM3_CR1 |= BIT0; 		// enable timer 3
	TIM3_DIER |= BIT0; 		// enable interrupt
	enable_interrupts();

	initADC();

}

/********************************** WHEEL CONTROL *****************************/

void both_wheel_speed_change (int input_speed){ //changes both wheel speed
	left_wheel_speed = input_speed;
	right_wheel_speed = input_speed;
}

void left_wheel_speed_change (int input_speed){ // changes the left wheel speed
	left_wheel_speed = input_speed;
}

void right_wheel_speed_change (int input_speed){ // changes the right wheel speed
  right_wheel_speed = input_speed;
}

void right_wheel_on(void){
	right_wheel = ON;
}

void left_wheel_on(void){
	left_wheel = ON;
}

void turn_on(void){ // turns on the robot
  right_wheel = ON;
  left_wheel = ON;
}

void turn_off(void){ // turns off the robot
  right_wheel = OFF;
  left_wheel = OFF;
}

void go_straight(void){ // makes the robot go straight
	left_wheel_dir = COUNTERCLOCKWISE;
  right_wheel_dir = CLOCKWISE;
  right_wheel_on();
  left_wheel_on();
}

void go_backwards(void){ // turns the robot backwards
  left_wheel_dir = CLOCKWISE;
  right_wheel_dir = COUNTERCLOCKWISE;
  right_wheel_on();
  left_wheel_on();
}

void turnLeft(void){ //turns the robot left
	right_wheel_dir = CLOCKWISE;
  left_wheel_dir = CLOCKWISE;
  right_wheel_on();
  left_wheel_on();
}

void turnRight(void){// turns the robot right
	right_wheel_dir = COUNTERCLOCKWISE;
  left_wheel_dir = COUNTERCLOCKWISE;
 	right_wheel_on();
	left_wheel_on();
}

void pin25(int boolean){ // switches pin25 output
  if(boolean==1){
    	GPIOA_ODR |= BIT15; // PA11=1
  }

  if(boolean==0){
    GPIOA_ODR &= ~(BIT15); // PA11=0
  }
}

void pin26(int boolean){ // switches pin26 output
  if(boolean==1){
    GPIOB_ODR |= BIT3;
  }

  if(boolean==0){
    GPIOB_ODR &= ~(BIT3);
  }
}

void pin21(int boolean){
  if(boolean==1){
    	GPIOA_ODR |= BIT11; // PA11=1
  }

  if(boolean==0){
    GPIOA_ODR &= ~(BIT11); // PA11=0
  }
}

void pin22(int boolean){
  if(boolean==1){
    GPIOA_ODR |= BIT12; // PA12=1
  }

  if(boolean==0){
  	GPIOA_ODR &= ~(BIT12); // PA12=0
  }
}

void waitms(int ms){ //pauses main program but does not stop interrupts
	time_count = 0;
	while(time_count<= ms);
}

void turn_deg(int time){
	both_wheel_speed_change(50);
	turnRight();
	waitms(time);
  turn_off();
}

/********************************* SERVO CONTROL *******************************/

void delay_ms (int msecs)
{
	int ticks;
	ISR_frc=0;
	ticks=msecs/20;
	while(ISR_frc<ticks);
}

void magnet(int boolean){
	if(boolean==1){
	  GPIOB_ODR |= BIT4;		// pin 27
	}
	if(boolean==0){
	  GPIOB_ODR &= ~(BIT4);		// pin 27

	}
}

void servoPulseTop (int pw1){
 	ISR_pw_top = pw1;
}

void servoPulseBottom (int pw2){
	ISR_pw_bottom = pw2;
}

void pickup(void) {
	int i = 0;
	bottomServo = ON;
	servoPulseBottom(200);
	delay_ms(400);
	bottomServo = OFF;

	topServo = ON;
	servoPulseTop(225);
	delay_ms(400);
	topServo = OFF;

	magnet(ON);

	for(i=200; i>120; i-=2){
		bottomServo = ON;
		servoPulseBottom(i);
		delay_ms(20);
		bottomServo = OFF;
	}

	topServo = ON;
	servoPulseTop(100);
	delay_ms(400);
	topServo = OFF;

	bottomServo = ON;
	servoPulseBottom(100);
	delay_ms(400);
	bottomServo = OFF;

	topServo = ON;
	servoPulseTop(150);
	delay_ms(400);
	topServo = OFF;

	magnet(OFF);

	topServo = ON;
	servoPulseTop(60);
	delay_ms(400);
	topServo = OFF;

	bottomServo = ON;
	servoPulseBottom(60);
	delay_ms(400);
	bottomServo = OFF;
}

void initServoPos(void) {
	topServo = ON;
	servoPulseTop(60);
	delay_ms(800);
	topServo = OFF;

	bottomServo = ON;
	servoPulseBottom(60);
	delay_ms(800);
	bottomServo = OFF;
}

/******************************* COIN DETECTOR *********************************/

void PrintNumber(int N, int Base, int digits)
{
	int j;
	#define NBITS 32
	char buff[NBITS+1];
	buff[NBITS]=0;

	j=NBITS-1;
	while ( (N>0) | (digits>0) )
	{
		buff[j--]=HexDigit[N%Base];
		N/=Base;
		if(digits!=0) digits--;
	}
	eputs(&buff[j+1]);
}

// GetPeriod() seems to work fine for frequencies between 300Hz and 600kHz.
long int GetPeriod (int n)
{
	int i;
	unsigned int saved_TCNT1a, saved_TCNT1b;

	STK_RVR = 0xffffff;  // 24-bit counter set to check for signal present
	STK_CVR = 0xffffff; // load the SysTick counter
	STK_CSR = 0x05; // Bit 0: ENABLE, BIT 1: TICKINT, BIT 2:CLKSOURCE
	while (PIN_PERIOD_18!=0) // Wait for square wave to be 0
	{
		if(STK_CSR & BIT16) return 0;
	}
	STK_CSR = 0x00; // Disable Systick counter

	STK_RVR = 0xffffff;  // 24-bit counter set to check for signal present
	STK_CVR = 0xffffff; // load the SysTick counter
	STK_CSR = 0x05; // Bit 0: ENABLE, BIT 1: TICKINT, BIT 2:CLKSOURCE
	while (PIN_PERIOD_18==0) // Wait for square wave to be 1
	{
		if(STK_CSR & BIT16) return 0;
	}
	STK_CSR = 0x00; // Disable Systick counter

	STK_RVR = 0xffffff;  // 24-bit counter reset
	STK_CVR = 0xffffff; // load the SysTick counter to initial value
	STK_CSR = 0x05; // Bit 0: ENABLE, BIT 1: TICKINT, BIT 2:CLKSOURCE
	for(i=0; i<n; i++) // Measure the time of 'n' periods
	{
		while (PIN_PERIOD_18!=0) // Wait for square wave to be 0
		{
			if(STK_CSR & BIT16) return 0;
		}
		while (PIN_PERIOD_18==0) // Wait for square wave to be 1
		{
			if(STK_CSR & BIT16) return 0;
		}
	}
	STK_CSR = 0x00; // Disable Systick counter

	return 0xffffff-STK_CVR;
}

float pin18period(void){
	long int count;
	float T, f;

		count=GetPeriod(100);
		if(count>0)
		{
			T=count/(F_CPU*100.0);
			f=1/T;
		}
		else
		{
			eputs("NO SIGNAL                     \r");
			f= 0;
		}
		waitms(10);
		return f;
}

/************************** PERIMETER DETECT *********************************/

// elec291 is bae <3
void initADC(void)
{
	RCC_AHBENR |= BIT18;        // Turn on GPIOB
	RCC_APB2ENR |= BIT9;        // Turn on ADC
	GPIOB_MODER |= (BIT2+BIT3); // Select analog mode for PB1 (pin 15 of LQFP32 package)
	GPIOB_MODER |= (BIT0+BIT1); // Select analog mode for PB0 (pin 14 of LQFP32 package)
	ADC_CR |= BIT31;            // Begin ADCCalibration
	while ((ADC_CR & BIT31));   // Wait for calibration complete
	ADC_SMPR=7;                 // Long sampling time for more stable measurements
	//ADC_CHSELR |= BIT17;      // Select Channel 17, internal reference
	ADC_CHSELR |= BIT9;         // Select Channel 9
	ADC_CCR |= BIT22;	        // Enable the reference voltage
	ADC_CR |= BIT0;             // Enable the ADC
}

int readADC(void)
{
	ADC_CR |=  BIT2;            // Trigger a conversion
	while ( (ADC_CR & BIT2) );  // Wait for End of Conversion
	return ADC_DR;              // ADC_DR has the 12 bits out of the ADC
}

/*********************************** MAIN *************************************/

// pin18period gets period for coin detector (every 2 seconds)
// pickup activates servo to pickup one coin
int main(void)
{
	SysInit();

	waitms(5000);
	robot_mode = 0;

	topServo = ON;
	servoPulseTop(60);
	delay_ms(800);
	topServo = OFF;

	bottomServo = ON;
	servoPulseBottom(60);
	delay_ms(800);
	bottomServo = OFF;

  both_wheel_speed_change(50);




	while(1)
	{

/*	both_wheel_speed_change(50);
		turn_on();
		left_wheel_dir = CLOCKWISE;
		right_wheel_dir = COUNTERCLOCKWISE;

 		ROBOT MODES
			Mode 0: Wait mode
				-> Do nothing and wait for start signal from bluetooth module

			Mode 1: Look for coins
				-> Move forwards until coin/perimeter detect
				-> If coin detect, move back and pickup coin (MODE 2), and continue
				-> If perimeter detect, turn around
				** coin detect: ~73500

			Mode 2: Pickup coin
				-> Move back (beeping noise?)
				-> Pickup coin
				-> Back to mode 1

			Mode 3: Turn around
				-> Turn left/right, keep detecting perimeter in case?
				-> Left/right clicking LED
				-> Back to mode 1
				** keep detecting for coin as well?

			Mode 4: Dance mode?

		switch(robot_mode)
		{
			case 0:	// wait mode
				break;

			case 1:
				both_wheel_speed_change(50);
				go_straight();

				// check coins and perimeter
				for(int i=0; i < 30; i++) {
					freq_1 += pin18period();
				}
				freq_1 /= 30;
				freq = (int) freq_1;

				if(freq > FREQ_TRESHOLD) {
					robot_mode = 2;
					break;
				}
				else if() {

				}
				break;

			case 2:

				break;

			case 3:
				break;

			case 4:
				break;

			case 5:
				break;
		}
*/

		// freq = pin18period();
		// freq_1 = pin18period();

		for(int i=0; i < 30; i++) {
			freq_1 += pin18period();
		}
		freq_1 /= 30;
		freq = (int) freq_1;
/*
		eputs("freq= ");
		PrintNumber(freq,10,7);
		eputs("\n\r");
*/
		eputs("freq= ");
		PrintNumber(freq,10,7);
		eputs("\n\r\n");

/*
		if((freq>71000)&&(freq_1>71000)){
			turn_off();
			pickup();
		}
*/
		if(freq > 72700) {
			turn_off();
			pickup();
		}
		//waitms(10000);

		turn_on();
		go_straight();

	}
	return 0;
}
