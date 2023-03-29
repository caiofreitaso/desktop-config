#!/bin/bash -ev

APTITUDE_PACKAGES=(
  curl
  i3
  gimp
  inkscape
  darktable
  remmina
  thunderbird
)
DPKG_DEB=( )
REQUIREMENTS=( )

add_sublime() {
  echo deb https://download.sublimetext.com/ apt/stable/ | tee /etc/apt/sources.list.d/sublime-text.list
  wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
  REQUIREMENTS+=( apt-transport-https )
  APTITUDE_PACKAGES+=( sublime-text )
}
add_opera() {
  echo deb https://deb.opera.com/opera-stable/ stable non-free | tee /etc/apt/sources.list.d/opera.list
  wget -qO- https://deb.opera.com/archive.key | apt-key add -
  APTITUDE_PACKAGES+=( opera-stable )
}
add_spotify() {
  echo deb http://repository.spotify.com stable non-free | tee /etc/apt/sources.list.d/spotify.list
  curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
  APTITUDE_PACKAGES+=( spotify-client )
}
download_steam() {
  STEAM_URL="http://media.steampowered.com/client/installer/steam.deb"
  echo "Downloading steam.deb"
  wget -q $STEAM_URL
  DPKG_DEB+=( steam.deb )
}
download_cockatrice() {
  AWK_SCRIPT='
  {
    if ($1 ~ /browser_download/ && $2 ~ /\.deb/) {
      gsub(/\"/, "", $2);
      print $2;
    }
  }'
  COCKATRICE_URL=$(\
    curl -s https://api.github.com/repos/Cockatrice/Cockatrice/releases/latest \
    | awk "${AWK_SCRIPT}" \
  )
  COCKATRICE_FILE=$(echo ${COCKATRICE_URL} | rev | awk -F/ '{print $1}' | rev)

  echo "Downloading $COCKATRICE_FILE"
  wget -q $COCKATRICE_URL
  DPKG_DEB+=( "${COCKATRICE_FILE}" )
}

download_steam
download_cockatrice
dpkg -i ${DPKG_DEB[@]}

add_opera
add_sublime
add_spotify
aptitude update
aptitude install ${REQUIREMENTS[@]}
aptitude install ${APTITUDE_PACKAGES[@]}

rm ${DPKG_DEB_[@}}
