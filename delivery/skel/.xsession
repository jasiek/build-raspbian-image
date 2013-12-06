#!/bin/sh

matchbox-window-manager &

xset s off
xset -dpms
xset s noblank

sleep 10

/usr/bin/midori -e Fullscreen --app=http://jasiek.github.io/raspberry-dashboard/start




