#!/bin/sh

BLANK='#00000000'
CLEAR='#00000077'
TEXT='#eeeeeeee'
WRONG='#ee555555'
VERIFY='#eeeeee55'

i3lock \
	--ring-color=$BLANK \
	--ringver-color=$VERIFY \
	--ringwrong-color=$WRONG \
	--inside-color=$CLEAR \
	--insidever-color=$CLEAR \
	--insidewrong-color=$CLEAR \
	--line-color=$BLANK \
	--separator-color=$BLANK \
	--verif-color=$BLANK \
	--wrong-color=$BLANK \
	--time-color=$TEXT \
	--date-color=$TEXT \
	--keyhl-color=$VERIFY \
	--bshl-color=$WRONG \
	--screen 1 \
	--blur 8 \
	--clock \
	--indicator \
	--time-str="%H:%M:%S" \
	--date-str="%A, %Y-%m-%d"
