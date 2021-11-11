SRC_URI:append:amlogic = " \
	git://gitlab.com/jbrunet/yocto-kernel-cache-nosem.git;protocol=https;type=kmeta;name=meta-nosem;branch=master;destsuffix=${KMETA}-nosem"
SRCREV_meta-nosem = "${AUTOREV}"

require linux-yocto-amlogic.inc
