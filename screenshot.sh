#!/bin/sh
scrot -a $(slop -lc 1,1,1,0.5 -f "%x,%y,%w,%h") -F /tmp/screenshot
xclip -selection clipboard -t image/png -i /tmp/screenshot
rm /tmp/screenshot
