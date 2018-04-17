#!/bin/bash

CONFIGDIR=/home/caio/Documents/desktop-config

PROFILE=$1

PROFILEDIR=$CONFIGDIR/$PROFILE

i3 -c $PROFILEDIR/i3.config
