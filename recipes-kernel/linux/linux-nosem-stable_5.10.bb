require linux-nosem.inc

LINUX_KERNEL_TYPE ?= "longterm"

LINUX_VERSION ?= "5.10.91"
KBRANCH = "linux-5.10.y"
SRCREV = "b9c28c563fc9727bf5549665fa73016b78dd3531"

LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"

SRC_URI = " \
    git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;branch=${KBRANCH} \
    file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-.patch \
    file://0002-arm64-dts-amlogic-Assign-a-fixed-index-to-mmc-device.patch \
    file://0003-arm64-dts-meson-p241-add-vcc_5v-regulator.patch \
    file://0004-arm64-dts-meson-p241-add-sound-support.patch \
    "

# Fixup reboot issue on v5.10 stable
SRC_URI:append = " \
    file://0001-Revert-drm-meson-fix-shutdown-crash-when-component-n.patch"
