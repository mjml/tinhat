#!/bin/sh

source ./setpaths.sh

set -x

loopdev=$(losetup -a | grep $RESCUEIMG | cut -f 1 -d \: )
echo loopdev is $loopdev

grub2-install --debug --recheck --no-floppy --target=x86_64-efi --efi-directory=$RESCUEBOOT/efi --directory=/root/tinhat/root/usr/lib/grub/x86_64-efi --boot-directory=$RESCUEBOOT --root-directory=$RESCUEROOT $loopdev

