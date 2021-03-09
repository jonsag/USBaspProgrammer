EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_02x14_Counter_Clockwise J1
U 1 1 603379B1
P 6250 3150
F 0 "J1" H 6300 3967 50  0000 C CNN
F 1 "Conn_02x14_Counter_Clockwise" H 6300 3876 50  0000 C CNN
F 2 "My_Misc:ZIF_DIP_Socket-28_W6.9_W7.62_W7.62_W12.7_W13.5_large" H 6250 3150 50  0001 C CNN
F 3 "~" H 6250 3150 50  0001 C CNN
	1    6250 3150
	1    0    0    -1  
$EndComp
$Comp
L My_Parts:ISP_header_Conn_02x05_Odd_Even J2
U 1 1 6033957C
P 8600 1900
F 0 "J2" H 8800 2325 50  0000 C CNN
F 1 "ISP_header_Conn_02x05_Odd_Even" H 8800 2234 50  0000 C CNN
F 2 "My_Misc:IDC-Header_2x05_P2.54mm_Vertical_large" H 8600 1900 50  0001 C CNN
F 3 "~" H 8600 1900 50  0001 C CNN
	1    8600 1900
	1    0    0    -1  
$EndComp
$Comp
L My_Parts:ISP_header_Conn_02x05_Odd_Even J3
U 1 1 6033A090
P 8600 2750
F 0 "J3" H 8800 3175 50  0000 C CNN
F 1 "ISP_header_Conn_02x05_Odd_Even" H 8800 3084 50  0000 C CNN
F 2 "My_Misc:IDC-Header_2x05_P2.54mm_Vertical_large" H 8600 2750 50  0001 C CNN
F 3 "~" H 8600 2750 50  0001 C CNN
	1    8600 2750
	1    0    0    -1  
$EndComp
$Comp
L My_Parts:ISP_header_Conn_02x05_Odd_Even J4
U 1 1 6033AB8F
P 8600 3600
F 0 "J4" H 8800 4025 50  0000 C CNN
F 1 "ISP_header_Conn_02x05_Odd_Even" H 8800 3934 50  0000 C CNN
F 2 "My_Misc:IDC-Header_2x05_P2.54mm_Vertical_large" H 8600 3600 50  0001 C CNN
F 3 "~" H 8600 3600 50  0001 C CNN
	1    8600 3600
	1    0    0    -1  
$EndComp
Text Notes 9700 1950 0    50   ~ 0
ATmega88/328/328P
Text Notes 9650 2750 0    50   ~ 0
ATtiny4313
Text Notes 9750 3600 0    50   ~ 0
ATtiny85
Text Notes 850  6600 0    80   ~ 0
            10Pin           6pin    ATmega8/88/328/328P     ATtiny4313      ATtiny85  \nMOSI    ->  1           ->  4   ->  17/PB3                  17/PB5          5/AREF/PB0  \nMISO    ->  9           ->  1   ->  18/PB4                  18/PB6          6/PB1  \nSCK     ->  7           ->  3   ->  19/PB5                  19/PB7          7/PB2  \nRST     ->  5           ->  5   ->  1/RESET/PC6,21/AREF     1/RESET/PA2     1/RESET/PB5  \nVCC     ->  2           ->  2   ->  7/VCC                   20/VCC          8/VCC  \nGND     ->  4,6,8,10    ->  6   ->  8/GND                   10/GND          4/GND  \nXTAL1                               9/XTAL1                 5/XTAL1         2/XTAL1\nXTAL2                               10/XTAL2                4/XTAL2         3/XTAL2
Text GLabel 6750 3650 2    50   Input ~ 0
17
Text GLabel 8200 1700 0    50   Input ~ 0
17
Text GLabel 8200 2100 0    50   Input ~ 0
18
Text GLabel 6750 3550 2    50   Input ~ 0
18
Text GLabel 6750 3450 2    50   Input ~ 0
19
Text GLabel 8200 2000 0    50   Input ~ 0
19
Text GLabel 8200 1900 0    50   Input ~ 0
1
Text GLabel 5850 2550 0    50   Input ~ 0
1
Text GLabel 5850 3150 0    50   Input ~ 0
7
Text GLabel 9400 1700 2    50   Input ~ 0
7
Wire Wire Line
	8400 1700 8200 1700
Wire Wire Line
	8400 1900 8200 1900
Wire Wire Line
	8400 2000 8200 2000
Wire Wire Line
	8400 2100 8200 2100
Text GLabel 5850 3250 0    50   Input ~ 0
8
Text GLabel 9400 2100 2    50   Input ~ 0
8
Wire Wire Line
	6050 2550 5850 2550
Wire Wire Line
	6050 3150 5850 3150
Wire Wire Line
	6050 3250 5850 3250
Wire Wire Line
	6750 3450 6550 3450
Wire Wire Line
	6750 3550 6550 3550
Wire Wire Line
	6750 3650 6550 3650
Text GLabel 5850 3450 0    50   Input ~ 0
10
Wire Wire Line
	6050 3450 5850 3450
Text GLabel 6750 2850 2    50   Input ~ 0
25
Text GLabel 8200 3400 0    50   Input ~ 0
25
Text GLabel 6750 2750 2    50   Input ~ 0
26
Text GLabel 8200 3800 0    50   Input ~ 0
26
Text GLabel 6750 2650 2    50   Input ~ 0
27
Text GLabel 8200 3700 0    50   Input ~ 0
27
Text GLabel 8200 3600 0    50   Input ~ 0
1
Text GLabel 9400 3400 2    50   Input ~ 0
28
Text GLabel 6750 2550 2    50   Input ~ 0
28
Text GLabel 5850 2850 0    50   Input ~ 0
4
Text GLabel 9400 3800 2    50   Input ~ 0
4
Wire Wire Line
	8400 3400 8200 3400
Wire Wire Line
	8400 3600 8200 3600
Wire Wire Line
	8200 3700 8400 3700
Wire Wire Line
	8400 3800 8200 3800
Wire Wire Line
	9200 3400 9400 3400
Wire Wire Line
	6750 2650 6550 2650
Wire Wire Line
	6550 2550 6750 2550
Wire Wire Line
	6750 2750 6550 2750
Wire Wire Line
	6750 2850 6550 2850
Wire Wire Line
	6050 2850 5850 2850
Text GLabel 8200 2550 0    50   Input ~ 0
25
Text GLabel 8200 2950 0    50   Input ~ 0
26
Text GLabel 8200 2850 0    50   Input ~ 0
27
Text GLabel 8200 2750 0    50   Input ~ 0
1
Text GLabel 9400 2550 2    50   Input ~ 0
28
Text GLabel 9400 2950 2    50   Input ~ 0
10
Wire Wire Line
	9400 2550 9200 2550
Wire Wire Line
	8400 2950 8200 2950
Wire Wire Line
	8200 2850 8400 2850
Wire Wire Line
	8400 2750 8200 2750
Wire Wire Line
	8200 2550 8400 2550
Wire Wire Line
	9200 2100 9400 2100
Wire Wire Line
	9200 2950 9400 2950
Wire Wire Line
	9200 3800 9400 3800
Wire Wire Line
	9400 1700 9200 1700
$Comp
L Device:Crystal Y1
U 1 1 6030494F
P 1550 3150
F 0 "Y1" H 1550 3418 50  0000 C CNN
F 1 "Crystal" H 1550 3327 50  0000 C CNN
F 2 "My_Headers:3-pin_Crystal_header_large" H 1550 3150 50  0001 C CNN
F 3 "~" H 1550 3150 50  0001 C CNN
	1    1550 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 603054C8
P 1300 3500
F 0 "C1" H 1415 3546 50  0000 L CNN
F 1 "22p" H 1415 3455 50  0000 L CNN
F 2 "My_Misc:C_Disc_D3.0mm_W1.6mm_P2.50mm_larg" H 1338 3350 50  0001 C CNN
F 3 "~" H 1300 3500 50  0001 C CNN
	1    1300 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 60305AF8
P 1800 3500
F 0 "C2" H 1915 3546 50  0000 L CNN
F 1 "22p" H 1915 3455 50  0000 L CNN
F 2 "My_Misc:C_Disc_D3.0mm_W1.6mm_P2.50mm_larg" H 1838 3350 50  0001 C CNN
F 3 "~" H 1800 3500 50  0001 C CNN
	1    1800 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 3650 1300 3850
Wire Wire Line
	1300 3850 1550 3850
Wire Wire Line
	1800 3850 1800 3650
Wire Wire Line
	1550 3850 1550 4050
Connection ~ 1550 3850
Wire Wire Line
	1550 3850 1800 3850
Wire Wire Line
	1300 3350 1300 3150
Wire Wire Line
	1300 3150 1400 3150
Wire Wire Line
	1700 3150 1800 3150
Wire Wire Line
	1800 3150 1800 3350
Wire Wire Line
	1300 3150 1300 2750
Connection ~ 1300 3150
Wire Wire Line
	1800 2750 1800 3150
Connection ~ 1800 3150
Text GLabel 1300 2750 1    50   Input ~ 0
XTAL1
Text GLabel 1800 2750 1    50   Input ~ 0
XTAL2
Text GLabel 1550 4050 3    50   Input ~ 0
GND
Text GLabel 3200 1700 0    50   Input ~ 0
XTAL1
Text GLabel 3200 1800 0    50   Input ~ 0
XTAL2
Text GLabel 3200 1900 0    50   Input ~ 0
GND
Text GLabel 3200 2400 0    50   Input ~ 0
XTAL1
Text GLabel 3200 2500 0    50   Input ~ 0
XTAL2
Text GLabel 3200 2600 0    50   Input ~ 0
GND
Text GLabel 3200 3100 0    50   Input ~ 0
XTAL1
Text GLabel 5850 3350 0    50   Input ~ 0
9
Wire Wire Line
	6050 3350 5850 3350
Text GLabel 4100 1700 2    50   Input ~ 0
9
Text GLabel 4100 1800 2    50   Input ~ 0
10
Text GLabel 4100 1900 2    50   Input ~ 0
8
Text GLabel 4100 2400 2    50   Input ~ 0
5
Text GLabel 5850 2950 0    50   Input ~ 0
5
Text GLabel 4100 2500 2    50   Input ~ 0
4
Text GLabel 4100 2600 2    50   Input ~ 0
10
Text GLabel 5850 3050 0    50   Input ~ 0
4
Text GLabel 4100 3100 2    50   Input ~ 0
2
Text GLabel 5850 2650 0    50   Input ~ 0
2
Text GLabel 5850 2750 0    50   Input ~ 0
3
Wire Wire Line
	6050 3050 5850 3050
Wire Wire Line
	6050 2950 5850 2950
Wire Wire Line
	6050 2750 5850 2750
Wire Wire Line
	6050 2650 5850 2650
Text GLabel 4100 3300 2    50   Input ~ 0
4
Text GLabel 4100 3200 2    50   Input ~ 0
3
Text GLabel 3200 3300 0    50   Input ~ 0
GND
Text GLabel 3200 3200 0    50   Input ~ 0
XTAL2
$Comp
L My_Parts:3_pole_Jumper_2_Open JP1
U 1 1 602EAB8E
P 3650 1700
F 0 "JP1" H 3650 1935 50  0000 C CNN
F 1 "3_pole_Jumper_2_Open" H 3650 1844 50  0000 C CNN
F 2 "My_Parts:3-pole_jumper_2x03_P2.54mm_Vertical" H 3650 1700 50  0001 C CNN
F 3 "~" H 3650 1700 50  0001 C CNN
	1    3650 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 1700 3200 1700
Wire Wire Line
	3450 1800 3200 1800
Wire Wire Line
	3450 1900 3200 1900
Wire Wire Line
	4100 1700 3850 1700
Wire Wire Line
	4100 1800 3850 1800
Wire Wire Line
	4100 1900 3850 1900
$Comp
L My_Parts:3_pole_Jumper_2_Open JP2
U 1 1 603108C9
P 3650 2400
F 0 "JP2" H 3650 2635 50  0000 C CNN
F 1 "3_pole_Jumper_2_Open" H 3650 2544 50  0000 C CNN
F 2 "My_Parts:3-pole_jumper_2x03_P2.54mm_Vertical" H 3650 2400 50  0001 C CNN
F 3 "~" H 3650 2400 50  0001 C CNN
	1    3650 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 2400 3200 2400
Wire Wire Line
	3450 2600 3200 2600
Wire Wire Line
	3200 2500 3450 2500
Wire Wire Line
	4100 2400 3850 2400
Wire Wire Line
	4100 2500 3850 2500
Wire Wire Line
	4100 2600 3850 2600
$Comp
L My_Parts:3_pole_Jumper_2_Open JP3
U 1 1 603319D4
P 3650 3100
F 0 "JP3" H 3650 3335 50  0000 C CNN
F 1 "3_pole_Jumper_2_Open" H 3650 3244 50  0000 C CNN
F 2 "My_Parts:3-pole_jumper_2x03_P2.54mm_Vertical" H 3650 3100 50  0001 C CNN
F 3 "~" H 3650 3100 50  0001 C CNN
	1    3650 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 3100 3200 3100
Wire Wire Line
	3200 3200 3450 3200
Wire Wire Line
	3450 3300 3200 3300
Wire Wire Line
	3850 3300 4100 3300
Wire Wire Line
	4100 3200 3850 3200
Wire Wire Line
	3850 3100 4100 3100
$EndSCHEMATC
