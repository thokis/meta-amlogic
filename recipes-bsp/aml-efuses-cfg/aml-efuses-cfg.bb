SUMMARY = "Amlogic eFuses configuration setup"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = "file://nvmem-fuses.cfg"

# Configuration depends on the machine
PACKAGE_ARCH = "${MACHINE_ARCH}"
COMPATIBLE_MACHINE:append = "|aml-s905x-cc"

RDEPENDS_${PN} = "nvmem-fuses"

do_install() {
	install -d ${D}${sysconfdir}
	install -m 0644 ${WORKDIR}/nvmem-fuses.cfg ${D}${sysconfdir}/nvmem-fuses.cfg
}
