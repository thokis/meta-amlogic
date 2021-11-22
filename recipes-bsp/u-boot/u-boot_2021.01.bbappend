FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}/${PV}:${THISDIR}/${PN}:"

# Fixup some mmc problems with 2021.01
SRC_URI_append_nosem = " \
	file://0001-mmc-meson-gx-set-270-degree-core-phase-for-v3-SoCs.patch \
	file://0002-mmc-meson-gx-align-clock-settings-on-linux.patch"

# Most platform just specify the dtb basename but meson adds the "amlogic/" dir.
# We could force yocto to install the dtb in an "amlogic/" dir but its easier to just
# amend the fdtfile variable to match yocto default behavior
SRC_URI_append_nosem = " \
	file://0001-meson-env-remove-amlogic-directory-from-fdtfile-vari.patch"

# HDMI and USB Keyboard mess with the TTY and are annoying while working on the platform
SRC_URI_append_nosem = " \
	${@bb.utils.contains('UBOOT_ILOVEUART', '1', " file://meson-config-only-uart-by-default.patch", "", d)}"

# Add p241 support
SRC_URI_append_amlogic-p241 = " \
	file://0001-arm64-meson-import-p241-dts-from-linux-v5.8-rc1.patch \
	file://0002-arm64-meson-add-support-for-the-amlogic-p241-board.patch"
