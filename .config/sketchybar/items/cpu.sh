#!/bin/bash

sketchybar \
  --add item cpu right \
  --set cpu update_freq=5 \
  icon=􀧓 \
  icon.font="SF Pro:Bold:15.0" \
  script="$PLUGIN_DIR/cpu.sh" \
  click_script="open -a 'Activity Monitor'"
