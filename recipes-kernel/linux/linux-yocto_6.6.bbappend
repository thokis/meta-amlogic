FILESEXTRAPATHS:prepend := "${THISDIR}/files/6.6:${THISDIR}/files:"

SRC_URI:append:amlogic = " \
        git://gitlab.com/jbrunet/yocto-kernel-cache-amlogic.git;protocol=https;type=kmeta;name=meta-amlogic;branch=master;destsuffix=${KMETA}-amlogic"
SRCREV_meta-amlogic = "dfb3f82c6d7c978f3526ad3754f53fefe7eb13bc"

require linux-yocto-amlogic.inc

# Backport ASoC fixups
SRC_URI:append:amlogic = " \
	file://0001-ASoC-meson-cards-select-SND_DYNAMIC_MINORS.patch \
	file://0002-ASoC-meson-axg-extend-TDM-maximum-sample-rate-to-384.patch \
	file://0003-ASoC-meson-axg-fifo-take-continuous-rates.patch \
	file://0004-ASoC-meson-axg-fifo-use-FIELD-helpers.patch \
	file://0005-ASoC-meson-axg-fifo-use-threaded-irq-to-check-period.patch \
	file://0006-ASoC-meson-axg-card-make-links-nonatomic.patch \
	file://0007-ASoC-meson-axg-tdm-interface-manage-formatters-in-tr.patch \
	file://0008-ASoC-meson-axg-tdm-add-continuous-clock-support.patch "

# Backport DRM fixups
SRC_URI:append:amlogic = " \
	file://0001-drm-meson-dw-hdmi-power-up-phy-on-device-init.patch \
	file://0002-drm-meson-dw-hdmi-add-bandgap-setting-for-g12.patch "

# Add Sticky register support
SRC_URI:append:amlogic = " \
	file://0001-arm64-dts-amlogic-add-AO-rti-sticky-register-sram.patch"

# Add Genesys gl3510 support for cottonwood
SRC_URI:append:amlogic = " \
	file://0001-usb-misc-onboard_usb_hub-add-Genesys-Logic-gl3510-hu.patch \
	file://0002-usb-misc-onboard_usb_hub-extend-gl3510-reset-duratio.patch"

# Add libretech cottonwood support
SRC_URI:append:amlogic = " \
	file://0001-arm64-dts-amlogic-add-libretech-cottonwood-support.patch"

# FIXME:
# cottonwood is only compatible with v6.6 until it lands in mainline
COMPATIBLE_MACHINE:append:amlogic = "|aml-a311d-cc|aml-s905d3-cc"

# Sound DT fixup backport
SRC_URI:append:amlogic = " \
	file://0001-arm64-dts-meson-g12-name-spdifout-consistently.patch "

# DSI support backport
SRC_URI:append:amlogic = " \
	file://0001-dt-bindings-clk-g12a-clkc-add-CTS_ENCL-clock-ids.patch \
	file://0002-clk-meson-g12a-add-CTS_ENCL-CTS_ENCL_SEL-clocks.patch \
	file://0003-clk-meson-add-vclk-driver.patch \
	file://0004-clk-meson-g12a-make-VCLK2-and-ENCL-clock-path-config.patch \
	file://0005-arm64-meson-g12-common-add-the-MIPI-DSI-nodes.patch \
	file://0006-arm64-meson-khadas-vim3l-add-TS050-DSI-panel-overlay.patch \
	file://0007-drm-meson-gate-px_clk-when-setting-rate.patch "
