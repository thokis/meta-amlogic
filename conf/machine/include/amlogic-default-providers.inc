# Default providers for (lazy) amlogic machines

# linux kernel:
PREFERRED_PROVIDER:virtual/kernel ?= "linux-nosem-stable"

# u-boot bootloader:
EXTRA_IMAGEDEPENDS += "virtual/bootloader"
PREFERRED_PROVIDER:virtual/bootloader ?= "u-boot"
UBOOT_SUFFIX = "bin"

# Arm Trusted Firmware
EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
PREFERRED_PROVIDER:virtual/trusted-firmware-a ?= "amlogic-prebuilt-atf"
