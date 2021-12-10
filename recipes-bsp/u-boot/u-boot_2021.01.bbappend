FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}/${PV}:${THISDIR}/${PN}:"

# Fixup some mmc problems with 2021.01
SRC_URI:append:nosem = " \
	file://0001-mmc-meson-gx-stick-to-the-oscillator.patch\
	file://0002-mmc-meson-gx-align-clock-settings-on-linux.patch"

# Most platform just specify the dtb basename but meson adds the "amlogic/" dir.
# We could force yocto to install the dtb in an "amlogic/" dir but its easier to just
# amend the fdtfile variable to match yocto default behavior
SRC_URI:append:nosem = " \
	file://0001-meson-env-remove-amlogic-directory-from-fdtfile-vari.patch"

# HDMI and USB Keyboard mess with the TTY and are annoying while working on the platform
SRC_URI:append:nosem = " \
	${@bb.utils.contains('UBOOT_ILOVEUART', '1', " file://meson-config-only-uart-by-default.patch", "", d)}"

# Add p241 support
SRC_URI:append:amlogic-p241 = " \
	file://0001-arm64-meson-import-p241-dts-from-linux-v5.8-rc1.patch \
	file://0002-arm64-meson-add-support-for-the-amlogic-p241-board.patch"



# Added Environment support
ADD_ENV_DEFAULT_FILES = " \
	file://env-storage.cfg \
	file://fw_env.config"

SRC_URI:append:aml-s905x-cc = "${ADD_ENV_DEFAULT_FILES}"
SRC_URI:append:khadas-vim3 = "${ADD_ENV_DEFAULT_FILES}"
