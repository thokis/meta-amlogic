# Amlogic G12A SoC family configuration

require conf/machine/include/amlogic-g12.inc

SOC_FAMILY:append = ":meson-g12a"

DEFAULTTUNE ?= "cortexa53"
require conf/machine/include/tune-cortexa53.inc
