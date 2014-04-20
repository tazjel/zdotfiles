Work in progress...

#

A Brief Description of zdotfiles
Features

Raspberry Pi WebIDE Installation & Setup

Introduction/
A Brief Description
A Brief History
Future Directions
Technical Appendix
Tips and Tricks


Conflict Analysis and Resolution

### بسم الله الرحمن الرحيم
### ماشاء الله لا قوة الا بالله

النظام خاص لذوي الإحتياجات الخاصة
إعداد وتنفيذ : احمد باني الغامدي

Author : Ahmed Al-Ghamdi

=========
Work in progress

=========

# To install run the following command :

cd $HOME && git clone https://github.com/tazjel/zdotfiles.git
rm ~/.zshrc; ln -s ~/zdotfiles/link/.zshrc
rm ~/.vimrc.local; ln -s ~/zdotfiles/link/.vimrc.local
zsh && ranger


Quote of the day:
The UNIX philosophy - "Write programs that do one thing and do it well. Write programs to work together. Write programs to handle text streams, because that is a universal interface."
-- Ref: uzbl.org

zdotfiles

### 1-First Diminsion :
    Command line
    Commands = [ls, sed,..]

### 2- Second Diminsion :
     Text Editor
     Command = [vim,]


### 3- Third Diminsion :
     Directory;File/Folder Manager
     Commands = [ranger, Nerdtree, Texplore,]

### 4- Fourth Diminsion :
     Access : User timeline
     Commands = [history, undotree,]

### 5- Fivth Diminsion :
     Access : Current processes
     commands = [ps, lsof,]

### 6- Sixth Diminsion :
     Access : User applications
     Productivity = [Autokey, shortcuts,]

### 7- Seventh Diminsion :
     Access : Root - System Administration
    
Commands = [fdisk, mount, dd, parted, modprobe, df, proot, ]

### 8- Eighth Diminsion
     Access : Other's servers
     Internet Access to your account on-line
     Commands = [curl, wget, web2py(imap), ]

### 9- Nineth Diminsion
     Access : Your Server as a Root/Administrator
     Commands = [ssh, ftps, ]

### 10- Peace. Controll your system with a perspective.
    Happy-Ever-after...



### Manual (not recommended)

1. Install the
   [zdotfiles](https://github.com/tazjel/zdotfiles.git)/

2. Put file in your Home directory (usually `~/zdotfiles/`)

# Clone zdotfiles
git clone git://github.com/tazjel/zdotfiles.git

