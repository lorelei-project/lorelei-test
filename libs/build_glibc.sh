#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <source dir> <install dir>" >&2
    exit 1
fi

SOURCE_DIR="$1"
INSTALL_DIR="$2"

ARCH=$(uname -m)
if [ $ARCH == "x86_64" ]; then
    echo "Current architecture is x86_64"
else
    echo "Current architecture is $ARCH, skip."
    exit 0
fi

# workaround for missing "asm" include dir
ln -s /usr/include/x86_64-linux-gnu/asm $SOURCE_DIR/asm

$SOURCE_DIR/configure \
    --prefix=$INSTALL_DIR \
    --enable-add-ons \
    --disable-profile \
    --with-headers=/usr/include \
    --with-binutils=/usr/bin \
    --disable-sanity-checks \
    --enable-shared
bear make -j16
make install