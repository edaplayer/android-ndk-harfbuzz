#!/bin/bash
. env.sh

echo OUTDIR=$OUTDIR

cd $OUTDIR/lib/
# if ! [ -e libgettextlib.so  ]; then
	# [ -f libgettextlib-0.21.so ] && ln -s libgettextlib-0.21.so libgettextlib.so
# fi
ln -s libgettextlib-0.21.so libgettextlib.so
cd -

cd gettext-0.21/

CFLAGS="-fPIC -I$OUTDIR/include -L$OUTDIR/lib" \
./configure --host=arm-linux-androideabi \
	--prefix=$OUTDIR \
	--enable-static \
	--with-libiconv-prefix=$OUTDIR \
	--disable-rpath \
	--disable-libasprintf \
	--disable-java \
	--disable-native-java \
	--disable-openmp \
	--disable-curses

ret=$?

if [ "$ret" != 0 ];then
	echo "ERROR: configure failed."
	exit $ret
fi

make -j8 && make install
