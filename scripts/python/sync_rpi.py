#!/usr/bin/env python
import os
RPORT='22'
RSYNC='/usr/bin/rsync'
SSH='/usr/bin/ssh'
KEY='/home/thisuser/cron/thishost-rsync-key'
RUSER='ii2user'
RHOST='192.168.2.113'
RPATH='/home/ii2user/rpiRND/'
LPATH='/home/ii2dev/bkp/'
#OPT='avzWe'
#OPT2='p'

#JOB="rsync "+ "-"+OPT + "ssh " "-"+OPT2+RPOR +LPATH +RUSER+"@"+RHOST+':'+RPATH  
#os.system("rsync -avzhrtue "ssh -p 22" /home/ii2dev/bkp/ ii2user@192.168.2.113:/home/ii2user/rpiRND/")
#os.system ("rsync -arvze 'ssh -p 22' /home/ii2dev/bkp/ ii2user@192.168.2.113:/home/ii2user/rpiRND/")
#os.system(JOB)
os.system("echo '$LPATH'")
os.system("echo LPATH")
os.system("echo " +LPATH)

os.system("echo "+RPORT)
os.system("echo RPORT")
os.system("echo " +RPORT)

os.system("echo -e" "\tTesting" +RPORT "\n"+ RPATH)
