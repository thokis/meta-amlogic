# Amlogic A113D/X SoC configuration

require conf/machine/include/amlogic-arm64.inc

SOC_FAMILY:append = ":meson-gx-boot:meson-axg:a113"

DEFAULTTUNE ?= "cortexa53"
require conf/machine/include/tune-cortexa53.inc
