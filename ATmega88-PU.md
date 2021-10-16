# Dissection of the ATmega88-PU

## Empty chip

>$ cu -l /dev/ttyACM0 -s 115200

    Atmega chip detector.
    Written by Nick Gammon.
    Version 1.20
    Compiled on Feb 15 2021 at 16:17:48 with Arduino IDE 10813.
    Attempting to enter ICSP programming mode ...
    Entered programming mode OK.
    Signature = 0x1E 0x93 0x0A 
    Unrecognized signature.
    LFuse = 0x62 
    HFuse = 0xDF 
    EFuse = 0xF9 
    Lock byte = 0xFF 
    Clock calibration = 0xAB 

    First 256 bytes of program memory:

    00: 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
    ...
    F0: 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 

    Programming mode off.

Dumping flash and eeprom  

>$ avrdude -p m88 -P /dev/ttyUSB0 -c avrisp -b 19200 -v -U flash:r:flashEmpty.hex:i -U eeprom:r:eepromEmpty.eep:i

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
    avrdude: reading flash memory:

    Reading | ################################################## | 100% 9.97s

    avrdude: Flash is empty, resulting file has no contents.
    avrdude: writing output file "flashEmpty.hex"
    avrdude: reading eeprom memory:

    Reading | ################################################## | 100% 7.88s

    avrdude: writing output file "eepromEmpty.eep"

    avrdude: safemode: hfuse reads as DF
    avrdude: safemode: efuse reads as F9
    avrdude: safemode: Fuses OK (E:F9, H:DF, L:62)

    avrdude done.  Thank you.

Read fuses  

>$ avrdude -p m88 -P /dev/ttyUSB0 -c avrisp -b 19200 -U lfuse:r:-:i -U hfuse:r:-:i -U efuse:r:-:i

    avrdude: AVR device initialized and ready to accept instructions

    Reading | ################################################## | 100% 0.08s

    avrdude: Device signature = 0x1e930a (probably m88)
    avrdude: reading lfuse memory:

    Reading | ################################################## | 100% 0.03s

    avrdude: writing output file "<stdout>"
    :01000000629D
    :00000001FF
    avrdude: reading hfuse memory:

    Reading | ################################################## | 100% 0.03s

    avrdude: writing output file "<stdout>"
    :01000000DF20
    :00000001FF
    avrdude: reading efuse memory:

    Reading | ################################################## | 100% 0.04s

    avrdude: writing output file "<stdout>"
    :01000000F906
    :00000001FF

    avrdude: safemode: Fuses OK (E:F9, H:DF, L:62)

    avrdude done.  Thank you.

All three confirms fuses are  

    LFuse = 0x62 
    HFuse = 0xDF 
    EFuse = 0xF9 

Lock byte  

    Lock byte = 0xFF

Clock calibration  

    Clock calibration = 0xAB

## After programming

>$ cu -l /dev/ttyACM0 -s 115200

    Atmega chip detector.
    Written by Nick Gammon.
    Version 1.20
    Compiled on Feb 15 2021 at 16:17:48 with Arduino IDE 10813.
    Attempting to enter ICSP programming mode ...
    Entered programming mode OK.
    Signature = 0x1E 0x93 0x0A 
    Unrecognized signature.
    LFuse = 0xFF 
    HFuse = 0xDD 
    EFuse = 0xF9 
    Lock byte = 0xFF 
    Clock calibration = 0xAB 

    First 256 bytes of program memory:

    00: 0x42 0xC0 0xAA 0xC1 0x5B 0xC0 0x5A 0xC0 0x59 0xC0 0x58 0xC0 0x57 0xC0 0x56 0xC0 
    ...
    F0: 0x10 0x92 0x28 0x01 0x80 0x91 0x01 0x01 0x84 0xFF 0x3A 0xC0 0xC0 0x91 0x00 0x01 

    Programming mode off.

Dumping flash and eeprom  

>$ avrdude -p m88 -P /dev/ttyUSB0 -c avrisp -b 19200 -v -U flash:r:flashProgrammed.hex:i -U eeprom:r:eepromProgrammed.eep:i

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
    avrdude: safemode: hfuse reads as DD
    avrdude: safemode: efuse reads as F9
    avrdude: reading flash memory:

    Reading | ################################################## | 100% 9.97s

    avrdude: writing output file "flashProgrammed.hex"
    avrdude: reading eeprom memory:

    Reading | ################################################## | 100% 7.90s

    avrdude: writing output file "eepromProgrammed.eep"

    avrdude: safemode: hfuse reads as DD
    avrdude: safemode: efuse reads as F9
    avrdude: safemode: Fuses OK (E:F9, H:DD, L:FF)

    avrdude done.  Thank you.

Read fuses  

>$ avrdude -p m88 -P /dev/ttyUSB0 -c avrisp -b 19200 -U lfuse:r:-:i -U hfuse:r:-:i -U efuse:r:-:i

    avrdude: AVR device initialized and ready to accept instructions

    Reading | ################################################## | 100% 0.08s

    avrdude: Device signature = 0x1e930a (probably m88)
    avrdude: reading lfuse memory:

    Reading | ################################################## | 100% 0.03s

    avrdude: writing output file "<stdout>"
    :01000000FF00
    :00000001FF
    avrdude: reading hfuse memory:

    Reading | ################################################## | 100% 0.03s

    avrdude: writing output file "<stdout>"
    :01000000DD22
    :00000001FF
    avrdude: reading efuse memory:

    Reading | ################################################## | 100% 0.03s

    avrdude: writing output file "<stdout>"
    :01000000F906
    :00000001FF

    avrdude: safemode: Fuses OK (E:F9, H:DD, L:FF)

    avrdude done.  Thank you.

All three agrees on fuses  

    LFuse = 0xFF 
    HFuse = 0xDD 
    EFuse = 0xF9 

Lock byte still  

    Lock byte = 0xFF 

Clock calibration is now  

    Clock calibration = 0xAB

Diff  

>$ diff main.hex flashProgrammed.hex | wc -l

    418

## Testing the programmer

Insert programmer  

>$ dmesg

    ...
    [173324.477738] usb 4-4: new low-speed USB device number 32 using ohci-pci
    [173324.722745] usb 4-4: New USB device found, idVendor=16c0, idProduct=05dc, bcdDevice= 1.04
    [173324.722749] usb 4-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
    [173324.722752] usb 4-4: Product: USBasp
    [173324.722754] usb 4-4: Manufacturer: www.fischl.de

>$ lsusb

    ...
    Bus 004 Device 036: ID 16c0:05dc Van Ooijen Technische Informatica shared ID for use with libusb
    ...
