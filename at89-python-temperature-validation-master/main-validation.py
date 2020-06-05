#!/usr/bin/python
import sys
if sys.version_info[0] < 3:
    import Tkinter
    from tkinter import *
    import tkMessageBox
else:
    import tkinter as Tkinter
    from tkinter import *
    from tkinter import messagebox as tkMessageBox
import time
import serial
import serial.tools.list_ports
import kconvert
import csv
import numpy as np
import time
import sys, time, math
import matplotlib.pyplot as plt
import matplotlib.animation as animation

top = Tk()
top.resizable(0,0)
top.title("Fluke_45/Tek_DMM40xx K-type Thermocouple")

#ATTENTION: Make sure the multimeter is configured at 9600 baud, 8-bits, parity none, 1 stop bit, echo Off

CJTemp = StringVar()
Temp = StringVar()
DMMout = StringVar()
portstatus = StringVar()
DMM_Name = StringVar()
connected=0

#log = open('tester.csv','w')
#w = csv.writer(log)
row = [["Temperature"],[20.0],[30.0],[40.0],[50.0],[60.0],[70.0],[80.0],[90.0],[100.0],[110.0],[120.0],[130.0],[140.0],[150.0],[160.0],[170.0],[180.0],[190.0],[200.0],[210.0],[220.0]]
urow = 0

global ser

def Just_Exit():
    top.destroy()
    try:
        ser.close()
    except:
        dummy=0

def update_temp():
    global ser, connected
    if connected==0:
        top.after(5000, FindPort) # Not connected, try to reconnect again in 5 seconds
        return
    try:
        strin_bytes = ser.readline() # Read the requested value, for example "+0.234E-3 VDC"
        strin=strin_bytes.decode()
        ser.readline() # Read and discard the prompt "=>"
        if len(strin)>1:
            if strin[1]=='>': # Out of sync?
                strin_bytes = ser.readline() # Read the value again
                strin = strin_bytes.decode() 
        ser.write(b"MEAS1?\r\n") # Request next value from multimeter
    except:
        connected=0
        DMMout.set("----")
        Temp.set("----");
        portstatus.set("Communication Lost")
        DMM_Name.set ("--------")
        top.after(5000, FindPort) # Try to reconnect again in 5 seconds
        return
    strin_clean = strin.replace("VDC","") # get rid of the units as the 'float()' function doesn't like it
    if len(strin_clean) > 0:      
       DMMout.set(strin.replace("\r", "").replace("\n", "")) # display the information received from the multimeter

       try:
           val=float(strin_clean)*1000.0 # Convert from volts to millivolts
           valid_val=1;
       except:
           valid_val=0

       try:
          cj=float(CJTemp.get()) # Read the cold junction temperature in degrees centigrade
       except:
          cj=0.0 # If the input is blank, assume cold junction temperature is zero degrees centigrade

       if valid_val == 1 :
           ktemp=round(kconvert.mV_to_C(val, cj),1)
           if ktemp < -200:  
               Temp.set("UNDER")
           elif ktemp > 1372:
               Temp.set("OVER")
           else:
               Temp.set(ktemp)
               log = open('tester.csv','w')
               g = data_gen()
               vtime, vtemp = next(g)
               #print(float(vtemp))
               print("%.2f" % (float(Temp.get()) - float(vtemp)))
               urow = check(Temp.get())
               LogFunction()
               if urow != 0:
                    #print("urow %d" %urow)
                    row[urow].append(float(Temp.get()) - float(vtemp))
                    print(row)
                    
       else:
           Temp.set("----");
    else:
       Temp.set("----");
       connected=0;
    top.after(500, update_temp) # The multimeter is slow and the baud rate is slow: two measurement per second tops!

def FindPort():
   global ser, connected
   try:
       ser.close()
   except:
       dummy=0
       
   connected=0
   DMM_Name.set ("--------")
   portlist=list(serial.tools.list_ports.comports())
   for item in reversed(portlist):
      portstatus.set("Trying port " + item[0])
      top.update()
      try:
         ser = serial.Serial(item[0], 9600, timeout=0.5)
         time.sleep(0.2) # for the simulator
         ser.write(b'\x03') # Request prompt from possible multimeter
         instr = ser.readline() # Read the prompt "=>"
         pstring = instr.decode();
         if len(pstring) > 1:
            if pstring[1]=='>':
               ser.timeout=0  # Three seconds timeout to receive data should be enough
               portstatus.set("Connected to " + item[0])
               ser.write(b"VDC; RATE S; *IDN?\r\n") # Measure DC voltage, set scan rate to 'Slow' for max resolution, get multimeter ID
               instr=ser.readline()
               devicename=instr.decode()
               DMM_Name.set(devicename.replace("\r", "").replace("\n", ""))
               ser.readline() # Read and discard the prompt "=>"
               ser.write(b"MEAS1?\r\n") # Request first value from multimeter
               connected=1
               top.after(1000, update_temp)
               break
            else:
               ser.close()
         else:
            ser.close()
      except:
         connected=0
   if connected==0:
      portstatus.set("Multimeter not found")
      top.after(5000, FindPort) # Try again in 5 seconds

#####################################################
      
try:
    ser.close() # try to close the last opened port
except:
    print('')

portlist=list(serial.tools.list_ports.comports())
print ('Available serial ports (will try to open the last one):')
for item in portlist:
    print (item[0])

# configure the serial port
ser = serial.Serial(
    port='COM9',
    baudrate=115200,
    parity=serial.PARITY_NONE,
    stopbits=serial.STOPBITS_TWO,
    bytesize=serial.EIGHTBITS
)
ser.isOpen()

def data_gen():
    ser = serial.Serial(
    port='COM9',
    baudrate=115200,
    parity=serial.PARITY_NONE,
    stopbits=serial.STOPBITS_TWO,
    bytesize=serial.EIGHTBITS
    )
    ser.isOpen()

    t = data_gen.t
    while True:
       t+=1
       strin = ser.readline()
       #print (strin.decode())
       vv = strin.decode()
       yield t, vv
       
def run(data):
    # update the data
    t,y = data
    if t>-1:
        xdata.append(t)
        ydata.append(y)
        if t>xsize: # Scroll to the left.
            ax.set_xlim(t-xsize, t)
        line.set_data(xdata, ydata)

    return line,

def on_close_figure(event):
    sys.exit(0)

#print ('To stop press Ctrl+C')
#xsize=100
data_gen.t = -1
#fig = plt.figure()
#fig.canvas.mpl_connect('close_event', on_close_figure)
#ax = fig.add_subplot(111)
#line, = ax.plot([], [], lw=2)
#ax.set_ylim(0, 300)
#ax.set_xlim(0, xsize)
#ax.grid()
#xdata, ydata = [], []

#ani = animation.FuncAnimation(fig, run, data_gen, blit=False, interval=100, repeat=False)
#plt.show()


#######################################################
Label(top, text="Cold Junction Temperature:").grid(row=1, column=0)
Entry(top, bd =1, width=7, textvariable=CJTemp).grid(row=2, column=0)
Label(top, text="Multimeter reading:").grid(row=3, column=0)
Label(top, text="xxxx", textvariable=DMMout, width=20, font=("Helvetica", 20), fg="red").grid(row=4, column=0)
Label(top, text="Thermocouple Temperature (C)").grid(row=5, column=0)
Label(top, textvariable=Temp, width=5, font=("Helvetica", 100), fg="blue").grid(row=6, column=0)
Label(top, text="xxxx", textvariable=portstatus, width=40, font=("Helvetica", 12)).grid(row=7, column=0)
Label(top, text="xxxx", textvariable=DMM_Name, width=40, font=("Helvetica", 12)).grid(row=8, column=0)
Button(top, width=11, text = "Exit", command = Just_Exit).grid(row=9, column=0)

CJTemp.set ("22")
DMMout.set ("NO DATA")
DMM_Name.set ("--------")


def LogFunction():
    with open('tester.csv','w',newline='') as log:
        w = csv.writer(log)
        for wrow in row:
            w.writerow(wrow)
            
def check(val):
    if float(val) == 21:
        return 1
    elif float(val) == 22:
        return 2
    elif float(val) == 23:
        return 3
    elif float(val) == 24:
        return 4
    elif float(val) == 25:
        return 5
    elif float(val) == 70:
        return 6
    elif float(val) == 80:
        return 7
    elif float(val) == 90:
        return 8
    elif float(val) == 100:
        return 9
    elif float(val) == 110:
        return 10
    elif float(val) == 120:
        return 11
    elif float(val) == 130:
        return 12
    elif float(val) == 140:
        return 13
    elif float(val) == 150:
        return 14
    elif float(val) == 160:
        return 15
    elif float(val) == 170:
        return 16
    elif float(val) == 180:
        return 17
    elif float(val) == 190:
        return 18
    elif float(val) == 200:
        return 19
    elif float(val) == 210:
        return 20
    elif float(val) == 220:
        return 21
    else:
        return 0
    

top.after(500, FindPort)
top.mainloop()
