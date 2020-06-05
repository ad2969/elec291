import time
import serial
import serial.tools.list_ports
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation
import sys, time, math
import smtplib

try:
    ser.close() # try to close the last opened port
except:
    print('')

portlist=list(serial.tools.list_ports.comports())
print ('Available serial ports (will try to open the last one):')
for item in portlist:
    print (item[0])

############################
try:
    server = smtplib.SMTP_SSL('smtp.gmail.com', 587)
    server.starttls()
    server.login("jennymollyz@gmail.com", "fatrat1235")
except:
    print("E-mail could not log in")

# configure the serial port
ser = serial.Serial(
    port='COM3',
    baudrate=115200,
    parity=serial.PARITY_NONE,
    stopbits=serial.STOPBITS_TWO,
    bytesize=serial.EIGHTBITS
)
ser.isOpen()

print ('To stop press Ctrl+C')

xsize=100
msg_flag = 0

def data_gen():
    t = data_gen.t
    while True:
       t+=1
       strin = ser.readline()
       print (strin.decode())
       val = int(strin)
       if t >= 360 and val <= 60 and msg_flag == 0:
           msg = "Oven is cool :)"
           server.sendmail("jennymollyz@gmail.com", "Clarenceadrian@gmail.com", msg)
           server.quit()
           msg_flag = 1
       yield t, val

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

data_gen.t = -1
fig = plt.figure()
fig.canvas.mpl_connect('close_event', on_close_figure)
ax = fig.add_subplot(111)
line, = ax.plot([], [], lw=2)
ax.set_ylim(0, 300)
ax.set_xlim(0, xsize)
ax.grid()
xdata, ydata = [], []

# Important: Although blit=True makes graphing faster, we need blit=False to prevent
# spurious lines to appear when resizing the stripchart.
ani = animation.FuncAnimation(fig, run, data_gen, blit=False, interval=100, repeat=False)
plt.show()


