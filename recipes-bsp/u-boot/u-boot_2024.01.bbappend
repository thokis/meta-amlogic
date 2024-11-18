FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/${PV}:${THISDIR}/${PN}:"

# HDMI and USB Keyboard mess with the TTY and are annoying while working on the platform
SRC_URI:append:amlogic = " \
	${@bb.utils.contains('UBOOT_ILOVEUART', '1', "file://meson-config-only-uart-by-default.patch", "", d)}"

# fit-support.cfg is meant to be replaced by another layer path prepend if the
# requirements are different. For example, one might wish to disable
# CONFIG_LEGACY_IMAGE_FORMAT for security reasons
SRC_URI:append:amlogic = " file://fit-support.cfg"

# Added Environment support
ADD_ENV_DEFAULT_FILES = " \
	file://env-storage.cfg \
	file://fw_env.config"

SRC_URI:append:aml-s905x-cc = " ${ADD_ENV_DEFAULT_FILES}"
SRC_URI:append:amlogic-p241 = " ${ADD_ENV_DEFAULT_FILES}"
SRC_URI:append:amlogic-u200 = " ${ADD_ENV_DEFAULT_FILES}"
SRC_URI:append:khadas-vim3 = " ${ADD_ENV_DEFAULT_FILES}"
SRC_URI:append:khadas-vim3l = " ${ADD_ENV_DEFAULT_FILES}"

# Fixup warning when efi loader configuration is not set
SRC_URI:append:amlogic = " \
	file://0001-ARM-meson-fix-warning-when-CONFIG_EFI_LOADER-is-not-.patch"

# Fixup some mmc problems with 2021.01
SRC_URI:append:amlogic = " \
	file://0001-mmc-meson-gx-set-clk-always-on-according-to-the-chip.patch"

# Fix MCU issue with the Khadas VIM3
SRC_URI:append:amlogic = " \
	file://0001-board-amlogic-vim3-retry-mcu-i2c-read-before-failing.patch"

# Add p241 support
SRC_URI:append:amlogic-p241 = " \
	file://0001-arm64-meson-add-support-for-the-amlogic-p241-board.patch"

# Add libretech cottonwood support
SRC_URI:append:libretech-cottonwood = " \
	file://0001-ARM-dts-add-libretech-cottonwood-support.patch"
