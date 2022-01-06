#!/bin/bash

main() {
    rtsp-simple-server conf.yml &> /dev/null &
    sleep 3
    ffmpeg -re -stream_loop 10 -i /usr/local/nosound.mp4 -c copy -f rtsp rtsp://localhost:8554/mystream
}

exit_script() {
    echo "Help! I am being killed!"
    killall -SIGINT ffmpeg
    killall -SIGINT rtsp-simple-server
    trap - SIGINT SIGTERM # clear the trap
    kill -- -$$           # Sends SIGTERM to child/sub processes
}

trap exit_script SIGINT SIGTERM

main
