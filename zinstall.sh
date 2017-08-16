#!/usr/bin/env bash

#   Copyright 2017 Ahmed Bani
#

############################  SETUP PARAMETERS
app_name='zdotfiles'
[ -z "$APP_PATH" ] && APP_PATH="$HOME/zdotfiles"
[ -z "$APP_PATH/APP_PATH_link" ] && APP_PATH_link="$HOME/zdotfiles/link"
[ -z "$REPO_URI" ] && REPO_URI="https://github.com/tazjel/zdotfiles.git"
[ -z "$REPO_BRANCH" ] && REPO_BRANCH='Z'
debug_mode='0'
fork_maintainer='0'

############################  BASIC SETUP TOOLS
msg() {
    printf '%b\n' "$1" >&2
}

success() {
    if [ "$ret" -eq '0' ]; then
        msg "\33[32m[✔]\33[0m ${1}${2}"
    fi
}

error() {
    msg "\33[31m[✘]\33[0m ${1}${2}"
    exit 1
}

debug() {
    if [ "$debug_mode" -eq '1' ] && [ "$ret" -gt '1' ]; then
        msg "An error occurred in function \"${FUNCNAME[$i+1]}\" on line ${BASH_LINENO[$i+1]}, we're sorry for that."
    fi
}

program_exists() {
    local ret='0'
    command -v $1 >/dev/null 2>&1 || { local ret='1'; }

    # fail on non-zero return value
    if [ "$ret" -ne 0 ]; then
        return 1
    fi

    return 0
}

program_must_exist() {
    program_exists $1

    # throw error on non-zero return value
    if [ "$?" -ne 0 ]; then
        error "You must have '$1' installed to continue."
    fi
}

variable_set() {
    if [ -z "$1" ]; then
        error "You must have your HOME environmental variable set to continue."
    fi
}

lnif() {
    if [ -e "$1" ]; then
        ln -sf "$1" "$2"
    fi
    ret="$?"
    ebug
}

############################ SETUP FUNCTIONS

do_backup() {
    if [ -e "$1" ] || [ -e "$2" ] || [ -e "$3" ]; then
        msg "Attempting to back up your original vim configuration."
        today=`date +%Y%m%d_%s`
        for i in "$1" "$2" "$3"; do
            [ -e "$i" ] && [ ! -L "$i" ] && mv -v "$i" "$i.$today";
        done
        ret="$?"
        success "Your original vim configuration has been backed up."
        debug
   fi
}

sync_repo() {
    local repo_path="$1"
    local repo_uri="$2"
    local repo_branch="$3"
    local repo_name="$4"

    msg "Trying to update $repo_name"

    if [ ! -e "$repo_path" ]; then
        mkdir -p "$repo_path"
        git clone -b "$repo_branch" "$repo_uri" "$repo_path"
        ret="$?"
        success "Successfully cloned $repo_name."
    else
        cd "$repo_path" && git pull origin "$repo_branch"
        ret="$?"
        success "Successfully updated $repo_name"
    fi

    debug
}

create_symlinks() {
    local source_path="$1"
    local target_path="$2"

    lnif "$source_path/.vimrc"         "$target_path/.vimrc"
    # lnif "$source_path/.vimrc"         "$target_path/.vimrc"
    # lnif "$source_path/.vimrc.bundles" "$target_path/.vimrc.bundles"
    # lnif "$source_path/.vimrc.before"  "$target_path/.vimrc.before"
    # lnif "$source_path/.vim"           "$target_path/.vim"

    if program_exists "nvim"; then
        lnif "$source_path/.vim"       "$target_path/.config/nvim"
        lnif "$source_path/.vimrc"     "$target_path/.config/nvim/init.vim"
    fi

    # touch  "$target_path/.vimrc.local"

    ret="$?"
    success "Setting up vim symlinks."
    debug
}

setup_fork_mode() {
    local source_path="$2"
    local target_path="$3"

    if [ "$1" -eq '1' ]; then
        touch "$target_path/.vimrc.fork"
        touch "$target_path/.vimrc.bundles.fork"
        touch "$target_path/.vimrc.before.fork"

        lnif "$source_path/.vimrc.fork"         "$target_path/.vimrc.fork"
        lnif "$source_path/.vimrc.bundles.fork" "$target_path/.vimrc.bundles.fork"
        lnif "$source_path/.vimrc.before.fork"  "$target_path/.vimrc.before.fork"

        ret="$?"
        success "Created fork maintainer files."
        debug
    fi
}


############################ MAIN()
variable_set "$HOME"
program_must_exist "vim"
program_must_exist "git"

backup_vim() {
    do_backup  "$HOME/.vim" \
                "$HOME/.vimrc" \
                "$HOME/.gvimrc"
}

sync_repo       "$APP_PATH_link" \
                "$REPO_URI" \
                "$REPO_BRANCH" \
                "$app_name"

create_symlinks "$APP_PATH_link" \
                "$HOME"

setup_fork_mode "$fork_maintainer" \
                "$APP_PATH" \
                "$HOME"

sync_repo       "$HOME/.vim/bundle/vundle" \
                "$VUNDLE_URI" \
                "master" \
                "vundle"

setup_vundle    "$APP_PATH/.vimrc.bundles.default"

msg             "\nThanks for installing $app_name."
msg             "© `date +%Y` http://www.tazjel.com/"

zssh_make_new_key() {
  #ssh-keygen -t rsa -C 'tazjel@gmail.com'
  ssh-keygen -t rsa -C 'tazjel@gmail.com'
}

zssh_check_github() {
  ssh -T git@github.com
}

ssh-keygen_rsa() {
  ssh-keygen -t rsa -C 'tazjel@gmail.com'
  xclip -sel clip < ~/.ssh/id_rsa.pub
  ssh -T git@github.com
}

xclip_pass() {
  xclip -sel clip < ~/.ssh/id_rsa.pub
}

zgit_clone_zdotfiles() {
  git clone git@github.com:tazjel/zdotfiles.git
  cd zdotfiles
  git remote add upstream git@github.com:tazjel/zdotfiles.git
  git remote set-url origin git@github.com:tazjel/zdotfiles.git
  git fetch upstream
}

zgit_clone_zdotfiles() {
  git config --global user.name "Ahmed Bani"
  git config --global user.email "tazjel@gmail.com"
}

zgit_config() {
  git config --global credential.helper cache
  # Set git to use the credential memory cache
  git config --global credential.helper 'cache --timeout=3600'
  # Set the cache to timeout after 1 hour (setting is in seconds)
  git config --global color.ui auto
  ###########
  #Allow all Git commands to use colored output, if possible

  git config --global color.ui auto

  #Disable the advice shown by Git when you attempt to push something that’s not 
  fast forward-able

  #git config --global advice.pushNonFastForward false

  #Disable “how to stage/unstage/add” hints given by git status:

  git config --global advice.statusHints false

  #Tell Git which whitespace problems it should recognize, namely any 
  whitespace at the end of a line, as well as mixed spaces and tabs:

  git config --global core.whitespace trailing-space,space-before-tab

  #See the man page for more possible options on this.

  #Allow git diff to do basic rename and copy detection:

  git config --global diff.renames copies

  #Tell git diff to use mnemonic prefixes (index, work tree, commit, object) 
  instead of the standard a and b notation:

  git config --global diff.mnemonicprefix true

  #When branching off a remote branch, automatically let the local branch track 
  the remote branch:

  git config --global branch.autosetupmerge true

  #When pushing without giving a refspec, push the current branch to its upstream 
  branch. See the git config man page for more possible options.

  git config --global push.default tracking

  #Enable the recording of resolved conflicts, so that identical hunks can be 
  resolved automatically later on.

  git config --global rerere.enabled true

  #You may also want to investigate the rerere.autoupdate setting.
  #Always show a diffstat at the end of a merge:

  git config --global merge.stat true
}
