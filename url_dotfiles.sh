curl http://dotfiles.org/.vimrc >> VVV


abobani at ubuntu in ~/tst 
○ ag dotfiles.org ~/.zsh_history 
1163:: 1370509949:0;ag dotfiles.org
1164:: 1370510008:0;ag dotfiles.org wv
1551:: 1370560705:0;ag -l dotfiles.org
1554:: 1370560739:0;ag -l dotfiles.org
1557:: 1370560791:0;fn dotfiles.org
1558:: 1370560794:0;fn dotfiles.org .
1559:: 1370560800:0;fn .dotfiles.org
1560:: 1370560804:0;fn . dotfiles.org
1562:: 1370560829:0;qfind dotfiles.org
1563:: 1370560836:0;qfind ~ dotfiles.org
1566:: 1370560868:0;ls -R ~ G dotfiles.org
1570:: 1370560912:0;ag -l ~ dotfiles.org
1571:: 1370560930:0;ag -l / dotfiles.org
1572:: 1370560934:0;ag -l / "dotfiles.org"
1573:: 1370560955:0;wf dotfiles.org
2558:: 1370752430:0;wget -0 - dotfiles.org/.vimrc | grep -o '<a href=['"'"'"][^"'"'"']*['"'"'"]' | sed -e 's/^<a href=["'"'"']//' -e 's/["'"'"']$//'
2560:: 1370752557:0;wget -0 - http://dotfiles.org/.vimrc | grep -o '<a href=['"'"'"][^"'"'"']*['"'"'"]' | sed -e 's/^<a href=["'"'"']//' -e 's/["'"'"']$//'
2561:: 1370752572:0;wget -O - http://dotfiles.org/.vimrc | grep -o '<a href=['"'"'"][^"'"'"']*['"'"'"]' | sed -e 's/^<a href=["'"'"']//' -e 's/["'"'"']$//'
2564:: 1370752808:0;wget -O - http://dotfiles.org/.vimrc ~/tst/wget_vimrc | grep -o '<a href=['"'"'"][^"'"'"']*['"'"'"]' | sed -e 's/^<a href=["'"'"']//' -e 's/["'"'"']$//'
2569:: 1370752870:0;wget -O - http://dotfiles.org/.vimrc VV | grep -o '<a href=['"'"'"][^"'"'"']*['"'"'"]' | sed -e 's/^<a href=["'"'"']//' -e 's/["'"'"']$//'
2572:: 1370752947:0;wget -O - http://dotfiles.org/.vimrc VV
2575:: 1370753021:0;wget -E - http://dotfiles.org/.vimrc
2582:: 1370753136:0;wget -O- http://dotfiles.org/.vimrc VV
2586:: 1370753180:0;wget http://dotfiles.org/.vimrc
2589:: 1370753207:0;curl http://dotfiles.org/.vimrc
2597:: 1370753265:0;curl http://dotfiles.org/.vimrc VV
2601:: 1370753425:0;curl http://dotfiles.org/.vimrc | vim -
2608:: 1370753511:0;curl http://dotfiles.org/.vimrc >> VVV
2632:: 1370754860:0;for i in $(sed -n "/href=/s/.*href=\([^>]*\).*/\1/p" VVV);do echo "http://www.dotfiles.org/$i;done
2634:: 1370754870:0;for i in $(sed -n "/href=/s/.*href=\([^>]*\).*/\1/p" VVV);do echo "http://www.dotfiles.org/"$i;done
2635:: 1370754989:0;for i in $(sed -n "/href=/s/.*href=\([^>]*\).*/\1/p" VVV | sed 's/^'//g');do echo "http://www.dotfiles.org/"$i;done
2636:: 1370755000:0;for i in $(sed -n "/href=/s/.*href=\([^>]*\).*/\1/p" VVV | sed 's/^\'//g');do echo "http://www.dotfiles.org/"$i;done\
2638:: 1370755039:0;for i in $(sed -n "/href=/s/.*href=\([^>]*\).*/\1/p" VVV | sed "s/^\'//g");do echo "http://www.dotfiles.org/"$i;done\
2640:: 1370755046:0;for i in $(sed -n "/href=/s/.*href=\([^>]*\).*/\1/p" VVV | sed "s/^'//g");do echo "http://www.dotfiles.org/"$i;done\
2642:: 1370755060:0;for i in $(sed -n "/href=/s/.*href=\([^>]*\).*/\1/p" VVV | sed "s/^'/d");do echo "http://www.dotfiles.org/"$i;done\
2644:: 1370755073:0;for i in $(sed -n "/href=/s/.*href=\([^>]*\).*/\1/p" VVV);do echo "http://www.dotfiles.org/"$i;done
2645:: 1370755104:0;for i in $(sed -n "/href=/s/.*href=\([^>]*\).*/\1/p" VVV | sed "s/^'\///g");do echo "http://www.dotfiles.org/"$i;done\
2647:: 1370755130:0;for i in $(sed -n "/href=/s/.*href=\([^>]*\).*/\1/p" VVV | sed "s/^'\///g" | sed "s/'$//g");do echo "http://www.dotfiles.org/"$i;done\
2757:: 1370764737:0;ag dotfiles.org ~/.zsh_history
