#! /bin/sh

# -an - no sound
ffmpeg -ss 00:00:00.000 -t 00:01:00.0 -i $1 -vf "scale=1536:1152:flags=neighbor,crop=1536:1080:0:36" $1.mp4
