#!/bin/sh

KERNEL=$(ls boot | grep vmlinuz)
INITRAMFS=${KERNEL/vmlinuz/initramfs}

echo dracut -c dracut/dracut.conf --kernel-image boot/$KERNEL boot/$INITRAMFS
dracut -c dracut/dracut.conf --kernel-image boot/$KERNEL boot/$INITRAMFS

