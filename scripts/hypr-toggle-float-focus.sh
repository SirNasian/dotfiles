#!/bin/sh
IS_FLOATING=$(hyprctl activewindow -j | jq -r ".floating")
TARGET=$([ "$IS_FLOATING" = "true" ] && echo tiled || echo floating)
hyprctl dispatch focuswindow $TARGET
