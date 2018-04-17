#!/bin/bash -ev

# Debian repositories
aptitude update
aptitude install i3 gimp inkscape darktable remmina thunderbird

# Sublime-Text
## 1) Add GPG key
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
## 2) Ensure HTTPS works
aptitude install apt-transport-https
## 3) Add to source list
echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list

# Opera
## 1) Add repository
add-apt-repository 'deb https://deb.opera.com/opera-stable/ stable non-free'
## 2) Add GPG key
wget -qO- https://deb.opera.com/archive.key | apt-key add -

# Steam
STEAM_URL="http://media.steampowered.com/client/installer/steam.deb"
echo "Downloading steam.deb"
wget -q $STEAM_URL

# Cockatrice
COCKATRICE_URL=$(curl -s https://api.github.com/repos/Cockatrice/Cockatrice/releases/latest |\
 awk '{if ($1 ~ /browser_download/ && $2 ~ /\.deb/) {gsub(/\"/, "", $2); print $2;}}')
COCKATRICE_FILE=$(echo ${COCKATRICE_URL} | rev | awk -F/ '{print $1}' | rev)
echo "Downloading $COCKATRICE_FILE"
wget -q $COCKATRICE_URL

dpkg -i steam.deb $COCKATRICE_FILE

aptitude update
aptitude install opera-stable sublime-text

rm steam.deb $COCKATRICE_FILE
