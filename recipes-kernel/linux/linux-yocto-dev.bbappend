SRC_URI:append:amlogic = " \
	git://gitlab.com/jbrunet/yocto-kernel-cache-amlogic.git;protocol=https;type=kmeta;name=meta-amlogic;branch=master;destsuffix=${KMETA}-amlogic"
SRCREV_meta-amlogic = "${AUTOREV}"

require linux-yocto-amlogic.inc
