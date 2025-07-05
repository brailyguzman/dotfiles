#!/bin/bash

sketchybar \
  --add item volume right \
  --set volume script="$PLUGIN_DIR/volume.sh" \
  icon.font="SF Pro:Bold:15.0" \
  click_script='open "x-apple.systempreferences:com.apple.preference.sound"' \
  --subscribe volume volume_change
