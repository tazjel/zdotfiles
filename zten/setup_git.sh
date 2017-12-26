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

zgit_set_user() {
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
