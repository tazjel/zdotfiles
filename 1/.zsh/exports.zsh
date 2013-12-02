export KEYTIMEOUT=1

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


# Currently this path is appended to dynamically when picking a ruby version

# zshenv has already started PATH with rbenv so append only here
    export PATH=$PATH~/bin:/usr/local/bin:/usr/local/sbin:~/bin

# Set default console Java to 1.6
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

export LESS='--ignore-case --raw-control-chars'
export PAGER='less'
export EDITOR='vim'
export LESS="-R"
#export NODE_PATH=/opt/github/homebrew/lib/node_modules


export PYTHONPATH=/usr/local/lib/python2.7/dist-packages

export PATH=/usr/local/opt/ruby/bin:/usr/local:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:

export PATH=$PATH:/usr/local/sbin

# CTAGS Sorting in VIM/Emacs is better behaved with this in place
    export LC_COLLATE=C


# Virtual Environment Stuff
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/Projects/django
    export tazjel=$HOME/zdotfiles
    export hz=$HOME/.zsh_history
#

#source $HOME/.locl/bin/virtualenvwrapper.sh
#source /usr/local/bin/virtualenvwrapper.sh
## Might want these three in your .bashrc
    export PATH=$PATH:$HOME/.local/bin
    export VIRTUALENVWRAPPER_VIRTUALENV_ARGS="--distribute"

# Terminal 256 colors
    export TERM="xterm-256color"
    export PYTHONDONTWRITEBYTECODE=1
    export PYTHONUNBUFFERED=True
    export VIRTUALENV_DISTRIBUTE=true
