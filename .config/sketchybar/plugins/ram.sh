#!/bin/sh

# Load colors
source "$CONFIG_DIR/colors.sh"

MEM_USED=$(vm_stat | awk '/Pages active/ {active=$3} /Pages wired down/ {wired=$4} /Pages occupied by compressor/ {compressed=$5} END {print (active + wired + compressed) * 4096 / 1024 / 1024}')
MEM_TOTAL=$(sysctl -n hw.memsize | awk '{print $1 / 1024 / 1024}')
MEM_PCT=$(awk "BEGIN {printf \"%.0f\", ($MEM_USED/$MEM_TOTAL)*100}")

# Set color based on memory usage
if [[ $MEM_PCT -ge 80 ]]; then
  COLOR=$ERROR_COLOR
elif [[ $MEM_PCT -ge 60 ]]; then
  COLOR=$WARNING_COLOR
else
  COLOR=$SUCCESS_COLOR
fi

sketchybar --set $NAME label="${MEM_PCT}%" icon.color=$COLOR
