PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
MACHINE_FEATURES:append = " alsa bluetooth screen usbgadget usbhost vfat wifi"
MACHINEOVERRIDES:append = ":libretech-cottonwood"

require conf/machine/include/amlogic-wic.inc
