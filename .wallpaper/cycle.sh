#!/bin/sh
while true; do
	feh --bg-fill $(find .wallpaper/ -type f ! -name "*.sh" | shuf -n 1)
	sleep 900;
done
