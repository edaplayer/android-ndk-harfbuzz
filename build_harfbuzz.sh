#!/bin/bash
. env.sh
echo OUTDIR=$OUTDIR

cd harfbuzz-2.7.2/

# CAIRO_LIBS=$OUTDIR/lib \
# LIBS="-L$OUTDIR/lib" \

# CFLAGS="-std=c11 -DU_DISABLE_RENAMING=1 -DU_DISABLE_VERSION_SUFFIX=1 -fPIC -I$OUTDIR/include" \
# CXXFLAGS="-std=c++11 -DU_DISABLE_RENAMING=1 -DU_DISABLE_VERSION_SUFFIX=1 -fPIC -I$OUTDIR/include" \

CFLAGS="-std=c11 -fPIC -I$OUTDIR/include" \
CXXFLAGS="-std=c++11 -fPIC -I$OUTDIR/include" \
./configure --host=arm-linux-androideabi \
	--prefix=$OUTDIR/ \
	--enable-static \
	--with-icu=yes \

	# --with-cairo=yes \

ret=$?
if [ "$ret" != 0 ];then
	echo "ERROR: configure failed."
	exit $ret
fi

make -j8 && make install
