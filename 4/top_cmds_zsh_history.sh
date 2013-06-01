# The top ten commands you use
perl -pe 's/.+;//' ~/.zsh_history | sort | uniq -c | sort -r|head -10

