#!/bin/bash

sketchybar \
  --add item bluetooth right \
  --set bluetooth update_freq=10 \
  script="$PLUGIN_DIR/bluetooth.sh" \
  icon.font="SF Pro:Bold:15.0" \
  label.drawing=off \
  background.color=$ITEM_BG_COLOR \
  background.corner_radius=5 \
  background.height=24 \
  icon.padding_left=8 \
  icon.padding_right=8 \
  click_script='open "x-apple.systempreferences:com.apple.preference.bluetooth"' \
  --subscribe bluetooth bluetooth_change
