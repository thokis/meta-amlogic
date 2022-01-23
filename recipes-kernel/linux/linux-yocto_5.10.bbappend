FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append:amlogic = " \
        git://gitlab.com/jbrunet/yocto-kernel-cache-nosem.git;protocol=https;type=kmeta;name=meta-nosem;branch=yocto-5.10;destsuffix=${KMETA}-nosem"
SRCREV:meta-nosem = "88cdbb26d97165032fe762a34af11e0757ce181a"

require linux-yocto-amlogic.inc

# Fixup reboot issue on v5.10 stable
SRC_URI:append:amlogic = " \
    file://0002-Revert-drm-meson-fix-shutdown-crash-when-component-n.patch"

# Fix MMC device numbers
SRC_URI:append:amlogic = " \
    file://0003-arm64-dts-amlogic-Assign-a-fixed-index-to-mmc-device.patch"

# Use fixed up card names
SRC_URI:append:amlogic = " \
    file://0004-arm64-dts-meson-shorten-audio-card-names-for-alsa-co.patch"

## Add Sound support on P241
SRC_URI:append:amlogic = " \
    file://0005-arm64-dts-meson-p241-add-vcc_5v-regulator.patch \
    file://0006-arm64-dts-meson-p241-add-sound-support.patch"
