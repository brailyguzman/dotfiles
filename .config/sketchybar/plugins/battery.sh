#!/bin/sh

# Load colors
source "$CONFIG_DIR/colors.sh"

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ $PERCENTAGE = "" ]; then
  exit 0
fi

# Set color based on battery level
if [[ $PERCENTAGE -ge 60 ]]; then
  COLOR=$SUCCESS_COLOR
elif [[ $PERCENTAGE -ge 30 ]]; then
  COLOR=$WARNING_COLOR
else
  COLOR=$ERROR_COLOR
fi

case ${PERCENTAGE} in
9[0-9] | 100)
  ICON="􀛨"
  ;;
[6-8][0-9])
  ICON="􀺸"
  ;;
[3-5][0-9])
  ICON="􀺶"
  ;;
[1-2][0-9])
  ICON="􀛩"
  ;;
*) ICON="􀛪" ;;
esac

if [[ $CHARGING != "" ]]; then
  ICON="􀢋"
  COLOR=$ACCENT_COLOR # Use accent color when charging
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --set $NAME icon="$ICON" label="${PERCENTAGE}%" icon.color=$COLOR
