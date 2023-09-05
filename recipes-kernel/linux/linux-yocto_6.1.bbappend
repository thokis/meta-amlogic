FILESEXTRAPATHS:prepend := "${THISDIR}/files/6.1:${THISDIR}/files:"

SRC_URI:append:amlogic = " \
        git://gitlab.com/jbrunet/yocto-kernel-cache-nosem.git;protocol=https;type=kmeta;name=meta-nosem;branch=yocto-6.1;destsuffix=${KMETA}-nosem"
SRCREV_meta-nosem = "dd3e1cce8043ecd772c8062f8f84dc45e72aa158"

require linux-yocto-amlogic.inc

# Add channel allocation fixup
SRC_URI:append:amlogic = " \
	file://0001-ASoC-meson-axg-tdm-formatter-fix-channel-slot-alloca.patch;maxver=6.1.46"

# Add Sticky register support
SRC_URI:append:amlogic = " \
	file://0001-arm64-dts-amlogic-add-AO-rti-sticky-register-sram.patch"
