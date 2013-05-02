
alias 'zurl'='args curl -I < url-list.txt'

alias 'schm'='sudo chmod +x'
alias 'wWw'='vim /home/bani/.config/updot/updot.conf'

alias 'zx'='updot -u'
alias 'wWW'='whoami'
alias 'wml'='mlterm -f=green -b=black -0=green -R=30-40'

###
alias 'wmlw'='mlterm -f=green -b=#008080 -0=green -R=30-40'


function wwsh {
sudo ssh root@192.168.1."$1" && echo "$1"
}
alias 'web2py'='cd ~/web2py && python web2py.py -a "w" -i 127.0.0.1 -p 8001'
alias 'agip'='sudo easy_install pip'

#alias 'wadd'='rsync -avz --progress -e  "ssh -p 2233" root@192.168.1.5:/var/mobile/AddressBook.sqlitedb ~/'
#alias 'hhhi'"history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head"
