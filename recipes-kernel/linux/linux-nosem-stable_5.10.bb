require linux-nosem.inc

LINUX_KERNEL_TYPE ?= "longterm"

LINUX_VERSION ?= "5.10"
KBRANCH = "linux-5.10.y"
SRCREV = "71046eac2db9aeccf10763d034a1a123911c9a81"
PV = "5.10.53"

KCONFIG_MODE="--alldefconfig"
KBUILD_DEFCONFIG = "defconfig"

LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"

SRC_URI = " \
    git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;branch=${KBRANCH} \
    file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-.patch \
    "
