#!/usr/bin/env bash

# Reference : http://fideloper.com/user-group-permissions-chmod-apache
# First
# We need to set the owner/group of the web root (and any directories/files 
# therein):

sudo chown -Rv www-data:www-data /home/www-data
# Second
# We need to setup the proper permissions for users and groups. We do some blanket 
# commands restricting access, and then open access up as much as we need to.

# To start, make it so no-one but the current user (www-data) can access the 
# web-root content. We use 'go', meaning apply to 'group' and 'other'. We use '-', 
# which means remove permissions. We use 'rwx' to remove read, write and execute 
# permissions.

sudo chmod go-rwx /home/www-data
# Next, allow users of the same group (and 'other') to enter the /var/www 
# directory. This is not done recursively. Once again, we use 'group' and 'other' 
# but we use '+' to allow the execute ('x') permission.

sudo chmod go+x /home/www-data

# Next, change all directories and files in the web root to the same group 
# (www-data) - just in case there are files in there currently:

sudo chgrp -Rv www-data /home/www-data
# Next, let's do another "reset" of sorts - Make it so only the user can access 
# web content:

sudo chmod -Rv go-rwx /home/www-data
# And finally, make it so anyone in the same group can ready/write and execute 
# directories/files in the web root.

sudo chmod -Rv g+rx /home/www-data
# I actually give group write permissions as well, for users which need to modify 
# content, such as users used to deploy code. That looks like this:


sudo chmod -Rv g+rwx /home/www-data
sudo restart uwsgi-emperor
echo
echo "www"
echo 'ww'
echo 'تم'
