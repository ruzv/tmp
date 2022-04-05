FROM selenium/standalone-firefox


USER root

RUN apt update \
  && apt install -y iproute2 iptables pulseaudio procps libsdl2-dev x264 x11-utils libxcb-shm0-dev libxcb-xfixes0-dev libx11-6 libx11-xcb1 libxcb1 libnss3-tools


RUN wget --no-verbose -O /home/seluser/ffmpeg https://s3-us-west-2.amazonaws.com/tdl-rtc-tester/binaries/ffmpeg-amd64 \
  && chown seluser: /home/seluser/ffmpeg \
  && chmod 700 /home/seluser/ffmpeg


USER seluser


# /home/seluser/ffmpeg -y -f pulse -i default -f x11grab -framerate 15 -video_size 1360x1020 -i :99.0 -pix_fmt yuv420p -qp 0 video_out.mp4
