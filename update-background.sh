#!/bin/bash

PROFILE=$1
ROTATE=$2

xrandr --output HDMI1 --rotate $ROTATE

ps -aux | awk '{if($11 ~ /conky/){print $2}}' | xargs -n1 kill
conky -d -c ~/.i3/$PROFILE/conky.config
feh --bg-fill ~/.i3/$PROFILE/background.png
