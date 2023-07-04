#! /usr/bin/env python

from os import system
from urllib2 import urlopen
from socket import socket
from sys import argv
from time import asctime

def tcp_test(server_info):
    cpos = server_info.find(':')
    try:
        sock = socket()
        sock.connect((server_info[:cpos], int(server_info[cpos+1:])))
        sock.close
        return True
    except:
        return False

def http_test(server_info):
    try:
        data = urlopen(server_info).read()
        return True
    except:
        return False

def server_test(test_type, server_info):
    if test_type.lower() == 'tcp':
        return tcp_test(server_info)
    elif test_type.lower() == 'http':
        return http_test(server_info)

def send_error(test_type, server_info, email_address):
    subject = '%s: %s %s error' % (asctime(), test_type.upper(), server_info)
    message = 'There was an error while executing a %s test against %s.' % (test_type.upper(), server_info)
    system('echo "%s" | mail -s "%s" %s' % (message, subject, email_address))

if __name__ == '__main__':
    if len(argv) != 4:
        print('Wrong number of arguments.')
    elif not server_test(argv[1], argv[2]):
        send_error(argv[1], argv[2], argv[3])
