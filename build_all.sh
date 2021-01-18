#!/bin/bash
#########################################################################
# File Name: build_all.sh
# Author: Edward.Tang
# mail:   @163.com
# Created Time: Fri 25 Sep 2020 10:06:56 AM CST
#########################################################################
./build_zlib.sh && \
./build_ffi.sh && \
./build_pcre.sh && \
./build_iconv.sh && \
./build_libpng.sh && \
./build_pixman.sh && \
./build_gettext.sh && \
./build_freetype.sh && \
./build_glib2.56.sh && \
./build_cairo.sh && \
./build_icu.sh host && \
./build_icu.sh && \
./build_harfbuzz.sh

