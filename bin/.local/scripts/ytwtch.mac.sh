#!/bin/bash
# by Kris Occhipinti, modified for macOS
# https://www.youtube.com/watch?v=FsQuGplQvrw

# Display notification
osascript -e 'display notification "Playing Video" with title "Notification"'

# Get clipboard content
CLIPBOARD_CONTENT=$(pbpaste)

# Play video using mpv
mpv --ytdl-format=bestvideo+bestaudio/best --fs --speed=2.5 --af=rubberband=pitch-scale=0.981818181818181 "$CLIPBOARD_CONTENT"
