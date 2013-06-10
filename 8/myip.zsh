# paste this in your ~/.bashrc
myip (){
clear
echo
echo ” ip local: `hostname -I`”
echo ” router: `route -n | awk ‘/UG/ {print $2}’`”
echo ” external ip: `curl –connect-timeout 4 -s sputnick-area.net/ip`”
echo
read -sn 1 -p ” Press any key to continue…”
clear
}
