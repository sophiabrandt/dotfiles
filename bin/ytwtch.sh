#!/bin/bash
# by Kris Occhipinti
# https://www.youtube.com/watch?v=FsQuGplQvrw

notify-send -t 3000 --icon=video-televison "Playing Video" "$(xclip -o)";
mpv --ytdl-format=22 --fs "$(xclip -o)" || mpv --fs "$(xclip -o)"
