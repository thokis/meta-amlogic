FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append:amlogic = " \
        git://gitlab.com/jbrunet/yocto-kernel-cache-nosem.git;protocol=https;type=kmeta;name=meta-nosem;branch=yocto-5.10;destsuffix=${KMETA}-nosem"
SRCREV:meta-nosem = "dc63bed1fbf4d3a7be2cf26a4400fe8da3bad15c"

require linux-yocto-amlogic.inc

# Fixup reboot issue on v5.10 stable
SRC_URI:append:amlogic = " \
	file://0001-Revert-drm-meson-fix-shutdown-crash-when-component-n.patch"

# Make sure we get stable mmc ids
SRC_URI:append:amlogic = " \
	file://0002-arm64-dts-amlogic-Assign-a-fixed-index-to-mmc-device.patch \
