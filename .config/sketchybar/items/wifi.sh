#!/bin/bash

sketchybar \
  --add item wifi right \
  --set wifi update_freq=10 \
  script="$PLUGIN_DIR/wifi.sh" \
  click_script='open "x-apple.systempreferences:com.apple.preference.network"' \
  --subscribe wifi wifi_change
  
