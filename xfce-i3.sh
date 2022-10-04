#!/bin/bash

PROFILE=$1
TARGET_CONNECTOR=${2:-DP}
export DISPLAY=${3:-:0.0}
CONFIGDIR=/home/caio/Documents/desktop-config

rm -rf ~/.i3/*
cp -R $CONFIGDIR/$PROFILE ~/.i3/

# if [[ "${PROFILE}" =~ -v$ ]]
# then
#   $CONFIGDIR/update-monitor.sh ${TARGET_CONNECTOR}
# fi
i3 -c ~/.i3/$PROFILE/i3.config
