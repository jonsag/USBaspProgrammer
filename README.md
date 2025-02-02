# USBaspProgrammer

My adaption of [Thomas Fischl's construction](https://www.fischl.de/usbasp/).  

This README concentrates on using ATmega88, and uploading it with avrisp, with a device such as [this one](https://github.com/jonsag/ardAVRProgrammer).  
Use the ICSP header on the programmer, and remember to set jumper J2.  

## Compile and upload

Put the ATmega88 in the programming device, and  

>$ cd Firmware/firmware

Test avrdude  

>$ make avrdude

    avrdude -c avrisp -p atmega88 -P /dev/ttyUSB0 -b 19200 -v

    avrdude: Version 6.3
            Copyright (c) 2000-2005 Brian Dean, http://www.bdmicro.com/
            Copyright (c) 2007-2014 Joerg Wunsch

            System wide configuration file is "/etc/avrdude.conf"
            User configuration file is "/home/jon/.avrduderc"
            User configuration file does not exist or is not a regular file, skipping

            Using Port                    : /dev/ttyUSB0
            Using Programmer              : avrisp
            Overriding Baud Rate          : 19200
            AVR Part                      : ATmega88
            Chip Erase delay              : 9000 us
            PAGEL                         : PD7
            BS2                           : PC2
            RESET disposition             : dedicated
            RETRY pulse                   : SCK
            serial program mode           : yes
            parallel program mode         : yes
            Timeout                       : 200
            StabDelay                     : 100
            CmdexeDelay                   : 25
            SyncLoops                     : 32
            ByteDelay                     : 0
            PollIndex                     : 3
            PollValue                     : 0x53
            Memory Detail                 :

                                    Block Poll               Page                       Polled
            Memory Type Mode Delay Size  Indx Paged  Size   Size #Pages MinW  MaxW   ReadBack
            ----------- ---- ----- ----- ---- ------ ------ ---- ------ ----- ----- ---------
            eeprom        65    20     4    0 no        512    4      0  3600  3600 0xff 0xff
            flash         65     6    64    0 yes      8192   64    128  4500  4500 0xff 0xff
            lfuse          0     0     0    0 no          1    0      0  4500  4500 0x00 0x00
            hfuse          0     0     0    0 no          1    0      0  4500  4500 0x00 0x00
            efuse          0     0     0    0 no          1    0      0  4500  4500 0x00 0x00
            lock           0     0     0    0 no          1    0      0  4500  4500 0x00 0x00
            calibration    0     0     0    0 no          1    0      0     0     0 0x00 0x00
            signature      0     0     0    0 no          3    0      0     0     0 0x00 0x00

            Programmer Type : STK500
            Description     : Atmel AVR ISP
            Hardware Version: 2
            Firmware Version: 1.18
            Topcard         : Unknown
            Vtarget         : 0.0 V
            Varef           : 0.0 V
            Oscillator      : Off
            SCK period      : 0.1 us

    avrdude: AVR device initialized and ready to accept instructions

    Reading | ################################################## | 100% 0.08s

    avrdude: Device signature = 0x1e930a (probably m88)
    avrdude: safemode: hfuse reads as DF
    avrdude: safemode: efuse reads as F9

    avrdude: safemode: hfuse reads as DF
    avrdude: safemode: efuse reads as F9
    avrdude: safemode: Fuses OK (E:F9, H:DF, L:62)

    avrdude done.  Thank you.

Clean, compile, upload and set fuses  

>$ make clean

    rm -f main.hex main.lst main.obj main.cof main.list main.map main.eep.hex main.bin *.o main.s usbdrv/*.o

>$ make main.hex

    avr-gcc -Wall -O2 -Iusbdrv -I. -mmcu=atmega88  -c usbdrv/usbdrv.c -o usbdrv/usbdrv.o
    avr-gcc -Wall -O2 -Iusbdrv -I. -mmcu=atmega88  -x assembler-with-cpp -c usbdrv/usbdrvasm.S -o usbdrv/usbdrvasm.o
    avr-gcc -Wall -O2 -Iusbdrv -I. -mmcu=atmega88  -c usbdrv/oddebug.c -o usbdrv/oddebug.o
    avr-gcc -Wall -O2 -Iusbdrv -I. -mmcu=atmega88  -c isp.c -o isp.o
    avr-gcc -Wall -O2 -Iusbdrv -I. -mmcu=atmega88  -c clock.c -o clock.o
    avr-gcc -Wall -O2 -Iusbdrv -I. -mmcu=atmega88  -x assembler-with-cpp -c tpi.S -o tpi.o
    avr-gcc -Wall -O2 -Iusbdrv -I. -mmcu=atmega88  -c main.c -o main.o
    avr-gcc -Wall -O2 -Iusbdrv -I. -mmcu=atmega88  -o main.bin usbdrv/usbdrv.o usbdrv/usbdrvasm.o usbdrv/oddebug.o isp.o clock.o tpi.o main.o -Wl,-Map,main.map
    rm -f main.hex main.eep.hex
    avr-objcopy -j .text -j .data -O ihex main.bin main.hex

>$ make flash

    avrdude -c avrisp -p atmega88 -P /dev/ttyUSB0 -b 19200 -U flash:w:main.hex

    avrdude: AVR device initialized and ready to accept instructions

    Reading | ################################################## | 100% 0.08s

    avrdude: Device signature = 0x1e930a (probably m88)
    avrdude: NOTE: "flash" memory has been specified, an erase cycle will be performed
            To disable this feature, specify the -D option.
    avrdude: erasing chip
    avrdude: reading input file "main.hex"
    avrdude: input file main.hex auto detected as Intel Hex
    avrdude: writing flash (4400 bytes):

    Writing | ################################################## | 100% 7.60s

    avrdude: 4400 bytes of flash written
    avrdude: verifying flash memory against main.hex:
    avrdude: load data flash data from input file main.hex:
    avrdude: input file main.hex auto detected as Intel Hex
    avrdude: input file main.hex contains 4400 bytes
    avrdude: reading on-chip flash data:

    Reading | ################################################## | 100% 5.38s

    avrdude: verifying ...
    avrdude: 4400 bytes of flash verified

    avrdude: safemode: Fuses OK (E:F9, H:DF, L:62)

    avrdude done.  Thank you.

>$ make fuses

    avrdude -c avrisp -p atmega88 -P /dev/ttyUSB0 -b 19200 -u -U hfuse:w:0xDD:m -U lfuse:w:0xFF:m

    avrdude: AVR device initialized and ready to accept instructions

    Reading | ################################################## | 100% 0.08s

    avrdude: Device signature = 0x1e930a (probably m88)
    avrdude: reading input file "0xDD"
    avrdude: writing hfuse (1 bytes):

    Writing | ################################################## | 100% 0.09s

    avrdude: 1 bytes of hfuse written
    avrdude: verifying hfuse memory against 0xDD:
    avrdude: load data hfuse data from input file 0xDD:
    avrdude: input file 0xDD contains 1 bytes
    avrdude: reading on-chip hfuse data:

    Reading | ################################################## | 100% 0.03s

    avrdude: verifying ...
    avrdude: 1 bytes of hfuse verified
    avrdude: reading input file "0xFF"
    avrdude: writing lfuse (1 bytes):

    Writing | ################################################## | 100% 0.09s

    avrdude: 1 bytes of lfuse written
    avrdude: verifying lfuse memory against 0xFF:
    avrdude: load data lfuse data from input file 0xFF:
    avrdude: input file 0xFF contains 1 bytes
    avrdude: reading on-chip lfuse data:

    Reading | ################################################## | 100% 0.03s

    avrdude: verifying ...
    avrdude: 1 bytes of lfuse verified

    avrdude done.  Thank you.

## Define device rules

>$ sudo cp \<PATH>/Documents/linux-nonroot/99-USBasp.rules /etc/udev/rules.d/99-USBasp.rules
>
>$ sudo udevadm control --reload-rules

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

## My notes

Connections on different MCUs  

            10Pin           6pin    ATmega8/88/328/328P     ATtiny4313      ATtiny85  
MOSI    ->  1           ->  4   ->  17/PB3                  17/PB5          5/AREF/PB0  
MISO    ->  9           ->  1   ->  18/PB4                  18/PB6          6/PB1  
SCK     ->  7           ->  3   ->  19/PB5                  19/PB7          7/PB2  
RST     ->  5           ->  5   ->  1/RESET/PC6,21/AREF     1/RESET/PA2     1/RESET/PB5  
VCC     ->  2           ->  2   ->  7/VCC                   20/VCC          8/VCC  
GND     ->  4,6,8,10    ->  6   ->  8/GND                   10/GND          4/GND  
XTAL1                               9/XTAL1                 5/XTAL1         2/XTAL1
XTAL2                               10/XTAL2                4/XTAL2         3/XTAL2
