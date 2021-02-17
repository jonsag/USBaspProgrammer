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
P 3800 3750
F 0 "J1" H 3850 4567 50  0000 C CNN
F 1 "Conn_02x14_Counter_Clockwise" H 3850 4476 50  0000 C CNN
F 2 "My_Misc:ZIF_DIP_Socket-28_W6.9_W7.62_W7.62_W12.7_W13.5_large" H 3800 3750 50  0001 C CNN
F 3 "~" H 3800 3750 50  0001 C CNN
	1    3800 3750
	1    0    0    -1  
$EndComp
$Comp
L My_Parts:ISP_header_Conn_02x05_Odd_Even J2
U 1 1 6033957C
P 5600 3000
F 0 "J2" H 5800 3425 50  0000 C CNN
F 1 "ISP_header_Conn_02x05_Odd_Even" H 5800 3334 50  0000 C CNN
F 2 "My_Misc:IDC-Header_2x05_P2.54mm_Vertical_large" H 5600 3000 50  0001 C CNN
F 3 "~" H 5600 3000 50  0001 C CNN
	1    5600 3000
	1    0    0    -1  
$EndComp
$Comp
L My_Parts:ISP_header_Conn_02x05_Odd_Even J3
U 1 1 6033A090
P 5600 3850
F 0 "J3" H 5800 4275 50  0000 C CNN
F 1 "ISP_header_Conn_02x05_Odd_Even" H 5800 4184 50  0000 C CNN
F 2 "My_Misc:IDC-Header_2x05_P2.54mm_Vertical_large" H 5600 3850 50  0001 C CNN
F 3 "~" H 5600 3850 50  0001 C CNN
	1    5600 3850
	1    0    0    -1  
$EndComp
$Comp
L My_Parts:ISP_header_Conn_02x05_Odd_Even J4
U 1 1 6033AB8F
P 5600 4700
F 0 "J4" H 5800 5125 50  0000 C CNN
F 1 "ISP_header_Conn_02x05_Odd_Even" H 5800 5034 50  0000 C CNN
F 2 "My_Misc:IDC-Header_2x05_P2.54mm_Vertical_large" H 5600 4700 50  0001 C CNN
F 3 "~" H 5600 4700 50  0001 C CNN
	1    5600 4700
	1    0    0    -1  
$EndComp
Text Notes 6700 3050 0    50   ~ 0
ATmega328/328P
Text Notes 6650 3850 0    50   ~ 0
ATtiny4313
Text Notes 6750 4700 0    50   ~ 0
ATtiny85
Text Notes 750  7400 0    80   ~ 0
            10Pin           6pin    ATmega328/328P          ATtiny4313      ATtiny85\nMOSI    ->  1           ->  4   ->  17/PB3                  17/PB5          5/AREF/PB0\nMISO    ->  9           ->  1   ->  18/PB4                  18/PB6          6/PB1\nSCK     ->  7           ->  3   ->  19/PB5                  19/PB7          7/PB2\nRST     ->  5           ->  5   ->  1/RESET/PC6,21/AREF     1/RESET/PA2     1/RESET/PB5\n        ->                          9/XTAL1/PB6\nVCC     ->  2           ->  2   ->  7/VCC,20/VSS            20/VCC          8/VCC\nGND     ->  4,6,8,10    ->  6   ->  8/GND,22/GND            10/GND          4/GND
Text GLabel 4300 4250 2    50   Input ~ 0
17
Text GLabel 5200 2800 0    50   Input ~ 0
17
Text GLabel 5200 3200 0    50   Input ~ 0
18
Text GLabel 4300 4150 2    50   Input ~ 0
18
Text GLabel 4300 4050 2    50   Input ~ 0
19
Text GLabel 5200 3100 0    50   Input ~ 0
19
Text GLabel 5200 3000 0    50   Input ~ 0
1
Text GLabel 3400 3150 0    50   Input ~ 0
1
Text GLabel 3400 3750 0    50   Input ~ 0
7
Text GLabel 4300 3950 2    50   Input ~ 0
20
Text GLabel 6550 2700 1    50   Input ~ 0
7
Text GLabel 6750 2700 1    50   Input ~ 0
20
Wire Wire Line
	6750 2800 6750 2700
Wire Wire Line
	6550 2700 6550 2800
Wire Wire Line
	6200 2800 6550 2800
Connection ~ 6550 2800
Wire Wire Line
	6550 2800 6750 2800
Wire Wire Line
	5400 2800 5200 2800
Wire Wire Line
	5400 3000 5200 3000
Wire Wire Line
	5400 3100 5200 3100
Wire Wire Line
	5400 3200 5200 3200
Wire Wire Line
	6200 3100 6300 3100
Wire Wire Line
	6300 3100 6300 3200
Wire Wire Line
	6300 3200 6200 3200
Text GLabel 3400 3850 0    50   Input ~ 0
8
Text GLabel 4300 3750 2    50   Input ~ 0
22
Text GLabel 6400 3100 2    50   Input ~ 0
8
Text GLabel 6400 3200 2    50   Input ~ 0
22
Wire Wire Line
	6400 3100 6300 3100
Connection ~ 6300 3100
Wire Wire Line
	6400 3200 6300 3200
Connection ~ 6300 3200
Wire Wire Line
	3600 3150 3400 3150
Wire Wire Line
	3600 3750 3400 3750
Wire Wire Line
	3600 3850 3400 3850
Wire Wire Line
	4100 3750 4300 3750
Wire Wire Line
	4300 3950 4100 3950
Wire Wire Line
	4300 4050 4100 4050
Wire Wire Line
	4300 4150 4100 4150
Wire Wire Line
	4300 4250 4100 4250
Text GLabel 3400 4050 0    50   Input ~ 0
10
Wire Wire Line
	3600 4050 3400 4050
Text GLabel 4300 3450 2    50   Input ~ 0
25
Text GLabel 5200 4500 0    50   Input ~ 0
25
Text GLabel 4300 3350 2    50   Input ~ 0
26
Text GLabel 5200 4900 0    50   Input ~ 0
26
Text GLabel 4300 3250 2    50   Input ~ 0
27
Text GLabel 5200 4800 0    50   Input ~ 0
27
Text GLabel 5200 4700 0    50   Input ~ 0
1
Text GLabel 6400 4500 2    50   Input ~ 0
28
Text GLabel 4300 3150 2    50   Input ~ 0
28
Text GLabel 3400 3450 0    50   Input ~ 0
4
Text GLabel 6400 4800 2    50   Input ~ 0
4
Wire Wire Line
	5400 4500 5200 4500
Wire Wire Line
	5400 4700 5200 4700
Wire Wire Line
	5200 4800 5400 4800
Wire Wire Line
	5400 4900 5200 4900
Wire Wire Line
	6200 4800 6300 4800
Wire Wire Line
	6200 4900 6300 4900
Wire Wire Line
	6300 4900 6300 4800
Connection ~ 6300 4800
Wire Wire Line
	6300 4800 6400 4800
Wire Wire Line
	6200 4500 6400 4500
Wire Wire Line
	4300 3250 4100 3250
Wire Wire Line
	4100 3150 4300 3150
Wire Wire Line
	4300 3350 4100 3350
Wire Wire Line
	4300 3450 4100 3450
Wire Wire Line
	3650 3450 3600 3450
Connection ~ 3600 3450
Wire Wire Line
	3600 3450 3400 3450
Text GLabel 5200 3650 0    50   Input ~ 0
25
Text GLabel 5200 4050 0    50   Input ~ 0
26
Text GLabel 5200 3950 0    50   Input ~ 0
27
Text GLabel 5200 3850 0    50   Input ~ 0
1
Text GLabel 6400 3650 2    50   Input ~ 0
28
Text GLabel 6400 3950 2    50   Input ~ 0
10
Wire Wire Line
	6400 3650 6200 3650
Wire Wire Line
	6200 3950 6300 3950
Wire Wire Line
	6300 3950 6300 4050
Wire Wire Line
	6300 4050 6200 4050
Wire Wire Line
	6300 3950 6400 3950
Connection ~ 6300 3950
Wire Wire Line
	5400 4050 5200 4050
Wire Wire Line
	5200 3950 5400 3950
Wire Wire Line
	5400 3850 5200 3850
Wire Wire Line
	5200 3650 5400 3650
$EndSCHEMATC
