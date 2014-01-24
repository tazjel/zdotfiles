#!/usr/bin/env bash
############################  SETUP PARAMETERS
git_branch='A'
debug_mode='0'
app_version='0.3'
############################  NAMES SETUP
zdotfiles=$HOME/zdotfiles
LINKS=$HOME/zdotfiles/link

#for FF in $(echo $XXP) ; do if [ -L $FF ] ; then echo -e ">>>>>> $FF ]]" ; else echo -e "$FF" ;fi;done
#for FF in $(find $HOME -maxdepth 1 -exec basename {} \;) ; do if [ -L $FF ] ; then echo -e "0 = $FF" ;else echo "1= $FF";fi;done
XXP=$(find $HOME -maxdepth 1)
############################  BASIC SETUP TOOLS

msg() {
    printf '%b\n' "$1" >&2
}

success() {
    msg "\e[32m[✔]\e[0m ${1}${2}"
}

z_error() {
    msg "\e[31m[✘]\e[0m ${1}${2}"
}


lnif() {
    if [ -e "$1" ]; then
        ln -sf "$1" "$2"
    fi
    ret="$?";
}
#####################################################
#
#
####################################################
#

w__prepare() {
  cd ${zdotfiles}/6
  sed -i -e 's|^#!/usr/bin/env python$|#!/usr/bin/env python2|' $(find ${zdotfiles}/6 -name '*.py');
}

wWw_git_up_ssh() {
    echo "Check for SSH key and generate one if it doesn't exist."
    [[ -f ~/.ssh/id_rsa.pub ]] || ssh-keygen -t rsa -C "tazjel@gmail.com"
    echo "Copy public key to clipboard and paste it into your Github account."
    [[ -f ~/.ssh/id_rsa.pub ]] && cat ~/.ssh/id_rsa.pub | xclip -selection clipboard
    echo "Open www.github.com and add new SSH key."
    echo "Press <Enter> to continue."
    read NOW_READ
}

w__shutdown() {
    echo "Your machine will now restart to apply changes."
    sudo shutdown -r 0
}


z__install_base() {
    echo "Installing base packages.This will take a long time and download ~500 MB."
    sudo apt-get install git-core ruby kate libxml2-dev libxslt-dev libc6-dev build-essential gcc libgraphicsmagick1-dev libmagickwand-dev libreadline-dev ffmpeg file mysql-client mysql-server mysql-client mysql-server libmysqlclient-dev libssl-dev g++
}

# Ask for the administrator password upfront
 sudo -v
# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &



# Ask for the administrator password upfront
    sudo -v
# Keep-alive: update existing `sudo` time stamp until script has finished
        while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


T_FILES=`cd $LINKS;find . -maxdepth 1 \
    -not -name "assets" -and \
    -not -name "scripts" -and \
    -not -name "install.sh" -and \
    -not -name "\.DS_Store" -and \
    -not -name "\.gitignore" -and \
    -not -name "\.gitmodules" -and \
    -not -name "*\.dmg" -and \
    -not -name "*\.swp" -and \
    -not -name "*\.md" -and \
    -not -name "\.git" -and \
    -not -name "*~*" \
    -not -name "\." \
    -exec basename {} \;`
#####################################################
#
#


# Patch terminal font for Vim's Airline plugin
# See: https://powerline.readthedocs.org/en/latest/fontpatching.html
z__install_fonts(){
    mkdir ./powerline-fontconfig
    curl -fsSL https://github.com/Lokaltog/powerline/tarball/develop | tar -xvz --strip-components 2 --directory ./powerline-fontconfig -f -
    fontforge -script ./powerline-fontconfig/fontpatcher.py --no-rename ./assets/SourceCodePro-Regular.otf
    rm -rf ./powerline-fontconfig
# Install the patched font
    if $IS_OSX; then
        mkdir -p ~/Library/Fonts/
        mv ./Source\ Code\ Pro.otf ~/Library/Fonts/
    else
        mkdir -p ~/.fonts/
        mv ./Source\ Code\ Pro.otf ~/.fonts/
        # Refresh font cache
        sudo fc-cache -f -v
    fi
}

####################################################

w__HOME_DOTFILES=`cd $HOME;find . -maxdepth 1 \
    -not -name "assets" -and \
    -not -name "scripts" -and \
    -not -name "install.sh" -and \
    -not -name "\.DS_Store" -and \
    -not -name "\.gitignore" -and \
    -not -name "\.gitmodules" -and \
    -not -name "*\.dmg" -and \
    -not -name "*\.swp" -and \
    -not -name "*\.md" -and \
    -not -name "\.git" -and \
    -not -name "*~*" \
    -not -name "\." \
    -exec basename {} \;`
############################  SETUP PARAMETERS
    #for FF in $(echo $XXP) ; do if [ -L $FF ] ; then echo -e ">>>>>> $FF ]]" ; else echo -e "$FF" ;fi;done
    #for FF in $(find $HOME -maxdepth 1 -exec basename {} \;) ; do if [ -L $FF ] ; then echo -e "0 = $FF" ;else echo "1= $FF";fi;done
    XXP=$(find $HOME -maxdepth 1)
############################  BASIC SETUP TOOLS

error() {
    msg "\e[31m[✘]\e[0m ${1}${2}"
}


lnif()
 {
    if [ -e "$1" ]; then
        ln -sf "$1" "$2"
    fi
    ret="$?"
}

success() {
    msg "\e[32m[✔]\e[0m ${1}${2}"
}

error() {
    msg "\e[31m[✘]\e[0m ${1}${2}"
}


lnif() {
    if [ -e "$1" ]; then
        ln -sf "$1" "$2"
    fi
    ret="$?";
}

#####################################################
#http://www.pythonforbeginners.com/systems-programming/how-to-use-fabric-in-python/
#https://code.osuosl.org/projects/51/wiki/Install
# pip
z__install_py() {
    sudo apt-get install python-pip
    # devel libraries may be needed for some pip installs
    sudo apt-get install python-dev
    # install fabric and virtualenv
    sudo apt-get install python-virtualenv
    sudo apt-get install fabric


}

####################################################


app_names=(mercurial \
    vim \
    zsh \
    vim \
    xclip \
    curl \
    wget \
    dos2unix)

z__check_app_names() {
    for AA in $app_names ; do
        type $AA >/dev/null 2>&1 || msg "Error $AA" && z_install_basic
    done;
}


z_install_basic() {
    sudo apt-get install -y aptitude \
        git git-core git-gui git-doc \
        mercurial \
        vim \
        zsh \
        vim \
        xclip \
        curl \
        wget \
        dos2unix \
        md5deep
}


z_link_f() {
    zlink=$HOME/zdotfiles/link
    for f in $T_FILES; do
       lnif "$zlink/$f" "$HOME/$f"
    done
}


z_clear_all_symlinks() {
    zlink=$HOME/zdotfiles/link
    for f in $HOME; do
       unlink "$HOME/$f"
    done
}


z_un_link_HOME() {
    for FF in $(find $HOME -maxdepth 1) ; do
        if [ -e $FF ] && [ -L $FF ] ; then
            success " $FF"# && unlink $FF
        else
            z_error "1= $FF"
        fi;done;
}


z_hi(){
    success " \r
        -i) z_install_basic ;;
        -r) z_restore ;;
        -c) z_check_f ;;
        -l) z_link_f ;;
        -L) z_un_link_HOME ;;"
}


usage() {
    echo `basename $0`: z_error: $* 1>&2
    echo usage: `basename $0` '[-a] [-b] [-c]
        [file ...]' 1>&2
    exit 1
}


z_clear_all_symlinks() {
    rm ~/.bashrc \
    rm ~/.zshrc \
    rm ~/.vimrc \
    rm ~/.vimrc.local \
    rm ~/.vim \
    rm ~/.vimrc.bundles \
    rm ~/.vimrc.before
}

    z_ssh-keygen_rsa() {
    ssh-keygen -t rsa -C 'tazjel@gmail.com'
    xclip -sel clip < ~/.ssh/id_rsa.pub
    ssh -T git@github.com;
}


git_clone() {
    git clone git@github.com:tazjel/zdotfiles.git
    cd zdotfiles
    git remote add upstream git@github.com:tazjel/zdotfiles.git
    git remote set-url origin git@github.com:tazjel/zdotfiles.git
    git fetch upstream
}


z__user() {
    read name
    read email
    read email2
    read phone
    read Keys_A
    read Keys_B
    read address
}


z_install_git() {
    echo ">>> your e-mail address ?"
    read email
    echo ">>> Generating SSH key..."
    echo ">>> Please write down the name of file with the path to that directory..."
    ssh-keygen -t rsa -C "$email"
    success "Downloads and installs xclip. If you don't have `apt-get`, you might need to use another installer"
    sudo apt-get install xclip

    # Copies the contents of the id_rsa.pub file to your clipboard
    xclip -sel clip < ~/.ssh/id_rsa.pub
    echo ">>> Now, go to your specified directory and open SSH key file,"
    echo ">>> Copy everyting inside and paste to SSH Keys part of your github account..."
    echo ">>> When you done that press any key to continue..."
    success "Go to : https://github.com/settings/ssh"

    read -t 5000
    echo ">>> Lets check if everything is OK..."
    ssh -T git@github.com

    echo ">>> Please give your name & surname..."
    read name_and_surname

    git config --global user.name "$name_and_surname"
    git config --global user.email "$email"

    echo ">>> THE END";
}

z__now() {
    NOW=$(date +"%a")
    case $NOW in
    Mon)
        echo "Full backup";;
    Tue|Wed|Thu|Fri)
        echo "Partial backup";;
    Sat|Sun)
        echo "No backup";;
    *) ;;
    esac
}


z_install_vimrc(){
    endpath="$HOME/.$app_name-3"
    lnif "$endpath/.vimrc"              "$HOME/.vimrc"
    lnif "$endpath/.vimrc.bundles"      "$HOME/.vimrc.bundles"
    lnif "$endpath/.vimrc.before"       "$HOME/.vimrc.before"
    lnif "$endpath/.vim"                "$HOME/.vim"

    # Useful for fork maintainers
    lnif "$LINKS/.vimrc.local" "$HOME/.vimrc.local"
    # Useful for fork maintainers
    lnif "$LINKS/.vimrc.local" "$HOME/.vimrc.local"
}


z_symlink_easystroke () {
    #
    [ -e $HOME/.easystroke/actions-0.5.6 ] && rm -rf "$HOME/.easystroke/actions-0.5.6" && z_error "Removed easystroke/actions-0.5.6" && ls -al ~/.easystroke/ && ls -al ~/.easystroke && read -p "w" wpw || success "no -e  symlink";
    #
    lnif "$HOME/zdotfiles/link/.easystroke/actions-0.5.6" "$HOME/.easystroke/actions-0.5.6" && success "link easystroke/actions-0.5.6" && ls -al ~/.easystroke/;
    #
   lnif "/home/w/zdotfiles/link/.easystroke/preferences-0.5.5" "$HOME/.easystroke/preferences-0.5.5" && success "link easystroke";

    #lnif "$HOME/zdotfiles/link/.easystroke/preferences-0.5.5" "$HOME/.easystroke/actions-0.5.6" \
        #&& success "B"

        #sudo chown -R w:w "$HOME/.easystroke" && success "removed"
        #sudo w -R w:w "$HOME/.easystroke" && success "removed "
        #success "symlink"
    #else
        #mkdir "$HOME/.easystroke" && success "removed "
        #lnif "$HOME/zdotfiles/link/.easystroke/actions-0.5.6" "$HOME/.easystroke/actions-0.5.6" && success "removed "
        #lnif "$HOME/zdotfiles/link/.easystroke/preferences-0.5.5" "$HOME/.easystroke/actions-0.5.6" && success "removed "
        #success "symlink "
    #fi
}


z_check_f() {
        [ -e $HOME/.easystroke ] && success "actions-0.5.6" "Yes" || z_error "actions-0.5.6"
    [ -e $(pgrep easystroke) ] && success "easystroke" "On" || z_error "Off";
    [ -e $(pgrep easystroke) ] && success "easystroke" "On" || z_error "Off";

}

z__install_spf() {
   #. /home/w/zdotfiles/0/spf3-new.sh
    sudo apt-get install curl
    sh <(curl http://j.mp/spf13-vim3 -L)
}


wWw_git_up() {
    cd $HOME/zdotfiles
    git add -A
    git commit -a
    git push --all
    git push origin --all && git push origin --tags;
}



function w_tmp() {
    tempfile='/tmp/chosendir'
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

w_Do_we_have_command() {
    which "$1" > /dev/null 2>&1 && echo "Success!";
}




while :
do
case $1 in
        i|-i) z_install_basic ;;
        -r) z_restore ;;
        c|-c) z_check_f ;;
        -l) z_link_f ;;
        e|-e) z_symlink_easystroke ;;
        -L) z_un_link_HOME ;;
        -g) z_install_git ;;
        s|-s) z__install_spf ;;
        w|-w) wWw_git_up ;;
        -*) error "bad argument $1";;
        *) break;;
esac
shift
done
