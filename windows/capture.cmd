@echo off
@rem install: https://github.com/rdp/screen-capture-recorder-to-video-windows-free

set framerate=24
set quality=20

set outputFile=%1
:request-file
if "%outputFile%"=="" set /p outputFile=Output file name: 
if "%outputFile%"=="" goto:request-file

rem ffmpeg -f dshow -i video="screen-capture-recorder" -framerate %framerate% -vcodec libx264 -pix_fmt yuv420p -preset ultrafast -vsync vfr %outputFile%.mkv
ffmpeg -f dshow -i audio="virtual-audio-capturer":video="screen-capture-recorder" -c:v libx264rgb -framerate %framerate% -crf %quality% -preset ultrafast %outputFile%.mkv