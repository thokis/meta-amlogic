require linux-nosem.inc

LINUX_KERNEL_TYPE ?= "longterm"

LINUX_VERSION ?= "5.10.70"
KBRANCH = "linux-5.10.y"
SRCREV = "f93026b28e2afe5060a493b0bbcee19d12961b7e"

KCONFIG_MODE="--alldefconfig"
KBUILD_DEFCONFIG = "defconfig"

LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"

SRC_URI = " \
    git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;branch=${KBRANCH} \
    file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-.patch \
    file://0002-arm64-dts-meson-p241-add-vcc_5v-regulator.patch \
    file://0003-arm64-dts-meson-p241-add-sound-support.patch \
    "
