#! /bin/sh

# -an            - no sound
# -ss 00:00:02.9 - start
# -t 00:01:00.0  - duration

ffmpeg -i $1 -vf "scale=iw*2:ih*2:flags=neighbor" $1.mp4
