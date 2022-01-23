FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:nosem = " \
	file://0001-meson-add-initial-p241-support.patch \
	file://0002-meson-add-initial-libretech-cc-support.patch"
