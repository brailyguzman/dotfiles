#!/bin/sh

MEM_USED=$(vm_stat | awk '/Pages active/ {active=$3} /Pages wired down/ {wired=$4} /Pages occupied by compressor/ {compressed=$5} END {print (active + wired + compressed) * 4096 / 1024 / 1024}')
MEM_TOTAL=$(sysctl -n hw.memsize | awk '{print $1 / 1024 / 1024}')
MEM_PCT=$(awk "BEGIN {printf \"%.0f\", ($MEM_USED/$MEM_TOTAL)*100}")

ICON="􀫦" # You can use any SF Symbol or icon you like

sketchybar --set $NAME icon="$ICON" label="${MEM_PCT}%"
