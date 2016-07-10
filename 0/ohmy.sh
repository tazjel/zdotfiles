curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | bash
cd ~
git clone --recursive https://github.com/DxCx/MyVimRc .vim_config
cd .vim_config
echo source ~/.vim_config/vimrc.vim > ~/.vimrc
git config --global core.editor "vim"
git config --global merge.tool "vimdiff"
chsh ${LOGNAME} -s /bin/zsh
