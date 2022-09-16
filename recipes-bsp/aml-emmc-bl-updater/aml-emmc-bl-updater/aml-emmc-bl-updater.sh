#!/bin/sh
# SPDX-License-Identifer: MIT
# Author: Jerome Brunet <jbrunet@baylibre.com>
#
# Atomic update script for Amlogic SoCs.

# Amlogic SoCs use partconf in a funny way.
# Instead of using partconf to choose the boot device, the ROMCode check the boot devices in a fixed order
# and, if the boot device found is an eMMC, it uses partconf to report the device on which the bootloader
# was found.

set -e

# 1 - eMMC device (ie /dev/mmcblk1)
# 2 - bootloader

errcho() {
    >&2 echo $@;
}

get_device() {
    #1 is the eMMC
    #2 index of the device

    PARTCONF=`mmc extcsd read ${1} | grep "PARTITION_CONFIG:" | grep -o -e "0x\([a-fA-F0-9]\)\{2\}"`

    # Convoluted sh way to do an XOR between the bootpart and the index
    # In the end BOOTPART contains 0 is the boot hw part was boot0, simple :P
    ! [ "${PARTCONF}" = "0x10" ]; BOOTPART=$?
    if [ "${BOOTPART}" = "${2}" ]; then
	echo "boot0"
    else
	echo "boot1"
    fi
}

block_size() {
    echo "$((($(stat -c "%s" ${1}) + 511) / 512))"
}

cleanup_on_exit() {
    echo 1 > /sys/block/$(basename ${DEVICE})boot0/force_ro
    echo 1 > /sys/block/$(basename ${DEVICE})boot1/force_ro
    rm -rf ${TMPATF}
}

truncate_up() {
    #1 orig
    #2 dest
    dd if=/dev/zero of=${2} bs=512 count="$(block_size ${1})" conv=notrunc 2>/dev/null
    dd if=${1} of=${2} conv=notrunc 2>/dev/null
}

update_boot() {
    # unlock device
    echo 0 > /sys/block/$(basename ${1})/force_ro

    # Erase first sector to make sure the BL is invalid during write
    dd if=/dev/zero of=${1} seek=1 bs=512 count=1 conv=notrunc 2>/dev/null

    # Write all but the first sector
    dd if=${2} of=${1} seek=2 skip=1 bs=512 conv=notrunc 2>/dev/null

    # Finally write the first sector
    dd if=${2} of=${1} seek=1 bs=512 count=1 conv=notrunc 2>/dev/null

    errcho "Wrote ${1}"

    MD5EMMC=`dd if=${1} bs=512 skip=1 count="$(block_size ${2})" 2>/dev/null | md5sum | cut -d ' ' -f0)`

    if [ "${MD5EMMC}" != "$(md5sum ${2} | cut -d ' ' -f0)" ]; then
       errcho "${1} update failure" 

       # Erase the first sector on failure so the ROMCode does not even try
       dd if=/dev/zero of=${1} seek=1 bs=512 count=1 conv=notrunc 2>/dev/null
       exit 1
    else
       errcho "Verified ${1}"
    fi
}

finalize_update() {
    # invalidate the bootloader in the user part
    dd if=/dev/zero of=${1} seek=1 bs=512 count=1 conv=notrunc 2>/dev/null

    errcho "Update done"
}

# TODO: Check reliable write is active - safety depends on it
DEVICE=${1}

# Why do we bother making the file slightly bigger ?
# Because doing so allows to read it back by (512B) blocks
# which a lot faster a than byte by byte read.
TMPATF=`mktemp -p /tmp`
truncate_up ${2} ${TMPATF}

trap "cleanup_on_exit" EXIT

# Update the partition we are not using first. We got here
# so the one we are using must be working somehow
# This is important if the update gets repeatidly interrupted
update_boot "${1}$(get_device ${1} 1)" ${TMPATF}

# Update the one we are using after that
update_boot "${1}$(get_device ${1} 0)" ${TMPATF}

# Make sure we don't use the user part anymore
# and mark the update as done
finalize_update ${1}
