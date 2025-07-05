#!/bin/bash

sketchybar \
  --add item apple left \
  --set apple icon="􀣺" \
  icon.font="SF Pro:Bold:16.0" \
  icon.color=$ACCENT_COLOR \
  label.drawing=off \
  background.color=$ITEM_BG_COLOR \
  background.corner_radius=5 \
  background.height=24 \
  icon.padding_left=8 \
  icon.padding_right=8 \
  background.drawing=off \
  click_script="open -b com.apple.systempreferences"
