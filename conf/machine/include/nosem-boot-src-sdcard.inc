# Configuration tweaks when installing the wic on SDcard

WKS_FILE_DEPENDS += "virtual/trusted-firmware-a"
WKS_FILE ?= "amlogic-sdcard.wks"
DEPLOY_ATF_NAME = "atf.bin.sd.bin"
DEPLOY_MBR_NAME = "atf.bin.sd-mbr.bin"
WICVARS:append = " DEPLOY_MBR_NAME"
