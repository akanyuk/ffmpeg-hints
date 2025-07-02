#! /bin/sh

# -an            - no sound
# -ss 00:00:02.9 - start
# -t 00:01:00.0  - duration

ffmpeg -i $1 -vf "scale=1536:1152:flags=neighbor,crop=1536:1080:0:36" $1.mp4
