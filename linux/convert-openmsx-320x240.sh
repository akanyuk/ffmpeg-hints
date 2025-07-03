#! /bin/sh

# -an            - no sound
# -ss 00:00:02.9 - start
# -t 00:01:00.0  - duration

ffmpeg -i $1 -vf "scale=1600:1200:flags=neighbor,crop=1600:1080:0:60" $1.mp4
