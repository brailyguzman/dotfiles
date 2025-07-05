#!/bin/bash

# Load colors
source "$CONFIG_DIR/colors.sh"

CORE_COUNT=$(sysctl -n machdep.cpu.thread_count)
CPU_INFO=$(ps -eo pcpu,user)
CPU_SYS=$(echo "$CPU_INFO" | grep -v $(whoami) | sed "s/[^ 0-9\.]//g" | awk "{sum+=\$1} END {print sum/(100.0 * $CORE_COUNT)}")
CPU_USER=$(echo "$CPU_INFO" | grep $(whoami) | sed "s/[^ 0-9\.]//g" | awk "{sum+=\$1} END {print sum/(100.0 * $CORE_COUNT)}")

CPU_PERCENT="$(echo "$CPU_SYS $CPU_USER" | awk '{printf "%.0f\n", ($1 + $2)*100}')"

# Set color based on CPU usage
if [[ $CPU_PERCENT -ge 80 ]]; then
  COLOR=$ERROR_COLOR
elif [[ $CPU_PERCENT -ge 50 ]]; then
  COLOR=$WARNING_COLOR
else
  COLOR=$SUCCESS_COLOR
fi

sketchybar --set $NAME label="$CPU_PERCENT%" icon.color=$COLOR
