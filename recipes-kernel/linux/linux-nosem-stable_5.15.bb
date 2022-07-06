FILESEXTRAPATHS:prepend := "${THISDIR}/files/5.15:${THISDIR}/files:"

require linux-nosem.inc

LINUX_KERNEL_TYPE ?= "longterm"

LINUX_VERSION ?= "5.15.36"
KBRANCH = "linux-5.15.y"
SRCREV = "45451e8015a91de5d1a512c3e3d7373bbcb58fb0"

LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"

SRC_URI = " \
    git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;branch=${KBRANCH} \
    file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-.patch"

## Add Sound support on P241
SRC_URI:append = " \
    file://0002-arm64-dts-meson-p241-add-vcc_5v-regulator.patch \
    file://0003-arm64-dts-meson-p241-add-sound-support.patch"

# Add Watchdog restart support
SRC_URI:append:amlogic = " \
	file://0004-watchdog-meson-keep-running-if-already-active.patch"

# Add ethernet stability patches
SRC_URI:append:amlogic = " \
	file://0001-Revert-net-phy-meson-gxl-improve-link-up-behavior.patch \
	file://0002-net-phy-meson-gxl-align-on-vendor-kernel-analog-sett.patch \
	file://0003-net-mdio-mux-meson-g12a-force-internal-PHY-off-on-mu.patch \
	file://0004-arm64-dts-amlogic-enable-ethernet-reset.patch \
	file://0005-net-stmmac-do-not-poke-MAC_CTRL_REG-twice-on-link-up.patch"
