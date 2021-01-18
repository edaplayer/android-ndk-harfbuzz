#!/bin/bash
ROOT=$PWD
HOSTDIR=$ROOT/hosticu
TARGETDIR=$ROOT/targeticu

build_host()
{
	mkdir -p $HOSTDIR
	cd $HOSTDIR

# export
# CPP=
# CPPFLAGS=
# Running ./configure   for Linux using the GNU C++ compiler
	# CC=gcc \
	# CXX=g++ \
	# LDFLAGS="-fPIC" \
	# CFLAGS="-DU_DISABLE_RENAMING=1 -DU_DISABLE_VERSION_SUFFIX=1 -fPIC -I$INCLUDEDIR -std=c11" \
	# CXXFLAGS="-DU_DISABLE_RENAMING=1 -DU_DISABLE_VERSION_SUFFIX=1 -fPIC -I$INCLUDEDIR -std=c++11" \
	CFLAGS="-fPIC -I$INCLUDEDIR -std=c11" \
	CXXFLAGS="-fPIC -I$INCLUDEDIR -std=c++11" \
	$ROOT/icu/source/runConfigureICU Linux/gcc \
		--disable-samples --disable-tests \

		# --enable-tools=no \
	# --enable-renaming=no \
	# --enable-rpath=no \
	# --enable-auto-cleanup \
	# --with-data-packaging=static \

	make -j8
}

build_target()
{
	echo "build target platform program"
	# . $ROOT/env.sh
	OUTDIR="$PWD/out"
	INCLUDEDIR=$OUTDIR/include/
	mkdir -p $TARGETDIR
	cd $TARGETDIR

	# CFLAGS="-DU_DISABLE_RENAMING=1 -DU_DISABLE_VERSION_SUFFIX=1 -fPIC -I$INCLUDEDIR -std=c11" \
	# CXXFLAGS="-DU_DISABLE_RENAMING=1 -DU_DISABLE_VERSION_SUFFIX=1 -fPIC -I$INCLUDEDIR -std=c++11" \

	CC="arm-linux-androideabi-gcc" \
	CXX="arm-linux-androideabi-g++" \
	PREFIX=$OUTDIR \
	LDFLAGS="-L$OUTDIR/lib" \
	LIBDIR=$OUTDIR/lib/ \
	CFLAGS="-fPIC -I$INCLUDEDIR -std=c11" \
	CXXFLAGS="-fPIC -I$INCLUDEDIR -std=c++11" \
	PKG_CONFIG_PATH=$OUTDIR/lib/pkgconfig \
	$ROOT/icu/source/configure --host=arm-linux-androideabi \
		--prefix=$OUTDIR/ \
		--with-cross-build=$HOSTDIR \
		--includedir=$INCLUDEDIR \
		--enable-static \
		--disable-samples --disable-tests \
		--enable-rpath=no \

		# --enable-tools=no \
		# --enable-renaming=no \
		# --disable-dyload \

	ret=$?
	if [ "$ret" != 0 ];then
		echo "ERROR: configure failed."
		exit $ret
	fi
	echo "build success."

	make -j8 && make install
}

if [ "$1" = "host" ] ;then
	build_host
else
	build_target
fi

