#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <source dir> <install dir>" >&2
    exit 1
fi

SOURCE_DIR="$1"
INSTALL_DIR="$2"

BUILD_DIR="$SOURCE_DIR/build"

# Configure
cd $SOURCE_DIR
./configure \
    --prefix=$INSTALL_DIR \
    LDLIBS=-ldl

# Build
mkdir $BUILD_DIR
cd $BUILD_DIR
make -C $SOURCE_DIR -j$(nproc)

# Install
make -C $SOURCE_DIR install