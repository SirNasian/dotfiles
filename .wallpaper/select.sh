#!/bin/sh
feh --bg-fill $(find .wallpaper/ -type f ! -name "*.sh" | fzf)
