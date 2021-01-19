#!/bin/bash

. ./env.sh

NINJA_DIR=ninjadir

cd glib-2.66.4/ &&
meson $NINJA_DIR --cross-file ../cross_file.txt &&
cd $NINJA_DIR &&
ninja &&
ninja install
