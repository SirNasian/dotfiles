#!/bin/sh
if [ -e /tmp/screenrecord.pid ]; then
	kill $(cat /tmp/screenrecord.pid)
else
	read x y w h <<< $(slop -of "%x %y %w %h")
	echo $x $y $w $h
	ffmpeg -video_size "${w}x${h}" -framerate 24 -f x11grab -i ":0.0+${x},${y}" /tmp/screenrecord.mp4 &
	notify-send "Screen Recording" "Recording started"
	echo $! > /tmp/screenrecord.pid
	wait $!
	notify-send "Screen Recording" "Recording stopped"
	rm /tmp/screenrecord.pid
	mkdir -p $HOME/Videos/ScreenRecordings
	mv /tmp/screenrecord.mp4 $HOME/Videos/ScreenRecordings/$(date +%Y-%m-%d_%H-%M-%S).mp4
fi
