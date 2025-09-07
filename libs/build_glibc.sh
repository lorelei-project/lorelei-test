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

