#!/usr/bin/env python3

import telepot
import time
import os
from picamera import PiCamera

path=os.getenv("HOME")

def handleMessage(msg):
    id = msg['chat']['id'];
    command = msg['text'];
    print ('Command ' + command + ' from chat id' + str(id));
    if (command == '/photo'):
        print ("Taking picture...");
        #Initialize the camera
        camera = PiCamera();
        camera.start_preview()
        camera.capture(path + '/pic.jpg',resize=(640,480))
        time.sleep(2)
        camera.stop_preview()
        camera.close()
        #Sending picture
        bot.sendPhoto(id, open(path + '/pic.jpg', 'rb'))
    else:
        bot.sendMessage(id, "Command not found..")

bot = telepot.Bot('1415593162:AAE0Ns9CK1oADejvE1xRNykuM6FXOW10nhs');
bot.message_loop(handleMessage);
while 1:
    time.sleep(10);
