#!/bin/bash

CONFIGDIR=/home/caio/Documents/desktop-config
PROFILE=$1
PROFILEDIR=$CONFIGDIR/$PROFILE

mkdir $PROFILEDIR

cp $CONFIGDIR/i3.config $PROFILEDIR
cp $CONFIGDIR/conky.config $PROFILEDIR
cp $CONFIGDIR/i3status.conf $PROFILEDIR

while read n k; do sed -i "s/$n/$k/g" $PROFILEDIR/i3.config; done < $2
while read n k; do sed -i "s/$n/$k/g" $PROFILEDIR/conky.config; done < $2

EXTRA_COMMANDS="exec feh --bg-fill ~/.i3/$PROFILE/background.png\
exec conky -d -c ~/.i3/$PROFILE/conky.config\
exec_always xset dpms 120 120 300\
exec pulseaudio --start"

echo "${EXTRA_COMMANDS}" >> $PROFILEDIR/i3.config

cp -R $PROFILEDIR ~/.i3/
