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

EXTRA_COMMANDS="exec feh --bg-fill $PROFILEDIR/background.png\
exec conky -d -c $PROFILEDIR/conky.config\
exec xset dpms 120 120 300"

echo "${EXTRA_COMMANDS}" >> $PROFILEDIR/i3.config
