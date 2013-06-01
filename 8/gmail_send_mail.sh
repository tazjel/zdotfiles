


Auto-notify Script for Newegg 5830s (or any other site)

(1/7) > >>

rethaw:
Newegg's auto-notify is worthless. I wrote this script that you can run on your linux miner box that will check the stock of the Sapphire 5830s and email you with a link to the newegg page if it comes in stock.

It checks every minute. It is currently set up to use a gmail address but you can change this to work with your server.

You firstly need curl, this is an application that will handle the connection to gmail. For debian/ubuntu:

Code:

sudo apt-get install curl

Now open your favorite text editor (vi, gedit, etc.) and paste the following code:

Code:

from_address="yourname@gmail.com" # change this
to_address="yourname@gmail.com" # and this
username="yourname@gmail.com" # and this
password="yourpass" #            this too
echo -n "Checking newegg for video cards"
echo "Subject: Video card update

Go buy some video cards, hurry! http://www.newegg.com/Product/Product.aspx?Item=N82E16814102878&cm_re=5830-_-14-102-878-_-Product
" > message.txt
running=true; while $running; do
echo -n "."
sleep 1m
if [ -z "`wget -qO- http://content.newegg.com/LandingPage/ItemInfo4ProductDetail.aspx?Item=N82E16814102878 | grep "OUT OF STOCK"`" ]
then
echo "In stock! Sending an email."
curl -n --ssl-reqd --mail-from "<$from_address>" --mail-rcpt "<$to_address>" --url smtps://smtp.gmail.com:465 -T message.txt -u "$username:$password"
running=false
rm message.txt
fi
done

You will need to edit the relevant top lines to reflect your email address and password. Now save it as "check.sh".

Then, from a command prompt "cd" to the folder where it is saved and enter:

Code:

sh check.sh

OK it's checking, you should see:

Code:

Checking newegg for video cards...

Where a "." is printed every time it checks. Leave this terminal running as long as you would like to check. It will quit if the product no longer says "OUT OF STOCK". Feel free to modify this code to check for another card. If you can't figure it out I can help out with those modifications.

I am hoping those who choose to use this aren't just turning around to sell on ebay, and good luck!

rethaw:
Well it worked, a batch came and went.

Good luck.

Keninishna:
Nice!! I could use this for some other things as well.

BkkCoins:
Yes, nice one!

I needed one like this to also send an SMS. You inspired me to take yours and modify it.
I simplified a bit and added details for SMS using the Clickatell api.

I comment out the echo dots and msg because I run it in background using "&" so I don't keep open a console.

Code:

#!/bin/bash

url="http://content.newegg.com/LandingPage/ItemInfo4ProductDetail.aspx?Item=N82E16814102878"
txt="OUT OF STOCK"

mailsrv="smtps://smtp.gmail.com:465"
mailuser="user@gmail.com"
mailpwd="whatever"
mailmsg="Subject: NewEgg Video Cards in Stock\r\n\r\nCome and get 'em."
from="user@gmail.com"
to="user@gmail.com"

smsuser="userid"
smspwd=""
smsapi="apicode"
smsphone="phonenumber"
smsmsg="NewEgg Video Cards in Stock"

#echo "Checking newegg for video cards"
while [ -z "`wget -qO- "$url" | grep "$txt"`" ]; do
#  echo -n "."
  sleep 1m
done

if [ -n "$smspwd" ]; then
  wget "http://api.clickatell.com/http/sendmsg?user=$smsuser&password=$smspwd&api_id=$smsapi&to=$smsphone&text=$smsmsg"
fi

if [ -n "$mailpwd" ]; then
  printf "$mailmsg" | curl -n --ssl-reqd --mail-from "<$from>" --mail-rcpt "<$to>" --url "$mailsrv" -T - -u "$mailuser:$mailpwd"
fi

rethaw:
Gmail can send sms as well. You send to yoursmsnumber@yourcarrier.com.

Here is a list of the carrier addresses http://en.wikipedia.org/wiki/List_of_SMS_gateways.

Navigation

[0] Message Index

[#] Next page
