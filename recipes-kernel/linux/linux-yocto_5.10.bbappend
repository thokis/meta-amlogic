FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append:amlogic = " \
        git://gitlab.com/jbrunet/yocto-kernel-cache-nosem.git;protocol=https;type=kmeta;name=meta-nosem;branch=yocto-5.10;destsuffix=${KMETA}-nosem"
SRCREV:meta-nosem = "cddac29b8c82c80a65e6b6d7b578ed90ebec1a45"

require linux-yocto-amlogic.inc

# Fixup reboot issue on v5.10 stable
SRC_URI:append:amlogic = " \
	file://0001-Revert-drm-meson-fix-shutdown-crash-when-component-n.patch"

# Make sure we get stable mmc ids
SRC_URI:append:amlogic = " \
	file://0002-arm64-dts-amlogic-Assign-a-fixed-index-to-mmc-device.patch \
