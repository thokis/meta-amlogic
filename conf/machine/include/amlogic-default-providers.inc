# Default providers for (lazy) amlogic machines

# linux kernel:
PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto-dev"

# u-boot bootloader:
EXTRA_IMAGEDEPENDS += "virtual/bootloader"
PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot"
PREFERRED_VERSION_u-boot = "2019.07%"
UBOOT_SUFFIX = "bin"
