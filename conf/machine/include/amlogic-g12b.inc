# Amlogic G12B SoC family configuration

require conf/machine/include/amlogic-g12.inc

SOC_FAMILY:append = ":meson-g12b"

DEFAULTTUNE ?= "cortexa73-cortexa53"
require conf/machine/include/tune-cortexa73-cortexa53.inc
