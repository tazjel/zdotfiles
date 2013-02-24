
#"   01. General ................. General Vim behavior                       "
#"   02. Events .................. General autocmd events                     "
#"   03. Theme/Colors ............ Colors, fonts, etc.                        "
#"   04. Vim UI .................. User interface behavior                    "
#"   05. Text Formatting/Layout .. Text, tab, indentation related             "
#""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
#" 01. General                                                                "
#""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
#""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""l
#" MAKE IT EASY TO UPDATE/RELOAD _vimrc
##:nmap ,s :source $VIM/_vimrc
##:nmap ,v :e $VIM/_vimrc
##:e $MYVIMRC         : edits your _vimrc whereever it might be  [N]
#--------------
alias gll='git add -A; git commit -a; git push origin master'

#function xp=(a.txt b.txt);for x in aliases.zsh oh-my-zsh.sh .zshrc;echo 'moving -> .zshrc to --> ~/zdotfiles/zsh' && mv .zshrc ~/zdotfiles/zsh
