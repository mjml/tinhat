#!/bin/bash

source ./setpaths.sh


# Manually unpack the kernel rpms
echo Downloading kernel-core and kernel-modules...
set -x

dnf-tinhat download kernel-core kernel-modules

KERNELCORE_RPM=$(ls -1 kernel-core*.rpm | sort -r | head -1)
KERNELMODS_RPM=$(ls -1 kernel-modules*.rpm | sort -r | head -1)

set +x
echo Got kernel core rpm at $KERNELCORE_RPM
echo Got kernel mods rpm at $KERNELMODS_RPM

echo Extracting both rpms manually to avoid rpm script triggers
set -x

rpm2cpio $KERNELCORE_RPM | cpio -i -u -d -D ${RESCUEROOT} 
rpm2cpio $KERNELMODS_RPM | cpio -i -u -d -D ${RESCUEROOT}

set +x

KERNELS=$(ls -1 $RESCUEROOT/lib/modules)

for kernel in $KERNELS; do
    echo "Copying kernel and System.map and running depmod"
    set -x
    cp $RESCUEROOT/lib/modules/$kernel/vmlinuz $RESCUEBOOT/vmlinuz-$kernel
    cp $RESCUEROOT/lib/modules/$kernel/System.map $RESCUEBOOT/System.map-$kernel
    pushd $RESCUEROOT/lib/modules/$kernel
    depmod -F System.map -b $RESCUEROOT -C $RESCUEROOT/etc/depmod.d $kernel
    popd
    set +x
done

