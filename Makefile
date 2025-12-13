.PHONY: help setup configure build build-lto clean distclean

help:
	@echo "QEMU Minimal Configuration Build"
	@echo ""
	@echo "Available targets:"
	@echo "  setup      - Download and configure QEMU with minimal configuration"
	@echo "  configure  - Run configure only (requires qemu-source/ to exist)"
	@echo "  build      - Build QEMU using make"
	@echo "  build-lto  - Build QEMU with LTO optimization using meson/ninja"
	@echo "  clean      - Clean build artifacts"
	@echo "  distclean  - Remove QEMU source and all build artifacts"
	@echo ""
	@echo "Quick start: make setup && make build"

setup:
	./setup-minimal-qemu.sh

configure:
	cd qemu-source && ./configure \
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

build:
	cd qemu-source && make -j$$(nproc)

build-lto:
	cd qemu-source && meson setup build --buildtype=release -Db_lto=true
	cd qemu-source && ninja -C build

clean:
	cd qemu-source && make clean 2>/dev/null || true
	cd qemu-source && rm -rf build 2>/dev/null || true

distclean:
	rm -rf qemu-source
