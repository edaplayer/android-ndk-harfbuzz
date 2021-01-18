#!/bin/bash
# ./configure --host=arm-linux-androideabi --prefix=$PWD/../out/ --cache-file=android.cache \
	# --includedir=$PWD/../out/include --libdir=$PWD/../out/lib \
. env.sh

cp android.cache glib-2.56.4/
cd glib-2.56.4/

LIBS=-lgettextlib CFLAGS="-fPIC -I$OUTDIR/include -L$OUTDIR/lib" &&
	./configure --host=arm-linux-androideabi \
	--prefix=$OUTDIR \
	--cache-file=android.cache \
	--disable-libelf  \
	--enable-libmount=no \
	--enable-static \

	# --with-pcre=no  \

ret=$?
if [ "$ret" != 0 ];then
	echo "ERROR: configure failed."
	exit $ret
fi

make -j8 && make install
