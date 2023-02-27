FILESEXTRAPATHS:prepend := "${THISDIR}/files/5.15:${THISDIR}/files:"

SRC_URI:append:amlogic = " \
        git://gitlab.com/jbrunet/yocto-kernel-cache-nosem.git;protocol=https;type=kmeta;name=meta-nosem;branch=yocto-5.15;destsuffix=${KMETA}-nosem"
SRCREV_meta-nosem = "1d69fddb6fdd16628d673009cd2ae482838fa9a3"

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
	file://0002-net-phy-meson-gxl-align-on-vendor-kernel-analog-sett.patch \
	file://0003-net-mdio-mux-meson-g12a-force-internal-PHY-off-on-mu.patch;maxver=5.15.90 \
	file://0004-arm64-dts-amlogic-enable-ethernet-reset.patch \
	file://0005-net-stmmac-work-around-sporadic-tx-issue-on-link-up.patch;maxver=5.15.67 "

# Add Sticky register support
SRC_URI:append:amlogic = " \
	file://0001-arm64-dts-amlogic-add-AO-rti-sticky-register-sram.patch"
