# Copy w/ progress
cp_p () {
  rsync -WavP --human-readable --progress $1 $2
}

#https://github.com/gf3/dotfiles/blob/master/.functions
