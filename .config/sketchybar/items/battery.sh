#!/bin/bash

sketchybar \
  --add item battery right \
  --set battery update_freq=120 \
  script="$PLUGIN_DIR/battery.sh" \
  icon.font="SF Pro:Bold:15.0" \
  click_script='open "x-apple.systempreferences:com.apple.preference.battery"' \
  --subscribe battery system_woke power_source_change
