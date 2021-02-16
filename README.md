# USBaspProgrammer

My adaption of [Thomas Fischl's construction](https://www.fischl.de/usbasp/).  

This README concentrates on using ATmega88, and uploading it with avrisp, with a device such as [this one](https://github.com/jonsag/ardAVRProgrammer).  

## Compile and upload

Put the ATmega88 in the programming device, and  

>$ cd Firmware/firmware

Test avrdude  

>$ make avrdude

Compile, upload and set fuses  

>$ make clean
>
>$ make main.hex
>
>$ make flash
>
>$ make fuses

## From Thomas Fischl's README

### USE PRECOMPILED VERSION  

Firmware:  
Flash "Firmware/precompiled/usbasp.atmega88.xxxx-xx-xx.hex" or "Firmware/precompiled/usbaspatmega8.xxxx-xx-xx.hex" to the used controller with a working programmer (e.g. with avrdude, uisp, ...). Set jumper J2 to activate USBasp firmware update function.  
You have to change the fuse bits for external crystal (see "make fuses").  
\# TARGET=atmega8    HFUSE=0xc9  LFUSE=0xef  
\# TARGET=atmega48   HFUSE=0xdd  LFUSE=0xff  
\# TARGET=atmega88   HFUSE=0xdd  LFUSE=0xff  

### Setting jumpers

J1 Power target  
    Supply target with 5V (USB voltage). Be careful with this option, the circuit isn't protected against short circuit!  
J2 Jumper for firmware upgrade (not self-upgradable)  
    Set this jumper for flashing the ATMega(4)8 of USBasp with another working programmer.  
J3 SCK option  
    If the target clock is lower than 1,5 MHz, you have to set this jumper. Then SCK is scaled down from 375 kHz to about 8 kHz  

### BUILDING AND INSTALLING FROM SOURCE CODE

#### Firmware

To compile the firmware  

1. install the GNU toolchain for AVR microcontrollers (avr-gcc, avr-libc),  
2. change directory to Firmware/firmware/  
3. run "make main.hex"  
4. flash "main.hex" to the ATMega(4)8. E.g. with uisp or avrdude (check the Makefile option "make flash"). To flash the firmware you have to set jumper J2 and connect USBasp to a working programmer.  
 You have to change the fuse bits for external crystal, (check the Makefile option "make fuses").  

#### Software (avrdude)

AVRDUDE supports USBasp since version 5.2.  

1. install libusb: [http://libusb.sourceforge.net/](http://libusb.sourceforge.net/)  
2. get latest avrdude release: [http://download.savannah.gnu.org/releases/avrdude/](http://download.savannah.gnu.org/releases/avrdude/)  
3. cd avrdude-X.X.X  
4. configure to your environment:  
./bootstrap (I had to comment out the two if-blocks which verify the installed versions of autoconf and automake)  
./configure  
5. compile and install it:  
make  
make install  

### Notes

To use USBasp as non-root, you have to define some device rules. See Documents/linux-nonroot for an example.  

### MORE INFORMATION

For more information on USBasp and it's components please visit the following URLs:  

USBasp .......................... [http://www.fischl.de/usbasp/](http://www.fischl.de/usbasp/)  
  
Firmware-only V-USB driver ...... [http://www.obdev.at/products/vusb/](http://www.obdev.at/products/vusb/)  
avrdude ......................... [http://www.nongnu.org/avrdude/](http://www.nongnu.org/avrdude/)  
libusb .......................... [http://libusb.sourceforge.net/](http://libusb.sourceforge.net/)  
libusb-win32 .................... [http://libusb-win32.sourceforge.net/](http://libusb-win32.sourceforge.net/)  

## Troubleshooting

### Compiling problem

    usbdrv/usbdrv.h:455:6: error: variable ‘usbDescriptorDevice’ must be const in order to be put into read-only section by means of ‘__attribute__((progmem))’
 char usbDescriptorDevice[];

Solution at [https://openrcforums.com/forum/viewtopic.php?t=2731](https://openrcforums.com/forum/viewtopic.php?t=2731), from Mon Feb 04, 2013  

    This issue is resolved I just wanted to document it here.

    Usbasp uses V-usb for usb communications. Usbasp includes V-usb in it's source code. The version of V-usb included in Usbasp is not the latest and would not compile with a recent avr-gcc. This issue affected er9x over a year ago.

    When trying to compile the 2009 or 2011 versions of Usbasp from http://www.fischl.de/usbasp/ I got about a dozen of these errors.
    CODE: SELECT ALL

    usbdrv/usbdrv.h:451:6: error: variable ‘usbDescriptorDevice’ must be const in order to be put into read-only section by means of ‘__attribute__((progmem))’
    The solution was to remove the ./firmware/usbdrv directory from the Usbasp source and replace it with the source from http://www.obdev.at/downloads/vusb/vusb-20121206.tar.gz . Then I was able to compile Usbasp. I tested both the 2009 and 2011 versions on a programmer and was able to program a MCU.

    Not sure when avr-gcc became picky about this issue or if that is even the issue. Nor do I know why my Ubuntuish 'Linux Mint 14 Nadia' calls the package gcc-avr. Anyway this is what versions of the relevant ( I think) packages I have installed.

    ii avr-libc 1:1.8.0-2 all Standard C library for Atmel AVR developm
    ii binutils-avr 2.20.1-3 amd64 Binary utilities supporting Atmel's AVR t
    ii gcc-avr 1:4.7.0-2 amd64 The GNU C compiler (cross compiler for av