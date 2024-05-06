FILESEXTRAPATHS:prepend := "${THISDIR}/files/6.1:${THISDIR}/files:"

SRC_URI:append:amlogic = " \
        git://gitlab.com/jbrunet/yocto-kernel-cache-amlogic.git;protocol=https;type=kmeta;name=meta-amlogic;branch=master;destsuffix=${KMETA}-amlogic"
SRCREV_meta-amlogic = "c4cc7399150c7bccb35ff4471212ba62b92cb6b9"

require linux-yocto-amlogic.inc

# Fixup possible minor number problem with ASoC
SRC_URI:append:amlogic = " \
	file://0001-ASoC-meson-cards-select-SND_DYNAMIC_MINORS.patch"

# Add Genesys gl3510 support for cottonwood
SRC_URI:append:amlogic = " \
	file://0001-usb-misc-onboard_usb_hub-add-Genesys-Logic-gl3510-hu.patch \
	file://0002-usb-misc-onboard_usb_hub-extend-gl3510-reset-duratio.patch"

# Add Sticky register support
SRC_URI:append:amlogic = " \
	file://0001-arm64-dts-amlogic-add-AO-rti-sticky-register-sram.patch"

# Add libretech cottonwood support
SRC_URI:append:amlogic = " \
	file://0001-arm64-dts-amlogic-add-libretech-cottonwood-support.patch"

# FIXME:
# cottonwood is only compatible with v6.1 until it lands in mainline
# It won't be backported to v5.15
COMPATIBLE_MACHINE:append:amlogic = "|aml-a311d-cc|aml-s905d3-cc"
