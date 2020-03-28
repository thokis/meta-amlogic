FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_amlogic = " file://0001-meson-env-remove-amlogic-directory-from-fdtfile-vari.patch"

# HDMI and USB Keyboard mess with the TTY and are annoying while working on
# the platform
SRC_URI_append_amlogic = "${@bb.utils.contains('UBOOT_ILOVEUART', '1', " file://u-boot-no-video-no-kbd.cfg", "", d)}"
