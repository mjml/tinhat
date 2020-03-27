#!/bin/sh

. ./setpaths.sh

set -x

umount $RESCUEROOT/boot
umount $RESCUEROOT
