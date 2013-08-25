sudo apt-get install -y vim zsh konsole xclip git-core openssh-server curl wget
sudo add-apt-repository -y ppa:cdekter/ppa
sudo apt-get update
sudo apt-get install -y autokey 



git config --global user.name 'Ahmed at zDell'
git config --global user.email 'tazjel@gmail.com'
git config --list


git config --global color.ui auto
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'

ssh-keygen -t rsa -C 'tazjel@gmail.com'

xclip -sel clip < ~/.ssh/id_rsa.pub
ssh -T git@github.com

git clone https://github.com/tazjel/zdotfiles.git
cd zdotfiles
git remote add upstream https://github.com/tazjel/zdotfiles.git
git fetch upstream

sh ~/zdotfiles/0/spf13.sh

