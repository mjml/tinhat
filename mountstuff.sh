#!/bin/sh


source ./setpaths.sh

set -x

kpartx -a tinhat.img

loopdev=$(losetup -a | awk -F ':' -e "/${RESCUEIMG//\//\\/}/ { print \$1}")
echo loopdev is $loopdev
mapperprefix=${loopdev/\/dev\//\/dev\/mapper\/}

# Wait for vgtin/lvtin to come up
sleep 0.5
cnt=0
while [[ -z $(lvs | grep lvtin) ]] && [[ $((cnt++)) -le 5 ]]; do
    sleep 0.5
    echo "Waiting for vgtin/lvtin to come up..."
done
if [[ $((++cnt)) -ge 5 ]]; then
    echo "vgtin/lvtin not found!"
    exit
fi


while
    mount /dev/vgtin/lvtin $RESCUEROOT
    [[ $? != 0 ]]; do
    sleep 0.5
done


mount ${mapperprefix}p1 $RESCUEBOOT

set +x


          
