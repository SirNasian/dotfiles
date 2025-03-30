#!/bin/sh
while true; do
	for wallpaper in $(find .wallpaper/ -type f ! -name "*.sh" | shuf); do
		feh --bg-fill $wallpaper
		sleep 900;
	done
done
