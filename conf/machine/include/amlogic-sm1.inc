# Amlogic SM1 SoC family configuration

require conf/machine/include/amlogic-arm64.inc

SOC_FAMILY:append = ":meson-sm1"

DEFAULTTUNE ?= "cortexa55"
require conf/machine/include/arm/armv8-2a/tune-cortexa55.inc
