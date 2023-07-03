#!/usr/bin/env python
import os
try:
        RUSER='ubuntu'
        RHOST='52.66.98.236'
        RKEY='/home/ii2dev/key/testSrv.pem '
        RDIR='/home/ubuntu/rpiRND/'
        LDIR='/home/ii2dev/bkp/ '
        SSH='"ssh -i /home/ii2dev/key/testSrv.pem -p 22" '
        CMD="rsync -avzWe "+SSH+LDIR+RUSER+"@"+RHOST+":"+RDIR
        os.system("echo " +CMD)
        os.system(CMD)
except Exception as E01:
        print E01
