#!/bin/bash

cd ~/Videos/Screencasts/

geo=$(swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | "\(.rect.x+.window_rect.x),\(.rect.y+.window_rect.y) \(.window_rect.width)x\(.window_rect.height)"' | slurp)
wf-recorder --audio --file="$(date +%H%M_%F).mp4" -g "$geo"
