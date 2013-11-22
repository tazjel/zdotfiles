#!/usr/bin/env python
#Author: Sarath Lakshman ( sarathlakshman [at] slynux.com )

import urllib2,urllib,re,os

opener=urllib2.build_opener(urllib2.HTTPCookieProcessor())

customer_id=""
first_time=True
configs={}

config_handle = file(os.path.expanduser('~/.smsconf'),"r+")
config_lines = config_handle.readlines()
if len(config_lines) > 2:
    first_time=False

for line in config_lines:
    splits = line.strip().split('=')
    configs[splits[0]]=splits[1]


customer_id_regex = re.compile("custfrom[0-9]*")
success_re = re.compile("Message has been submitted successfully")

print "Logging in"

login=urllib.urlencode({'username':configs["username"], 'password':configs["password"],'login':'Login'})

opener.open("http://wwwo.way2sms.com//auth.cl", login)

if first_time:

    print "First run: Pulling customer identity..."
    handle=opener.open("http://wwwo.way2sms.com//jsp/InstantSMS.jsp?val=0")
    data=handle.read()
    customer_id=customer_id_regex.findall(data)[0]
    config_handle.write("custid=%s" %customer_id)

    
else:
    customer_id=configs["custid"]

config_handle.close()

print
mobno=raw_input("Enter mobile no: ")
message=raw_input("Enter message: ")
print

print "Sending.."


send_msg=urllib.urlencode({'HiddenAction':'instantsms', 'Action':customer_id,'MobNo':mobno,'textArea':message})
handle=opener.open("http://wwwo.way2sms.com//FirstServletsms?custid=",send_msg)


if len(success_re.findall(handle.read())) == 1:
    print "Message has been submitted successfully"
else:
    print "Could not complete your request"
print
#. Create a text file ~/.smsconf and write following lines in it

#username=your_mob_no_as_user
#password=password_you_registered
