
et -e

# Pull down the rest of this archive, gain superuser, install everything.
curl -L https://github.com/venantius/bootstrap-bash/archive/master.zip > master.zip

# Ubuntu 12.04 (and maybe some others?) doesn't ship with unzip, so just in case...
if [ ! -x $"`which unzip`" ]; then
    apt-get install unzip
fi
unzip master.zip
rm master.zip
cd bootstrap-bash-master
echo "Assuming superuser powers now!"
sudo bash bootstrap.sh
cd ..
rm -rf bootstrap-bash-master
echo "All done! :)"



