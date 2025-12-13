#!/bin/bash
# Minimal QEMU configuration script
# This script should be run from the QEMU source directory

../configure \
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
