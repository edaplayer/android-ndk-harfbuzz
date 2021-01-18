#!/bin/bash
. ./env.sh
echo OUTDIR=$OUTDIR

cd libpng-1.6.37/
./configure --host=arm-linux-androideabi \
	--prefix=$OUTDIR \
	--enable-static \
	--with-zlib-prefix=$OUTDIR

ret=$?

if [ "$ret" != 0 ];then
	echo "ERROR: configure failed."
	exit $ret
fi

make -j8 && make install
