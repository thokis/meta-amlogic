FILESEXTRAPATHS:prepend := "${THISDIR}/files/5.15:${THISDIR}/files:"

require linux-nosem.inc

LINUX_KERNEL_TYPE ?= "longterm"

LINUX_VERSION ?= "5.15.68"
KBRANCH = "linux-5.15.y"
SRCREV = "dd20085f2a88b6cdb12bdcdbd2d7a761c86b184a"

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
	file://0001-Revert-net-phy-meson-gxl-improve-link-up-behavior.patch;maxver=5.15.67 \
	file://0003-net-mdio-mux-meson-g12a-force-internal-PHY-off-on-mu.patch;maxver=5.15.90 \
	file://0004-arm64-dts-amlogic-enable-ethernet-reset.patch \
	file://0005-net-stmmac-work-around-sporadic-tx-issue-on-link-up.patch;maxver=5.15.67"

# Add channel allocation fixup
SRC_URI:append:amlogic = " \
	file://0001-ASoC-meson-axg-tdm-formatter-fix-channel-slot-alloca.patch;maxver=5.15.127"

# Add Sticky register support
SRC_URI:append:amlogic = " \
	file://0001-arm64-dts-amlogic-add-AO-rti-sticky-register-sram.patch"
