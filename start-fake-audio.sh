
#!/usr/bin/env bash


pulseaudio --start 

pactl load-module module-pipe-source source_name=virtmic file=/home/seluser/virtmic format=s16le rate=16000 channels=1

pactl set-default-source virtmic

/home/seluser/ffmpeg -stream_loop -1 -re -i /home/seluser/audio.mp3 -f s16le -ar 16000 -ac 1 - > /home/seluser/virtmic
