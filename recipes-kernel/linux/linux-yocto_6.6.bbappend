FILESEXTRAPATHS:prepend := "${THISDIR}:"

SRC_URI:append:amlogic = " file://amlogic-kmeta;type=kmeta;name=amlogic-kmeta;destsuffix=amlogic-kmeta"

COMPATIBLE_MACHINE:append:amlogic = "|khadas-vim3l"
KMACHINE:amlogic = "amlogic"
