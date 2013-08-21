#!/bin/sh

machine=`uname -m`
if [ "${machine}" != "armv7l" ]; then
  echo "This script will be executed at mounted raspbian enviroment (armv7l). Current environment is ${machine}."
  exit 1
fi

echo "Please check environment variables etc, this script can be executed ONLY within RPI environment!"
echo "When tasks done, type \"exit\" to return"
echo ""

# We need to preconfigure that package manually, otherwise it'll try and display a dialog window.
dpkg-preconfigure keyboard-configuration --frontend=noninteractive
apt-get -y install mg avahi-daemon midori matchbox xinit

# Enable nodm
echo "NODM_ENABLED=true" >> /etc/default/nodm

adduser --disabled-password --gecos XYZ dashboard
cp skel/.* /home/dashboard

echo "7:23:respawn:/sbin/getty -a dashboard 38400 tty7" >> /etc/inittab

update-locale LC_ALL=C LANGUAGE=en
