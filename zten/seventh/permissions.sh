#!/bash

# notes
# site1/w2p
# User1/ www-data

# Add www-data to the newly created group,
sudo addgroup w2p


sudo adduser www-data w2p
# Check that www-data is really in that group,

groups www-data
# The output should be a list something like,

# user1 : <other-groups> w2p
# Now we can change the group ownership of your intended directory.

sudo chown -vR :w2p /home/www-data/web2py/applications/

# changed ownership of /home/www-data/web2py/applications

# from root:root to :w2p
# Grant write permission to this new group owner,

sudo chmod -vR g+w /home/www-data/web2py/applications

# mode of /home/www-data/web2py/applications changed from 0755 (rwxr-xr-x) to 0775 (rwxrwxr-x) 

# Check that all the changes are indeed there,

ls -ld  /home/www-data/web2py/applications/  

# drwxrwxr-x 2 root site1 4096 Oct 24 21:06 
# So, the directory now is owned by user root, group site1. Both user root and group site1 have write permission (plus read and execute permissions) to the directory. Any user belonging to group site1 will enjoy all the privileges granted to that group.

# Now login as user1, move to site1 directory and try to create a file in that directory,

echo "My www-data w2p " > index.html 

# bash: index.html: Permission denied
# This failed since most likely the primary group of user1 is not site1. So, change to that group.

# newgrp - w2p

# Try to recreate the file (beware that you have been moved to the home directory of user1 after changing group), this should work now. Since the created files will have world read permission, apache (or your web server) should not face any problem accessing them.

# Also, as pointed out by dan08 in comment, you need to add www-data to w2p group.

sudo adduser www-data w2p
