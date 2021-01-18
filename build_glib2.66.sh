#!/bin/bash
# ./configure --host=arm-linux-androideabi --prefix=$PWD/../out/ \
    # --includedir=/home/geek/work/ndk/android-ndk-r21b/sources/android/cpufeatures/

	# --includedir $PWD/out/include \
	# --libdir $PWD/out/lib \
	# -Dlibdir=$PWD/out/lib \
	# -Dincludedir=$PWD/out/include \

. env.sh

OUTDIR=/home/geek/work/ndk/cairo/out/

	# meson --reconfigure
CC=arm-linux-androideabi-gcc CFLAGS="-I$OUTDIR/include -L$OUTDIR/lib" meson setup --wipe  glib-2.66.0 release/ \
	--includedir $OUTDIR/include \
	--libdir $OUTDIR/lib \
	--cross-file cross_file.txt \
	--prefix=$OUTDIR/ \
	-Dc_arg="-I$OUTDIR/include -L$OUTDIR/lib" \
	-Dc_link_args="-I$OUTDIR/include -L$OUTDIR/lib" \
	-Diconv=external \
	-Dinternal_pcre='true' \
