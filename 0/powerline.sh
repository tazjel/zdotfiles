d ~
git clone https://github.com/Lokaltog/powerline-fonts
cd powerline-fonts
find -type d -not -iwholename '*.git*' -exec sudo mv {} /usr/share/fonts/ \;
cd ..
rm -Rf powerline-fonts
sudo fc-cache -vf
