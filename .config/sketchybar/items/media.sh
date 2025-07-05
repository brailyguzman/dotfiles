#!/bin/bash

sketchybar --add item media center \
  --set media \
  update_freq=3 \
  icon.padding_left=8 \
  icon.padding_right=4 \
  label.max_chars=20 \
  label.padding_right=8 \
  scroll_texts=off \
  background.drawing=off \
  script="$PLUGIN_DIR/media.sh"
