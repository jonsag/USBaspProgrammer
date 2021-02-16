# USBaspProgrammer

My adaption of [Thomas Fischl's construction](https://www.fischl.de/usbasp/).  

This README concentrates on using ATmega88, and uploading it with avrisp, with a device such as [this one](https://github.com/jonsag/ardAVRProgrammer).  

## Firmware

Put the ATmega88 in the programming device, and  

>$ cd Firmware/firmware
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
