FILESEXTRAPATHS:prepend := "${THISDIR}/files/5.15:${THISDIR}/files:"

SRC_URI:append:amlogic = " \
        git://gitlab.com/jbrunet/yocto-kernel-cache-amlogic.git;protocol=https;type=kmeta;name=meta-amlogic;branch=yocto-5.15;destsuffix=${KMETA}-amlogic"
SRCREV_meta-amlogic = "fb233feedf67a7af740cfef01ac342b85b164926"

require linux-yocto-amlogic.inc

# Add Sound support on P241
SRC_URI:append:amlogic = " \
    file://0002-arm64-dts-meson-p241-add-vcc_5v-regulator.patch \
    file://0003-arm64-dts-meson-p241-add-sound-support.patch"

# Add Watchdog restart support
SRC_URI:append:amlogic = " \
	file://0004-watchdog-meson-keep-running-if-already-active.patch"

# Add ethernet stability patches
SRC_URI:append:amlogic = " \
	file://0001-Revert-net-phy-meson-gxl-improve-link-up-behavior.patch;maxver=5.15.67 \
	file://0003-net-mdio-mux-meson-g12a-force-internal-PHY-off-on-mu.patch;maxver=5.15.90 \
	file://0004-arm64-dts-amlogic-enable-ethernet-reset.patch \
	file://0005-net-stmmac-work-around-sporadic-tx-issue-on-link-up.patch;maxver=5.15.67 "

# Add channel allocation fixup
SRC_URI:append:amlogic = " \
	file://0001-ASoC-meson-axg-tdm-formatter-fix-channel-slot-alloca.patch;maxver=5.15.127"

# Add Sticky register support
SRC_URI:append:amlogic = " \
	file://0001-arm64-dts-amlogic-add-AO-rti-sticky-register-sram.patch"
