#include "stm32f05xxx.h"
#include <stdio.h>

#define SYSCLK 8000000L
#define TICK_FREQ 1000L
#define ON 1
#define OFF 0
#define CLOCKWISE 0
#define COUNTERCLOCKWISE 1
#define LEFT_TURNING_TIME 3 //in seconds
#define RIGHT_TURNING_TIME 3

volatile unsigned char pwm_count=0;
volatile unsigned char time_count=0;
volatile unsigned int left_wheel_speed;
volatile unsigned int right_wheel_speed;
volatile unsigned int left_wheel;
volatile unsigned int right_wheel;
volatile unsigned int left_wheel_dir;
volatile unsigned int right_wheel_dir;

void both_wheel_speed_change (int);
void left_wheel_speed_change (int);
void right_wheel_speed_change (int);
void left_wheel_on (void);
void right_wheel_on (void);
void left_wheel_off(void);
void right_wheel_off(void);
void go_straight(void);
void go_backwards(void);
void turnLeft(void);
void turnRight(void);
void turn_off(void);
void pin25(int);
void pin26(int);
void pin21(int);
void pin22(int);

void Timer1ISR(void) // interrupts every 2ms
{
	TIM1_SR &= ~BIT0; // clear update interrupt flag
	pwm_count+=10;
	time_count++;
	if(pwm_count>100) pwm_count = 0;

  if(left_wheel==ON){    // currently only left wheel code written
    if(left_wheel_dir == CLOCKWISE){
    	if(pwm_count>left_wheel_speed){  //OUT0 = pwmcount>left_wheel_speed? 0:1;
      	pin25(0);
      }
      else{
        pin25(1);
    }
    	pin26(0);
	}               //  OUT1 = 0;

	if(left_wheel_dir == COUNTERCLOCKWISE){
      if(pwm_count>left_wheel_speed){
          pin26(0);
        }
      else{
          pin26(1);
          	}
			pin25(0);                          //  OUT1 = 0;
		}
	}
	else {
		pin25(0);
		pin26(0);
	}

	if(right_wheel==ON){
	    if(right_wheel_dir == COUNTERCLOCKWISE){
	    	if(pwm_count>right_wheel_speed){  //OUT0 = pwmcount>left_wheel_speed? 0:1;
	      	pin21(0);
	      }
	      else{
	        pin21(1);
	    }
	    	pin22(0);
		}               //  OUT1 = 0;

		if(right_wheel_dir == CLOCKWISE){
	      if(pwm_count>right_wheel_speed){
	          pin22(0);
	        }
	      else{
	          pin22(1);
	          	}
				pin21(0);                          //  OUT1 = 0;
			}
		}
		else {
			pin22(0);
			pin21(0);
		}

}

void SysInit()
{
	// Set up output port bit for blinking LED
	RCC_AHBENR |= 0x00020000;  // peripheral clock enable for port A
	RCC_AHBENR |= 0x00040000; // peripheral clock enable for port B
	GPIOA_MODER |= BIT22; // Make pin PA11 output (pin 21)
	GPIOA_MODER |= BIT24; // Make pin PA12 output (pin 22)
	GPIOA_MODER |= BIT30; // Make pin 25 output
	GPIOB_MODER |= BIT6; // Make pin 26 output

	// Set up timer
	RCC_APB2ENR |= BIT11; // turn on clock for timer1
	TIM1_ARR = SYSCLK/TICK_FREQ;
	ISER |= BIT13;        // enable timer interrupts in the NVIC
	TIM1_CR1 |= BIT4;     // Downcounting
	TIM1_CR1 |= BIT0;     // enable counting
	TIM1_DIER |= BIT0;    // enable update event (reload event) interrupt
	enable_interrupts();
}

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

void left_wheel_on(void){ // turns the left wheel on
  left_wheel = ON;
}

void right_wheel_on (void){ // turns the right wheel on
  right_wheel = ON;
}

void left_wheel_off(void){ // turns the left wheel off
  left_wheel = OFF;
}


void right_wheel_off(void){ // turns the right wheel off
  right_wheel = OFF;
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
  time_count = 0;
  while(time_count<(LEFT_TURNING_TIME*1000/2)){ //interrupts every 2ms
      right_wheel_on();
      left_wheel_on();
      right_wheel_dir = CLOCKWISE;
      left_wheel_dir = CLOCKWISE;
    }
}

void turnRight(void){ // turns the robot right
  time_count = 0;
  while(time_count<(RIGHT_TURNING_TIME*1000/2)){ //interrupts every 2ms
      right_wheel_on();
      left_wheel_on();
      right_wheel_dir = COUNTERCLOCKWISE;
      left_wheel_dir = COUNTERCLOCKWISE;
    }
}

void turn_off(void){ // turns off the robot
  right_wheel = OFF;
  left_wheel = OFF;
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


int main(void)
{
  char buff[17];

	SysInit();


/*	while(time_count <= 10000); // 2 seconds
	left_wheel_off();
	time_count=0;
	right_wheel_on();
	while(time_count <= 10000); // 2 seconds
	right_wheel_off(); */
	// turnLeft();
	// turnRight();


	//right_wheel_speed_change(50);
	//right_wheel_dir = CLOCKWISE;

	while(1)
	{

		left_wheel_dir = CLOCKWISE;
		right_wheel_dir = COUNTERCLOCKWISE;
		both_wheel_speed_change(50);

		time_count=0;
		right_wheel_on();
		left_wheel_on();
 //printf("Type in the following: \n");
 //printf("right\n");
 //printf("left\n");
 //printf("forward\n");
 //printf("backward\n");
 //printf("stop\n");
 //printf("speed change left");
 //printf("speed change right");


	}
	return 0;
}
