# elec291-alarm-clock
A simple alarm clock with extra features coded for the 8051 microcontroller


Demo Videos:  
https://youtu.be/kc6fSWSgGA4  
https://youtu.be/IB4a5bBmHK8  

INCLUDED FUNCTIONS/FEATURES:
1. Running clock
2. Weekday Alarm Clock
3. Weekend Alarm Clock

INSTRUCTIONS:  
  MAIN BUTTONS:  
	- "RESET" button - resets the clock  
	- "BOOT" button - stops alarm from ringing  
	- "MODE" button - switches between screens and modes  
	- "EDIT" button - enters edit mode for either of the screens  
	- "INCR" button - increments the selected input by 1 (edit mode)  
	- "SWITCH" button - switches the selected input  

  SCREEN MODES:
1. Welcome Screen  
	→ Features scrolling customizable welcome text

	- "BOOT" to exit
	- "RESET" resets the LCD into the welcome screen
2. Main Clock  
	→ Features running clock using microcontroller's ISR counter  
	→ Features blinking colons during edit mode  
	→ Features blinking alarm indicators (to indicate whether alarm 1/2 is active)  

	- "MODE" to switch modes (go into alarm modes)
	- "EDIT" to edit clock
	- "INCR" does nothing except in edit mode
	- "SWITCH" does nothing except in edit mode

3. Alarm Setting Screen  
	→ Features alarm clock (weekday/weekend mode)  
	→ Features a variety of blinking input during edit mode and when active  
	→ Features on/off setting for alarms  

	- "MODE" to exit the alarm screen
	- "EDIT" to edit the alarm
	- "INCR" activates/deactivates alarm, and is of normal usage during edit mode
	- "SWITCH" does nothing except in edit mode

LED OUTPUT LIGHTS:
- Blinks when alarm is set
- Blinks when in "edit mode"

SOUND SPEAKER OUTPUT:
- Activates in bursts when alarm is triggered
