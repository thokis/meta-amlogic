SRC_URI:append:amlogic = " \
        git://gitlab.com/jbrunet/yocto-kernel-cache-nosem.git;protocol=https;type=kmeta;name=meta-nosem;branch=yocto-5.10;destsuffix=${KMETA}-nosem"
SRCREV:meta-nosem = "86fb6da86f0baf69fc8951bd98f1855b8fc2d4bc"

require linux-yocto-amlogic.inc
