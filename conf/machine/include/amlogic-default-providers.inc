# Default providers for (lazy) amlogic machines

# linux kernel:
PREFERRED_PROVIDER_virtual/kernel ??= "linux-nosem-stable"
PREFERRED_VERSION_linux-yocto ??= "5.10%"

# u-boot bootloader:
PREFERRED_PROVIDER_virtual/bootloader ??= "u-boot"
PREFERRED_PROVIDER_u-boot-fw-utils ??= "libubootenv"
PREFERRED_VERSION_u-boot ??= "2021.01"
MACHINE_EXTRA_RRECOMMENDS:append = ' ${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/bootloader", "u-boot", "u-boot-fw-utils", "", d)}'

# Arm Trusted Firmware
PREFERRED_PROVIDER_virtual/trusted-firmware-a ??= "amlogic-prebuilt-atf"
