#!/bin/bash

source ./setpaths.sh

echo "Writing package list from filesystem at $RESCUEROOT to packages.txt"
rpm-tinhat -qa | sed -r -e "s/(\-[0-9a-zA-Z\.]+)?\-[0-9a-zA-Z\.]+\.${FCVER}([\.\-][0-9]+)?\.[a-zA-Z0-9_]+\$//" | sort > packages.txt

