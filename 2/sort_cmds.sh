# commandlinefu.com by David Winterbottom

# list the top 15 folders by decreasing size in MB
du -xB M --max-depth=2 /var | sort -rn | head -n 15

# List mp3 files with less than 320 kbps bitrate.
find -name '*.mp3' -exec mp3info {} -p "%F: %r kbps\n" \;  | sort | sed '/320 kbps/d'

# check your up to date delicious links.
curl -k https://Username:Password@api.del.icio.us/v1/posts/all?red=api | xml2| \grep '@href' | cut -d\= -f 2- | sort | uniq | linkchecker -r0 --stdin --complete -v -t 50 -F blacklist

# most used unix commands
awk '{print $1}' ~/.bash_history | sort | uniq -c | sort -rn | head -n 10

# List directories sorted by (human readable) size
du -h --time --max-depth=1 | sort -hr

# Mapreduce style processing
parallel -j 50 ssh {} "ls" ::: host1 host2 hostn | sort | uniq -c

# Prints total line count contribution per user for an SVN repository
svn ls -R | egrep -v -e "\/$" | tr '\n' '\0' | xargs -0 svn blame | awk '{print $2}' | sort | uniq -c | sort -nr

# Display unique values of a column
cut -d',' -f6 file.csv | sort | uniq

# Show number of connections per remote IP
netstat -antu | awk '$5 ~ /[0-9]:/{split($5, a, ":"); ips[a[1]]++} END {for (ip in ips) print ips[ip], ip | "sort -k1 -nr"}'

# Show number of connections per remote IP
netstat -antu | awk '{print $5}' | awk -F: '{print $1}' | sort | uniq -c | sort -n

# Yardstick static analysis report sorted by which JavaScript files have the highest ratio of comments to code.
find . -name *js -type f | xargs yardstick | sort -k6 -n

# Find LVM Volume Group name for a block device
cat /sys/block/md1/holders/dm*/dm/name | awk -F- '{print $1}' | sort -u

# List LVM Volume Groups as an unprivileged user
cat /sys/block/{*,*/*}/holders/dm*/dm/name | awk -F- '{print $1}' | sort -u

# Get fresh FollowBack list for Twitter
for a in $(seq 5 8); do cat twit.txt | cut -d " " -f$a | grep "^@" | sort -u; done > followlst.txt

# Find today created files
find -maxdepth 1 -type f -newermt "00:00" -printf "%f\n" | sort

# Find top 5 big files
ls -Sh **/*(.Lm+100) | tail -5

# Find files and list them sorted by modification time
find -type f | xargs ls -1tr

# Display 16 largest installed RPMs in size order, largest first
rpm -qa --queryformat '%{size} %{name}-%{version}-%{release}\n' | sort -k 1,1 -rn | nl | head -16

# Find top 5 big files
count=0;while IFS= read -r -d '' line; do echo "${line#* }"; ((++count==5)) && break; done < <(find . -type f -printf '%s %p\0' | sort -znr)

# Find top 5 big files
find . -type f -exec ls -s {} \; | sort -n -r | head -5

# list unique file extensions recursively for a path, include extension frequency stats
find /some/path -type f -printf '%f\n' | grep -o '\..\+$' | sort | uniq -c | sort -rn

# list unique file extensions recursively for a path, include extension frequency stats
find /some/path -type f | gawk -F/ '{print $NF}' | gawk -F. '/\./{print $NF}' | sort | uniq -c | sort -rn

# Change wallpaper random
feh --bg-scale "`ls -d $HOME/backgrounds/* |sort -R |tail -1`"

# Show git branches by date - useful for showing active branches
git for-each-ref --sort=-committerdate --format="%1B[32m%(committerdate:iso8601) %1B[34m%(committerdate:relative)  %1B[0;m%(refname:short)" refs/heads/

# Fetch all GPG keys that are currently missing in your keyring
for i in `gpg --list-sigs | perl -ne 'if(/User ID not found/){s/^.+([a-fA-F0-9]{8}).*/\1/; print}' | sort | uniq`; do gpg --keyserver-options no-auto-key-retrieve --recv-keys $i; done

