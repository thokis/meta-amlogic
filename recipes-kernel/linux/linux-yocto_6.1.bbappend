FILESEXTRAPATHS:prepend := "${THISDIR}/files/6.1:${THISDIR}/files:"

SRC_URI:append:amlogic = " \
        git://gitlab.com/jbrunet/yocto-kernel-cache-nosem.git;protocol=https;type=kmeta;name=meta-nosem;branch=yocto-6.1;destsuffix=${KMETA}-nosem"
SRCREV_meta-nosem = "5a69b9c5a58b3b740a51a45f3d8cfda1638dea22"

require linux-yocto-amlogic.inc

# Add channel allocation fixup
SRC_URI:append:amlogic = " \
	file://0001-ASoC-meson-axg-tdm-formatter-fix-channel-slot-alloca.patch;maxver=6.1.46"

# Add Genesys gl3510 support for cottonwood
SRC_URI:append:amlogic = " \
	file://0001-usb-misc-onboard_usb_hub-add-Genesys-Logic-gl3510-hu.patch \
	file://0002-usb-misc-onboard_usb_hub-extend-gl3510-reset-duratio.patch"

# Add Sticky register support
SRC_URI:append:amlogic = " \
	file://0001-arm64-dts-amlogic-add-AO-rti-sticky-register-sram.patch"

# Add libretech cottonwood support
SRC_URI:append:libretech-cottonwood = " \
	file://0001-arm64-dts-amlogic-add-libretech-cottonwood-support.patch"

# FIXME:
# cottonwood is only compatible with v6.1 until it lands in mainline
# It won't be backported to v5.15
COMPATIBLE_MACHINE:append:amlogic = "|aml-a311d-cc|aml-s905d3-cc"
