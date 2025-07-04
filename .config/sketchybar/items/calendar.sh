#!/bin/bash

sketchybar \
  --add item calendar center \
  --set calendar icon=􀧞 \
  icon.color=$ACCENT_COLOR \
  label.font="SF Pro:Medium:14.0" \
  label.color=$WHITE \
  background.color=$ITEM_BG_COLOR \
  background.drawing=on \
  update_freq=30 \
  script="$PLUGIN_DIR/calendar.sh"
