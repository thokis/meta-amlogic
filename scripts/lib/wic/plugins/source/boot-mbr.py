#
# Copyright (c) 2022, Baylibre SAS
#
# SPDX-License-Identifier: GPL-2.0
#
# DESCRIPTION
# This implements the 'boot-mbr' source plugin class for 'wic'
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

class BootMbrPlugin(SourcePlugin):
    """
    Write a binary in LBA 0, preserving the MBR
    """

    name = 'boot-mbr'

    @classmethod
    def do_install_disk(cls, disk, disk_name, creator, workdir, oe_builddir,
                        bootimg_dir, kernel_dir, native_sysroot):
        """
        Called after all partitions have been prepared and assembled into a
        disk image.
        """
        if creator.ptable_format == 'gpt':
            """
            The zone should be reversed for the protective MBR
            """
            raise WicError("Unsupported partition table: %s" %
                           creator.ptable_format)

        deploy_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
        mbrname = get_bitbake_var("DEPLOY_MBR_NAME")

        if not mbrname:
            mbrname = "mbr.bin"

        mbrfile = os.path.join(deploy_dir, mbrname)
        if not os.path.exists(mbrfile):
            raise WicError("Couldn't find %s. use DEPLOY_MBR_NAME to specify "
                           "the name of the mbr binary" % mbrfile)

        # TODO: check size
        full_path = creator._full_path(workdir, disk_name, "direct")

        logger.debug("Installing MBR %s on disk %s as %s with size %s bytes",
                     mbrfile, disk_name, full_path, disk.min_size)

        # Write LBA 0 part preserving MSDOS partition table
        dd_cmd = "dd if=%s of=%s conv=fsync,notrunc bs=1 count=440" % (mbrfile, full_path)
        exec_cmd(dd_cmd, native_sysroot)
