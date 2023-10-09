# Amlogic ARM64 SoC configuration

SOC_FAMILY = "amlogic"
require conf/machine/include/soc-family.inc

# Basic feature all HW usually have - override if necessary
MACHINE_FEATURES ?= "serial"
MACHINE_FEATURES_BACKFILL_CONSIDERED ?= "rtc"

# Between the default kernel and ramfs addresses
UBOOT_ENTRYPOINT ?= "0x0c000000"
UBOOT_SUFFIX = "bin"

MACHINE_EXTRA_RRECOMMENDS:append = " kernel-modules"
MACHINE_EXTRA_RRECOMMENDS:append = " \
	${@bb.utils.contains("DISTRO_FEATURES", "alsa", "alsa-state", "", d)}"

KERNEL_CLASSES += "kernel-fitimage"
KERNEL_IMAGETYPE ?= "fitImage"

# All Amlogic platforms seems to use this console settings
SERIAL_CONSOLES ?= "115200;ttyAML0"
SERIAL_CONSOLES_CHECK ?= "${SERIAL_CONSOLES}"

# Make boot sources a bit simpler to change
# eMMC seems like a sane default for most design
AMLOGIC_BOOT_DEV ??= "emmc"
MACHINEOVERRIDES:append = ":${MACHINE}-${AMLOGIC_BOOT_DEV}-boot:${AMLOGIC_BOOT_DEV}-boot"
WKS_FILE ?= "amlogic-${AMLOGIC_BOOT_DEV}.wks"

# Amlogic will need the TFA to boot.
EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
WKS_FILE_DEPENDS += "virtual/trusted-firmware-a"

require conf/machine/include/amlogic-default-providers.inc
