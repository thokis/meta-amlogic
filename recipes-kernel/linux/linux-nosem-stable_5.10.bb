FILESEXTRAPATHS:prepend := "${THISDIR}/files/5.10:${THISDIR}/files:"

require linux-nosem.inc

LINUX_KERNEL_TYPE ?= "longterm"

LINUX_VERSION ?= "5.10.107"
KBRANCH = "linux-5.10.y"
SRCREV = "4c8814277b5dc2b9d2745c6493614b1ce10cef09"

LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"

SRC_URI = " \
    git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;branch=${KBRANCH} \
    file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-.patch"

# Fixup reboot issue on v5.10 stable
SRC_URI:append = " \
    file://0002-Revert-drm-meson-fix-shutdown-crash-when-component-n.patch"

# Fix MMC device numbers
SRC_URI:append = " \
    file://0003-arm64-dts-amlogic-Assign-a-fixed-index-to-mmc-device.patch"

# Use fixed up card names
SRC_URI:append = " \
    file://0004-arm64-dts-meson-shorten-audio-card-names-for-alsa-co.patch"

## Add Sound support on P241
SRC_URI:append = " \
    file://0005-arm64-dts-meson-p241-add-vcc_5v-regulator.patch \
    file://0006-arm64-dts-meson-p241-add-sound-support.patch"
