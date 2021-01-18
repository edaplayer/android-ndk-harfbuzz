#!/bin/bash
. env.sh
# CPUDIR=$HOME/work/ndk/android-ndk-r21b/sources/android/cpufeatures
CPUDIR=$ROOTDIR/cpufeatures
cd $CPUDIR
# ./build.sh
ndk-build NDK_PROJECT_PATH=. \
	APP_BUILD_SCRIPT=Android.mk \
	NDK_APPLICATION_MK=Application.mk

cp $CPUDIR/obj/local/armeabi-v7a/libcpufeatures.a $OUTDIR/lib/
cd -

cd pixman-0.40.0/
./configure --host=arm-linux-androideabi \
	--prefix=$OUTDIR/ \
	--enable-libpng \
	--enable-static \
	--disable-arm-simd \
	--disable-arm-neon \
	CFLAGS="-mfpu=neon -fPIC -I$CPUDIR -I$OUTDIR/include -L$OUTDIR/lib " \
	LDFLAGS="-mfpu=neon -L$OUTDIR/lib -lcpufeatures" \

ret=$?

if [ "$ret" != 0 ];then
	echo "ERROR: configure failed."
	exit $ret
fi

make -j8 && make install
