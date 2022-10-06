SUMMARY = "Nvmem eFuses programming tool"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

inherit allarch

SRC_URI = "file://nvmem-fuses.sh"

# Require shell, dd and hexdump
RDEPENDS:${PN} = "${VIRTUAL-RUNTIME_base-utils} util-linux-hexdump"

do_install() {
	install -d ${D}${sbindir}
	install -m 0755 ${WORKDIR}/nvmem-fuses.sh ${D}${sbindir}/nvmem-fuses
}