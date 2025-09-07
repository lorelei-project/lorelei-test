# Build Glibc

## Setup Environment

```bash
sudo apt install gawk bear

git clone https://sourceware.org/git/glibc.git
cd glibc
git checkout release/2.35/master

mkdir build
cd build
export GLIBC_INSTALL_DIR=$(pwd)/install
../configure \
    --prefix=$GLIBC_INSTALL_DIR \
    --enable-add-ons \
    --disable-profile \
    --with-headers=/usr/include \
    --with-binutils=/usr/bin \
    --disable-sanity-checks \
    --enable-shared
bear make -j16
make install
```

## Error Handling

1. /usr/include/linux/errno.h:1:10: fatal error: asm/errno.h: No such file or directory

```bash
ln -s /usr/include/x86_64-linux-gnu/asm /usr/include/asm
```