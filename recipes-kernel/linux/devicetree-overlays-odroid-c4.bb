FILESEXTRAPATHS:prepend := "${THISDIR}/devicetree-overlays/odroid-c4:"

inherit devicetree

COMPATIBLE_MACHINE = "odroid-c4"

SRC_URI:odroid-c4 = " \
    file://i2c2.dts \
    file://i2c3.dts \
    "
