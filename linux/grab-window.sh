#!/usr/bin/env bash

echo "Please select the window that you want to record."

win_info="$(xwininfo)"
x="$(echo "$win_info" | grep -i 'absolute upper-left x' | sed 's/^[^0-9]*\([0-9]\+\)$/\1/g' )"
y="$(echo "$win_info" | grep -i 'absolute upper-left y' | sed 's/^[^0-9]*\([0-9]\+\)$/\1/g' )"
width="$(echo "$win_info" | grep -Ei '^\W+width:' | sed 's/^[^0-9]*\([0-9]\+\)$/\1/g' )"
height="$(echo "$win_info" | grep -Ei '\W+height:' | sed 's/^[^0-9]*\([0-9]\+\)$/\1/g' )"
now="$(date +%Y-%m-%d_%H-%M_%S)"

ffmpeg -y -vsync vfr -f x11grab -video_size ${width}x${height} -i +${x},${y} "window_recording_${now}.mp4"
