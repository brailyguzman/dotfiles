#!/bin/bash

sketchybar \
  --add item calendar right \
  --set calendar icon=􀧞 \
  icon.color=$ACCENT_COLOR \
  label.font="SF Pro:Medium:14.0" \
  label.color=$WHITE \
  background.color=$ITEM_BG_COLOR \
  background.drawing=on \
  update_freq=1 \
  script="$PLUGIN_DIR/calendar.sh"
