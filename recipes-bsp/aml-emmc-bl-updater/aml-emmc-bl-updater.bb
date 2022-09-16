SUMMARY = "Amlogic eMMC bootloader upgrade tool"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

inherit allarch

SRC_URI = "file://aml-emmc-bl-updater.sh"

RDEPENDS:${PN} = "${VIRTUAL-RUNTIME_base-utils} util-linux mmc-utils"

do_install() {
	install -d ${D}${sbindir}
	install -m 0755 ${WORKDIR}/aml-emmc-bl-updater.sh ${D}${sbindir}/aml-emmc-bl-updater
}
