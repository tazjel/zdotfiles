
#hcitool - HCI Tool ver 4.98
#Usage:
        #hcitool [options] <command> [command parameters]
#Options:
        #--help  Display help
        #-i dev  HCI device
#Commands:
        #dev     Display local devices
        #inq     Inquire remote devices
        #scan    Scan for remote devices
        #name    Get name from remote device
        #info    Get information from remote device
        #spinq   Start periodic inquiry
        #epinq   Exit periodic inquiry
        #cmd     Submit arbitrary HCI commands
        #con     Display active connections
        #cc      Create connection to remote device
        #dc      Disconnect from remote device
        #sr      Switch master/slave role
        #cpt     Change connection packet type
        #rssi    Display connection RSSI
        #lq      Display link quality
        #tpl     Display transmit power level
        #afh     Display AFH channel map
        #lp      Set/display link policy settings
        #lst     Set/display link supervision timeout
        #auth    Request authentication
        #enc     Set connection encryption
        #key     Change connection link key
        #clkoff  Read clock offset
        #clock   Read local or remote clock
        #lescan  Start LE scan
        #lewladd Add device to LE White List
        #lewlrm  Remove device from LE White List
        #lewlsz  Read size of LE White List
        #lewlclr Clear LE White list
        #lecc    Create a LE Connection
        #ledc    Disconnect a LE Connection
        #lecup   LE Connection Update
#dev     Display local devices
hcitool dev
#Get name from remote device

hcitool name
#info    Get information from remote device

hcitool info

        #con     Display active connections
hcitool con

#      Display link quality
hcitool lq
#      Display transmit power level
hcitool tpl


