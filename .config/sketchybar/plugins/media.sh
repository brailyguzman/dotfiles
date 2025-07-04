#!/bin/bash

source "$CONFIG_DIR/colors.sh"

# Function to get media info from Apple Music
get_music_info() {
  osascript -e '
    tell application "Music"
        if player state is playing then
            set trackArtist to artist of current track
            set trackName to name of current track
            return trackArtist & " - " & trackName
        else
            return ""
        end if
    end tell' 2>/dev/null
}

# Function to get media info from Spotify
get_spotify_info() {
  osascript -e '
    tell application "Spotify"
        if player state is playing then
            set trackArtist to artist of current track
            set trackName to name of current track
            return trackArtist & " - " & trackName
        else
            return ""
        end if
    end tell' 2>/dev/null
}

# Try to get media info
MEDIA_INFO=""

# Check if Music.app is running and playing
if pgrep -x "Music" >/dev/null; then
  MEDIA_INFO=$(get_music_info)
fi

# If no music from Apple Music, try Spotify
if [ -z "$MEDIA_INFO" ] && pgrep -x "Spotify" >/dev/null; then
  MEDIA_INFO=$(get_spotify_info)
fi

# Update the bar
if [ -n "$MEDIA_INFO" ] && [ "$MEDIA_INFO" != "" ]; then
  sketchybar --set $NAME \
    label="$MEDIA_INFO" \
    icon="􀑪" \
    icon.color=$ACCENT_COLOR \
    label.color=$WHITE \
    drawing=on
else
  sketchybar --set $NAME drawing=off
fi
