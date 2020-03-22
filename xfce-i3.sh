#!/bin/bash

PROFILE=$1
TARGET_DISPLAY=${2:-:0.0}
DISPLAY=${TARGET_DISPLAY}
CONFIGDIR=/home/caio/Documents/desktop-config

rm -rf ~/.i3/*
cp -R $CONFIGDIR/$PROFILE ~/.i3/

i3 -c ~/.i3/$PROFILE/i3.config
