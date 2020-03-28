#!/bin/bash

. ./setpaths.sh

pushd $RESCUEROOT/etc/selinux

sed -e 's/SELINUX=enforcing/SELINUX=permisive/' <config >tmp
mv -f tmp config

popd
