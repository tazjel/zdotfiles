bkup_z() {
    unset f
    for f in "$T_FILES"; do 
    source="${LINKS}/${f}" && \
    echo "Source = $source" \ 
    target="${HOME}/$f" && echo "Target = $target/$f"; done\
    unset f
}

