# meta-amlogic

This README file contains information on the contents of the meta-amlogic
layer.

It provides support amlogic based boards, using upstream kernel and u-boot.
Boards using the vendor provided u-boot are not supported in this layer.

Please see the corresponding sections below for details.

## Dependencies

* poky: `git://git.yoctoproject.org/poky`

OR

* oe-core: `https://git.openembedded.org/openembedded-core`
* bitbake: `https://git.openembedded.org/bitbake`

## Patches

Please submit any patches against the meta-amlogic layer through a pull
request to the corresponding gitlab project at
https://gitlab.com/jbrunet/meta-amlogic

## Maintainer

Jerome Brunet <jbrunet@baylibre.com>

## Quick Start

Checkout this awesome layer

```
git clone https://gitlab.com/jbrunet/meta-amlogic.git
```

Checkout poky with <branch-name> and setup the build as usual

```
git clone git://git.yoctoproject.org/poky -b <branch-name>
source poky/oe-init-build-env
```

Finally add meta-amlogic to your build

```
bitbake-layers add-layer ../meta-amlogic
```

You are done

## Quick Start with Kas

This layer has basic for support kas (see
https://kas.readthedocs.io/en/1.0/index.html) Boards are
provided with the related kas yaml file.

Just checkout `meta-amlogic` and fire up `kas`. It will take care of the
dependencies and the configuration

```
git clone https://gitlab.com/jbrunet/meta-amlogic.git
cd meta-amlogic
KAS_MACHINE=aml-s905x-cc kas build kas/poky.yml
```

This will build `core-image-base` for the `aml-s905x-cc`

## Flashing

Image generated with `wic` can be flashed directly to the device using dd.
Even better, you can use bmaptool which is faster and safer

```
bmaptool copy --bmap <some-img>.wic.bmap <some-img>.wic.bz2 <target-device>
```

If you used `amlogic-none.wks`, the atf was not installed in the
`wic`. This is useful if you intend to install the bootloader on another
device, such as a SPI or eMMC boot partition

Check `tmp/deploy/images/<machine>/` for `atf.bin`

* SPI: using a bootstrap u-boot, write `atf.bin` directly at the start of
  the device
* eMMC and SDcard: write `atf.bin`, start from the 2nd sector

```
dd if=atf.bin of=/dev/mmcblkX bs=512 seek=1
```

NOTE: Because of how the bootloader is installed, the storage holding the
bootloader can't use GPT partitionning scheme.

## Flags

 * UBOOT_ILOVEUART: By default, most amlogic board u-boot configuration
   have HDMI and USB Keyboard enabled. stdout and stdin are set to use
   them.  This is a great feature for standalone device. For dev purpose,
   it messes with uart.  When doing copy/paste, some characters are
   missed. Setting UBOOT_ILOVEUART to "1" sets stdin and stdout to use the
   UART only, avoiding the problem.
