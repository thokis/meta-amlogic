# HDMI and USB Keyboard mess with the TTY and are annoying while working on the platform
SRC_URI:append:amlogic = " \
	${@bb.utils.contains('UBOOT_ILOVEUART', '1', "file://meson-config-only-uart-by-default.patch", "", d)}"

# fit-support.cfg is meant to be replaced by another layer path prepend if the
# requirements are different. For example, one might wish to disable
# CONFIG_LEGACY_IMAGE_FORMAT for security reasons
SRC_URI:append:amlogic = " file://fit-support.cfg"

# Added Environment support
ADD_ENV_DEFAULT_FILES = " \
	file://env-storage.cfg \
	file://fw_env.config"

SRC_URI:append:aml-s905x-cc = " ${ADD_ENV_DEFAULT_FILES}"
SRC_URI:append:amlogic-p241 = " ${ADD_ENV_DEFAULT_FILES}"
SRC_URI:append:amlogic-u200 = " ${ADD_ENV_DEFAULT_FILES}"
SRC_URI:append:khadas-vim3 = " ${ADD_ENV_DEFAULT_FILES}"
SRC_URI:append:khadas-vim3l = " ${ADD_ENV_DEFAULT_FILES}"
