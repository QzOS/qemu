# Building QEMU with Minimal Configuration

This repository contains scripts and documentation for building QEMU with a minimal configuration optimized for size.

## Quick Start

### Option 1: Using Makefile (Recommended)

```bash
make setup   # Download and configure QEMU
make build   # Build with make
```

Or for LTO-optimized build:
```bash
make setup
make build-lto
```

Run `make help` to see all available targets.

### Option 2: Automated Setup Script

Run the automated setup script:

```bash
./setup-minimal-qemu.sh
```

This will:
1. Download QEMU source (if not already present)
2. Configure it with minimal options
3. Prepare it for building

Then build with:

```bash
cd qemu-source
make -j$(nproc)
```

### Option 3: Manual Setup

1. Download QEMU source:

```bash
git clone https://gitlab.com/qemu-project/qemu.git qemu-source
cd qemu-source
```

2. Configure with minimal options:

```bash
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
```

3. Build:

```bash
make -j$(nproc)
```

## Build Options

### Standard Build

```bash
make -j$(nproc)
```

### Optimized Build with LTO

For an even smaller binary with Link Time Optimization:

```bash
meson setup build --buildtype=release -Db_lto=true
ninja -C build
```

## Configuration Details

This minimal configuration:

- **Target**: Only builds `aarch64-softmmu` (ARM 64-bit system emulation)
- **Disabled Features**:
  - Tools (qemu-img, qemu-nbd, etc.)
  - Documentation
  - Plugin system
  - Network backends (slirp)
  - Display options (VNC, GTK, SDL, OpenGL, curses)
  - SPICE protocol
  - USB support
  - Audio
  - Cryptography libraries (nettle, gcrypt)
  - Disassembly (capstone)
  - SSH and XML support
  - Braille display support
  - VTE terminal widget
  - Debug features

This results in a significantly smaller QEMU binary optimized for size and focused on basic ARM64 system emulation.

## Requirements

- GCC or Clang compiler
- Python 3.x
- Ninja build system (for meson builds)
- Meson (for meson builds)
- Git
- Basic build dependencies (glib, pixman, etc.)

## Notes

- The configuration targets minimal size, so many features are disabled
- Only ARM64 system emulation is enabled
- For production use, you may need to enable additional features based on your requirements
