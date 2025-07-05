#!/bin/bash

sketchybar \
  --add item ram right \
  --set ram update_freq=5 \
  icon="􀫦" \
  icon.font="SF Pro:Bold:15.0" \
  script="$PLUGIN_DIR/ram.sh" \
  click_script="open -a 'Activity Monitor'"
