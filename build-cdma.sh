#!/bin/bash

BASE_VER=".smokin901.wlv.wls"
VER=""
# Kernel Version
KERNEL_VER=$BASE_VER$VER

# AK Variables
export LOCALVERSION="-"`echo $KERNEL_VER`

# toolchain
export CROSS_COMPILE=${HOME}/Toolchains/arm-cortex_a15-linux-gnueabihf-linaro_4.9.2-2014.09/bin/arm-cortex_a15-linux-gnueabihf-

export ARCH=arm
export SUBARCH=arm
DATE_START=$(date +"%s")
make "elementalx_m7wls_defconfig"

echo "LOCALVERSION="$LOCALVERSION
echo "CROSS_COMPILE="$CROSS_COMPILE
echo "ARCH="$ARCH

make -j4

DATE_END=$(date +"%s")
echo
DIFF=$(($DATE_END - $DATE_START))
echo "  Build completed in $(($DIFF / 60)) minutes and $(($DIFF % 60)) seconds."
echo

find . -name zImage -exec cp '{}' ../../kernel \;
find . -name *.ko -exec cp '{}' ../../kernel \;
