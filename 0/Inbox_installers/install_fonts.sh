#!/bin/bash
# Install Microsoft Fonts (Including Tahoma)

if [ "$(id -u)" == "0" ]
then
  if apt-get install msttcorefonts; then
    mkdir temp-tahomafont
    cd temp-tahomafont
    if wget  http://download.microsoft.com/download/ie6sp1/finrel/6_sp1/W98NT42KMeXP/EN-US/IELPKTH.CAB;  then
      cabextract IELPKTH.CAB
      if cp *.ttf /usr/share/fonts/truetype/msttcorefonts/; then
        if fc-cache -fv; then
          cd ..
          rm -r temp-tahomafont
          echo "Microsoft fonts are now installed"
        else
          echo "Could not rebuild font cache"
          exit -1
        fi
      else
        echo "Could not copy the font to  /usr/share/fonts/truetype/msttcorefonts/"
        exit -1
      fi
    else
      echo "Could not download Tahoma font"
      exit -1
    fi
  else
    echo "Could not install msttcorefonts package"
    exit -1
  fi
else
  echo "Run 'sudo ./addfonts.sh'"
  exit 0
fi
