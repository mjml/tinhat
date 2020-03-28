#!/bin/bash

. ./setpaths.sh

echo Ensure that SELINUX is set to permissive...
set -x
pushd $RESCUEROOT/etc/selinux
sed -e 's/SELINUX=enforcing/SELINUX=permisive/' <config >tmp
mv -f tmp config
popd
set +x

echo Relabel everything on first boot...
set -x
touch $RESCUEROOT/.autorelabel
set +x
