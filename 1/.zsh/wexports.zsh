export KEYTIMEOUT=1

#Time zone
export TZ=Asia/Riyadh


# Currently this path is appended to dynamically when picking a ruby version
# zshenv has already started PATH with rbenv so append only here
    export PATH=$PATH~/bin:/usr/local/bin:/usr/local/sbin:~/bin


# TODO: Set default console Java to 1.6
    export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home


# Setup terminal, and turn on colors
    export TERM=xterm-256color
    export CLICOLOR=1
    export LSCOLORS=Gxfxcxdxbxegedabagacad


# Enable color in grep
    export GREP_OPTIONS='--color=auto'
    export GREP_COLOR='3;33'


# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
    export ARCHFLAGS='-arch x86_64'

# vim
export EDITOR='vim'
export LESS='--ignore-case --raw-control-chars'
export PAGER='less'
export LESS="-R"


# PYTHONPATH
export PYTHONPATH=/usr/local/lib/python2.7/dist-packages
export PYTHONPATH=/usr/share/python:/usr/local/share/python:$PYTHONPATH
export PATH=/usr/local/opt/ruby/bin:/usr/local:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:
export PATH=$PATH:/usr/local/sbin


# Virtual Environment Stuff
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/Projects/django


#source $HOME/.locl/bin/virtualenvwrapper.sh
#source /usr/local/bin/virtualenvwrapper.sh
## Might want these three in your .bashrc
    export PATH=$PATH:$HOME/.local/bin
    export VIRTUALENVWRAPPER_VIRTUALENV_ARGS="--distribute"

# Terminal 256 colors
    export TERM="xterm-256color"

    #export PYTHONDONTWRITEBYTECODE=1
    export PYTHONUNBUFFERED=True
    export VIRTUALENV_DISTRIBUTE=true


# Unicode Locale environment variables (See: Unicode HowTo):
#export LANGUAGE=ar:ar_SA.UTF-8:en:C:en_US.UTF-8:en_GB
export LC_ALL=en_US.UTF-8:ar_SA.UTF-8
export LANG=en_US.UTF-8:ar_SA.UTF-8
# CTAGS Sorting in VIM/Emacs is better behaved with this in place
export LC_COLLATE=C
export LESSCHARSET=UTF-8


# dotfiles;zsh_history
ZPATHS=$tazjel
export tazjel=$HOME/zdotfiles
export hz=$HOME/.zsh_history



#export LANGUAGELIST=ar_SA:en_GB:en:C
#export FALLBACKLOCALE=C
#export COUNTRY=SA
#export G_BROKEN_FILENAMES=1
#export CHARSET=ISO_8859-6
