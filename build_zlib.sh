#!/bin/bash
# --includedir=/home/geek/work/ndk/android-ndk-r21b/sources/android/cpufeatures/
. ./env.sh

cd zlib-1.2.7/
# LIBDIR=$OUTDIR/lib/ CFLAGS="-I$OUTDIR/include -L$OUTDIR/lib"
./configure \
	--prefix=$OUTDIR \
	--static

ret=$?

if [ "$ret" != 0 ];then
	echo "ERROR: configure failed."
	exit $ret
fi

make -j8 && make install
