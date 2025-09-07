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
    ARCH_FLAG="-DLORELEI_ENABLE_GUEST=TRUE"
elif [ $ARCH == "aarch64" ]; then
    ARCH_FLAG="-DLORELEI_ENABLE_GUEST=FALSE"
elif [ $ARCH == "riscv64" ]; then
    ARCH_FLAG="-DLORELEI_ENABLE_GUEST=FALSE"
else
    echo "ERROR: architecture $ARCH is not supported!!!"
fi

cmake -S $SOURCE_DIR -B . -G Ninja $ARCH_FLAG \
    -DCMAKE_INSTALL_PREFIX=$INSTALL_DIR \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DLORELEI_BUILD_TOOLS=FALSE

cmake --build . --target all
cmake --build . --target install