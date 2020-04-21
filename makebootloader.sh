#!/bin/bash

source ./setpaths.sh

set -x

if [[ ! -e $RESCUEBOOT/grub2/grub.cfg ]]; then
    echo "Automatically creating $RESCUEBOOT/grub2/grub.cfg"
    grub2-mkconfig -o $RESCUEBOOT/grub2/grub.cfg
fi

echo Clearing old bootloader
rm -rf $RESCUEBOOT/efi/*

echo "Installing grub to $RESCUEBOOT on ${RESCUEDEV}1"
grub2-install --debug --removable --recheck --no-floppy --no-nvram --target=x86_64-efi \
              --efi-directory=$RESCUEBOOT \
              --boot-directory=$RESCUEBOOT \
              ${RESCUEDEV}1

echo Fixup to get the correct name for the EFI bootloader...
cp $RESCUEBOOT/efi/grub/grubx64.efi $RESCUEBOOT/efi/boot/bootx64.efi
rm -rf $RESCUEBOOT/efi/grub
