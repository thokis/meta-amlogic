# Generic configuration when doing wic on amlogic
# Most machine will use it having this aside give us the option
# to disable it or defer the settings to something else

IMAGE_BOOT_FILES += " \
	${KERNEL_IMAGETYPE} \
	${@bb.utils.contains('KERNEL_IMAGETYPE', 'fitImage', '', os.path.basename("${KERNEL_DEVICETREE}"), d)}"

WKS_FILE_DEPENDS += " \
	dosfstools-native \
	e2fsprogs-native \
	mtools-native \	
	virtual/kernel"

WKS_FILE ??= "amlogic-none.wks"
IMAGE_FSTYPES ?= "wic.bz2 wic.bmap"
