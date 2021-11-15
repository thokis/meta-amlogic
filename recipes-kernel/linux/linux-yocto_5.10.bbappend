SRC_URI:append:amlogic = " \
        git://gitlab.com/jbrunet/yocto-kernel-cache-nosem.git;protocol=https;type=kmeta;name=meta-nosem;branch=yocto-5.10;destsuffix=${KMETA}-nosem"
SRCREV_meta-nosem = "bb27a9d9df82ae2d870d379766e9421cc3acfbe2"

require linux-yocto-amlogic.inc
