FILESEXTRAPATHS:prepend := "${THISDIR}/files/6.1:${THISDIR}/files:"

SRC_URI:append:amlogic = " \
        git://gitlab.com/jbrunet/yocto-kernel-cache-nosem.git;protocol=https;type=kmeta;name=meta-nosem;branch=yocto-6.1;destsuffix=${KMETA}-nosem"
SRCREV_meta-nosem = "6cc589e2a0b0e08345b5ec84becbe2c6b2599a96"

require linux-yocto-amlogic.inc

# Add channel allocation fixup
SRC_URI:append:amlogic = " \
	file://0001-ASoC-meson-axg-tdm-formatter-fix-channel-slot-alloca.patch;maxver=6.1.46"

# Add Sticky register support
SRC_URI:append:amlogic = " \
	file://0001-arm64-dts-amlogic-add-AO-rti-sticky-register-sram.patch"
