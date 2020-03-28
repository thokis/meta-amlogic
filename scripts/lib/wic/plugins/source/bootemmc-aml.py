#
# Copyright (c) 2020, Intel Corporation.
#
# SPDX-License-Identifier: GPL-2.0
#
# DESCRIPTION
# This implements the 'bootemmc-aml' source plugin class for 'wic'
#
# AUTHORS
# Jerome Brunet <jbrunet@baylibre.com>
#

import logging
import os

from wic import WicError
from wic.engine import get_custom_config
from wic.pluginbase import SourcePlugin
from wic.misc import (exec_cmd, get_bitbake_var)

logger = logging.getLogger('wic')

class BootEmmcAmlPlugin(SourcePlugin):
    """
    Write the ATF on the eMMC for the AML ROM Code
    """

    name = 'bootemmc-aml'
    
    @classmethod
    def do_install_disk(cls, disk, disk_name, creator, workdir, oe_builddir,
                        bootimg_dir, kernel_dir, native_sysroot):
        """
        Called after all partitions have been prepared and assembled into a
        disk image. In this case, we install the ATF.
        """
        if creator.ptable_format == 'gpt':
            """
            Bootloader will need the 2nd LBA - not compatible with GPT
            """
            raise WicError("Unsupported partition table: %s" %
                           creator.ptable_format)

        deploy_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
        atf = os.path.join(deploy_dir, "atf/atf.bin")
        full_path = creator._full_path(workdir, disk_name, "direct")

        logger.debug("Installing ATF on eMMC disk %s as %s with size %s bytes",
                     disk_name, full_path, disk.min_size)

        # Write ATF on eMMC image starting from LBA 1
        dd_cmd = "dd if=%s of=%s conv=fsync,notrunc bs=512 seek=1" % (atf, full_path)
        exec_cmd(dd_cmd, native_sysroot)
