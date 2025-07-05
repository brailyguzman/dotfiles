#!/bin/bash

# Load colors
source "$CONFIG_DIR/colors.sh"

# Check if Bluetooth is powered on
BT_POWER=$(system_profiler SPBluetoothDataType 2>/dev/null | grep -A 1 "State:" | grep "On" | wc -l)

# Check for connected devices
BT_CONNECTED=$(system_profiler SPBluetoothDataType 2>/dev/null | grep -c "Connected: Yes")

# TODO: Find better icons for Bluetooth states

if [[ $BT_POWER -gt 0 ]]; then
  if [[ $BT_CONNECTED -gt 0 ]]; then
    # Bluetooth on and devices connected
    ICON="􀟰" # Bluetooth connected icon
    COLOR=$SUCCESS_COLOR
  else
    # Bluetooth on but no devices connected
    ICON="􀟯" # Regular Bluetooth icon
    COLOR=$WARNING_COLOR
  fi
else
  # Bluetooth off
  ICON="􀟮" # Bluetooth off icon
  COLOR=$INACTIVE_COLOR
fi

sketchybar --set $NAME icon="$ICON" icon.color=$COLOR
