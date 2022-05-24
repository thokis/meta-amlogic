FILESEXTRAPATHS:prepend := "${THISDIR}/files/5.15:${THISDIR}/files:"

SRC_URI:append:amlogic = " \
        git://gitlab.com/jbrunet/yocto-kernel-cache-nosem.git;protocol=https;type=kmeta;name=meta-nosem;branch=yocto-5.15;destsuffix=${KMETA}-nosem"
SRCREV_meta-nosem = "4cb92cd9bc839d1934423b3b67e7f509c003534e"

require linux-yocto-amlogic.inc

# Add Sound support on P241
SRC_URI:append:amlogic = " \
    file://0002-arm64-dts-meson-p241-add-vcc_5v-regulator.patch \
    file://0003-arm64-dts-meson-p241-add-sound-support.patch"
