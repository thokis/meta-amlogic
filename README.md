# meta-nosem

This README file contains information on the contents of the meta-nosem layer.

It provides support amlogic based boards, using upstream kernel and u-boot.
Boards using the vendor provided u-boot are not supported in this layer.

Please see the corresponding sections below for details.

## Dependencies

* poky: `git://git.yoctoproject.org/poky` - refspec: `hardknott`

## Patches

Please submit any patches against the meta-nosem layer through a pull request to
the corresponding gitlab project at https://gitlab.com/jbrunet/meta-nosem

## Maintainer

Jerome Brunet <jbrunet@baylibre.com>


## Quick Start 

Checkout this awesome layer
```
git clone https://gitlab.com/jbrunet/meta-nosem.git
```

Checkout poky with hardknott and setup the build as usual
```
git clone git://git.yoctoproject.org/poky -b hardknott
poky/oe-init-build-env
```

Finally add meta-nosem to your build
```
bitbake-layers add-layer ../meta-nosem
```

You are done

## Quick Start with Kas

This layer has basic for support kas (see https://kas.readthedocs.io/en/1.0/index.html)
A subset of board are provided with the related kas yaml file. For the other, it is
straight forward to add it. Taking the example of the `aml-s905x-cc`.

Just checkout `meta-nosem` and fire up `kas`. It will take care of the dependencies
and the configuration

```
git clone https://gitlab.com/jbrunet/meta-nosem.git
kas build kas/aml-s905x-cc.yml
```

This will build `core-image-minimal` for the `aml-s905x-cc`


## Flags

 * UBOOT_ILOVEUART: By default, most amlogic board u-boot configuration have
   HDMI and USB Keyboard enabled. stdout and stdin are set to use them.
   This is a great feature for standalone device. For dev purpose, it messes with uart.
   When doing copy/paste, some characters are missed. Setting UBOOT_ILOVEUART to "1"
   sets stdin and stdout to use the UART only, avoiding the problem.