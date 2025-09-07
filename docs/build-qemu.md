# Build QEMU

## Setup Environment

```bash
mkdir build
cd build
../configure --target-list=x86_64-linux-user
make -j$(nproc)
```