SUMMARY = "Amlogic ATF prebuilt"
DESCRIPTION = "Arm trusted firmware A with Amlogic prebuilt binaries"
PROVIDES = "virtual/trusted-firmware-a"

LICENSE = "CLOSED"

do_compile[depends] += "u-boot:do_deploy"

# This package is machine specific
PACKAGE_ARCH = "${MACHINE_ARCH}"

COMPATIBLE_MACHINE:aml-a311d-cc = "aml-a311d-cc"
SRC_URI:aml-a311d-cc = "https://jbrunet.baylibre.com/pub/amlogic/fips/fip-collect-aml-a311d-cc-20230701.tar.gz;sha256sum=6471490bdbac53508003071f3844b8b93b77b48a242aade8cf96492bd0e39175"

COMPATIBLE_MACHINE:aml-s905d3-cc = "aml-s905d3-cc"
SRC_URI:aml-s905d3-cc = "https://jbrunet.baylibre.com/pub/amlogic/fips/fip-collect-aml-s905d3-cc-20230820.tar.gz;sha256sum=bae0d43c3d86c6d86df6bace2a8df65c3d5ee073647bced280daabdf6c78b5ff"

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
SRC_URI:khadas-vim3 = "https://jbrunet.baylibre.com/pub/amlogic/fips/fip-collect-khadas-vim3-20200918.tar.gz;sha256sum=b96ceb6f4f4e48281ff5094c6392ad429b789eafee63d572d2863672472c9f04"

COMPATIBLE_MACHINE:khadas-vim3l = "khadas-vim3l"
SRC_URI:khadas-vim3l = "https://jbrunet.baylibre.com/pub/amlogic/fips/fip-collect-khadas-vim3l-20200918.tar.gz;sha256sum=261df690f4956a32867236f8f5802a8d8b624730510b050d201b08c018745699"

inherit deploy

S = "${WORKDIR}/fip-collect"

do_compile () {
	./generate-bins.sh ${S} ${DEPLOY_DIR_IMAGE}/u-boot.bin ${B} atf.bin

	# Create something easy to flash with with fastboot on the eMMC boot devices
	dd if=${B}/atf.bin of=${B}/atf.bin.emmc.bin conv=fsync,notrunc bs=512 seek=1
}

do_deploy () {
	install -m 644 ${B}/atf.bin ${DEPLOYDIR}/atf.bin
	install -m 644 ${B}/atf.bin.emmc.bin ${DEPLOYDIR}/atf.bin.emmc.bin
}

do_deploy:append:meson-gx-boot () {
	install -m 644 ${B}/atf.bin.usb.bl2 ${DEPLOYDIR}/atf.bin.usb.bl2
	install -m 644 ${B}/atf.bin.usb.tpl ${DEPLOYDIR}/atf.bin.usb.tpl
}

addtask deploy after do_compile before do_populate_sysroot
