### Converting an audio track to mp3
```
ffmpeg -i source.avi -acodec mp3 -c:v copy output.avi
```

#### The same thing, but with the selection of the desired track (1 - the first, 2 - the second) - not tested
```
ffmpeg -i source.avi -c:a:1 mp3 -c:v copy output.avi
```

### Cuts off the beginning of the video, change the duration, change the size without smoothing, save it to mp4
```
ffmpeg -ss 00:00:02.500 -t 00:00:06.0 -i "source.avi" -vf "scale=1280:960:flags=neighbor" output.mp4
```

### Crop + resize
```
ffmpeg -i source.avi -vf "crop=640:460:3:59,scale=1280:920:flags=neighbor" output.mp4
```

```
ffmpeg -i in.mp4 -filter:v "crop=out_w:out_h:x:y" out.mp4
```
Where the options are as follows:
* out_w is the width of the output rectangle
* out_h is the height of the output rectangle
* x and y specify the top left corner of the output rectangle


### Example of a stream on stream.retroscene.org

```
ffmpeg -re -i %1 -c copy -f flv rtmp://stream.retroscene.org/%SECRET%/main
```

```
ffmpeg -f dshow -i video="Logitech HD Webcam C270" -preset ultrafast -vcodec libx264 -tune zerolatency -b 900k -f flv rtmp://stream.retroscene.org/%SECRET%/main
```

### Make mp4 from DOSBox capture
```
ffmpeg -i %1 -vf scale=640:480:flags=neighbor -r 30 -vcodec libx264 -crf 20 -acodec libmp3lame -aq 2 -f mp4 %1.mp4
```

### Rotate the video by 90, 180, 270 degrees. Can be mirrored

0 = 90 CounterCLockwise and Vertical Flip (default)
1 = 90 Clockwise
2 = 90 CounterClockwise
3 = 90 Clockwise and Vertical Flip

To rotate 180 degrees, instead use "transpose=2,transpose=2"
```
ffmpeg -i afterparty2.ts -vf "transpose=2" afterparty2.mp4
```

### Concat protocol
```
ffmpeg -i afterparty1.mp4 -c copy -bsf:v h264_mp4toannexb -f mpegts 1f.ts
ffmpeg -i afterparty2.mp4 -c copy -bsf:v h264_mp4toannexb -f mpegts 2f.ts
ffmpeg -i "concat:1f.ts|2f.ts" -y -bsf:a aac_adtstoasc -c copy afterparty.mp4
```

### Concat demuxer (best choice)
```
$ cat mylist.txt
file '/path/to/file1'
file '/path/to/file2'
file '/path/to/file3'
    
$ ffmpeg -f concat -i mylist.txt -c copy output.mp4
```
  
### Fade in/out audio and video
video in frames, audio in seconds
```
ffmpeg -i s1.mp4 -y -vf "fade=in:0:120, fade=out:61233:240, scale=1704:960" -af "afade=in:st=0:d=2,afade=out:st=253.5:d=2.5" s2.mp4
```

### Counting number of frames
```
ffprobe -v error -count_frames -select_streams v:0 -show_entries stream=nb_read_frames -of default=nokey=1:noprint_wrappers=1 3.mp4 
```

### Increasing canvas size
```
ffmpeg -i "%1" -vf "scale=880:1100:flags=neighbor,pad=width=1464:height=1100:x=292:y=0:color=black" "%1.mp4"
```
