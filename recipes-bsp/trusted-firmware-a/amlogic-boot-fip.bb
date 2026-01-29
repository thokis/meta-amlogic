SUMMARY = "Amlogic Firmware Image Pacakge (FIP) sources used to sign u-boot binaries"
PROVIDES = "virtual/trusted-firmware-a"
LICENSE = "CLOSED"

S = "${WORKDIR}/git"
inherit deploy

do_compile[depends] += "u-boot:do_deploy"

PACKAGE_ARCH = "${MACHINE_ARCH}"

SRCREV = "${AUTOREV}"
SRC_URI = "git://github.com/LibreELEC/amlogic-boot-fip;protocol=http;branch=master"

COMPATIBLE_MACHINE:khadas-vim3l = "khadas-vim3l"
COMPATIBLE_MACHINE:odroid-c4 = "odroid-c4"
COMPATIBLE_MACHINE:beelink-gt1-ultimate = "beelink-gt1-ultimate"

MODEL:khadas-vim3l = "khadas-vim3l"
MODEL:odroid-c4 = "odroid-c4"
MODEL:beelink-gt1-ultimate = "beelink-gt1"

do_compile () {
    mkdir ${B}/fip
	./build-fip.sh ${MODEL} ${DEPLOY_DIR_IMAGE}/u-boot.bin ${B}/fip
}

do_deploy () {
	install -m 644 ${B}/fip/u-boot.bin ${DEPLOYDIR}/u-boot.bin.emmc.bin
	install -m 644 ${B}/fip/u-boot.bin.sd.bin ${DEPLOYDIR}/u-boot.bin.sd.bin
}

do_deploy:append:meson-gx-boot () {
	install -m 644 ${B}/fip/u-boot.bin.usb.bl2 ${DEPLOYDIR}/u-boot.bin.usb.bl2
	install -m 644 ${B}/fip/u-boot.bin.usb.tpl ${DEPLOYDIR}/u-boot.bin.usb.tpl
}

addtask deploy after do_compile before do_populate_sysroot
