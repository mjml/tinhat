#!/bin/bash

source ./setpaths.sh

dnf-tinhat --releasever=31 install $(cat package-list.txt)

