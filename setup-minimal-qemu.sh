#!/bin/bash
# Script to download and setup QEMU with minimal configuration

set -e

QEMU_VERSION=${QEMU_VERSION:-"v8.2.0"}
QEMU_REPO="https://gitlab.com/qemu-project/qemu.git"

echo "Setting up QEMU with minimal configuration..."

# Clone QEMU if not already present
if [ ! -d "qemu-source" ]; then
    echo "Downloading QEMU ${QEMU_VERSION}..."
    git clone --depth 1 --branch ${QEMU_VERSION} ${QEMU_REPO} qemu-source
else
    echo "QEMU source already exists in qemu-source/"
fi

cd qemu-source

echo "Configuring QEMU for minimal size..."
./configure \
  --target-list=aarch64-softmmu \
  --disable-tools \
  --disable-docs \
  --disable-plugins \
  --disable-slirp \
  --disable-vnc \
  --disable-gtk \
  --disable-sdl \
  --disable-opengl \
  --disable-curses \
  --disable-spice \
  --disable-usb \
  --disable-libusb \
  --disable-audio \
  --disable-nettle \
  --disable-gcrypt \
  --disable-capstone \
  --disable-libssh \
  --disable-libxml2 \
  --disable-brlapi \
  --disable-vte \
  --disable-qom-cast-debug \
  --disable-debug-info

echo ""
echo "Configuration complete!"
echo ""
echo "To build QEMU, run one of the following:"
echo "  make -j\$(nproc)"
echo ""
echo "Or for optimized build with LTO:"
echo "  meson setup build --buildtype=release -Db_lto=true"
echo "  ninja -C build"
