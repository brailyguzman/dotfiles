#!/bin/bash

source "$CONFIG_DIR/colors.sh"

# Format: "Thu, Jan 3 • 2:45 PM"
DATE_TIME=$(date +'%a, %b %d • %l:%M %p' | sed 's/  / /g')

sketchybar --set $NAME \
  label="$DATE_TIME" \
  label.color=$WHITE \
  icon.color=$ACCENT_COLOR
