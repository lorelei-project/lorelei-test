#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <source dir> <install dir>" >&2
    exit 1
fi

SOURCE_DIR="$1"
INSTALL_DIR="$2"

ARCH=$(uname -m)
ARCH_FLAG=""
if [ $ARCH == "x86_64" ]; then
    ARCH_FLAG="-DAMD64=TRUE" # not used
elif [ $ARCH == "aarch64" ]; then
    ARCH_FLAG="-DARM64=TRUE"
elif [ $ARCH == "riscv64" ]; then
    ARCH_FLAG="-DRV64=TRUE"
else
    echo "ERROR: architecture $ARCH is not supported!!!"
fi

BUILD_DIR="$SOURCE_DIR/build"

# Configure
cmake -S $SOURCE_DIR -B $BUILD_DIR -G Ninja $ARCH_FLAG \
    -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DNO_LIB_INSTALL=TRUE \
    -DNO_CONF_INSTALL=TRUE

# Build
cmake --build $BUILD_DIR --target all

# Install
cmake --build $BUILD_DIR --target install