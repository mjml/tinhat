#!/bin/sh

KERNEL=$(ls boot | grep vmlinuz)

echo dracut -c dracut/dracut.conf --kernel-image $KERNEL

