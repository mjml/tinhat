#!/bin/bash

source ./setpaths.sh

set -x
grub2-install --debug --recheck --no-floppy --no-nvram --target=x86_64-efi --efi-directory=$RESCUEBOOT /dev/sam32a1

echo Fixup to get the correct name for the EFI bootloader...
mkdir -p $RESCUEBOOT/efi/boot
rm -rf $RESCUEBOOT/efi/boot/*
cp $RESCUEBOOT/efi/grub/grubx64.efi $RESCUEBOOT/efi/boot/bootx64.efi
rm -rf $RESCUEBOOT/efi/grub
