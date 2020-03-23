#!/bin/sh

. ./setpaths.sh

KERNELS=$RESCUEROOT/lib/modules/*

for kernel in $KERNELS; do
    cp $RESCUEROOT/lib/modules/$kernel/vmlinuz $RESCUEBOOT/vmlinuz-$kernel
    cp $RESCUEROOT/lib/modules/$kernel/System.map $RESCUEBOOT/System.map-$kernel
done

