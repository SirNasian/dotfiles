#!/bin/sh
scrot -a $(slop -of "%x,%y,%w,%h") -F /tmp/screenshot
xclip -selection clipboard -t image/png -i /tmp/screenshot
rm /tmp/screenshot
