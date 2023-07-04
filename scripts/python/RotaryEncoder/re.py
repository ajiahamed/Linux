#!/usr/bin/env python
#This is for testing rotary encoder
import RPi.GPIO as GPIO
import time
from time import sleep
clk = 17
dt = 18
clkState = 0
GPIO.setmode(GPIO.BCM)
GPIO.setup(clk, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
GPIO.setup(dt, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)

counter = 0
clkLastState = GPIO.input(clk)

try:
    while True:
        clkState = GPIO.input(clk)
        dtState = GPIO.input(dt)
        if clkLastState !=clkState:
            if dtState !=0:
                print "Anticlockwise"
            else:
                counter+=1
                print "Clockwise"
                print "counter %d, counter"
                clkLastState = clkState
                time.sleep(0.01)
finally:
    GPIO.cleanup()
