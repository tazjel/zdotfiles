#!/bin/bash
#
#BleedingEdge.sh for Mint Copyright (C) 2009-2013 Paul Fedele
#Works only with zenity and notify-osd Installed!
#
#To use this script graphically, make it executable (Right Click File, Permissions, Select Execute Checkbox)
#then double click the file and select "Run in Terminal"
#
#To use this script from the command prompt type "chmod u+x PATH/BleedingEdge_VERSION.sh" where PATH is the location of the script and VERSION is the appropriate version of the script
#
#Inquiries can be sent to fedele at rocketmail dot com
#
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#http://www.gnu.org/licenses/gpl-3.0.html
#
#This script adds software from repositories which are not under its control.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#No Warranty or guarantee of suitability exists for this software
#Use at your own risk. The author is not responsible if your system breaks.
#
#You should have received a copy of the GNU General Public License
#along with this program. If not, see <http://www.gnu.org/licenses/>.
#Adobe Reader, Cinelerra, CLI Companion, Dolphin, Firefox, GetDeb, gImageReader, GmapCatcher, Google Talk, Gtalx, GUFW, Hunspell, Linux, Microsoft, Minetest, Mint, Mono, Netflix, PDF, PlayDeb, Remobo IPN, Steam, Ubuntu, Ubuntu Tweak, VirtualBox, Wii, Wiithon, Wordnet, and Y-PPA-Manager are trademarks of their respective owners.  No endorsement by any trademark holder is stated or implied.
VERSION="_M15_5"
DISTRIBUTION="raring"
DISTRIBUTION2="olivia"
RED="\033[0;31m"
BLUE="\033[0;34m"
GREEN="\033[1;32m"
ENDCOLOR="\033[0m"
ARCHITECTURE=`uname -m`
ON_USER=`whoami`
RESTART="NO"
UPDATEREQUIRED="NO"
CODENAME=$(lsb_release -cs)
function CinelerraPrep()
{
	if [ -f /etc/apt/sources.list.d/cinelerra-ppa-cinelerra-exp-$DISTRIBUTION.list ]
	then
		echo -e $GREEN"*Cinelerra Repository Found*"$ENDCOLOR
		/usr/bin/notify-send "Cinelerra Repository Found"
	else
		echo "=================================================="
		echo -e $BLUE"Adding The Cinelerra Repository"$ENDCOLOR
		/usr/bin/notify-send "Adding The Cinelerra Repository"
		sudo add-apt-repository ppa:cinelerra-ppa/ppa
	fi
	UPDATEREQUIRED="YES"
	return
}
function DolphinPrep()
{
	if [ -f /etc/apt/sources.list.d/glennric-dolphin-emu-$DISTRIBUTION.list ]
	then
		echo -e $GREEN"*Dolphin Wii Emulator Repository Found*"$ENDCOLOR
		/usr/bin/notify-send "Dolhpin Wii Emulator Repository Found"
	else
		echo "=================================================="
		echo -e $BLUE"Adding The Dolhpin Wii Emulator Repository"$ENDCOLOR
		/usr/bin/notify-send "Adding The Dolhpiin Wii Emulator Repository"
		sudo add-apt-repository ppa:glennric/dolphin-emu
#		sudo add-apt-repository ppa:wii.sceners.linux/wiithon
	fi
	UPDATEREQUIRED="YES"
	return
}
function GetdebPrep()
{
	if [ -f /etc/apt/sources.list.d/getdeb.list ]
	then
		echo -e $GREEN"*Getdeb Repository Found*"$ENDCOLOR
		/usr/bin/notify-send "Getdeb Repository Found"
	else
		echo "=================================================="
		echo -e $BLUE"Adding Getdeb Repository"$ENDCOLOR
		/usr/bin/notify-send "Adding Getdeb Repository"
		sudo echo "deb http://archive.getdeb.net/ubuntu $DISTRIBUTION-getdeb apps" > ./getdeb.list
		sudo echo "deb http://archive.getdeb.net/ubuntu $DISTRIBUTION-getdeb games" >> ./getdeb.list
		sudo mv ./getdeb.list /etc/apt/sources.list.d/getdeb.list
		wget -q -O- http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
	fi
	UPDATEREQUIRED="YES"
		echo -e $BLUE"After this program completes you may add additional software from your package manager or www.getdeb.net"$ENDCOLOR
		/usr/bin/notify-send "After this program completes you may add additional software from your package manager or www.getdeb.net"
	return
}
function MinetestPrep()
{
	if [ -f /etc/apt/sources.list.d/minetestdevs-stable-$DISTRIBUTION.list ]
	then
		echo -e $GREEN"*Minetest Desktop Repository Found*"$ENDCOLOR
		/usr/bin/notify-send "Minetest Desktop Repository Found"
	else
		echo "=================================================="
		echo -e $BLUE"Adding The Minetest Desktop Repository"$ENDCOLOR
		/usr/bin/notify-send "Adding The Minetest Desktop Repository"
		sudo apt-add-repository ppa:minetestdevs/stable releases
	fi
	UPDATEREQUIRED="YES"
	return
}
function NetflixPrep()
{
	if [ -f /etc/apt/sources.list.d/ehoover-compholio-$DISTRIBUTION.list ]
	then
		echo -e $GREEN"*Netflix Desktop Repository Found*"$ENDCOLOR
		/usr/bin/notify-send "Netflix Desktop Repository Found"
	else
		echo "=================================================="
		echo -e $BLUE"Adding The Netflix Desktop Repository"$ENDCOLOR
		/usr/bin/notify-send "Adding The Netflix Desktop Repository"
		sudo apt-add-repository ppa:ehoover/compholio
	fi
	UPDATEREQUIRED="YES"
	return
}
function RepositoriesPrep()
{
		echo "=================================================="
		echo -e $BLUE"Opening your local package manager to add more repositories"$ENDCOLOR
		/usr/bin/notify-send "Opening your local package manager to add more repositories"
		sudo software-properties-gtk
	return
}
function VirtualBoxPrep()
{
	if [ -f /etc/apt/sources.list.d/VirtualBox.list ]
	then
		echo -e $GREEN"*VirtualBox Repository Found*"$ENDCOLOR
		/usr/bin/notify-send "VirtualBox Repository Found"
	else
		echo "=================================================="
		echo -e $BLUE"Adding the VirtualBox Repository"$ENDCOLOR
		/usr/bin/notify-send "Adding the VirtualBox Repository"
		sudo echo "deb http://download.virtualbox.org/virtualbox/debian $DISTRIBUTION contrib" > ./VirtualBox.list
		sudo mv ./VirtualBox.list /etc/apt/sources.list.d/VirtualBox.list
		wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
	fi
	UPDATEREQUIRED="YES"
	return
}
function Hardware()
{
	echo "=================================================="
	echo -e $RED"Proprietary Hardware Installation..."$ENDCOLOR
	/usr/bin/notify-send "Proprietary Hardware Installation..."
	sudo apt-get -y install linux-firmware-nonfree
	driver-manager
	RESTART="YES"
	return
}
function Acrobat()
{
	if [ $ARCHITECTURE = "i686" ]
	then
		echo "=================================================="
		echo -e $RED"Installing Adobe Acrobat Reader"$ENDCOLOR
		/usr/bin/notify-send "Installing Adobe Acrobat Reader"
		/usr/bin/notify-send "Displaying Adobe end user license agreements.  Opening Firefox"
		firefox http://www.adobe.com/products/eulas/&
		sleep 3
		zenity --question --text="Do you agree to the terms of end user license agreement (EULA) of Adobe Acrobat Reader?"
		if [ $? == 0 ]
		then
			/usr/bin/notify-send "Installing Adobe Acrobat Reader"
			wget -nc http://ardownload.adobe.com/pub/adobe/reader/unix/9.x/9.5.5/enu/AdbeRdr9.5.5-1_i386linux_enu.deb
			sudo dpkg -i ./AdbeRdr*
			rm ./AdbeRdr*
		fi
	fi
	if [ $ARCHITECTURE = "x86_64" ]
	then
		echo -e $RED"Sorry - Adobe Acrobat not yet implemented for x86_64, but there are free alternatives."$ENDCOLOR
		/usr/bin/notify-send "Sorry - Adobe Acrobat not yet implemented for x86_64, but there are free alternatives."
	fi
	return
}
function Cinelerra()
{
	echo "=================================================="
	echo -e $RED"Installing Cinelerra"$ENDCOLOR
	/usr/bin/notify-send "Installing Cinelerra"
	sudo apt-get -y install cinelerra-cv esound-common libaudiofile1 libesd0 libguicast1-cv liblavfile-2.0-0 liblavjpeg-2.0-0 liblavplay-2.0-0 libmpeg3cine-cv libquicktime2 libquicktimecine-cv mjpegtools mjpegtools-gtk
	return
}
function Dolphin()
{
	echo "=================================================="
	echo -e $RED"Installing Dolphin Wii Emulator & Wiithon"$ENDCOLOR
	/usr/bin/notify-send "Installing Dolphin Wii Emulator & Wiithon"
	sudo apt-get -y install dolphin-emu-master libao-common libao4 libcg libcggl libsfml-network1.6 libsoil1 libwxbase2.9-0 libwxgtk2.9-0 nvidia-cg-dev nvidia-cg-toolkit
#	if [ $ARCHITECTURE = "i686" ]
#	then
#		wget -nc http://ppa.launchpad.net/wii.sceners.linux/wiithon/ubuntu/pool/main/w/wiithon/wiithon_1.26-507_i386.deb
#		sudo apt-get -y install python-sqlalchemy imagemagick
#	fi
#	if [ $ARCHITECTURE = "x86_64" ]
#	then
#		wget -nc http://ppa.launchpad.net/wii.sceners.linux/wiithon/ubuntu/pool/main/w/wiithon/wiithon_1.26-507_amd64.deb
#	fi
#	sudo dpkg -i ./wiithon*
#	sudo gpasswd -a $USER disk
	return
}
function gImageReader()
{
	echo "=================================================="
	echo -e $RED"Installing gImageReader"$ENDCOLOR
	/usr/bin/notify-send "Installing gImageReader"
	sudo apt-get -y install tesseract-ocr tesseract-ocr-eng tesseract-ocr-equ tesseract-ocr-osd libtesseract3 liblept3 python-enchant python-gtkspell python-poppler python-imaging-sane
	wget -nc http://downloads.sourceforge.net/project/gimagereader/0.9/gimagereader_0.9-1_all.deb
	sudo dpkg -i ./gimagereader*
	rm ./gimagereader*
	return
}
function GMapCatcher()
{
	echo "=================================================="
	echo -e $RED"Installing GMapCatcher"$ENDCOLOR
	/usr/bin/notify-send "Installing GMapCatcher"
	wget -nc http://gmapcatcher.googlecode.com/files/mapcatcher_0.8.0.0-1_all.deb
	sudo dpkg -i ./mapcatcher*
	rm ./mapcatcher*
	return
}
function Voice()
{
	echo "=================================================="
	echo -e $RED"Installing Google Voice and Video Chat Plugin"$ENDCOLOR
	/usr/bin/notify-send "Displaying Google Voice and Video Chat Plugin terms of service and privacy policy.  Starting Firefox"
	firefox http://www.google.com/talk/intl/en/terms.html http://www.google.com/talk/intl/en/privacy.html&
	sleep 3
	zenity --question --text="Do you agree to the terms of service and privacy policy of Google Voice and Video Chat Plugin?"
	if [ $? == 0 ]
	then
		/usr/bin/notify-send "Installing Google Voice and Video Chat Plugin"
		if [ $ARCHITECTURE = "i686" ]
		then
			wget -nc http://dl.google.com/linux/direct/google-talkplugin_current_i386.deb
		fi
		if [ $ARCHITECTURE = "x86_64" ]
		then
			wget -nc http://dl.google.com/linux/direct/google-talkplugin_current_amd64.deb
		fi
		sudo dpkg -i ./google-talkplugin*
		rm ./google-talkplugin*
	fi
	return
}
function Gtalx()
{
	echo "=================================================="
	echo -e $RED"Installing GtalX"$ENDCOLOR
	/usr/bin/notify-send "Installing GtalX"
	if [ $ARCHITECTURE = "i686" ]
	then
		wget -nc http://sites.google.com/site/jozsefbekes/Home/gtalx/gtalx_0.1.0_i386.deb
	fi
	if [ $ARCHITECTURE = "x86_64" ]
	then
		wget -nc http://sites.google.com/site/jozsefbekes/Home/gtalx/gtalx_0.1.0_amd64.deb
	fi
	sudo apt-get -y install libqt4-gui libmediastreamer0 libortp8
	sudo dpkg -i ./gtalx*
	rm ./gtalx*
	return
}
function GUFW()
{
	echo "=================================================="
	echo -e $RED"Installing GUFW"$ENDCOLOR
	/usr/bin/notify-send "Installing GUFW"
	sudo apt-get -y install gufw
	sudo ufw enable
	echo -e $RED"Starting firewall GUI.  Typically, the firwall is enabled with incoming traffic denied."$ENDCOLOR
	/usr/bin/notify-send "Starting firewall GUI.  Typically, the firwall is enabled with incoming traffic denied."
	sudo gufw
       read -sn 1 -p "Press any key to continue…
"
	return
}
function Java()
{
	echo "=================================================="
	echo -e $RED"Installing Java or OpenJDK"$ENDCOLOR
	zenity --question --width=420 --height=100 --ok-label="OpenJDK" --cancel-label="Java" --text="BleedingEdge can help you install\n\n-Oracle Java (Proprietary)\n\n   or\n\n-OpenJDK (Open Source)\n\nWhich do you prefer?"
		if [ $? == 1 ]
		then
			echo -e $RED"Installing Java"$ENDCOLOR
			/usr/bin/notify-send "Installing Java"
			/usr/bin/notify-send "Displaying Oracle Java terms.  Starting Firefox"
			firefox http://www.oracle.com/technetwork/java/javase/terms/license/index.html&
			sleep 3
			zenity --question --text="Do you agree to the terms of Oracle Java?"
			if [ $? == 0 ]
			then
				if [ $ARCHITECTURE = "i686" ]
				then
					wget -nc http://javadl.sun.com/webapps/download/AutoDL?BundleId=76851
					mv ./AutoDL?Bund* ./jre-7u21-linux-i586.tar.gz
					tar -xvf ./jre*
					sudo mkdir /usr/lib/jvm/jre1.7.0_21/
					sudo mv ./jre*/* /usr/lib/jvm/jre1.7.0_21/
					sudo ln -s /usr/lib/jvm/jre1.7.0_21/lib/i386/libnpjp2.so /usr/lib/firefox/plugins/
				fi
				if [ $ARCHITECTURE = "x86_64" ]
				then
					wget -nc http://javadl.sun.com/webapps/download/AutoDL?BundleId=76853
					mv ./AutoDL?Bund* ./jre-7u21-linux-x64.tar.gz
					tar -xvf ./jre*
					sudo mkdir /usr/lib/jvm/jre1.7.0_21/
					sudo mv ./jre*/* /usr/lib/jvm/jre1.7.0_21/
					sudo ln -s /usr/lib/jvm/jre1.7.0_21/lib/amd64/libnpjp2.so /usr/lib/firefox/plugins/
					rm -rf ./jre*
				fi
			fi
		else
			echo -e $RED"Installing OpenJDK"$ENDCOLOR
			/usr/bin/notify-send "Installing OpenJDK"
			sudo apt-get -y install openjdk-7-jre icedtea-7-plugin icedtea-plugin default-jre default-jre-headless icedtea-7-jre-cacao icedtea-7-jre-jamvm libatk-wrapper-java-jni openjdk-7-jre-headless icedtea-netx-common libtirpc1 rpcbind libgssglue1 icedtea-plugin
		fi 
	return
}
function Minetest()
{
	echo "=================================================="
	echo -e $RED"Installing Minetest"$ENDCOLOR
	/usr/bin/notify-send "Installing Minetest"
	sudo apt-get -y install minetestc55
	return
}
function Netflix()
{
	echo "=================================================="
	echo -e $RED"Installing Netflix Desktop"$ENDCOLOR
	/usr/bin/notify-send "Installing Netflix Desktop"
	sudo apt-get -y install netflix-desktop wine-compholio wine-browser-installer
	sudo netflix-desktop
	return
}
function Remobo()
{
	echo "=================================================="
	echo -e $RED"Installing Remobo IPN"$ENDCOLOR
	/usr/bin/notify-send "Installing Remobo IPN"
	if [ $ARCHITECTURE = "i686" ]
	then
		wget -nc http://remobo.com/dl?p=debs/i386/remobo_0.72.1-1_i386.deb
	fi
	if [ $ARCHITECTURE = "x86_64" ]
	then
		wget -nc http://remobo.com/dl?p=debs/x86_64/remobo_0.72.1-1_x86_64.deb
	fi
	sudo apt-get -y install chkconfig
	sudo dpkg -i remobo*
	rm ./remobo*
	return
}
function Steam()
{
	echo "=================================================="
	echo -e $RED"Installing Steam"$ENDCOLOR
	/usr/bin/notify-send "Installing Steam"
	if [ $ARCHITECTURE = "i686" ]
	then
		wget -nc http://media.steampowered.com/client/installer/steam.deb
	fi
	if [ $ARCHITECTURE = "x86_64" ]
	then
		wget -nc http://media.steampowered.com/client/installer/steam.deb
		sudo apt-get -y install libcurl3-gnutls:i386 ia32-libs gnome-terminal gnome-terminal-data
	fi
	sudo apt-get -f install curl jockey-common nvidia-common
	sudo dpkg -i steam*
	rm ./steam*
	return
}
function VirtualBox()
{
	echo "=================================================="
	echo -e $RED"Installing VirtualBox"$ENDCOLOR
	/usr/bin/notify-send "Installing VirtualBox"
	if [ $ARCHITECTURE = "i686" ]
	then
		wget -nc http://dlc.sun.com.edgesuite.net/virtualbox/4.2.12/virtualbox-4.2_4.2.12-84980~Ubuntu~$DISTRIBUTION\_i386.deb
	fi
	if [ $ARCHITECTURE = "x86_64" ]
	then
		wget -nc http://dlc.sun.com.edgesuite.net/virtualbox/4.2.12/virtualbox-4.2_4.2.12-84980~Ubuntu~$DISTRIBUTION\_amd64.deb
	fi
	sudo apt-get -y install libcurl3 libqt4-network libqt4-opengl libqtcore4 libqtgui4 libsdl-ttf2.0-0 libaudio2 libmng1 libqt4-dbus libqt4-xml
	echo -e $RED"Removing Previous VirtualBox Versions"$ENDCOLOR
	/usr/bin/notify-send "Removing Previous VirtualBox Versions"
	sudo apt-get -y remove virtualbox
	sudo dpkg -i virtualbox*
	rm ./virtualbox*
	RESTART="YES"
	echo "=================================================="
	echo -e $RED"Downloading VirtualBox Extensions and Guest Additions"$ENDCOLOR
	/usr/bin/notify-send "Downloading VirtualBox Extensions and Guest Additions"
	wget -nc http://dlc.sun.com.edgesuite.net/virtualbox/4.2.12/Oracle_VM_VirtualBox_Extension_Pack-4.2.12-84980.vbox-extpack
	wget -nc http://dlc.sun.com.edgesuite.net/virtualbox/4.2.12/VBoxGuestAdditions_4.2.12.iso
	echo "=================================================="
	sudo /etc/init.d/vboxdrv setup
	virtualbox&
	echo -e $RED"Starting VirtualBox"$ENDCOLOR
	/usr/bin/notify-send "Starting VirtualBox"
	echo -e $RED"To Add Extensions, Select File -> Preferences -> Extensions, Click on the blue diamond and select the file from the folder that BleedingEdge is in."$ENDCOLOR
	/usr/bin/notify-send "To Add Extensions, Select File -> Preferences -> Extensions, Click on the blue diamond and select the file from the folder that BleedingEdge is in."
	read -sn 1 -p "Press any key to continue…"
	return
}
function Dim()
{
	echo "=================================================="
	zenity --question --width=420 --height=100 --text="Does your computer boot with the brightness turned all the way down?"
	if [ $? == 1 ]
	then
		/usr/bin/notify-send "Fix not applied"
		echo "Fix not applied"
		return
	else
		/usr/bin/notify-send "Updating GRUB to fix brightness problem"
		echo "Updating GRUB to fix brightness problem"
		sudo sed "s/\(GRUB_CMDLINE_LINUX=\)\"\"/\1\"acpi_­osi=Linux acpi_backlight=vendor\"/" /etc/default/grub -i
		sudo update-grub
	fi
	return
}
function Mono()
{
	echo "=================================================="
	MONOUNINSTALLED=$(cat /etc/apt/preferences | grep mono-runtime | awk '{print $1}')
	if  [ $MONOUNINSTALLED = "Package:" ]
	then
		echo -e $RED"Mono Previously Uninstalled"$ENDCOLOR
		/usr/bin/notify-send "Mono Previously Uninstalled"
	else
		echo -e $RED"Uninstalling Mono"$ENDCOLOR
		/usr/bin/notify-send "Uninstalling Mono..."
		sudo apt-get purge cli-common mono-runtime libmono*
		sudo rm -rf /usr/lib/mono/
		echo "Package: cli-common mono-runtime" > ./preferences
		echo "Pin: version *" >> ./preferences
		echo "Pin-Priority: -100" >> ./preferences
		sudo mv ./preferences /etc/apt/preferences
	fi
	return
}
echo -e  $GREEN"BleedingEdge for Mint version $VERSION\n\nCopyright 2009-2013 Paul Fedele.\n\nGPLv3 Licensed.\n\nRun this script in a terminal.\n\nThis script adds software from sources which are not under its control.\n\nNo warranty or guarantee of suitability exists for this software.\n\nUse at your own risk.\n\n"$ENDCOLOR
if [ $CODENAME != $DISTRIBUTION2 ]
then
	echo -e  $RED"Sorry, you are using $CODENAME.  Only Mint $DISTRIBUTION2 is supported.\n\nPlease check the files listed at http://sourceforge.net/projects/bleedingedge/files/ for your distribution.\n\nAlternately, you can edit line 33 of this script to reflect your distribution."$ENDCOLOR
	/usr/bin/notify-send "Sorry, you are using $CODENAME.  Only Mint $DISTRIBUTION2 is supported."
	/usr/bin/notify-send "Please check the files listed at http://sourceforge.net/projects/bleedingedge/files/ for your distribution."
	/usr/bin/notify-send "Alternately, you can edit line 33 of this script to reflect your distribution."
	read -sn 1 -p "Press any key to terminate."
	echo -e "\n"
	exit 1
fi
if [ $ARCHITECTURE != "i686" ]
then
	if [ $ARCHITECTURE != "x86_64" ]
	then
	echo -e  $RED"Sorry, only i686 and x86_64 architectures are supported."$ENDCOLOR
	sleep 5
	exit 1
	fi
fi
while ps -U root -u root u | grep "synaptic" | grep -v grep > /dev/null;
       do 
       echo -e $RED"Installation can't continue. Please close Synaptic first then try again."$ENDCOLOR
       read -sn 1 -p "Press any key to continue…
"
done
while ps -e | grep "update-manager" | grep -v grep > /dev/null;
       do
       echo -e $RED"Installation can't continue. Please close Update Manager first then try again."$ENDCOLOR
       read -sn 1 -p "Press any key to continue…
"
done
while ps -U root -u root u | grep "software-center" | grep -v grep > /dev/null;
       do 
       echo -e $RED"Installation can't continue. Please close Software Center first then try again."$ENDCOLOR
       read -sn 1 -p "Press any key to continue…
"
done 
while ps -U root -u root u | grep "apt-get" | grep -v grep > /dev/null;
       do
       echo -e $RED"Installation can't continue. Please wait for apt-get to finish running, or terminate the process, then try again."$ENDCOLOR
       read -sn 1 -p "Press any key to continue…
"
done       
while ps -U root -u root u | grep "dpkg" | grep -v grep > /dev/null;
       do 
       echo -e $RED"Installation can't continue. Wait for dpkg to finish running, or exit it, then try again."$ENDCOLOR
       read -sn 1 -p "Press any key to continue…
"
done       
TESTCONNECTION=`wget --tries=3 --timeout=15 www.google.com -O /tmp/testinternet &>/dev/null 2>&1`
if [ $? != 0 ]
then
	echo -e $RED"You are not connected to the Internet. Please check your Internet connection and try again."$ENDCOLOR
else
	echo -e $GREEN"Internet Connection Verified"$ENDCOLOR
fi
if [ -e /usr/bin/wget ]
then
	echo -e $GREEN"Wget Verified"$ENDCOLOR
else
	echo -e $RED"Wget is needed for this script to run properly.  Installing wget"$ENDCOLOR
	sudo apt-get -y install wget
fi
if [ -e /usr/bin/zenity ]
then
	echo -e $GREEN"Zenity Verified"$ENDCOLOR
else
	echo -e $RED"Zenity is needed for this script to run properly.  Installing Zenity"$ENDCOLOR
	sudo apt-get -y install zenity
fi
if [ -e /usr/bin/notify-send ]
then
	echo -e  $GREEN"Notify-osd Verified"$ENDCOLOR
else
	echo -e  $RED"notify-osd is needed for this script to run properly.  Installing notify-osd"$ENDCOLOR
	sudo apt-get -y install notify-osd libnotify-bin
fi
echo -e  $BLUE"Checking for Latest Version"$ENDCOLOR
VER_MAJ=$(echo $VERSION | awk -F"_" '{print $2}')
MAJ_ONLY=$(echo $VER_MAJ | awk -F"M" '{print $2}')
VER_MIN=$(echo $VERSION | awk -F"_" '{print $3}')
wget -nc http://sourceforge.net/projects/bleedingedge/files/Mint$MAJ_ONLY/
LATEST=$(cat ./index.html | grep "Click to download" | head -n 1 | tail -n 1 | awk '{sub("title=\"Click to download BleedingEdge", ""); sub(".sh\"", ""); print $1}')
LAT_MAJ=$(echo $LATEST | awk -F"_" '{print $2}')
LAT_MIN=$(echo $LATEST | awk -F"_" '{print $3}')
rm ./index.html
if [ $VER_MAJ = $LAT_MAJ ]
then
	if [ $VERSION = $LATEST ]
	then
		echo -e  $GREEN"Latest Version Verified"$ENDCOLOR
	else
		echo -e  $RED"BleedingEdge Version $VERSION is obsolete.  Latest version available is $LATEST"$ENDCOLOR
		zenity --question --width=420 --height=100 --text="You are using BleedingEdge $VERSION .\n\nThe latest version available is $LATEST .\n\nDo you wish to download version $LATEST ?"
		if [ $? == 0 ]
		then
			wget -nc http://downloads.sourceforge.net/project/bleedingedge/Mint$MAJ_ONLY/BleedingEdge$LATEST.sh
			chmod u+x ./BleedingEdge$LATEST.sh
	        	exec ./BleedingEdge$LATEST.sh&
			exit 0
		fi
	fi
else
	echo -e  $RED"Updates to older versions of BleedingEdge are available for manual download at http://sourceforge.net/projects/bleedingedge/files/"$ENDCOLOR
	/usr/bin/notify-send "Updates to older versions of BleedingEdge are available for manual download at http://sourceforge.net/projects/bleedingedge/files/"
fi
zenity --question --width=420 --height=100 --text="BleedingEdge for Mint version $VERSION\n\nCopyright 2009-2013 Paul Fedele.\n\nGPLv3 Licensed.\n\nRun this script in a terminal.\n\nThis script adds software from sources which are not under its control.\n\nNo warranty or guarantee of suitability exists for this software.\n\nUse at your own risk.\n\nAre you sure you wish to proceed?"
if [ $? == 1 ]
then
	/usr/bin/notify-send "Program Terminated"
	exit 0
fi
/usr/bin/notify-send "Making sure that packages are up to date before installing anything."
zenity --question --width=420 --height=100 --text="Updates may be required before continuing\n\nDo you wish to update?"
if [ $? == 0 ]
then
	sudo apt-get update
	zenity --info --width=420 --height=100 --text="If the update software pops up, use it before continuing with this script."
fi
if [ $ARCHITECTURE = "i686" ]
then
ans=$(zenity  --list  --width=600 --height=415 --text "BleedingEdge Mint $CODENAME Installations and Modifications" --checklist  --column "Select" --column "Options" FALSE "Acrobat Reader (32 Bit Only)" FALSE "Additional Repositories" FALSE "Cinelerra video editor" FALSE "Dolphin Wii Emulator" FALSE "Getdeb & Playdeb Repos" FALSE "GMapCatcher" FALSE "Google Voice and Video Chat Plugin" FALSE "Minetest" FALSE "Netflix Desktop (32 Bit Only)" FALSE "Proprietary Hardware Drivers" FALSE "Steam (32 Bit Only)" FALSE "VirtualBox" FALSE "Fix Dim Screen on Boot" FALSE "Uninstall Mono" --separator=":")
fi
if [ $ARCHITECTURE = "x86_64" ]
then
ans=$(zenity  --list  --width=600 --height=415 --text "BleedingEdge Mint $CODENAME Installations and Modifications" --checklist  --column "Select" --column "Options" FALSE "Additional Repositories" FALSE "Cinelerra video editor" FALSE "Dolphin Wii Emulator" FALSE "Getdeb & Playdeb Repos" FALSE "GMapCatcher" FALSE "Google Voice and Video Chat Plugin" FALSE "Minetest" FALSE "Proprietary Hardware Drivers" FALSE "VirtualBox" FALSE "Fix Dim Screen on Boot" FALSE "Uninstall Mono" --separator=":")
fi
if [ $? == 1 ]
then
	/usr/bin/notify-send "Program Terminated"
	exit 0
fi
arr=$(echo $ans | tr "\:" "\n")
clear
for x in $arr
do
	if [ $x = "Cinelerra" ]
	then
		CinelerraPrep
	fi
	if [ $x = "Dolphin" ]
	then
		DolphinPrep
	fi
	if [ $x = "Getdeb" ]
	then
		GetdebPrep
	fi
	if [ $x = "Fonts" ]
	then
		FontsPrep
	fi
	if [ $x = "Studio" ]
	then
		StudioPrep
	fi
	if [ $x = "Minetest" ]
	then
		MinetestPrep
	fi
	if [ $x = "Netflix" ]
	then
		NetflixPrep
	fi
	if [ $x = "Repositories" ]
	then
		RepositoriesPrep
	fi
	if [ $x = "WebDevelopmentPrep" ]
	then
		WebDevelopmentPrep
	fi	
done
if [ $UPDATEREQUIRED = "YES" ]
then
	sudo apt-get -q update
fi
for x in $arr
do
	if [ $x = "Hardware" ]
	then
		Hardware
	fi
	if [ $x = "Acrobat" ]
	then
		Acrobat
	fi
	if [ $x = "Cinelerra" ]
	then
		Cinelerra
	fi
	if [ $x = "Dolphin" ]
	then
		Dolphin
	fi
	if [ $x = "gImageReader" ]
	then
		gImageReader
	fi
	if [ $x = "GMapCatcher" ]
	then
		GMapCatcher
	fi
	if [ $x = "Earth" ]
	then
		Earth
	fi
	if [ $x = "Voice" ]
	then
		Voice
	fi
	if [ $x = "GtalX" ]
	then
		Gtalx
	fi
	if [ $x = "GUFW" ]
	then
		GUFW
	fi
	if [ $x = "Java" ]
	then
		Java
	fi
	if [ $x = "Minetest" ]
	then
		Minetest
	fi
	if [ $x = "Netflix" ]
	then
		Netflix
	fi
	if [ $x = "Move" ]
	then
		Move
	fi
	if [ $x = "Remobo" ]
	then
		Remobo
	fi
	if [ $x = "Steam" ]
	then
		Steam
	fi
	if [ $x = "VirtualBox" ]
	then
		VirtualBox
	fi
	if [ $x = "Dim" ]
	then
		Dim
	fi
	if [ $x = "Mono" ]
	then
		Mono
	fi
done
zenity --question --width=420 --height=100 --text="Would you like this program to tidy up\n\nThis involves removing locales (language files).\n\nRemoving old kernels.\n\nRemoving apt cache.\n\nRemoving config files for unused .deb packages.\n\nEmptying the trash."
if [ $? == 0 ]
then
	echo -e $BLUE"\n=================================================="$ENDCOLOR
	echo -e $BLUE"                 Cleaning Up"$ENDCOLOR
	echo -e $BLUE""$ENDCOLOR
	echo -e $BLUE"LocalePurge will remove language files that you do not need"$ENDCOLOR
	echo -e $BLUE"     Use the arrows, space bar, and tab if prompted"$ENDCOLOR
	echo -e $BLUE"=================================================="$ENDCOLOR
	if [ -f /usr/sbin/localepurge ]
		then
			sudo localepurge
		else
			/usr/bin/notify-send "LocalePurge will remove language files that you do not need"
			/usr/bin/notify-send "Use the arrows, space bar, and tab if prompted"
			sudo apt-get -y install localepurge
	fi
	sudo apt-get install
	sudo apt-get -y autoremove
	sudo apt-get clean
	sudo updatedb
#	OLDCONF=$(dpkg -l|grep "^rc"|awk '{print $2}')
	CURKERNEL=$(uname -r|sed 's/-*[a-z]//g'|sed 's/-386//g')
	LINUXPKG="linux-(image|headers|ubuntu-modules|restricted-modules)"
	METALINUXPKG="linux-(image|headers|restricted-modules)-(generic|i386|server|common|rt|xen)"
	OLDKERNELS=$(dpkg -l|awk '{print $2}'|grep -E $LINUXPKG |grep -vE $METALINUXPKG|grep -v $CURKERNEL)
	echo -e $RED"Cleaning apt cache..."$ENDCOLOR
#	sudo apt-get clean
#	echo -e $RED"Removing old config files..."$ENDCOLOR
#	sudo apt-get purge $OLDCONF
	if [ -z $OLDKERNELS ]
	then
		echo -e $BLUE"No old kernels found..."$ENDCOLOR
	else
		if [ $RESTART = "YES" ]
		then
			echo -e $RED"You may be using an old kernel.  Reboot on new kernel before removing older versions.."$ENDCOLOR
		else
			echo -e $RED"Removing old kernels..."$ENDCOLOR
			sudo apt-get purge $OLDKERNELS
			RESTART="YES"
		fi
	fi
	echo -e $RED"Emptying the trash..."$ENDCOLOR
	rm -rf /home/*/.local/share/Trash/*/** &> /dev/null
	rm -rf /root/.local/share/Trash/*/** &> /dev/null
fi
zenity --question --width=420 --height=100 --text="Would you like to remove repositories that were added while using this program?\n\nYes - Software installed by BleedingEdge will not be updated.\n\nNo - 3rd party repositories can be fickle and mess with DPKG."
if [ $? == 0 ]
then
	echo -e $BLUE"=================================================="$ENDCOLOR
	echo -e $BLUE"                 Removing PPA Repositories"$ENDCOLOR
	echo -e $BLUE"=================================================="$ENDCOLOR
	sudo mv /etc/apt/sources.list.d/official-package-repositories.list /etc/apt/official-package-repositories.list
	sudo mv /etc/apt/sources.list.d/local-repository.list /etc/apt/local-repository.list
	sudo rm -f /etc/apt/sources.list.d/*.list
	sudo rm -f /etc/apt/sources.list.d/*.list.save
	sudo mv /etc/apt/official-package-repositories.list /etc/apt/sources.list.d/official-package-repositories.list
	sudo mv /etc/apt/local-repository.list /etc/apt/sources.list.d/local-repository.list
fi
unset CODENAME
unset DISTRIBUTION
unset DISTRIBUTION2
unset ARCHITECTURE
unset OLDCONF
unset CURKERNEL
unset LAT_MAJ
unset LAT_MIN
unset LINUXPKG
unset METALINUXPKG
unset OLDKERNELS
unset RED
unset BLUE
unset GREEN
unset ENDCOLOR
unset x
unset y
unset TESTCONNECTION
unset VER_MAJ
unset VER_MIN
unset VERSION
unset LATEST
unset UPDATEREQUIRED
unset MONOUNINSTALLED
if [ $RESTART = "YES" ]
then
	echo -e $BLUE"\nDone! Restart your computer to apply the changes."$ENDCOLOR
	/usr/bin/notify-send "Done! Restart your computer to apply the changes."
else
	echo -e $GREEN"\nDone!  This program will end in 5 seconds."$ENDCOLOR
	/usr/bin/notify-send "Done!  This program will end in 5 seconds."
fi
unset RESTART
sleep 5
exit 0
