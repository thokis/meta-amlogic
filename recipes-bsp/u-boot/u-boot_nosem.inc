# Most platform just specify the dtb basename but meson adds the "amlogic/" dir.
# We could force yocto to install the dtb in an "amlogic/" dir but its easier to just
# amend the fdtfile variable to match yocto default behavior
SRC_URI:append:nosem = " \
	file://0001-meson-env-remove-amlogic-directory-from-fdtfile-vari.patch"

# HDMI and USB Keyboard mess with the TTY and are annoying while working on the platform
SRC_URI:append:nosem = " \
	${@bb.utils.contains('UBOOT_ILOVEUART', '1', "file://meson-config-only-uart-by-default.patch", "", d)}"

# fit-support.cfg is meant to be replaced by another layer path prepend if the
# requirements are different. For example, one might wish to disable
# CONFIG_LEGACY_IMAGE_FORMAT for security reasons
SRC_URI:append:nosem = " file://fit-support.cfg"

# Added Environment support
ADD_ENV_DEFAULT_FILES = " \
	file://env-storage.cfg \
	file://fw_env.config"

SRC_URI:append:aml-s905x-cc = "${ADD_ENV_DEFAULT_FILES}"
SRC_URI:append:khadas-vim3 = "${ADD_ENV_DEFAULT_FILES}"
SRC_URI:append:khadas-vim3l = "${ADD_ENV_DEFAULT_FILES}"
