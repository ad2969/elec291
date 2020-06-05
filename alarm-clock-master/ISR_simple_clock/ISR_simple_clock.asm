; ISR_EXERCISE.asm:
; Contains different modes of operation
; 1) Clock. Can be set, and increments upwards constantly
; 2) Weekday Alarm. Can be set, rings, can be interrupted to stop
; 3) Weekend Alarm. Can be set, rings, can be interrupted to stop
; 4) Nice little game?

$NOLIST
$MODLP51
$LIST

; The following below have been copied from the ISR_example.asm file provided
; Copied section stops when marked by a divider

TIMER0_RELOAD_L DATA 0xf2
TIMER1_RELOAD_L DATA 0xf3
TIMER0_RELOAD_H DATA 0xf4
TIMER1_RELOAD_H DATA 0xf5

CLK           EQU 22118400 ; Microcontroller system crystal frequency in Hz
TIMER0_RATE   EQU 500     ; 2048Hz squarewave (peak amplitude of CEM-1203 speaker)
TIMER0_RELOAD EQU ((65536-(CLK/TIMER0_RATE)))
TIMER2_RATE   EQU 500     ; ~1 second interval timer
TIMER2_RELOAD EQU ((65536-(CLK/TIMER2_RATE)))

BOOT_BUTTON   equ P4.5
SOUND_OUT     equ P3.7
MODE_BUTTON   equ P0.0
EDIT_BUTTON   equ P0.4
INCR_BUTTON   equ P0.3
SWITCH_BUTTON equ P0.2


; Reset vector
org 0x0000
    ljmp main

; External interrupt 0 vector (not used in this code)
org 0x0003
	reti

; Timer/Counter 0 overflow interrupt vector
org 0x000B
	ljmp Timer0_ISR

; External interrupt 1 vector (not used in this code)
org 0x0013
	reti

; Timer/Counter 1 overflow interrupt vector (not used in this code)
org 0x001B
	reti

; Serial port receive/transmit interrupt vector (not used in this code)
org 0x0023
	reti

; Timer/Counter 2 overflow interrupt vector
org 0x002B
	ljmp Timer2_ISR

; In the 8051 we can define direct access variables starting at location 0x30 up to location 0x7F
dseg at 0x30
Count1ms:       ds 2 ; Used to determine when half second has passed
CLOCK_SECOND:   ds 1 ; The clock incremented in the ISR and displayed in the main loop
CLOCK_MINUTE:   ds 1 ;
CLOCK_HOUR:     ds 1 ;
CLOCK_AMPM:     ds 1 ; 0 for AM, 1 for PM
CLOCK_DAY:      ds 1 ; 0 starts on SUND
cursor_pos:     ds 1 ; position of edit cursor

; In the 8051 we have variables that are 1-bit in size.  We can use the setb, clr, jb, and jnb
; instructions with these variables.  This is how you define a 1-bit variable:
bseg
half_seconds_flag: dbit 1 ; Set to one in the ISR every time 500 ms had passed

cseg
; These 'equ' must match the wiring between the microcontroller and the LCD!
LCD_RS equ P1.1
LCD_RW equ P1.2
LCD_E  equ P1.3
LCD_D4 equ P3.2
LCD_D5 equ P3.3
LCD_D6 equ P3.4
LCD_D7 equ P3.5
$NOLIST
$include(LCD_4bit.inc) ; A library of LCD related functions and utility macros
$LIST

;                     1234567890123456    <- This helps determine the location of the counter
Initial_Message:  db 'Welcome!', 0
Template_Clock:	  db 'xx:xx:xx', 0
Clock_String:	    db 'CLOCK', 0
Weekday_String:	  db 'WEEKDAY MODE', 0
Weekend_String:	  db 'WEEKEND MODE', 0
Sunday:           db 'SUNDAY   ', 0
Monday:           db 'MONDAY   ', 0
Tuesday:          db 'TUESDAY  ', 0
Wednesday:        db 'WEDNESDAY', 0
Thursday:         db 'THURSDAY ', 0
Friday:           db 'FRIDAY   ', 0
Saturday:         db 'SATURDAY ', 0
AM:               db 'AM', 0
PM:               db 'PM', 0
bb:               db ' ', 0           ; attempt at making blank
bbday:            db '         ', 0

; * MAIN MENU
; Clock Mode Positions: 1-2, 4-5, 7,18
; AM/PM Position: 11-12
; Day Position: (2nd row) 1-9
; * ALARM MENU
;---------------------------------;
; Routine to initialize the ISR   ;]
; for timer 0                     ;
;---------------------------------;
Timer0_Init:
	mov a, TMOD
	anl a, #0xf0 ; Clear the bits for timer 0
	orl a, #0x01 ; Configure timer 0 as 16-timer
	mov TMOD, a
	mov TH0, #high(TIMER0_RELOAD)
	mov TL0, #low(TIMER0_RELOAD)
	; Set autoreload value
	mov TIMER0_RELOAD_H, #high(TIMER0_RELOAD)
	mov TIMER0_RELOAD_L, #low(TIMER0_RELOAD)
	; Enable the timer and interrupts
    setb ET0  ; Enable timer 0 interrupt
    setb TR0  ; Start timer 0
	ret

;---------------------------------;
; ISR for timer 0.  Set to execute;
; every 1/4096Hz to generate a    ;
; 2048 Hz square wave at pin P3.7 ;
;---------------------------------;
Timer0_ISR:
	;clr TF0  ; According to the data sheet this is done for us already.
	cpl SOUND_OUT ; Connect speaker to P3.7!
	reti

;---------------------------------;
; Routine to initialize the ISR   ;
; for timer 2                     ;
;---------------------------------;
Timer2_Init:
	mov T2CON, #0 ; Stop timer/counter.  Autoreload mode.
	mov TH2, #high(TIMER2_RELOAD)
	mov TL2, #low(TIMER2_RELOAD)
	; Set the reload value
	mov RCAP2H, #high(TIMER2_RELOAD)
	mov RCAP2L, #low(TIMER2_RELOAD)
	; Init One millisecond interrupt counter.  It is a 16-bit variable made with two 8-bit parts
	clr a
	mov Count1ms+0, a
	mov Count1ms+1, a
	; Enable the timer and interrupts
    setb ET2  ; Enable timer 2 interrupt
    setb TR2  ; Enable timer 2
	ret

;---------------------------------;
; ISR for timer 2                 ;
;---------------------------------;
Timer2_ISR:
	  clr  TF2  ; Timer 2 doesn't clear TF2 automatically. Do it in ISR
	  cpl  P3.6 ; To check the interrupt rate with oscilloscope. It must be precisely a 1 ms pulse.

	; The two registers used in the ISR must be saved in the stack
	  push   acc
	  push   psw

	; Increment the 16-bit one mili second counter
	  inc    Count1ms+0        ; Increment the low 8-bits first
	  mov    a, Count1ms+0     ; If the low 8-bits overflow, then increment high 8-bits
	  jnz    Inc_Done
	  inc    Count1ms+1

  Inc_Done:
	; Check if half second has passed
	  mov    a, Count1ms+0
	  cjne   a, #low(500),    Timer2_ISR_done 	   ; Check if count(down) = 244
	  mov    a, Count1ms+1					; Warning: this instruction changes the carry flag!
	  cjne   a, #high(500),   Timer2_ISR_done	   ; Check if count(up) = 1

	; 500 milliseconds have passed.  Set a flag so knowthe main program knows
	  setb   half_seconds_flag ; Let the main program  half second had passed
	  cpl    TR0 ; Enable/disable timer/counter0 . This line creates a beep-silence-beep-silence sound.
	; Reset to zero the milli-seconds counter, it is a 16-bit variable
	  clr    a
	  mov    Count1ms+0, a
	  mov    Count1ms+1, a
	; Increment the BCD counters, check first though
	  mov    a, CLOCK_SECOND
	  cjne   a, #0x59,        Timer2_second_inc		; check if second will turn 60
	  mov    a, #0							                  ; if true, reset seconds and add minute
	  da     a
	  mov    CLOCK_SECOND, a

	  mov    a, CLOCK_MINUTE
	  cjne   a, #0x59,        Timer2_minute_inc		; check if minute will turn 60
	  mov    a, #0							                  ; if true, reset minute and add hour
	  da     a
	  mov    CLOCK_MINUTE, a

    check_am:                                   ; if AM, allow to reach 12:xx
    mov    a, CLOCK_AMPM                        ; but change am -> pm
    cjne   a, #0x0,        not_am
    mov    a, CLOCK_HOUR
	  cjne   a, #0x12,        Timer2_hour_inc	  	; AM: check if hour will turn 13
	  mov    a, #0x1							                ; if true, reset hour to 1
    sjmp   do_ampm
    not_am:
    mov    a, CLOCK_HOUR
    cjne   a, #0x11,        Timer2_hour_inc      ; PM: check if hour will turn 12
    mov    a, #0x0                              ; if true, reset hour to 0
    do_ampm:
    da     a
    mov    CLOCK_HOUR, a

    mov    a, CLOCK_AMPM
	  cjne   a, #0x1,         Timer2_ampm_inc	  	; check if already pm
	  mov    a, #0x0							                ; if true, reset back to pm
	  da     a
	  mov    CLOCK_AMPM, a

    check_day:
    mov    a, CLOCK_DAY
	  cjne   a, #0x6,         Timer2_day_inc	  	 ; check if already Saturday
	  mov    a, #0x0							                 ; if true, reset back to Sunday
	  da     a
	  mov    CLOCK_DAY, a
	  sjmp   Timer2_ISR_done

  Timer2_hour_inc:
	  mov    a, CLOCK_HOUR
	  add    a, #0x01
    da     a                ; Decimal adjust instruction.  Check datasheet for more details!
	  mov    CLOCK_HOUR, a
	  sjmp   Timer2_ISR_done
  Timer2_minute_inc:
	  mov    a, CLOCK_MINUTE
	  add    a, #0x01
	  da     a 								; Decimal adjust instruction.  Check datasheet for more details!
	  mov    CLOCK_MINUTE, a
	  sjmp   Timer2_ISR_done
  Timer2_second_inc:
	  mov    a, CLOCK_SECOND
	  add    a, #0x01
	  da     a 								; Decimal adjust instruction.  Check datasheet for more details!
	  mov    CLOCK_SECOND, a
	  sjmp   Timer2_ISR_done
  Timer2_ampm_inc:
  	mov    a, CLOCK_AMPM
  	add    a, #0x01
  	da     a 								; Decimal adjust instruction.  Check datasheet for more details!
  	mov    CLOCK_AMPM, a
  	sjmp   Timer2_ISR_done
  Timer2_day_inc:
    mov    a, CLOCK_DAY
    add    a, #0x01
    da     a 								; Decimal adjust instruction.  Check datasheet for more details!
    mov    CLOCK_DAY, a
    sjmp   Timer2_ISR_done
  Timer2_ISR_done:
  	pop    psw
	  pop    acc
	  reti

clearscreen:
    push   acc
	  WriteCommand(#0x01)     ; Clear screen command (takes some time)
  ;Wait for clear screen command to finish. Usually takes 1.52ms.
	  Wait_Milli_Seconds(#2)
    pop    acc
    ret

main:
  ; Initializing the timers
    mov SP, #0x7F
    lcall Timer0_Init
    lcall Timer2_Init
    mov P0M0, #0            ; setting pints of P0 to bidirectional?
    mov P0M1, #0
    setb EA                 ; Enable global interrupts
    lcall LCD_4BIT

    Set_Cursor(1,1)
    Send_Constant_String(#Initial_Message)
    Wait_Milli_Seconds(#100)

    setb    half_seconds_flag
    mov     CLOCK_SECOND, #0x0000
	  mov     CLOCK_MINUTE, #0x0059
	  mov     CLOCK_HOUR,   #0x0011
    mov     CLOCK_DAY,    #0x0003
    mov     CLOCK_AMPM,   #0x0001

main_load:
    lcall clearscreen
    Set_Cursor(  1 , 1  )
    Send_Constant_String(#Template_Clock)
main_loop:
  ; main loop begins
    ;
    ; jb BOOT_BUTTON, loop_a  ; if boot button is not pressed, start displaying time
    ; Wait_Milli_Seconds(#50) ; Debounce delay.
    ; jb BOOT_BUTTON, loop_a  ; if boot button is not pressed, start displaying time
    ; jnb BOOT_BUTTON, $      ; if boot button pressed, wait til release
    ;
    jb    MODE_BUTTON,    main_edit_check   ; if mode button is not pressed, check edit
    Wait_Milli_Seconds(#50)              ; Debounce delay.
    jb    MODE_BUTTON,    main_edit_check   ; if mode button is not pressed, check edit
    jnb   MODE_BUTTON,    alarm1_trans      ; if mode button is pressed, wait til depress
  main_edit_check:
    jb    EDIT_BUTTON,    main_loop_show    ; if edit button is not pressed, start display
    Wait_Milli_Seconds(#50)              ; Debounce delay.
    jb    EDIT_BUTTON,    main_loop_show    ; if edit button is not pressed, start display
    jnb   EDIT_BUTTON,    main_edit_trans   ; if edit button is pressed, wait til depress
    ;clr   TR2                              ; Stop timer 2
  ; Clear the 1ms counters
    ;clr   a
    ;mov   Count1ms+0, a
    ;mov   Count1ms+1, a
  ; Clear the Clock Inputs
    ;mov   CLOCK_SECOND, a
    ;mov   CLOCK_MINUTE, a
    ;mov   CLOCK_HOUR, a
    ;mov   CLOCK_DAY, a
    ;mov   CLOCK_AMPM, a
    ;setb  TR2                              ; Start timer 2
    ;sjmp  main_halfsec_a                   ; Display the new value

  ; redirects if not the second half of a minisecond
  main_loop_show:
    jnb   half_seconds_flag, main_loop
  ; prints the clock hours, minutes, and seconds
  main_halfsec_pass:
    clr   half_seconds_flag   ; Clear flag in the main loop
    Set_Cursor(  1 , 1  )
    Display_BCD(CLOCK_HOUR)  ; Macro located in 'LCD_4bit.inc'
    Set_Cursor(  1 , 4  )
    Display_BCD(CLOCK_MINUTE)
    Set_Cursor(  1 , 7  )
    Display_BCD(CLOCK_SECOND)
    ljmp main_loop_show_ampm

; ******************************** Transfers **********************************
    alarm1_trans:
      ljmp alarm1_mode
    main_edit_trans:
      ljmp main_edit
; *****************************************************************************
  ; prints the clock am/pm
  main_loop_show_ampm:
    Set_Cursor(  1 , 10  )
    mov   a, CLOCK_AMPM
    cjne  a, #0x0,       not_am_time
    Send_Constant_String(#AM)
    ljmp main_loop_show_day
  not_am_time:
    Send_Constant_String(#PM)
    ljmp main_loop_show_day
  ; prints the clock day
  main_loop_show_day:
    Set_Cursor(  2 , 1  )
    mov   a, CLOCK_DAY
    cjne  a, #0x0,      not_sunday
    Send_Constant_String(#Sunday)
    ljmp   main_loop
    not_sunday:
    cjne  a, #0x1,      not_monday
    Send_Constant_String(#Monday)
    ljmp   main_loop
    not_monday:
    cjne  a, #0x2,      not_tuesday
    Send_Constant_String(#Tuesday)
    ljmp   main_loop
    not_tuesday:
    cjne  a, #0x3,      not_wednesday
    Send_Constant_String(#Wednesday)
    ljmp   main_loop
    not_wednesday:
    cjne  a, #0x4,      not_thursday
    Send_Constant_String(#Thursday)
    ljmp   main_loop
    not_thursday:
    cjne  a, #0x5,      not_friday
    Send_Constant_String(#Friday)
    ljmp   main_loop
    not_friday:
    Send_Constant_String(#Saturday)
    ljmp   main_loop

main_edit:

alarm1_mode:
    lcall clearscreen
    Set_Cursor(1,4)
    Send_Constant_String(#Template_Clock)
alarm1_loop:
  ; weekday alarm mode
    jb MODE_BUTTON, alarm1_loop_show  ; if mode button is not pressed, start display
    Wait_Milli_Seconds(#50)           ; Debounce delay.
    jb MODE_BUTTON, alarm1_loop_show  ; if mode button is not pressed, start display
    jnb MODE_BUTTON, alarm2_mode      ; if mode button is pressed, wait til depress
  alarm1_loop_show:
    Set_Cursor(2,2)
    Send_Constant_String(#Weekday_String)
    ljmp alarm1_loop

alarm2_mode:
    ; lcall clear
    Set_Cursor(1,4)
    Send_Constant_String(#Template_Clock)
alarm2_loop:
  ; weekend alarm mode
    jb MODE_BUTTON, alarm2_loop_show  ; if mode button is not pressed, start display
    Wait_Milli_Seconds(#50)               ; Debounce delay.
    jb MODE_BUTTON, alarm2_loop_show           ; if mode button is not pressed, start display
    jnb MODE_BUTTON, main_load_transfer        ; if mode button is pressed, wait til depress
  alarm2_loop_show:
    Set_Cursor(2,2)
    Send_Constant_String(#Weekend_String)
    ljmp alarm2_loop

  main_load_transfer:
    ljmp   main_load
END
END
