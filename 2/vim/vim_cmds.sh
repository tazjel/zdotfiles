# commandlinefu.com by David Winterbottom

# Use Vim to convert text to HTML.
vimhtml() { [[ -f "$1" ]] || return 1; vim +'syn on | run! syntax/2html.vim | wq | q' "$1";}

# Open a file using vim in read only (like less)
vim -R /etc/passwd

# Go to a specified line in a file
vim +143 filename.txt

# The single most useful thing in bash
vim ~/.inputrc

# call vim help page from shell prompt
function :h { vim +":h $1" +'wincmd o' +'nnoremap q :q!<CR>' ;}

# vi a remote file with port
vim sftp://[user@]host.domain.tld:[port]/[path/][file]

# vim multiple files at one time, split vertically.
vim -O file1 file2

# How to search for files and open all of them in tabbed vim editor.
sudo find / -type f -name config.inc.php -exec vim -p {} +

# Grep inside Vim and navigate results
:vimgrep pattern %

# Improve Emacs
alias emacs='vim'

# Compare local and remote files using SCP/VIM/DIFF
vimdiff local_dir1/local_file.xml scp://user@remote_host//remote_absolute_location/remote_file.xml

# Open (in vim) all modified files in a git repository
vim `git status --porcelain | sed -ne 's/^ M //p'`

# This little command edits your gitignore from anywhere in your repo
vim $(git rev-parse --show-toplevel)/.gitignore

# Open (in vim) all modified files in a git repository
vim `git status | grep modified | awk '{print $3}'`

# Open all files with a regular expression in vim
vim $(grep [REGULAR_EXPRESSION] -R * | cut -d":" -f1 | uniq)

# Multiple open files and go directly to the line where some string is
grep -rl string_to_find  public_html/css/ | xargs -I '{}' vim +/string_to_find  {} -c ":s/string_to_find/string_replaced"

# Open multiple files from STDIN with VIM
vim -p $(complicated command to list the files you want)

# open two files on top of each other in vim (one window, two panes)
vim -o file1 file2

# open two files side by side in vim (one window, two panes)
vim -O file1 file2

# open two files in vim
vim file1 file2

# Edit 2 or more files in vim using vim -d
vim -O file1 file2

# Edit 2 or more files in vim using vim -d
vim -d '+diffoff!' file1 file2

# use vim to get colorful diff output
vimdiff file1 file2

# Alias nasty quick vim habits
alias ':q'='exit'; alias ':e'='vim';

# Use vim automation to create a colorized html file
file=<filename>;vim ${file} -e -s -c 'runtime! syntax/syntax.vim' -c 'runtime! syntax/2html.vim' -c "w ${file}.html" -c 'q!' -c 'q!' > /dev/null

