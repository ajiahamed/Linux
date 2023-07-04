#!/usr/bin/env python
import os
host= raw_input("Pleas enter the hostname or IP of the server to connect: ")
try:
        RUSER='ubuntu'
        RHOST='host'
        RKEY='/home/ii2dev/key/testSrv.pem '
        command="ssh -i "+RKEY +RUSER+"@"+RHOST
        os.system("echo " +RHOST)
        os.system(command)
except Exception as E01:
        print E01

