#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <source dir> <install dir>" >&2
    exit 1
fi

SOURCE_DIR="$1"
INSTALL_DIR="$2"

# Configure
$SOURCE_DIR/configure \
    --prefix=$INSTALL_DIR \
    --target-list=x86_64-linux-user

# Build
make -j$(nproc)

# Install
make install