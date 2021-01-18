#!/bin/bash
. ./env.sh
echo OUTDIR=$OUTDIR

cd freetype-2.10.2/
./configure --host=arm-linux-androideabi \
	--prefix=$OUTDIR \
	--enable-static \

  # --with-harfbuzz=yes

ret=$?

if [ "$ret" != 0 ];then
	echo "ERROR: configure failed."
	exit $ret
fi

make -j8 && make install
