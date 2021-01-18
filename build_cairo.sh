#!/bin/bash
. env.sh

# OUTDIR=/home/geek/work/ndk/cairo/out/
cd cairo-1.17.2/
CFLAGS="-fPIC -I$OUTDIR/include -L$OUTDIR/lib" \
	./configure --host=arm-linux-androideabi \
	--prefix=$OUTDIR \
	--enable-gl=auto \
	--enable-glesv2=auto \
	--enable-glesv3=auto \
	--enable-static \

ret=$?
if [ "$ret" != 0 ];then
	echo "ERROR: configure failed."
	exit $ret
fi

make -j8 && make install
