EXCLUDED="- junk/
- .thumbnails/
- .googleearth/
- .macromedia/
- .cache/
- .kde/
- .config/chromium/
- .config/google-chrome/
- .config/akonadi/
- .config/Terminal/
- .local/share/local-mail/
- .mozilla/
- .thumbnails/
- .thunderbird/
- .kompozer.net/
- .jedit/
- .fontconfig/
- .local/share/Trash/
- .local/share/akonadi/
- Desktop/
- Documents/
- Downloads/
- Dropbox/
- Music/
- Pictures/
- Public/
- RetroPie-Setup/
- Templates/
- Videos/
- bkpdir/
- bkupdir/
- zdotfiles/
- zzz_bkp/
- .dropbox/
- .local/share/zeitgeist/
- font/
- .spf13-vim-3/
"


BKUPDIR=$HOME/bkupdir
echo "${EXCLUDED}" | rsync -vax --delete /home/abobani --cvs-exclude --exclude-from=- --delete-excluded ${BKUPDIR}
