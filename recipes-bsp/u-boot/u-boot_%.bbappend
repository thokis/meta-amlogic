FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " \
	file://acs_tool.py \
	file://fit.cfg \
    file://iminfo.cfg \
"
