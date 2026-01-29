FILESEXTRAPATHS:prepend := "${THISDIR}/devicetree-overlays/common:${THISDIR}/devicetree-overlays/beelink-gt1-ultimate:"

inherit devicetree

COMPATIBLE_MACHINE = "beelink-gt1-ultimate"

SRC_URI:beelink-gt1-ultimate = " \
    file://ethernet_fix.dts \
    "
