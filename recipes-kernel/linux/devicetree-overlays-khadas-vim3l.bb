FILESEXTRAPATHS:prepend := "${THISDIR}/devicetree-overlays/khadas-vim3l:"

inherit devicetree

COMPATIBLE_MACHINE = "khadas-vim3l"

SRC_URI:khadas-vim3l = " \
    file://i2c3.dts \
    "
