#!/usr/bin/env python
from RPi import GPIO
from luma.core.interface.serial import i2c
from luma.core.render import canvas
from luma.oled.device import ssd1306, ssd1325, ssd1331, sh1106
from time import sleep
import socket
import sys_info

clk = 17
dt = 18
sw = 27
global menuindex
global insubmenu

GPIO.setmode(GPIO.BCM)
GPIO.setup(clk, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(dt, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(sw, GPIO.IN, pull_up_down=GPIO.PUD_UP)
serial = i2c(port=1, address=0x3C)
device = ssd1306(serial, rotate=0)

clkLastState = GPIO.input(clk)

from PIL import ImageFont, ImageDraw
from luma.core.interface.serial import i2c
from luma.core.render import canvas
from luma.oled.device import ssd1306, ssd1325, ssd1331, sh1106
import time

serial = i2c(port=1, address=0x3C)
device = ssd1306(serial, rotate=0)
global gdraw, gdevice

def ip_address():
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    s.connect(("8.8.8.8", 80))
    ip = (s.getsockname()[0])
    s.close()
    return str(ip)

def invert(draw,x,y,text):
    font = ImageFont.load_default()
    draw.rectangle((x, y, x+120, y+10), outline=255, fill=255)
    draw.text((x, y), text, font=font, outline=0,fill="black")

# Box and text rendered in portrait mode
def menu(device, draw, menustr,index):
    global menuindex
    font = ImageFont.load_default()
    draw.rectangle(device.bounding_box, outline="white", fill="black")
    for i in range(len(menustr)):
        if( i == index):
            menuindex = i
            invert(draw, 2, i*10, menustr[i])
        else:
		    draw.text((2, i*10), menustr[i], font=font, fill=255)


names = ['Disk', 'Memory', 'Network', 'CPUUsage', 'IPAddress', 'CODELECTRON']
with canvas(device) as draw:
    menu(device, draw, names,1)
#
def menu_operation(strval):
    if ( strval == "CODELECTRON"):
        with canvas(device) as draw:
            draw.rectangle(device.bounding_box, outline="white", fill="black")
            draw.text((10, 20), "Thank you", fill="white")
            draw.text((10, 30), "Keep following", fill="white")
    if ( strval == "Disk"):
        with canvas(device) as draw:
            draw.text((0, 26), sys_info.disk_usage('/'), fill="white")
    if ( strval == "Memory"):
        with canvas(device) as draw:
            draw.text((0, 26), sys_info.mem_usage(), fill="white")
    if ( strval == "Network"):
        with canvas(device) as draw:
            draw.text((0, 26), sys_info.network('wlan0'), fill="white")
    if ( strval == "CPUUsage"):
        with canvas(device) as draw:
            draw.text((0, 26), sys_info.cpu_usage(), fill="white")
    if ( strval == "IPAddress"):
        with canvas(device) as draw:
            draw.text((0, 26), ip_address(), fill="white")

def sw_callback(channel):
    global menuindex
    global insubmenu

    strval = names[menuindex]
    menu_operation(strval)


def rotary_callback(channel):
    global clkLastState
	global dtLastState
    global counter
    try:
		new_clk_state=GPIO.input(clk)
		dt_new_state=GPIO.input(dt)
		if(clkLastState!= new_clk_state):# or dtLastState != dt_new_state ):
			if(clkLastState==0 and new_clk_state==1 and dtLastState==0 and dt_new_state==0):
				counter += 1
			elif(clkLastState==1 and new_clk_state==0 and dtLastState==1 and dt_new_state==1):
				counter += 1
		if(dtLastState != dt_new_state:
			if(dtLastState==0 and dt_new_state==1 and clkLastStateLastState==0 and new_clk_state==0):
				counter -= 1
			elif(dtLastState==1 and dt_new_state==0 and clkLastState==1 and new_clk_state==1):
				counter -= 1
			print counter
			clkLastState=new_clk_state
			dtLastState=dt_new_state
		with canvas(device) as draw:
			menu(device, draw, names,counter%7)

    finally:
                print "Ending"


counter = 0
insubmenu = 0
clkLastState = GPIO.input(clk)
dtLastState=GPIO.input(dt)
GPIO.add_event_detect(dt, GPIO.FALLING , callback=rotary_callback, bouncetime=50)
GPIO.add_event_detect(clk, GPIO.FALLING , callback=rotary_callback, bouncetime=50)
GPIO.add_event_detect(sw, GPIO.FALLING , callback=sw_callback, bouncetime=300)
raw_input("Enter anything")
GPIO.cleanup()
