FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/${PV}:${THISDIR}/${PN}:"

require u-boot_nosem.inc

# Fixup warning when efi loader configuration is not set
SRC_URI:append:nosem = " \
	file://0001-ARM-meson-fix-warning-when-CONFIG_EFI_LOADER-is-not-.patch"

# Fixup some mmc problems with 2021.01
SRC_URI:append:nosem = " \
	file://0001-mmc-meson-gx-stick-to-the-oscillator.patch \
	file://0002-mmc-meson-gx-align-clock-settings-on-linux.patch"

# Add p241 support
SRC_URI:append:amlogic-p241 = " \
	file://0001-arm64-meson-import-p241-dts-from-linux-v5.8-rc1.patch \
	file://0002-arm64-meson-add-support-for-the-amlogic-p241-board.patch"

