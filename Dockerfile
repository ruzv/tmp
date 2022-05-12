FROM selenium/standalone-firefox


USER root

RUN apt update \
  && apt install -y iproute2 iptables pulseaudio procps libsdl2-dev x264 x11-utils libxcb-shm0-dev libxcb-xfixes0-dev libx11-6 libx11-xcb1 libxcb1 libnss3-tools


RUN wget --no-verbose -O /home/seluser/ffmpeg https://s3-us-west-2.amazonaws.com/tdl-rtc-tester/binaries/ffmpeg-amd64 \
  && chown seluser: /home/seluser/ffmpeg \
  && chmod 700 /home/seluser/ffmpeg


RUN echo "allow-exit = no" >> /etc/pulse/daemon.conf
RUN echo "exit-idle-time = -1" >> /etc/pulse/daemon.conf

RUN echo "default-source = virtmic" >> /etc/pulse/client.conf


USER 1200

COPY start-fake-audio.sh /opt/bin/

COPY fake-audio.conf /etc/supervisor/conf.d/



USER seluser

COPY audio.mp3 /home/seluser/
