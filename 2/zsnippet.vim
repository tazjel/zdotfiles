%s/paper/\$\{1\:#\}/g
w! ~/zdotfiles/2/english/english.snippet
%s/X/\$\{1\:#\}/gc
%s/X/\$\{2\:#\}/gc
%s/Z/\$\{3\:#\}/gc


%s/0/\$\{1\:#\}/gc
%s/X/\$\{2\:#\}/gc
%s/Z/\$\{3\:#\}/gc





%s/^/snippet\s\s\s\s\sXXX/\$\{0\:#\}/gc

%s/^/snippet     XXX/\$\{0\:#\}/gc
%s/^/snippet\tXXX/\$\{0\:#\}/gc
%s/^/snippetXXX/\$\{0\:\#\}/gc
%s/^/snippet/\$\{0\:\#\}/gc

/home/ahmed/zdotfiles/2
%s:^:snippet\$\{0\:\#\}/gc
%s/Y/\$\{3\:#\}/gc
%s:^\w:snippet XXX\r\t$\{0\:\#\}/gc
%s:^\w:snippet XXX\r\t:gc

