#! /bin/sh

# -an - no sound
ffmpeg -ss 00:00:02.9 -t 00:01:00.0 -i $1 -vf "scale=1680:1200:flags=neighbor,crop=1680:1080:0:60" -an $1.mp4
