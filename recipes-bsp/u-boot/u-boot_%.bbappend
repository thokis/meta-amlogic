FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

# Add p241 support
SRC_URI_append_amlogic = " file://0001-ARM-dts-sync-Amlogic-GX-AXG-from-Linux-5.10-rc1.patch \
			   file://0002-arm64-meson-import-p241-dts-from-linux-v5.14-rc1.patch \
			   file://0003-arm64-meson-add-support-for-the-amlogic-p241-board.patch"

# FIXME
SRC_URI_append_amlogic = " file://0001-meson-env-remove-amlogic-directory-from-fdtfile-vari.patch"

# HDMI and USB Keyboard mess with the TTY and are annoying while working on the platform
SRC_URI_append_amlogic = "${@bb.utils.contains('UBOOT_ILOVEUART', '1', " file://meson-config-only-uart-by-default.patch", "", d)}"
