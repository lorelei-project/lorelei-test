#/bin/bash

SOURCE_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
INSTALL_DIR=$SOURCE_DIR/build/_install

mkdir build
cd build

# 1. Build QEMU
echo "[Build QEMU]"
mkdir qemu
cd qemu
$SOURCE_DIR/tools/build-qemu.sh $SOURCE_DIR/tools/qemu $INSTALL_DIR
cd ..

# 2. Build Blink
echo "[Build Blink]"
mkdir blink
cd blink
$SOURCE_DIR/tools/build-blink.sh $SOURCE_DIR/tools/blink $INSTALL_DIR
cd ..

# 3. Build Box64
echo "[Build Box64]"
mkdir box64
cd box64
$SOURCE_DIR/tools/build-box64.sh $SOURCE_DIR/tools/box64 $INSTALL_DIR
cd ..

# 4. Build GLIBC
echo "[Build GLIBC]"
mkdir glibc
cd glibc
$SOURCE_DIR/libs/build-glibc.sh $SOURCE_DIR/libs/glibc $$SOURCE_DIR/build/_x64root
cd ..