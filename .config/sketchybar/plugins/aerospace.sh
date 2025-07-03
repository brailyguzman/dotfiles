#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

# Get the focused workspace
FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set $NAME \
    background.drawing=on \
    background.color=$ACCENT_COLOR \
    icon.color=$BAR_COLOR \
    label.color=$BAR_COLOR \
    icon.font="SF Pro:Bold:12.0"
else
  sketchybar --set $NAME \
    background.drawing=off \
    icon.color=$WHITE \
    label.color=$WHITE \
    icon.font="SF Pro:Regular:12.0"
fi
