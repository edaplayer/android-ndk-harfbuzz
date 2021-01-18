# Add the standalone toolchain to the search path.
# export PATH=$PATH:`pwd`/my-toolchain/bin

# Tell configure what tools to use.
# target_host=aarch64-linux-android
# export AR=$target_host-ar
# export AS=$target_host-clang
# export CC=$target_host-clang
# export CXX=$target_host-clang++
# export LD=$target_host-ld
# export STRIP=$target_host-strip

TOOLCHAIN=$HOME/work/ndk/toolchain

export CROSS_COMPILE=arm-linux-androideabi-
export AR=${CROSS_COMPILE}ar
export AS=${CROSS_COMPILE}as
export CC=${CROSS_COMPILE}gcc
# export CPP=${CROSS_COMPILE}gcc -E
export CXX=${CROSS_COMPILE}g++
export LD=${CROSS_COMPILE}ld
export NM=${CROSS_COMPILE}nm
export RANLIB=${CROSS_COMPILE}ranlib
export STRIP=${CROSS_COMPILE}strip
export STRINGS=${CROSS_COMPILE}strings
export OBJCOPY=${CROSS_COMPILE}objcopy
export READELF=${CROSS_COMPILE}readelf

# Tell configure what flags Android requires.
export ROOTDIR="$HOME/work/ndk/builddir/"
export OUTDIR="$HOME/work/ndk/builddir/out"
export INCLUDEDIR=$OUTDIR/include/
export LIBDIR=$OUTDIR/lib/
export PREFIX=$OUTDIR

export LD_LIBRARY_PATH=$OUTDIR/lib
export CFLAGS="-fPIC -I$INCLUDEDIR"
export CXXFLAGS="-fPIC -I$INCLUDEDIR" \
export LDFLAGS="-fPIC -pie -L$LD_LIBRARY_PATH"
export LIBS="-L$LD_LIBRARY_PATH"

export PKG_CONFIG=/usr/bin/pkg-config
export PKG_CONFIG_PATH=$OUTDIR/lib/pkgconfig

