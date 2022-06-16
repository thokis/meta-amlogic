FILESEXTRAPATHS:prepend := "${THISDIR}/files/5.15:${THISDIR}/files:"

SRC_URI:append:amlogic = " \
        git://gitlab.com/jbrunet/yocto-kernel-cache-nosem.git;protocol=https;type=kmeta;name=meta-nosem;branch=yocto-5.15;destsuffix=${KMETA}-nosem"
SRCREV_meta-nosem = "b29daf36671e2e04bd1d2dc9deef5f644cc06809"

require linux-yocto-amlogic.inc

# Add Sound support on P241
SRC_URI:append:amlogic = " \
    file://0002-arm64-dts-meson-p241-add-vcc_5v-regulator.patch \
    file://0003-arm64-dts-meson-p241-add-sound-support.patch"

# Add ethernet stability patches
SRC_URI:append:amlogic = " \
	file://0001-net-phy-meson-gxl-align-on-vendor-kernel-analog-sett.patch \
	file://0002-net-mdio-mux-meson-g12a-force-internal-PHY-off-on-mu.patch \
	file://0003-arm64-dts-amlogic-enable-ethernet-reset.patch \
	file://0004-Revert-net-stmmac-Use-resolved-link-config-in-mac_li.patch \
	file://0005-Revert-net-phy-meson-gxl-improve-link-up-behavior.patch"
