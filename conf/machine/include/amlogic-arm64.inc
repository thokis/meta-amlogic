# Amlogic ARM64 SoC configuration

SOC_FAMILY = "amlogic"
require conf/machine/include/soc-family.inc

MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= "kernel-image kernel-devicetree"
MACHINE_EXTRA_RDEPENDS ?= "kernel-modules"

KERNEL_IMAGETYPE = "Image"

# All Amlogic platforms seems to use this console settings
SERIAL_CONSOLES ?= "115200;ttyAML0"
SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
