# commandlinefu.com by David Winterbottom

# Fix grub2 boot failure using live cd
sudo grub-install --root-directory=/media/ubuntu /dev/sda

# GRUB2: Set Imperial Death March as startup tune
echo "GRUB_INIT_TUNE=\"480 440 4 440 4 440 4 349 3 523 1 440 4 349 3 523 1 440 8 659 4 659 4 659 4 698 3 523 1 415 4 349 3 523 1 440 8"\"" | sudo tee -a /etc/default/grub > /dev/null && sudo update-grub

# GRUB2: set Super Mario as startup tune
sudo bash -c 'echo "GRUB_INIT_TUNE=\"480 165 2 165 2 165 3 554 1 587 1 554 2 370 1 554 1 523 2 349 1 523 1 494 3 165 2 165 2 165 2\"" >> /etc/default/grub && update-grub'

# GRUB2: set Super Mario as startup tune
echo "GRUB_INIT_TUNE=\"1000 334 1 334 1 0 1 334 1 0 1 261 1 334 1 0 1 392 2 0 4 196 2\"" | sudo tee -a /etc/default/grub > /dev/null && sudo update-grub

