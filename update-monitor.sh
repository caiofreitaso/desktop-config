#!/bin/bash
CONNECTOR="${1:-DP}"
FAN_SPEED="${2:-50}"
OUTPUT=$(xrandr -q | awk '{ if ($0 ~ /'"${CONNECTOR}"'.* connected/) { print $1 } }')
NVIDIA=$(which nvidia-settings)

# xrandr --output "${OUTPUT}" --rotate left
if [ -n "${NVIDIA}" ]
then
  NVIDIA_ASSIGN="[fan:0]/GPUTargetFanSpeed=${FAN_SPEED}"
  ${NVIDIA} -a "[gpu:0]/GPUFanControlState=1"
  ${NVIDIA} -a "${NVIDIA_ASSIGN}"
fi

