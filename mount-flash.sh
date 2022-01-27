#!/bin/bash

. ./setpaths.sh

if [[ ! -e $RESCUEDEV ]]; then
    echo "Couldn't find flash drive. Exiting."
    exit
else
    echo "Flash drive found at $RESCUEDEV"
fi

if [[ -z $(lvs | grep lvtin) ]]; then
    echo "Couldn't find the lvtin logical volume. Exiting."
    exit
fi

set -x

mount $RESCUEROOTDEV root
mount $RESCUEBOOTDEV root/boot
