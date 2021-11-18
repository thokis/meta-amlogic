# Default providers for (lazy) amlogic machines

# linux kernel:
PREFERRED_PROVIDER_virtual/kernel ?= "linux-nosem-stable"
PREFERRED_VERSION_linux-yocto ?= "5.10%"

# u-boot bootloader:
EXTRA_IMAGEDEPENDS += "virtual/bootloader"
PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot"
PREFERRED_VERSION_u-boot ?= "2021.01"
UBOOT_SUFFIX = "bin"

# Arm Trusted Firmware
EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
PREFERRED_PROVIDER_virtual/trusted-firmware-a ?= "amlogic-prebuilt-atf"
