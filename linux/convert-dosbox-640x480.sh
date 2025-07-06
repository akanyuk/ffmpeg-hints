#! /bin/sh

# -an - no sound
ffmpeg -ss 00:00:00.000 -t 00:01:00.0 -an -i $1 -vf "scale=1920:1440:flags=neighbor" $1.mp4
