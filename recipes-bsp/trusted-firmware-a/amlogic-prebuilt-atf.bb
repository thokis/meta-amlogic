SUMMARY = "Amlogic ATF prebuilt"
DESCRIPTION = "Arm trusted firmware A with Amlogic prebuilt binaries"
PROVIDES = "virtual/trusted-firmware-a"

LICENSE = "Amlogic-Proprietary"
NO_GENERIC_LICENSE[Amlogic-Proprietary] = "LICENSE"

do_compile[depends] += "u-boot:do_deploy"

# This package is machine specific
PACKAGE_ARCH = "${MACHINE_ARCH}"

COMPATIBLE_MACHINE_aml-s905x-cc = "aml-s905x-cc"
LIC_FILES_CHKSUM_aml-s905x-cc = "file://LICENSE;md5=7620f418d8fea612915a124b1ac30196"
SRC_URI_aml-s905x-cc = "https://jbrunet.baylibre.com/pub/amlogic/fips/fip-collect-aml-s905x-cc-20181003.tar.gz;sha256sum=98e011eea20a3832b148267f7cd8b875964e358c8ea1752c9fd00b7dad9977c6"

COMPATIBLE_MACHINE_aml-s805x-ac = "aml-s805x-ac"
LIC_FILES_CHKSUM_aml-s805x-ac = "file://LICENSE;md5=7620f418d8fea612915a124b1ac30196"
SRC_URI_aml-s805x-ac = "https://jbrunet.baylibre.com/pub/amlogic/fips/fip-collect-aml-s805x-ac-20180418.tar.gz;sha256sum=f69ae29b141bad80eae7ac435d9ed4c66e52772e25d6b1103e82568eca51d0ef"

COMPATIBLE_MACHINE_amlogic-p241 = "amlogic-p241"
LIC_FILES_CHKSUM_amlogic-p241 = "file://LICENSE;md5=7620f418d8fea612915a124b1ac30196"
SRC_URI_amlogic-p241 = "https://jbrunet.baylibre.com/pub/amlogic/fips/fip-collect-aml-s805x-ac-20180418.tar.gz;sha256sum=f69ae29b141bad80eae7ac435d9ed4c66e52772e25d6b1103e82568eca51d0ef"

COMPATIBLE_MACHINE_amlogic-s400 = "amlogic-s400"
LIC_FILES_CHKSUM_amlogic-s400 = "file://LICENSE;md5=7620f418d8fea612915a124b1ac30196"
SRC_URI_amlogic-s400 = "https://jbrunet.baylibre.com/pub/amlogic/fips/fip-collect-aml-s400-20181003.tar.gz;sha256sum=a1367a2c8cf2fb928ee2931d8ffa236164d9afde326e92612208e24cc6409173"

COMPATIBLE_MACHINE_khadas-vim3 = "khadas-vim3"
LIC_FILES_CHKSUM_khadas-vim3 = "file://LICENSE;md5=5576a462e448a0c3369dcff00d535eac"
SRC_URI_khadas-vim3 = "https://jbrunet.baylibre.com/pub/amlogic/fips/fip-collect-khadas-vim3-20200410.tar.gz;sha256sum=eb61a70edb5503f78ff43fd378ece879acc318dc450f9c798358459e9814d8b5"

inherit deploy

S = "${WORKDIR}/fip-collect"

do_compile () {
	./generate-bins.sh ${S} ${DEPLOY_DIR_IMAGE}/u-boot.bin ${B} atf.bin
}

do_deploy () {
	install -m 755 -d ${DEPLOYDIR}/atf
	install -m 644 ${B}/atf.bin ${DEPLOYDIR}/atf/atf.bin
	install -m 644 ${B}/atf.bin.sd.bin ${DEPLOYDIR}/atf/atf.bin.sd.bin
}

do_deploy_append_meson-gxl-boot () {
	install -m 644 ${B}/atf.bin.usb.bl2 ${DEPLOYDIR}/atf/atf.bin.usb.bl2
	install -m 644 ${B}/atf.bin.usb.tpl ${DEPLOYDIR}/atf/atf.bin.usb.tpl
}

addtask deploy after do_compile
