# Configuration tweaks when bootloader is not on the wic device

# FIXME: Did find a good way to produce a multi-device image
WKS_FILE ?= "amlogic-none.wks"

# WKS does not depend on the bootloader, but we still need it
# to put it somewhere else
EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a"
DEPLOY_ATF_NAME = "atf.bin"
