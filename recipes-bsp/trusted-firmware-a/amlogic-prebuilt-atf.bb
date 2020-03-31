SUMMARY = "Amlogic ATF prebuilt"
DESCRIPTION = "Arm trusted firmware A with Amlogic prebuilt binaries"
PROVIDES = "virtual/trusted-firmware-a"

LICENSE = "Proprietary"

DEPENDS = "python-native"
do_compile[depends] += "u-boot:do_deploy"

# This package is machine specific
PACKAGE_ARCH = "${MACHINE_ARCH}"

COMPATIBLE_MACHINE_aml-s905x-cc = "aml-s905x-cc"
LIC_FILES_CHKSUM_aml-s905x-cc = "file://LICENSE;md5=7620f418d8fea612915a124b1ac30196"
SRC_URI_aml-s905x-cc = "file://fip-collect-aml-s905x-cc-20181003.tar.gz"

COMPATIBLE_MACHINE_aml-s805x-ac = "aml-s805x-ac"
LIC_FILES_CHKSUM_aml-s805x-ac = "file://LICENSE;md5=7620f418d8fea612915a124b1ac30196"
SRC_URI_aml-s805x-ac = "file://fip-collect-aml-s805x-ac-20180418.tar.gz"

inherit deploy

FILESEXTRAPATHS_prepend := "${THISDIR}/amlogic-prebuilt-atf:"

S = "${WORKDIR}/fip-collect"

do_compile () {
	./generate-bins.sh ${S} ${DEPLOY_DIR_IMAGE}/u-boot.bin ${B} atf.bin
}

do_deploy () {
	install -m 755 -d ${DEPLOYDIR}/atf
	install -m 644 ${B}/atf.bin ${DEPLOYDIR}/atf/atf.bin
}

do_deploy_append_meson-gxl () {
	install -m 644 ${B}/atf.bin.sd.bin ${DEPLOYDIR}/atf/atf.bin.sd.bin
	install -m 644 ${B}/atf.bin.usb.bl2 ${DEPLOYDIR}/atf/atf.bin.usb.bl2
	install -m 644 ${B}/atf.bin.usb.tpl ${DEPLOYDIR}/atf/atf.bin.usb.tpl
}

addtask deploy after do_compile
