#!/bin/bash

sketchybar \
  --add item wifi right \
  --set wifi update_freq=10 \
  script="$PLUGIN_DIR/wifi.sh" \
  icon.font="SF Pro:Bold:15.0" \
  label.drawing=off \
  background.color=$ITEM_BG_COLOR \
  background.corner_radius=5 \
  background.height=24 \
  icon.padding_left=8 \
  icon.padding_right=8 \
  click_script='open "x-apple.systempreferences:com.apple.preference.network"' \
  --subscribe wifi wifi_change
