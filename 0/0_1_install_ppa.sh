# autokey 
sudo add-apt-repository -y ppa:cdekter/ppa
sudo apt-get update
sudo apt-get install -y autokey 


sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update
sudo apt-get install oracle-java7-installer


# Ref :
# http://www.howtoforge.com/the-perfect-desktop-xubuntu-12.04-p2
# http://xubuntu-chronicles.blogspot.com/2013/01/things-to-do-after-xubuntu-12041-lts.html

sudo apt-get install xubuntu-restricted-extras

sudo apt-get install xfce4-goodies
sudo apt-get install htop


sudo add-apt-repository ppa:tiheum/equinox
sudo apt-get update
sudo apt-get install faenza-icon-theme


7. Synchronize computer clock with Internet / GPS time

Go to Menu / System / Time and Date settings, choose Intenet servers
install ntp support to sync the time with Internet servers
add aditional ntp servers in /etc/ntp.conf

8. Change Monday to be the first day of the week

check which locale is running, using the locale command (ie en_US)
sudo nano /usr/share/i18n/locales/en_US 
and change first_weekday to 2
regenerate the locale using sudo locale-gen
re login

 Install software

via Menu / Ubuntu Software Center

irssi
LibreOffice Writer, Calc, Impress, Draw, Base.
Geany
VLC
Cheese
OpenShot
MyPaint
Inkscape
Scribus
Blender
Hugin
Stellarium
Periodic table
GParted
Disk Utility
Network Tools

nmap
xtrlock
vino
Midori

Mobile media converter, enable Medibuntu

Disk usage:
ncdu
baobab

Games
Simon Tatham's Puzzle Games, like Map, etc.
gbrainy
Kana test

Screensavers
data files to be shared among screensaver frontends
xscreensaver-data-extra


Oracle Java 7 
i. Download the tar.gz file for linux,ex: jdk-7-linux-i586.tar.gz from Oracle
ii. Untar and copy it where the open java is installed: /usr/lib/jvm/
    sudo tar -zxvf ~/Downloads/jdk-7-linux-i586.tar.gz -C /usr/lib/jvm/
iii. Add the new java installation to the java alternative lists:
    sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.7.0/jre/bin/java 1
iv. Make the added installation the default one
    sudo update-alternatives --config java
v. Choose the sun java option, in my case it was 2.
vi. Test using java -version.
my java path: /usr/lib/jvm/jdk1.7.0/jre/bin/java




Download and install from Internet:

Google Chrome

Google Earth

Google video chat


enable Canonical Partners packagesin order to be able to install
Skype
Oracle (Sun) Virtual Box



Xubuntu terminal cursor blinking
Edit ~/.config/Terminal/terminalrc
and change:
MiscCursorBlinks=FALSE
...to read:
MiscCursorBlinks=TRUE


XKB Keyboard Fix:
Source: https://bugs.launchpad.net/ubuntu/+source/xfce4-xkb-plugin/+bug/548631/comments/54

I used the following instructions given from a Romanian gentleman and
it worked. Source: http://askubuntu.com/a/113517

As the best previous answer appears to be commented afterwards by the
user as not working anymore, I will give here an updated perfected
version of a quite successful workaround. Sorry not to be able to
provide a more scientific less empirical approach, I am not an
advanced user, just had the luck to get what I want in this case and
want to share this, maybe as a temporary patchwork. So, bare with me.
I use Xubuntu, maybe some instructions are limited to that.

My solution is this (my case is English-US as default, second French,
third Romanian standard - replace accordingly):

Go to Setting Manager - Keyboard - Layout, and set the languages in
the preferred order (delete them and add them in order to achieve
this). Go to the properties of the xkb plugin and make the same
settings in the same order with the same default language.

Open the file /home/username/.config/xfce4/xfconf/xfce-perchannel-xml/keyboard-layout.xml
Edit it to look similar to this:

<?xml version="1.0" encoding="UTF-8"?>

<channel name="keyboard-layout" version="1.0">
 <property name="Default" type="empty">
   <property name="XkbDisable" type="bool" value="false"/>
   <property name="XkbLayout" type="string" value="us,fr,ro"/>
   <property name="XkbVariant" type="string" value=",,std"/>
 </property>
</channel>

Open the file /home/username/.config/xfce4/panel/xkb-plugin-##.rc
Edit it to look similar to this:

display_type=1
group_policy=0
default_group=0
never_modify_config=false
model=pc105
layouts=us,fr,ro
variants=,,std
toggle_option=grp:alt_shift_toggle
compose_key_position=

Open the file (as root) /etc/default/keyboard
Edit it accordingly:

XKBMODEL="pc105"
XKBLAYOUT="no,bg"
XKBVARIANT=",phonetic"
XKBOPTIONS="grp:lwin_toggle"



------------------------------

Linux help tips

AVCHD convert to mpeg, taken from: http://ubuntuforums.org/showthread.php?t=1330676

find ~/encode -name '*.MTS' -type f -exec mencoder '{}' -oac copy -ovc lavc -of mpeg -mpegopts format=dvd -vf scale=1920:1080,harddup -lavcopts vcodec=mpeg2video:vrc_buf_size=1835:vrc_maxrate=9800:vbitrate=8000:keyint=15:aspect=16/9:threads=4 -vf lavcdeint -ofps 25 -fps 50 -o '{}'.mpg \;


------------------------------

This exports X11 from remote machines:
ssh -Y x.x.x.x

------------------------------

If Upgrade problems:
then fix with:

sudo dpkg --clear-avail

------------------------------

Bypass Youtube Regional Filtering

Some videos are only available in certain parts of the world. Your IP Address is used to determine your location and then allow or deny access to the video. Change the url from http://www.youtube.com/watch?v=<somecode> to http://www.youtube.com/v/<somecode>

------------------------------


How to Disable 'System Program Problem Detected' Errors in Ubuntu 12.04 LTS?
It used to happen very rarely when I first installed Ubuntu 12.04 LTS. But after several upgrades and new software installations, these errors have become more common place and sometimes annoying even. Disabling Apport permanently helped me solve this issue. This should work for you as well. Follow the steps.


sudo nano /etc/default/apport

disable apport in ubuntu 12.04 lts

    Change value of "enabled" from 1 to 0 (instructions are provided in the text file itself).

    Save and exit. Do a system reboot. Everything should work fine from now on.

------------------------------
Time update manually

sudo ntpdate -s -b -p 8 -u time.isnet.is

------------------------------
More themes:

sudo apt-get install xfwm4-themes

------------------------------
W510 mouse problem

to me
add this

echo N > /sys/module/drm_kms_helper/parameters/poll
exit 0

to /etc/rc.local

source: https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/926714
comment #17 a
------------------------------  

Fix slow Thunar:

sudo nano /usr/share/gvfs/mounts/network.mount

change to AutoMount=false

------------------------------  

Best Xfce terminal colors, font and a blinkig cursor
the font is Liberation Mono, Size 10.



(from http://ethanschoonover.com/solarized)

edit the file
nano .config/Terminal/terminalrc
add this:

[Configuration]
ColorCursor=#9393a1a1a1a1
ColorForeground=#FDFDF6F6E3E3
ColorBackground=#00002B2B3636
ColorPalette1=#070736364242
ColorPalette2=#dcdc32322f2f
ColorPalette3=#858599990000
ColorPalette4=#b5b589890000
ColorPalette5=#26268ae0d2d2
ColorPalette6=#d3d336368282
ColorPalette7=#eeeee8e8d5d5
ColorPalette8=#58586e6e7575
ColorPalette9=#00002b2b3636
ColorPalette10=#cbcb4b4b1616
ColorPalette11=#2a2aa1a19898
ColorPalette12=#65657bfb8383
ColorPalette13=#838394949696
ColorPalette14=#6c6c7171c4c4
ColorPalette15=#9393a1a1a1a1
ColorPalette16=#fdfdf6f6e3e3
Term=xterm-color
FontName=Liberation Mono 10
MiscAlwaysShowTabs=FALSE
MiscBell=FALSE
MiscBordersDefault=TRUE
MiscCursorBlinks=TRUE
MiscCursorShape=TERMINAL_CURSOR_SHAPE_BLOCK # _BLOCK (the default), _IBEAM, _UNDERLINE
MiscDefaultGeometry=80x24
MiscInheritGeometry=FALSE
MiscMenubarDefault=TRUE
MiscMouseAutohide=FALSE
MiscToolbarsDefault=FALSE
MiscConfirmClose=TRUE
MiscCycleTabs=TRUE
MiscTabCloseButtons=TRUE
MiscTabCloseMiddleClick=TRUE
MiscTabPosition=GTK_POS_TOP
MiscHighlightUrls=TRUE
BackgroundMode=TERMINAL_BACKGROUND_TRANSPARENT
BackgroundDarkness=0.840000



