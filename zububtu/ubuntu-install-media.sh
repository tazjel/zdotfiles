#!/bin/bash

# Usage: sudo apt-get install -yqq curl; curl -L -s https://raw.github.com/gist/4671312/ubuntu-install-media.sh | sudo bash

#alias sagi="apt-get install --yes --quiet" # normall sudo apt-get, but this is already root
#alias sagid="apt-get install --yes --quiet --download-only" # same as above
#STDOUT=/dev/stdout
#STDERR=/dev/stderr
STDOUT=/dev/null
STDERR=/dev/null

fail () {
  echo "failure (bad internet connection?)"
  exit 1
}

cleanup_aptget () {
  echo -n "Performing cleanup... "
  dpkg --configure -a > ${STDOUT} 2> ${STDERR}
  if [ $? -eq 0 ]; then
    echo -n "looking good... "
  else
    echo -n "fixing partial installs... "
    # fuser -cuk /var/lib/dpkg/lock
    rm -f /var/lib/dpkg/lock
    #fuser -cuk /var/cache/apt/archives/lock
    rm -f /var/cache/apt/archives/lock
    rm -rf /var/cache/debconf/*
    dpkg --configure -a > ${STDOUT} 2> ${STDERR}
  fi
  apt-get clean > ${STDOUT} 2> ${STDERR}
  echo "Done"
}

add_repos () {
  echo -n "Enabling software from Google, Skype, etc in Ubuntu Software Center... "
  apt-add-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"

  # Google
  # See https://gist.github.com/4686265
  # And https://gist.github.com/4686647
  if [ ! -f "/etc/apt/sources.list.d/mod-pagespeed.list" ]
  then
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - > ${STDOUT} 2> ${STDERR}
    echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list
    echo "deb http://dl.google.com/linux/musicmanager/deb/ stable main" > /etc/apt/sources.list.d/google-musicmanager.list
    echo "deb http://dl.google.com/linux/earth/deb/ stable main" > /etc/apt/sources.list.d/google-earth.list
    echo "deb http://dl.google.com/linux/talkplugin/deb/ stable main" > /etc/apt/sources.list.d/google-talkplugin.list
    echo "deb http://dl.google.com/linux/mod-pagespeed/deb/ stable main" > /etc/apt/sources.list.d/mod-pagespeed.list
  fi

  # Spotify
  if [ ! -f "/etc/apt/sources.list.d/spotify.list" ]
  then
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59 > ${STDOUT} 2> ${STDERR}
    echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list
  fi

  # See https://gist.github.com/4669989
  if [ ! -f "/tmp/medibuntu.done" ]
  then
    echo "deb http://packages.medibuntu.org/ $(lsb_release -cs) free non-free" > /etc/apt/sources.list.d/medibuntu.list
    apt-get update --quiet > ${STDOUT} 2> ${STDERR}
    apt-get install --yes --quiet --allow-unauthenticated \
      medibuntu-keyring > ${STDOUT} 2> ${STDERR}
    touch /tmp/medibuntu.done
  fi

  # Haven't verified that steam updates from one distro to the next gracefully
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F24AEA9FB05498B7 > ${STDOUT} 2> ${STDERR}
  #echo "deb http://repo.steampowered.com/steam/ $(lsb_release -cs) steam" > /etc/apt/sources.list.d/steam.list

  # Unofficial Netflix
  apt-add-repository ppa:ehoover/compholio --yes > ${STDOUT} 2> ${STDERR}

  apt-get update --quiet > ${STDOUT} 2> ${STDERR}
  echo "Done"
}

download_msfonts () {
  echo -n "Downloading Microsoft Fonts Installer..."
  apt-get install --yes --quiet --quiet --download-only \
    ttf-mscorefonts-installer \
    > ${STDOUT} 2> ${STDERR} \
    && echo "Done" || fail
}

install_msfonts () {
  echo "Installing Microsoft Fonts (you'll need to sign for this)..."
  apt-get install --yes --quiet \
    $(apt-cache depends ttf-mscorefonts-installer | grep Depends | sed "s/.*ends:\ //" | tr '\n' ' ') \
     > ${STDOUT} 2> ${STDERR}

  apt-get install --yes --quiet --quiet \
    ttf-mscorefonts-installer || fail
  clear
  echo "Microsoft fonts installed."
}

download_chrome () {
  echo -n "Downloading Chrome... "

  # Old Way
  #GCARCH=i386
  #if [ -n "`arch | grep 64`" ]
  #then
  #  GCARCH=amd64
  #fi
  #apt-get install --yes --quiet --download-only \
  #  chromium-browser \
  #  > ${STDOUT} 2> ${STDERR} \
  #  || fail
  #wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_${GCARCH}.deb > ${STDOUT} 2> ${STDERR}
  #dpkg -i google-chrome-stable_current_${GCARCH}.deb > ${STDOUT} 2> ${STDERR}
  #apt-get install -yf

  # Better Way (ubuntu repos installed in add_partner)
  apt-get install --yes --quiet --download-only \
    google-chrome-stable \
    google-talkplugin \
    > ${STDOUT} 2> ${STDERR}
  echo "Done"
}

install_chrome () {
  echo -n "Installing Chrome... "

  # Old Way
  #GCARCH=i386
  #if [ -n "`arch | grep 64`" ]
  #then
  #  GCARCH=amd64
  #fi
  #apt-get install --yes --quiet \
  #  chromium-browser \
  #  > ${STDOUT} 2> ${STDERR} \
  #  || fail
  #dpkg -i google-chrome-stable_current_${GCARCH}.deb > ${STDOUT} 2> ${STDERR}
  #apt-get install -yf

  # Better Way (ubuntu repos installed in add_partner)
  apt-get install --yes --quiet google-chrome-stable google-talkplugin > ${STDOUT} 2> ${STDERR}
  echo "Done"
}

download_http_getters () {
  echo -n "Downloading system tools... "
  apt-get install --yes --quiet --download-only \
    curl \
    wget \
    > ${STDOUT} 2> ${STDERR} \
    && echo "Done" || fail
}

install_http_getters () {
  echo -n "Installing system tools... "
  apt-get install --yes --quiet \
    curl \
    wget \
    > ${STDOUT} 2> ${STDERR} \
    && echo "Done" || fail
}

download_dev_tools () {
  echo -n "Downloading more system tools... "
  apt-get install --yes --quiet --download-only \
    vim \
    git \
    build-essential \
    > ${STDOUT} 2> ${STDERR} \
    && echo "Done" || fail
}

install_dev_tools () {
  echo -n "Installing more system tools... "
  apt-get install --yes --quiet \
    vim \
    git \
    build-essential \
    > ${STDOUT} 2> ${STDERR} \
    && echo "Done" || fail
}

download_multimedia () {
  echo -n "Downloading basic multimedia tools... "
  apt-get install --yes --quiet --download-only \
    ubuntu-restricted-extras \
    gstreamer0.10-plugins-ugly \
    libdvdread4 \
    vlc \
    > ${STDOUT} 2> ${STDERR} \
    && echo "Done" || fail
}

install_multimedia () {
  echo -n "Installing basic multimedia tools... "
  apt-get install --yes --quiet \
    ubuntu-restricted-extras \
    gstreamer0.10-plugins-ugly \
    libdvdread4 \
    vlc \
    > ${STDOUT} 2> ${STDERR} \
    && echo "Done" || fail
}

download_dvd () {
  echo -n "Downloading DVD player... "
  apt-get install --yes --quiet --download-only \
    libdvdread4 \
    > ${STDOUT} 2> ${STDERR} \
    && echo "Done" || fail
}

install_dvd () {
  echo -n "Installing DVD player... "
  apt-get install --yes --quiet \
    libdvdread4 \
    > ${STDOUT} 2> ${STDERR}
  /usr/share/doc/libdvdread4/install-css.sh > ${STDOUT} 2> ${STDERR}
  echo "Done"
}

download_bluray () {
  sudo apt-get install --yes --quiet --download-only \
    curl \
    wget \
    vlc \
    build-essential \
    libc6-dev \
    libssl-dev \
    libexpat1-dev \
    libgl1-mesa-dev \
    libqt4-dev \
    > ${STDOUT} 2> ${STDERR}

  mkdir -p /tmp/makemkv > ${STDOUT} 2> ${STDERR}
  pushd /tmp/makemkv > ${STDOUT} 2> ${STDERR}
  wget -c http://www.makemkv.com/download/makemkv-bin-1.7.10.tar.gz > ${STDOUT} 2> ${STDERR}
  wget -c http://www.makemkv.com/download/makemkv-oss-1.7.10.tar.gz > ${STDOUT} 2> ${STDERR}
  popd > ${STDOUT} 2> ${STDERR}

  # download / install in one
  mkdir -p /usr/local/bin > ${STDOUT} 2> ${STDERR}
  curl -L -s https://raw.github.com/gist/4167539/blu-play.bash -o /usr/local/bin/blu-play > ${STDOUT} 2> ${STDERR}
  chmod a+x /usr/local/bin/blu-play > ${STDOUT} 2> ${STDERR}
}

# this is silenced by the caller
install_bluray () {
  # See https://gist.github.com/4167539
  sudo apt-get install --yes --quiet \
    curl \
    wget \
    vlc \
    build-essential \
    libc6-dev \
    libssl-dev \
    libexpat1-dev \
    libgl1-mesa-dev \
    libqt4-dev

  pushd /tmp/makemkv

  tar xf makemkv-bin-1.7.10.tar.gz
  pushd makemkv-bin-1.7.10/
  mkdir -p tmp
  touch tmp/eula_accepted
  make -f makefile.linux
  sudo make -f makefile.linux install
  popd

  tar xf makemkv-oss-1.7.10.tar.gz
  pushd makemkv-bin-1.7.10/
  mkdir -p tmp
  touch tmp/eula_accepted
  make -f makefile.linux
  sudo make -f makefile.linux install
  popd

  popd
}

download_skype () {
  echo -n "Downloading Skype... "
  #wget -c http://download.skype.com/linux/skype-ubuntu-precise_4.1.0.20-1_i386.deb > ${STDOUT} 2> ${STDERR}
  #dpkg -i skype-ubuntu-precise_4.1.0.20-1_i386.deb > ${STDOUT} 2> ${STDERR}
  #apt-get install -fy > ${STDOUT} 2> ${STDERR}
  apt-get install --yes --quiet --download-only \
    skype \
    > ${STDOUT} 2> ${STDERR} \
    && echo "Done" || fail
}

install_skype () {
  echo -n "Installing Skype... "
  #dpkg -i skype-ubuntu-precise_4.1.0.20-1_i386.deb > ${STDOUT} 2> ${STDERR}
  #apt-get install -fy > ${STDOUT} 2> ${STDERR}
  apt-get install --yes --quiet \
    skype \
    > ${STDOUT} 2> ${STDERR} \
    && echo "Done" || fail
}

download_spotify () {
  # See https://gist.github.com/4668957
  echo -n "Downloading Spotify... "
  apt-get install --yes --quiet --download-only \
    spotify-client \
    > ${STDOUT} 2> ${STDERR} \
    && echo "Done" || fail
}

install_spotify () {
  echo -n "Installing Spotify... "
  apt-get install --yes --quiet \
    spotify-client \
    > ${STDOUT} 2> ${STDERR} \
    && echo "Done" || fail
}

download_medibuntu () {
  echo -n "Downloading more multimedia tools... "

  # See https://gist.github.com/4669989
  # skipped because I don't want hot-babe showing up in the software center
  # app-install-data-medibuntu
  apt-get install --yes --quiet --download-only \
    apport-hooks-medibuntu \
    > ${STDOUT} 2> ${STDERR}

  # non-free-codecs is either w32codecs or w64codecs
  apt-get install --yes --quiet --download-only \
    aacgain \
    aacplusenc \
    alsa-firmware \
    ices \
    libavcodec-extra-53 \
    libavdevice-extra-53 \
    libavfilter-extra-2 \
    libavformat-extra-53 \
    libavutil-extra-51 \
    libdvdcss2 \
    libpostproc-extra-52 \
    libswscale-extra-2 \
    mencoder \
    mplayer \
    > ${STDOUT} 2> ${STDERR} \
    && echo "Done" || fail

  # didn't work: rmconverter
  # too large: acroread-fonts
  # skipped: libav-extra-dbg hot-babe libdvdcss-dev mplayer-dbg mplayer-doc mplayer-gui
  # included in non-free-codecs: w32codecs w64codecs
}

install_medibuntu () {
  echo -n "Installing more multimedia tools... "

  # See https://gist.github.com/4669989
  # skipped because I don't want hot-babe showing up in the software center
  # app-install-data-medibuntu
  apt-get install --yes --quiet \
    apport-hooks-medibuntu \
    > ${STDOUT} 2> ${STDERR}

  # non-free-codecs is either w32codecs or w64codecs
  apt-get install --yes --quiet \
    aacgain \
    aacplusenc \
    alsa-firmware \
    ices \
    libavcodec-extra-53 \
    libavdevice-extra-53 \
    libavfilter-extra-2 \
    libavformat-extra-53 \
    libavutil-extra-51 \
    libdvdcss2 \
    libpostproc-extra-52 \
    libswscale-extra-2 \
    mencoder \
    mplayer \
    > ${STDOUT} 2> ${STDERR} \
    && echo "Done" || fail

  # didn't work: rmconverter
  # too large: acroread-fonts
  # skipped: libav-extra-dbg hot-babe libdvdcss-dev mplayer-dbg mplayer-doc mplayer-gui
  # included in non-free-codecs: w32codecs w64codecs
}

# These are the ones that require EULAs to be accepted (pity...)
download_licensed () {
  echo -n "Downloading licensed media readers... "
  apt-get install --yes --quiet --download-only \
    non-free-codecs \
    ubuntu-restricted-extras \
    ubuntu-restricted-addons \
    ttf-mscorefonts-installer \
    flashplugin-installer \
    acroread \
    > ${STDOUT} 2> ${STDERR} \
    && echo "Done" || fail
}

install_licensed () {
  # See https://gist.github.com/4669989
  echo -n "Installing licensed media readers... "
  apt-get install --yes --quiet \
    non-free-codecs \
    ubuntu-restricted-extras \
    ubuntu-restricted-addons \
    ttf-mscorefonts-installer \
    flashplugin-installer \
    > ${STDOUT} 2> ${STDERR} \
    && echo "Done" || fail
}

download_acroread () {
  echo -n "Downloading Adobe Reader... "
  # acroread-fonts \
  apt-get install --yes --quiet --download-only \
    acroread \
    > ${STDOUT} 2> ${STDERR} \
    && echo "Done" || fail
}

install_acroread () {
  sudo apt-get install --yes --quiet \
    $(apt-cache depends acroread | grep Depends | sed "s/.*ends:\ //" | tr '\n' ' ') \
    > ${STDOUT} 2> ${STDERR}
    
  echo "You're about to have to accept some license agreements using the arrow and enter keys..."
  echo -n "Installing Adobe Reader (you'll have to sign for this)... "
  apt-get install --yes --quiet \
    acroread
}

remove_hotbabe () {
  # Just because I don't want family people offended by hot-babe
  apt-get remove --purge app-install-data-medibuntu > ${STDOUT} 2> ${STDERR}
  #rm /etc/apt/sources.list.d/medibuntu.list
  #apt-get update
}

download_steam () {
  echo -n "Downloading Steam..."
  pushd /tmp > ${STDOUT} 2> ${STDERR}
  wget -c http://media.steampowered.com/client/installer/steam.deb \
    > ${STDOUT} 2> ${STDERR} \
    && echo "Done" || fail
  popd > ${STDOUT} 2> ${STDERR}
}

install_steam () {
  echo -n "Installing Steam..."
  pushd /tmp > ${STDOUT} 2> ${STDERR}
  dpkg -i steam.deb > ${STDOUT} 2> ${STDERR}
  apt-get install -fy \
    > ${STDOUT} 2> ${STDERR} \
    && echo "Done" || fail
  popd > ${STDOUT} 2> ${STDERR}
}

download_netflix() {
  echo -n "Downloading Netflix..."
  apt-get install --yes --quiet --download-only \
    netflix-desktop \
    > ${STDOUT} 2> ${STDERR} \
    && echo "Done" || fail
}

install_netflix() {
  echo -n "Installing Netflix..."
  apt-get install --yes --quiet \
    netflix-desktop \
    > ${STDOUT} 2> ${STDERR} \
    && echo "Done" || fail
}





clear

echo "There are two instances where you need to accept licensing terms"
echo "during this installation."
echo "One will be in just a few minutes. The other will be at the very end."
echo ""
echo "This process takes quite a long time (perhaps an hour), so accept"
echo "the first license and then go take a nap."
echo ""
echo "If at any time you quit the process (by disconnecting the internet"
echo "or turning off the computer), you can run it again to resume where"
echo "it left off."
echo ""

pushd /tmp > ${STDOUT} 2> ${STDERR}
cleanup_aptget
download_http_getters
install_http_getters
add_repos
# Get the first EULA out of the way quickly
# (lots of packages depend on the meta package that contains msfonts)
download_msfonts
install_msfonts
# get people back to watching cats faster
download_chrome
install_chrome

# Download first
download_dev_tools
download_multimedia
download_skype
download_spotify
download_medibuntu
download_bluray
download_licensed
download_acroread
download_steam
download_netflix
download_dvd

# Then install
install_dvd # must download as well
echo -n "Installing Blu-Ray Player (blu-play)... "
install_bluray > ${STDOUT} 2> ${STDERR} \
  && echo "Done" || fail
install_dev_tools
install_multimedia
install_skype
install_spotify
install_medibuntu
install_licensed
remove_hotbabe
install_acroread
install_steam
install_netflix
netflix-desktop > ${STDOUT} 2> ${STDERR} &
popd > ${STDOUT} 2> ${STDERR}

clear
echo ""
echo "The installation is done."
echo "It completed successfully (no known errors)."
echo "What a happy day!"
echo ""