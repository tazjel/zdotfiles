zeslobi=~/zdotfiles/0/arabic/eslobi.sh 
WWW_path=$zeslobi

function zWWW {
    desc="ADD DESCRIPTION..."
    if [ -n "$3" ]; then
        desc="$3"
    fi
    echo "" >> $WWW_path
    echo "# $desc" >> $WWW_path
    echo '# "$1"="$2" ' >> $WWW_path
    tail -7 $WWW_path
    echo "" && echo "- Alias added  $1 = $2 " && echo "";
}

alias "سم"="alias"
alias "قل"="echo"
alias "اكتب"="vim"
alias "اقرا"="cat"
alias "اكتب عربي"="vim -A"
alias "اعد"="zsh"
alias "نظف"="clear"
alias "التاريخ"="clear"

alias "التحديث"="agg"

# ADD DESCRIPTION...
# "$1"="$2" 

# ADD DESCRIPTION...
# "$1"="$2" 

# ADD DESCRIPTION...
# "$1"="$2" 

# /home/tazjel/zdotfiles/0/arabic/eslobi.sh
# "$1"="$2" 
