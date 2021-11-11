SRC_URI:append:amlogic = " \
        git://gitlab.com/jbrunet/yocto-kernel-cache-nosem.git;protocol=https;type=kmeta;name=meta-nosem;branch=yocto-5.10;destsuffix=${KMETA}-nosem"
SRCREV_meta-nosem = "ec9501e98cfc79c95d6b4ce5ec71c9dd52341815"

require linux-yocto-amlogic.inc
