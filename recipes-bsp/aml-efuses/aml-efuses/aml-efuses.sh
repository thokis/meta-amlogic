#!/bin/sh
# SPDX-License-Identifer: MIT
# Author: Jerome Brunet <jbrunet@baylibre.com>
#
# Utility for setting serial and mac in aml efuses

set -e

efuse_cfg="/etc/aml-efuses.cfg"

if [ ! -r $efuse_cfg ]; then
    echo "Configuration file $efuse_cfg not found" 1>&2
    exit 2
fi

. ${efuse_cfg}
efuse_mac_size=6
efuse_mac_pattern='^\([a-fA-F0-9]\{2\}:\)\{5\}[a-fA-F0-9]\{2\}$'

#
# Options parsing
#
no_question_asked=0
do_dry_run=0

usage() {
    echo "Usage: $(basename $1) [options] <action> [arg]"
    echo "Options"
    echo " -f/--force                   No question asked"
    echo " -d/--dry-run                 Do not write device"
    echo ""
    echo "Supported actions"
    echo " fuse mac <mac-address>       Fuse MAC address in efuse"
    echo " get  mac                     Read MAC address in efuse"
    echo " fuse sn <serial-number>      Fuse serial number address in efuse"
    echo " get  sn                      Read serial number address in efuse"
    echo " help                         Print this"
    echo ""
    echo "$(basename $1) fuse mac 12:34:56:78:90:AB"
    echo "$(basename $1) get mac"
    echo "$(basename $1) fuse sn 2001212345678901"
    echo "$(basename $1) get sn"
}

error_usage() {
    usage $1
    exit 1
}

fuse_is_clean() {
    # Check fuses are clean
    if [ ! -z $(dd if=$efuse_path bs=1 skip=$1 count=$2 2>/dev/null | hexdump -e "${2}/1 \"%c\" \"\n\"" | tr -d '\000') ]; then
	# Fuse dirty
	return 1
    else
	return 0
    fi
}

get_mac() {
    if fuse_is_clean "$efuse_mac_offset" "$efuse_mac_size"; then
	echo "Unset"
    else
	dd if=$efuse_path bs=1 skip=$efuse_mac_offset count=6 2>/dev/null | hexdump -e "5/1 \"%02x:\" 1/1 \"%02x\n\""
    fi
}

get_sn() {
    if fuse_is_clean "$efuse_sn_offset" "$efuse_sn_size"; then
	echo "Unset"
    else
	dd if=$efuse_path bs=1 skip=$efuse_sn_offset count=$efuse_sn_size 2>/dev/null | hexdump -e "${efuse_sn_size}/1 \"%c\" \"\n\""
    fi
}

fuse_mac() {
    OIFS=$IFS
    IFS=":"
    i=$efuse_mac_offset
    for byte in $1; do
	# Oh boy - Posix is making this difficult !!!
	printf "\\$(printf %o 0x${byte})" | dd of=$efuse_path bs=1 seek=$i count=1 conv=notrunc 2>/dev/null
	i=$(($i + 1))
    done
    IFS=$OIFS
}


fuse_sn() {
    printf $1 | dd of=$efuse_path bs=1 seek=$efuse_sn_offset count=$efuse_sn_size conv=notrunc 2>/dev/null
}

if [ ! -f $efuse_path ]; then
    echo "$efuse_path not found"
    exit 2
fi

while [ $# != 0 ] ; do
    arg=$1
    shift

    case $arg in
	-f|--force)
	    no_question_asked="1"
	    ;;

	-d|--dry-run)
	    do_dry_run=1
	    ;;

	fuse)
	    action=$arg
	    data=$1
	    shift
	    [ -z $1 ] && error_usage $0 || arg1=$1
	    shift
	    ;;

	get)
	    action=$arg
	    data=$1
	    shift
	    ;;

	help|-h|--help)
	    error_usage $0
	    ;;

	*)
	    echo "Syntax Error"
	    error_usage $0
	    exit 1
	    ;;
    esac
done

if [ $# != 0 -o -z $action -o -z $data ]; then
   echo "Syntax Error" 1>&2
   error_usage $0
fi

case $data in
	sn)
	    size=$efuse_sn_size
	    offset=$efuse_sn_offset
	    pattern=$efuse_sn_pattern
	    ;;

	mac)
	    size=$efuse_mac_size
	    offset=$efuse_mac_offset
	    pattern=$efuse_mac_pattern
	    ;;
	*)
	    echo "Syntax Error"
	    error_usage $0
	    exit 1
	    ;;
esac

if [ "$action" = "fuse" ]; then

    # Check fuses are clean
    if ! fuse_is_clean "$offset" "$size"; then
	echo "$data fuses dirty - abort" 1>&2
	exit 1
    fi

    # Verify argument match pattern
    if ! echo "$arg1" | grep -q $pattern; then
	echo "$data $arg1 - Invalid" 1>&2
	exit 1
    fi

    # Dangerous stuff ahead - get confirmation
    if [ $no_question_asked != "1" ]; then
	echo -n "$action $data $arg1 - Are you sure ? [Y/N] "
	read REPLY
	if ! echo $REPLY | grep -q "^Y$"; then
	    echo "Abort" 1>&2
	    exit 1
	fi
    fi

    # Stop now on dry-run
    if [ $do_dry_run = "1" ]; then
	exit 0
    fi

    # Dragons ...

    if [ ! -w $efuse_path ]; then
	echo "$efuse is not writeable" 1>&2
	exit 1
    fi
fi

# Yeah ... it was a lot nicer with bash ...
"$action"_"$data" "$arg1"
