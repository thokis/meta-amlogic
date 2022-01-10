SUMMARY = "Amlogic eFuses programming tool"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

inherit allarch

SRC_URI = " \
	file://aml-efuses.sh \
	file://aml-efuses.cfg"

# Configuration depends on the machine
PACKAGE_ARCH = "${MACHINE_ARCH}"
COMPATIBLE_MACHINE:append = "|aml-s905x-cc"

# Require shell, dd and hexdump
RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_base-utils} util-linux"

do_install() {
	install -d ${D}${sbindir}
	install -m 0755 ${WORKDIR}/aml-efuses.sh ${D}${sbindir}/aml-efuses

	install -d ${D}${sysconfdir}
	install -m 0644 ${WORKDIR}/aml-efuses.cfg ${D}${sysconfdir}/aml-efuses.cfg
}