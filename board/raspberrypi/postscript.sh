#!/bin/sh

TARGET="${1}"

# do not start the DHCP server by default
[ -f ${TARGET}/etc/init.d/S80dhcp-server ] &&
		mv -f ${TARGET}/etc/init.d/S80dhcp-server ${TARGET}/etc/init.d/_S80dhcp-server

# do not start the HTTP server by default
[ -f ${TARGET}/etc/init.d/S50lighttpd ] &&
		mv -f ${TARGET}/etc/init.d/S50lighttpd ${TARGET}/etc/init.d/_S50lighttpd

# copy System.map
cp ${TARGET}/../build/linux-*/System.map ${TARGET}/System.map

# copy kernel
cp ${TARGET}/../images/zImage ${TARGET}/../images/boot/kernel.img

exit 0

