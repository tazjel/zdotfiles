autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line
export EDITOR=vim


function chpwd() {
  ls
}
function cd {
  builtin cd "$@" && ls -F
}
