# Default providers for (lazy) amlogic machines

# linux kernel:
PREFERRED_PROVIDER:virtual/kernel ??= "linux-nosem-stable"
PREFERRED_VERSION:linux-yocto ??= "5.10%"

# u-boot bootloader:
PREFERRED_PROVIDER:virtual/bootloader ??= "u-boot"
PREFERRED_PROVIDER:u-boot-fw-utils ??= "libubootenv"
PREFERRED_VERSION:u-boot ??= "2021.01"
MACHINE_EXTRA_RRECOMMENDS:append = ' ${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/bootloader", "u-boot", "u-boot-fw-utils", "", d)}'

# Arm Trusted Firmware
PREFERRED_PROVIDER:virtual/trusted-firmware-a ??= "amlogic-prebuilt-atf"
