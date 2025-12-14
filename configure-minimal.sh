#!/bin/bash
# Minimal QEMU configuration script
# This script should be run from within the QEMU source directory

set -e

if [ ! -f "configure" ]; then
    echo "Error: configure script not found. Please run this from the QEMU source directory."
    exit 1
fi

./configure \
  --target-list=aarch64-softmmu \
  --disable-user \
  --disable-gtk \
  --disable-sdl \
  --disable-vnc \
  --disable-spice \
  --disable-opengl \
  --disable-curses \
  --disable-audio \
  --disable-usb \
  --disable-libusb \
  --disable-brlapi \
  --disable-vte \
  --disable-docs \
  --disable-plugins \
  --disable-libxml2 \
  --disable-libssh \
  --disable-slirp \
  --enable-debug \
  --enable-gdb
