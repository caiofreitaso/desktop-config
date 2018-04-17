#!/bin/bash

CONFIGDIR=/home/caio/Documents/desktop-config

i3 -c $CONFIGDIR/$1/i3.config
i3-msg exec feh --bg-fill $CONFIGDIR/$1/background.png
i3-msg exec conky -d -c $CONFIGDIR/$1/conky.config
i3-msg exec xset dpms 120 120 300
