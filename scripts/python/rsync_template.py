#!/usr/bin/env python
import os
try:
        RUSER='<--enter the remote user name'
        RHOST='<---enter the remote ip/host'
        RKEY='<--if there is an ssh key enter the fullpath and filename '
        RDIR='<-- enter the path of remote dir'
        LDIR='<--enter the path of local dir '
#        SSH='"ssh -i /home/ii2dev/key/testSrv.pem -p 22" '
	SSH='"ssh -p 22" '
        CMD="rsync -avzWe "+SSH+LDIR+RUSER+"@"+RHOST+":"+RDIR
        os.system("echo " +CMD)
        os.system(CMD)
except Exception as E01:
        print E01

