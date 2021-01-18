#!/bin/bash
. ./env.sh
echo OUTDIR=$OUTDIR
cd libffi-3.3/
CFLAGS="-fPIC -I$OUTDIR/include -L$OUTDIR/lib " \
	./configure --host=arm-linux-androideabi --prefix=$OUTDIR/ \
	--includedir=$OUTDIR/include --libdir=$OUTDIR/lib \
	--disable-multi-os-directory \
	--enable-static

ret=$?

if [ "$ret" != 0 ];then
	echo "ERROR: configure failed."
	exit $ret
fi

make -j8 && make install
