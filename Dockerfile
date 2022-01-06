FROM jrottenberg/ffmpeg:4-alpine

RUN apk add bash

COPY nosound.mp4 /usr/local

COPY rtsp-simple-server /usr/local/bin
COPY conf.yml /usr/local/bin
COPY rtsp-simple-server.yml /usr/local/bin
COPY run.sh /usr/local/bin
WORKDIR /usr/local/bin
RUN chmod -R 777 run.sh
ENV RTSP_PROTOCOLS=tcp
EXPOSE 8554
# ENTRYPOINT []
# ENTRYPOINT ["/bin/bash"]
#RUN ["/usr/local/bin/run.sh"]
#ENTRYPOINT ["ffmpeg", "-re", "-stream_loop", "10", "-i", "/usr/local/nosound.mp4", "-c", "copy", "-f", "rtsp", "rtsp://localhost:8554/mystream"]
ENTRYPOINT ["/usr/local/bin/run.sh"]

# ffmpeg -re -stream_loop -1 -i /usr/local/nosound.mp4 -c copy -f rtsp rtsp://localhost:8554/mystream
# docker run -it -d -e RTSP_PROTOCOLS=tcp -p 8554:8554 -p 1935:1935 -p 8888:8888 dogukanburda/ffmpeg:son
# docker run -p 8554:8554 -p 1935:1935 -p 8888:8888 dogukanburda/rtsp-out:1.0
