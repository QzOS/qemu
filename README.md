# QEMU Minimal Configuration

This repository provides scripts and configuration for building QEMU with minimal size optimization.

## Quick Start

Using Make (recommended):
```bash
make setup
make build
```

Or using the script directly:
```bash
./setup-minimal-qemu.sh
cd qemu-source
make -j$(nproc)
```

See [BUILD.md](BUILD.md) for detailed instructions and build options.

## Features

- Minimal QEMU configuration optimized for size
- ARM64 system emulation only (`aarch64-softmmu`)
- All non-essential features disabled
- Support for both make and meson/ninja build systems
- Automated setup script included

## Configuration

The minimal configuration disables:
- Tools, documentation, and plugins
- Network backends (slirp)
- Display options (VNC, GTK, SDL, OpenGL, curses, spice)
- USB and audio support
- Cryptography libraries and debug features

This results in a significantly smaller QEMU binary. 