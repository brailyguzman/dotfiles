#!/bin/bash

# Subscribe to workspace change events
sketchybar --add event aerospace_workspace_change

# Iterate through all Aerospace workspaces
for sid in $(aerospace list-workspaces --all); do
  sketchybar --add item space.$sid left \
    --subscribe space.$sid aerospace_workspace_change \
    --set space.$sid \
    label="$sid" \
    label.align=center \
    label.padding_left=8 \
    label.padding_right=8 \
    label.offset=0 \
    icon.drawing=off \
    background.corner_radius=5 \
    background.height=24 \
    background.drawing=off \
    click_script="aerospace workspace $sid" \
    script="$CONFIG_DIR/plugins/aerospace.sh $sid"
done
