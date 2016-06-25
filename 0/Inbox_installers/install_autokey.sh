sudo apt-get remove autokey
sudo add-apt-repository ppa:cdekter/ppa
sudo apt-get update
sudo apt-get install autokey-gtk
cd ~/.config
mv autokey autokey-backup
ln -s $HOME/zdotfiles/6/autokey
