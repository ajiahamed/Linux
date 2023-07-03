#!/usr/bin/env python
from smtplib import SMTP

sender = 'ajiahamed@gmail.com'
receivers = ['ajiahamed@live.com']

message = """From: From Aji <ajiahamed@gmail.com>
to: To Aji Ahamed <ajiahamed@live.com>
Subject: SMTP e-mail test

This is a test e-mail message.
"""

try:
	smtpObj = smtplib.SMTP('localhost')
	smtpObj.sendmail(sender, receivers, message)
	print "Successfully sent email"
except SMTPException:
	print "Error: unable to send email"
