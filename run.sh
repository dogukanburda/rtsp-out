#!/bin/bash

rtsp-simple-server conf.yml &> /dev/null &
ffmpeg -re -stream_loop -1 -i /usr/local/nosound.mp4 -c copy -f rtsp rtsp://localhost:8554/mystream

# /bin/bash