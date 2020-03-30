require linux-nosem.inc

LINUX_KERNEL_TYPE ?= "stable"

LINUX_VERSION ?= "5.6"
KBRANCH = "linux-5.6.y"
SRCREV = "7111951b8d4973bda27ff663f2cf18b663d15b48"

KBUILD_DEFCONFIG = "defconfig"
LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"

SRC_URI = " \
    git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;branch=${KBRANCH} \
    file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-.patch \
    "
