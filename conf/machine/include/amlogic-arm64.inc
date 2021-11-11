# Amlogic ARM64 SoC configuration

SOC_FAMILY = "amlogic:nosem"
require conf/machine/include/soc-family.inc

# Basic feature all HW usually have - override if necessary
MACHINE_FEATURES ?= "serial"
MACHINE_FEATURES_BACKFILL_CONSIDERED ?= "rtc"

# Between the default kernel and ramfs addresses
UBOOT_ENTRYPOINT ?= "0x0c000000"

MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= "kernel-image \
				     kernel-devicetree"
MACHINE_EXTRA_RDEPENDS ?= "kernel-modules"
MACHINE_EXTRA_RRECOMMENDS ?= "alsa-state"

KERNEL_IMAGETYPE ?= "Image"
IMAGE_BOOT_FILES ?= "${KERNEL_IMAGETYPE} \
		     ${@os.path.basename("${KERNEL_DEVICETREE}")}"

# All Amlogic platforms seems to use this console settings
SERIAL_CONSOLES ?= "115200;ttyAML0"
SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"

do_image_wic[depends] += "mtools-native:do_populate_sysroot \
			  dosfstools-native:do_populate_sysroot"
IMAGE_FSTYPES ?= "tar.bz2 wic wic.bz2 wic.bmap"
