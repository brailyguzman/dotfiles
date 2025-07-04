#!/bin/bash

sketchybar --add item media right \
  --set media \
  update_freq=3 \
  icon.padding_left=8 \
  icon.padding_right=4 \
  label.max_chars=25 \
  label.padding_right=8 \
  scroll_texts=on \
  background.drawing=on \
  script="$PLUGIN_DIR/media.sh"
