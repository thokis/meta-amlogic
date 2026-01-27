FILESEXTRAPATHS:prepend := "${THISDIR}:"

SRC_URI:append:amlogic = " \
    file://amlogic-kmeta;type=kmeta;name=amlogic-kmeta;destsuffix=amlogic-kmeta \
    "

KMACHINE:amlogic = "amlogic"

COMPATIBLE_MACHINE:append:amlogic = "|khadas-vim3l"
COMPATIBLE_MACHINE:append:amlogic = "|odroid-c4"
