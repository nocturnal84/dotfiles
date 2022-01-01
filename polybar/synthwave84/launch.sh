#!/usr/bin/env bash
DIR="$HOME/.config/polybar/synthwave84"
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done;
polybar main -c "$DIR/config.ini" &
