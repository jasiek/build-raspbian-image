#!/bin/sh

matchbox-window-manager &

xset -dpms
xset s off

sleep 10

/usr/bin/midori -e Fullscreen --app=http://dashboard.dsd.io/

