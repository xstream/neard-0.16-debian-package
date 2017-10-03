#!/bin/bash

# sudo apt -y install git debhelper dh-autoreconf automake libnl-3-dev libnl-genl-3-dev

./clean.sh

if [ ! -f neard_0.16.orig.tar.gz ]; then
	wget https://git.kernel.org/pub/scm/network/nfc/neard.git/snapshot/neard-0.16.tar.gz
	mv neard-0.16.tar.gz neard_0.16.orig.tar.gz
fi

if [ ! -d neard-0.16 ]; then
	tar zxf neard_0.16.orig.tar.gz
fi

if [ ! -d neard-0.16/debian ]; then
	cp -r debian neard-0.16/
fi

cd neard-0.16

dpkg-buildpackage -nc -b -uc -us
