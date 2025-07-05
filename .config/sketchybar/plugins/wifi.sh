#!/bin/bash

# Load colors
source "$CONFIG_DIR/colors.sh"

# Get WiFi status and info
WIFI_STATUS=$(networksetup -getairportpower en0 | awk '{print $4}')
WIFI_SSID=$(networksetup -getairportnetwork en0 | cut -d' ' -f4-)
WIFI_IP=$(ifconfig en0 | grep "inet " | awk '{print $2}')

if [[ $WIFI_STATUS == "On" ]] && [[ $WIFI_SSID != "You are not associated with an AirPort network." ]] && [[ $WIFI_IP != "" ]]; then
  # Connected to WiFi - strong signal icon
  ICON="􀙇" # WiFi connected icon
  COLOR=$SUCCESS_COLOR
elif [[ $WIFI_STATUS == "On" ]]; then
  # WiFi on but not connected - weak/searching icon
  ICON="􀙇" # WiFi searching/weak icon
  COLOR=$WARNING_COLOR
else
  # WiFi off - no signal icon
  ICON="􀙈" # WiFi off/no signal icon
  COLOR=$INACTIVE_COLOR
fi

sketchybar --set $NAME icon="$ICON" icon.color=$COLOR
