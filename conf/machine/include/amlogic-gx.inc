# Amlogic GX SoC family configuration

require conf/machine/include/amlogic-arm64.inc

SOC_FAMILY_append = ":meson-gx-boot:meson-gx"

DEFAULTTUNE ?= "cortexa53"
require conf/machine/include/tune-cortexa53.inc
