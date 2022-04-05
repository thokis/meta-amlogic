SUMMARY = "Amlogic ATF prebuilt"
DESCRIPTION = "Arm trusted firmware A with Amlogic prebuilt binaries"
PROVIDES = "virtual/trusted-firmware-a"

LICENSE = "CLOSED"

do_compile[depends] += "u-boot:do_deploy"

# This package is machine specific
PACKAGE_ARCH = "${MACHINE_ARCH}"

COMPATIBLE_MACHINE:aml-s905x-cc = "aml-s905x-cc"
SRC_URI:aml-s905x-cc = "https://jbrunet.baylibre.com/pub/amlogic/fips/fip-collect-aml-s905x-cc-20181003.tar.gz;sha256sum=98e011eea20a3832b148267f7cd8b875964e358c8ea1752c9fd00b7dad9977c6"

COMPATIBLE_MACHINE:aml-s805x-ac = "aml-s805x-ac"
SRC_URI:aml-s805x-ac = "https://jbrunet.baylibre.com/pub/amlogic/fips/fip-collect-aml-s805x-ac-20180418.tar.gz;sha256sum=f69ae29b141bad80eae7ac435d9ed4c66e52772e25d6b1103e82568eca51d0ef"

COMPATIBLE_MACHINE:amlogic-p241 = "amlogic-p241"
SRC_URI:amlogic-p241 = "https://jbrunet.baylibre.com/pub/amlogic/fips/fip-collect-aml-s805x-ac-20180418.tar.gz;sha256sum=f69ae29b141bad80eae7ac435d9ed4c66e52772e25d6b1103e82568eca51d0ef"

COMPATIBLE_MACHINE:amlogic-s400 = "amlogic-s400"
SRC_URI:amlogic-s400 = "https://jbrunet.baylibre.com/pub/amlogic/fips/fip-collect-aml-s400-20181003.tar.gz;sha256sum=a1367a2c8cf2fb928ee2931d8ffa236164d9afde326e92612208e24cc6409173"

COMPATIBLE_MACHINE:amlogic-u200 = "amlogic-u200"
SRC_URI:amlogic-u200 = "https://jbrunet.baylibre.com/pub/amlogic/fips/fip-collect-aml-u200-20180418.tar.gz;sha256sum=342a8ab27210d5b74a8d8bc1e0388b20030af73a53bbd88896b0bd66c9253b07"

COMPATIBLE_MACHINE:khadas-vim3 = "khadas-vim3"
SRC_URI:khadas-vim3 = "https://jbrunet.baylibre.com/pub/amlogic/fips/fip-collect-khadas-vim3-20200410.tar.gz;sha256sum=eb61a70edb5503f78ff43fd378ece879acc318dc450f9c798358459e9814d8b5"

COMPATIBLE_MACHINE:khadas-vim3l = "khadas-vim3l"
SRC_URI:khadas-vim3l = "https://jbrunet.baylibre.com/pub/amlogic/fips/fip-collect-khadas-vim3l-20200724.tar.gz;sha256sum=8ba2651d82b1dffc2746703cb831369849224396588f147ca50d0a57adf37731"

inherit deploy

S = "${WORKDIR}/fip-collect"

do_compile () {
	./generate-bins.sh ${S} ${DEPLOY_DIR_IMAGE}/u-boot.bin ${B} atf.bin

	# Spliting the sd target atf in two image is usefull in some cases (eg. mender)
	dd if=${B}/atf.bin.sd.bin of=${B}/atf.bin.sd-mbr.bin conv=fsync,notrunc bs=1 count=440
	dd if=${B}/atf.bin.sd.bin of=${B}/atf.bin.sd-rest.bin conv=fsync,notrunc bs=512 skip=1
}

do_deploy () {
	install -m 644 ${B}/atf.bin ${DEPLOYDIR}/atf.bin
	install -m 644 ${B}/atf.bin.sd.bin ${DEPLOYDIR}/atf.bin.sd.bin
	install -m 644 ${B}/atf.bin.sd-mbr.bin ${DEPLOYDIR}/atf.bin.sd-mbr.bin
	install -m 644 ${B}/atf.bin.sd-rest.bin ${DEPLOYDIR}/atf.bin.sd-rest.bin
}

do_deploy:append:meson-gx-boot () {
	install -m 644 ${B}/atf.bin.usb.bl2 ${DEPLOYDIR}/atf.bin.usb.bl2
	install -m 644 ${B}/atf.bin.usb.tpl ${DEPLOYDIR}/atf.bin.usb.tpl
}

addtask deploy after do_compile before do_populate_sysroot
