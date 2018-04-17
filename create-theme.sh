#!/bin/bash

CONFIGDIR=/home/caio/Documents/desktop-config

mkdir $CONFIGDIR/$1

cp $CONFIGDIR/i3.config $CONFIGDIR/$1
cp $CONFIGDIR/conky.config $CONFIGDIR/$1
cp $CONFIGDIR/i3status.conf $CONFIGDIR/$1

while read n k; do sed -i "s/$n/$k/g" $CONFIGDIR/$1/i3.config; done < $2
while read n k; do sed -i "s/$n/$k/g" $CONFIGDIR/$1/conky.config; done < $2