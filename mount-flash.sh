#!/bin/bash

if [[ ! -e /dev/sam32a ]]; then
    echo "Couldn't find flash drive. Exiting."
    exit
else
    echo "Flash drive found at /dev/sam32a"
fi

if [[ -z $(lvs | grep lvtin) ]]; then
    echo "Couldn't find the lvtin logical volume. Exiting."
    exit
fi

set -x

mount /dev/vgtin/lvtin root
mount /dev/sam32a1 root/boot
