#!/usr/bin/env python
import os
try:
	RUSER='ubuntu'
	RHOST='52.66.98.236'
        RKEY='/home/ii2dev/key/testSrv.pem '
	command="ssh -i "+RKEY +RUSER+"@"+RHOST
	os.system(command)
except Exception as E01:
	print E01
