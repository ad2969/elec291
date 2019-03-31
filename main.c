#include "stm32f05xxx.h"
#include <stdio.h>
#include <stdlib.h>

#define ON 1
#define OFF 0
#define SYSCLK 48000000L
#define DEF_F 100000L // To achieve a tick of 10 us


volatile int ISR_pw_top=100, ISR_pw_bottom=100,ISR_cnt_top=0, ISR_cnt_bottom=0,ISR_frc=0;

int egets(char *s, int Max);

volatile int topServo;
volatile int bottomServo;

void magnet(int);
void servoPulseTop(int);
void servoPulseBottom(int);

// The following ISR happens at a rate of 100kHz.  It is used
// to generate the standard hobby servo 50Hz signal with a pulse
// width of 0.6ms to 2.4ms.
void Timer1ISR(void)
{
	TIM1_SR &= ~BIT0; // clear update interrupt flag

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




void SysInit(void)
{
	// Set up output port bit for blinking LED
	RCC_AHBENR |= 0x00020000;  // peripheral clock enable for port A
	RCC_AHBENR |= 0x00040000; // peripheral clock enable for port B
	GPIOA_MODER |= BIT8; // Make pin PA4 output (pin 10)
	GPIOA_MODER |= BIT10; // Make pin PA5 output (pin 11)

	GPIOB_MODER |= BIT8; // pin 27 output (magnet)

	// Set up timer
	RCC_APB2ENR |= BIT11; // turn on clock for timer1
	TIM1_ARR = SYSCLK/DEF_F;
	ISER |= BIT13;        // enable timer interrupts in the NVIC
	TIM1_CR1 |= BIT4;     // Downcounting
	TIM1_CR1 |= BIT0;     // enable counting
	TIM1_DIER |= BIT0;    // enable update event (reload event) interrupt
	enable_interrupts();

}

void delay_ms (int msecs)
{
	int ticks;
	ISR_frc=0;
	ticks=msecs/20;
	while(ISR_frc<ticks);
}


void magnet(int boolean){
	if(boolean==1){
	  GPIOB_ODR |= BIT4;
	}
	if(boolean==0){
	  GPIOB_ODR &= ~(BIT4);

	}
}

void servoPulseTop (int pw1){
 	ISR_pw_top = pw1;
}

void servoPulseBottom (int pw2){
	ISR_pw_bottom = pw2;
}



int main(void)
{
    char buf[32];
    int pw;
	SysInit();
		float i;

	while (1)
	{
		bottomServo = ON;
		servoPulseBottom(200);
		delay_ms(800);
		bottomServo = OFF;

   	topServo = ON;
		servoPulseTop(240);
		delay_ms(800);
		topServo = OFF;

    magnet(ON);

		for(i=200; i>120; i-=2){
			bottomServo = ON;
			servoPulseBottom(i);
			delay_ms(20);
			bottomServo = OFF;
		}


		topServo = ON;
		servoPulseTop(130);
		delay_ms(800);
		topServo = OFF;

		bottomServo = ON;
		servoPulseBottom(100);
		delay_ms(400);
		bottomServo = OFF;

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

}
