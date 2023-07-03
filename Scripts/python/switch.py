import RPi.GPIO as GPIO
import time
import uinput

GPIO.setmode(GPIO.BCM)

GPIO.setup(19, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(20, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.setup(21, GPIO.IN, pull_up_down=GPIO.PUD_UP)

device = uinput.Device([
        uinput.KEY_P,
        uinput.KEY_N,
        uinput.KEY_F5,
        ])

while True:
    input_state_back = GPIO.input(19)
    input_state_forward = GPIO.input(20) 
    input_state_refresh = GPIO.input(21)

    if input_state_back == False:
        print('Button P Pressed')
        device.emit_click(uinput.KEY_P)
        time.sleep(0.5)
    if input_state_forward == False:
        print('Button N Pressed')
        device.emit_click(uinput.KEY_N)
        time.sleep(0.5)
    if input_state_refresh == False:
        print('Button F5 Pressed')
        device.emit_click(uinput.KEY_F5)
        time.sleep(0.5)
