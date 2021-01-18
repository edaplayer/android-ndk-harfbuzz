#!/bin/bash
. ./env.sh
echo OUTDIR=$OUTDIR

cd libiconv-1.16/
./configure --host=arm-linux-androideabi \
	--prefix=$OUTDIR \

ret=$?

if [ "$ret" != 0 ];then
	echo "ERROR: configure failed."
	exit $ret
fi

make -j8 && make install
