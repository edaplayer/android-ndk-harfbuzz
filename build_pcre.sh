#!/bin/bash
. env.sh

cd pcre-8.44/
./configure --host=arm-linux-androideabi \
	--prefix=$OUTDIR/ \
	--enable-static \
	CFLAGS="-fPIC -I$CPUDIR -I$OUTDIR/include -L$OUTDIR/lib " \

ret=$?

if [ "$ret" != 0 ];then
	echo "ERROR: configure failed."
	exit $ret
fi

make -j8 && make install
