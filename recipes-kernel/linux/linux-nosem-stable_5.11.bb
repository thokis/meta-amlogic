require linux-nosem.inc

LINUX_KERNEL_TYPE ?= "stable"

LINUX_VERSION ?= "5.11"
KBRANCH = "linux-5.11.y"
SRCREV = "6cc049b8e0d05e1519d71afcf2d40d3aa5a48366"
PV = "5.11.10"

KCONFIG_MODE="--alldefconfig"
KBUILD_DEFCONFIG = "defconfig"

LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"

SRC_URI = " \
    git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;branch=${KBRANCH} \
    "
