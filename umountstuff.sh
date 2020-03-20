#!/bin/sh

. ./setpaths.sh

umount $RESCUEBOOT
umount $RESCUEROOT

loopdev=$(losetup -a | awk -F ':' -e "/${RESCUEIMG//\//\\/}/ { print \$1}")

echo loopdev is $loopdev

mapperprefix=${loopdev/\/dev\//\/dev\/mapper\/}

echo mapperprefix is $mapperprefix

set -x 

lvchange -an vgtin

dmsetup remove ${mapperprefix}p?

losetup -d $loopdev

set +x

