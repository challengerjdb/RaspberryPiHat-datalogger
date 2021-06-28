EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Raspberry Pi DataQ Hat"
Date "2021-06-04"
Rev "2"
Comp "Amped Innovation"
Comment1 "Designed by Jack on Earth"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:R_US R2
U 1 1 609DE90E
P 6600 975
F 0 "R2" H 6670 1021 50  0000 L CNN
F 1 "10 kΩ" H 6670 930 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6530 975 50  0001 C CNN
F 3 "~" H 6600 975 50  0001 C CNN
	1    6600 975 
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_US R1
U 1 1 609DF2B6
P 7000 975
F 0 "R1" H 7070 1021 50  0000 L CNN
F 1 "16 kΩ" H 7070 930 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6930 975 50  0001 C CNN
F 3 "~" H 7000 975 50  0001 C CNN
	1    7000 975 
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 J3
U 1 1 609DFC21
P 6175 1400
F 0 "J3" H 6255 1442 50  0000 L CNN
F 1 "Screw_Terminal_01x03" H 6255 1351 50  0000 L CNN
F 2 "3screwterminal:TB002-500-03BE" H 6175 1400 50  0001 C CNN
F 3 "~" H 6175 1400 50  0001 C CNN
	1    6175 1400
	-1   0    0    1   
$EndComp
$Comp
L Connector:Raspberry_Pi_2_3 J5
U 1 1 609D8DC7
P 9850 2575
F 0 "J5" H 9850 4056 50  0000 C CNN
F 1 "Raspberry_Pi_2_3" H 9850 3965 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x20_P2.54mm_Vertical" H 9850 2575 50  0001 C CNN
F 3 "https://www.raspberrypi.org/documentation/hardware/raspberrypi/schematics/rpi_SCH_3bplus_1p0_reduced.pdf" H 9850 2575 50  0001 C CNN
	1    9850 2575
	1    0    0    -1  
$EndComp
$Comp
L Connector:Barrel_Jack_Switch J6
U 1 1 609FC5AC
P 1025 900
F 0 "J6" H 1082 1217 50  0000 C CNN
F 1 "Barrel_Jack_Switch" H 1082 1126 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_CUI_PJ-102AH_Horizontal" H 1075 860 50  0001 C CNN
F 3 "~" H 1075 860 50  0001 C CNN
	1    1025 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 1075 9650 1275
NoConn ~ 10650 1675
NoConn ~ 10650 1775
NoConn ~ 10650 1975
NoConn ~ 10650 2075
NoConn ~ 10650 2275
NoConn ~ 10650 2375
NoConn ~ 10650 2475
NoConn ~ 10650 2675
NoConn ~ 10650 2775
NoConn ~ 10650 3275
NoConn ~ 10650 3375
NoConn ~ 9050 2875
NoConn ~ 9050 2975
NoConn ~ 9050 3075
NoConn ~ 9050 3175
NoConn ~ 9050 3275
NoConn ~ 9050 1675
NoConn ~ 9050 1775
NoConn ~ 9050 2175
NoConn ~ 9950 1275
NoConn ~ 10050 1275
$Comp
L Regulator_Switching:LM2596S-5 U2
U 1 1 609F25C1
P 3025 2475
F 0 "U2" H 3025 2842 50  0000 C CNN
F 1 "LM2596S-5" H 3025 2751 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-263-5_TabPin3" H 3075 2225 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm2596.pdf" H 3025 2475 50  0001 C CNN
	1    3025 2475
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D2
U 1 1 609F3D61
P 3650 2800
F 0 "D2" H 3650 3017 50  0000 C CNN
F 1 "D_Schottky" H 3650 2926 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-128" H 3650 2800 50  0001 C CNN
F 3 "~" H 3650 2800 50  0001 C CNN
	1    3650 2800
	0    1    1    0   
$EndComp
$Comp
L Device:CP C1
U 1 1 609F4F72
P 2150 2800
F 0 "C1" H 2268 2846 50  0000 L CNN
F 1 "680 μF" H 2268 2755 50  0000 L CNN
F 2 "Capacitor_THT:C_Radial_D16.0mm_H25.0mm_P7.50mm" H 2188 2650 50  0001 C CNN
F 3 "~" H 2150 2800 50  0001 C CNN
	1    2150 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C4
U 1 1 609F591A
P 4325 2800
F 0 "C4" H 4443 2846 50  0000 L CNN
F 1 "220 μF" H 4443 2755 50  0000 L CNN
F 2 "Capacitor_THT:C_Radial_D10.0mm_H20.0mm_P5.00mm" H 4363 2650 50  0001 C CNN
F 3 "~" H 4325 2800 50  0001 C CNN
	1    4325 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:L L1
U 1 1 609F5F38
P 4025 2575
F 0 "L1" V 4175 2525 50  0000 L CNN
F 1 "33 μH" V 4100 2450 50  0000 L CNN
F 2 "Inductor33:SRN1060-330M" H 4025 2575 50  0001 C CNN
F 3 "~" H 4025 2575 50  0001 C CNN
	1    4025 2575
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2525 2375 2150 2375
Wire Wire Line
	2150 2375 2150 2650
Wire Wire Line
	3525 2575 3650 2575
Connection ~ 3650 2575
Wire Wire Line
	3650 2575 3875 2575
Connection ~ 3650 2950
Wire Wire Line
	3650 2950 4325 2950
Wire Wire Line
	3650 2575 3650 2650
Wire Wire Line
	3025 2775 3025 2950
Connection ~ 3025 2950
Wire Wire Line
	3025 2950 3650 2950
Wire Wire Line
	2150 2950 2575 2950
Wire Wire Line
	2525 2575 2525 2675
Wire Wire Line
	2525 2675 2575 2675
Wire Wire Line
	2575 2675 2575 2950
Connection ~ 2575 2950
Wire Wire Line
	2575 2950 3025 2950
Wire Wire Line
	4175 2575 4325 2575
Wire Wire Line
	4325 2650 4325 2575
Wire Wire Line
	3525 2375 4325 2375
Wire Wire Line
	4325 2375 4325 2575
Connection ~ 4325 2575
Wire Wire Line
	4900 4500 4750 4500
Wire Wire Line
	5400 3750 5500 3750
Wire Wire Line
	5400 4100 5400 3750
$Comp
L Device:R_US R4
U 1 1 60B241BA
P 6150 3750
F 0 "R4" H 6220 3796 50  0000 L CNN
F 1 "1 kΩ" H 6220 3705 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6080 3750 50  0001 C CNN
F 3 "~" H 6150 3750 50  0001 C CNN
	1    6150 3750
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_US R3
U 1 1 60B23E17
P 5650 3750
F 0 "R3" H 5720 3796 50  0000 L CNN
F 1 "2 kΩ" H 5720 3705 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5580 3750 50  0001 C CNN
F 3 "~" H 5650 3750 50  0001 C CNN
	1    5650 3750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5500 4100 5500 4025
Wire Wire Line
	4500 5900 4500 6050
Connection ~ 4500 5900
Wire Wire Line
	4500 5750 4500 5900
Wire Wire Line
	4500 6150 4500 6050
Connection ~ 4500 6050
Wire Wire Line
	4500 5750 4500 5650
Connection ~ 4500 5750
Wire Wire Line
	4500 5650 4500 5550
Connection ~ 4500 5650
Wire Wire Line
	4500 5550 4500 5450
Connection ~ 4500 5550
Wire Wire Line
	4625 6150 4500 6150
Wire Wire Line
	4625 6050 4500 6050
Wire Wire Line
	4625 5750 4500 5750
Wire Wire Line
	4625 5650 4500 5650
Wire Wire Line
	4625 5550 4500 5550
Wire Wire Line
	4625 5450 4500 5450
Wire Wire Line
	5800 6350 5925 6350
Connection ~ 5800 6350
Wire Wire Line
	5800 5300 5800 6350
Wire Wire Line
	5700 6250 5925 6250
Connection ~ 5700 6250
Wire Wire Line
	5700 5300 5700 6250
Wire Wire Line
	5600 6150 5925 6150
Connection ~ 5600 6150
Wire Wire Line
	5600 5300 5600 6150
Wire Wire Line
	5500 6050 5925 6050
Connection ~ 5500 6050
Wire Wire Line
	5500 5300 5500 6050
Wire Wire Line
	5300 5650 5900 5650
Connection ~ 5300 5650
Wire Wire Line
	5300 5300 5300 5650
Wire Wire Line
	5200 5550 5900 5550
Wire Wire Line
	5400 5750 5900 5750
Connection ~ 5400 5750
Wire Wire Line
	5400 5300 5400 5750
Connection ~ 5200 5550
Wire Wire Line
	5200 5300 5200 5550
Wire Wire Line
	5100 5450 5900 5450
Connection ~ 5100 5450
Wire Wire Line
	5100 5300 5100 5450
Wire Wire Line
	5025 6350 5800 6350
Wire Wire Line
	5025 6250 5700 6250
Wire Wire Line
	5025 6150 5600 6150
Wire Wire Line
	5025 6050 5500 6050
Wire Wire Line
	5025 5750 5400 5750
Wire Wire Line
	5025 5650 5300 5650
Wire Wire Line
	5025 5550 5200 5550
Wire Wire Line
	5025 5450 5100 5450
Wire Wire Line
	6550 5450 6300 5450
Wire Wire Line
	6550 5525 6550 5450
Wire Wire Line
	6550 5550 6300 5550
Wire Wire Line
	6550 5625 6550 5550
Wire Wire Line
	6550 5750 6300 5750
Wire Wire Line
	6550 5825 6550 5750
Wire Wire Line
	6550 5650 6300 5650
Wire Wire Line
	6550 5725 6550 5650
$Comp
L R_zigzag:R_Pack04_US RN3
U 1 1 60A202EB
P 4825 5550
F 0 "RN3" V 4425 5475 50  0000 L CNN
F 1 "33 kΩ" V 4500 5400 50  0000 L CNN
F 2 "Resistor_SMD:R_Array_Convex_4x1206" V 5100 5550 50  0001 C CNN
F 3 "~" H 4825 5550 50  0001 C CNN
	1    4825 5550
	0    -1   -1   0   
$EndComp
$Comp
L R_zigzag:R_Pack04_US RN2
U 1 1 60A1C3B2
P 6100 5550
F 0 "RN2" V 5700 5475 50  0000 L CNN
F 1 "100 kΩ" V 5775 5425 50  0000 L CNN
F 2 "Resistor_SMD:R_Array_Convex_4x1206" V 6375 5550 50  0001 C CNN
F 3 "~" H 6100 5550 50  0001 C CNN
	1    6100 5550
	0    -1   -1   0   
$EndComp
$Comp
L R_zigzag:R_Pack04_US RN4
U 1 1 60A14214
P 4825 6150
F 0 "RN4" V 4425 6075 50  0000 L CNN
F 1 "33 kΩ" V 4500 6000 50  0000 L CNN
F 2 "Resistor_SMD:R_Array_Convex_4x1206" V 5100 6150 50  0001 C CNN
F 3 "~" H 4825 6150 50  0001 C CNN
	1    4825 6150
	0    -1   -1   0   
$EndComp
$Comp
L R_zigzag:R_Pack04_US RN1
U 1 1 60A12C11
P 6125 6150
F 0 "RN1" V 5725 6075 50  0000 L CNN
F 1 "100 kΩ" V 5800 6025 50  0000 L CNN
F 2 "Resistor_SMD:R_Array_Convex_4x1206" V 6400 6150 50  0001 C CNN
F 3 "~" H 6125 6150 50  0001 C CNN
	1    6125 6150
	0    -1   -1   0   
$EndComp
$Comp
L Analog_ADC:MCP3008 U1
U 1 1 609E2A15
P 5400 4700
F 0 "U1" H 5400 5381 50  0000 C CNN
F 1 "MCP3008" H 5400 5290 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 5500 4800 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21295d.pdf" H 5500 4800 50  0001 C CNN
	1    5400 4700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3650 4800 4900 4800
$Comp
L Regulator_Linear:LM7805_TO220 U3
U 1 1 609F6988
P 2900 4800
F 0 "U3" H 2900 5042 50  0000 C CNN
F 1 "LM7805_TO220" H 2900 4951 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 2900 5025 50  0001 C CIN
F 3 "https://www.onsemi.cn/PowerSolutions/document/MC7800-D.PDF" H 2900 4750 50  0001 C CNN
	1    2900 4800
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C3
U 1 1 609F7FFE
P 3650 4950
F 0 "C3" H 3768 4996 50  0000 L CNN
F 1 "1 μF" H 3768 4905 50  0000 L CNN
F 2 "Capacitor_THT:C_Radial_D6.3mm_H11.0mm_P2.50mm" H 3688 4800 50  0001 C CNN
F 3 "~" H 3650 4950 50  0001 C CNN
	1    3650 4950
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C2
U 1 1 609F8AD1
P 2150 4950
F 0 "C2" H 2268 4996 50  0000 L CNN
F 1 "10 μF" H 2268 4905 50  0000 L CNN
F 2 "Capacitor_THT:C_Radial_D10.0mm_H20.0mm_P5.00mm" H 2188 4800 50  0001 C CNN
F 3 "~" H 2150 4950 50  0001 C CNN
	1    2150 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 4800 2150 4800
Wire Wire Line
	3650 4800 3200 4800
Wire Wire Line
	2150 5100 2900 5100
Connection ~ 2900 5100
Wire Wire Line
	2900 5100 3650 5100
Connection ~ 2150 4800
Connection ~ 3650 4800
Connection ~ 4500 6150
Wire Wire Line
	4625 6250 4500 6250
Wire Wire Line
	4625 6350 4500 6350
Wire Wire Line
	4500 6350 4500 6250
Connection ~ 4500 6250
Wire Wire Line
	4500 6250 4500 6150
Wire Wire Line
	8625 2775 9050 2775
Wire Wire Line
	6000 4800 6000 4650
Wire Wire Line
	6000 4650 6000 4500
Connection ~ 6000 4650
Wire Wire Line
	6300 3750 6575 3750
Wire Wire Line
	4325 2575 4750 2575
Wire Wire Line
	5875 575  7150 575 
Wire Wire Line
	11000 575  11000 4650
Wire Wire Line
	1325 1000 1325 950 
Wire Wire Line
	1325 950  4975 950 
Connection ~ 1325 950 
Wire Wire Line
	1325 950  1325 900 
Wire Wire Line
	5875 950  5875 575 
Wire Wire Line
	1325 800  1725 800 
Wire Wire Line
	1725 800  1725 1575
Wire Wire Line
	1725 4800 2150 4800
Wire Wire Line
	2150 2375 1725 2375
Connection ~ 2150 2375
Connection ~ 1725 2375
Wire Wire Line
	1725 2375 1725 4800
Wire Wire Line
	4750 2575 4750 4500
Connection ~ 4750 2575
Wire Wire Line
	2900 5100 2900 5900
Wire Wire Line
	2900 5900 3650 5900
Wire Wire Line
	3650 5900 3650 6625
Connection ~ 3650 5900
Wire Wire Line
	3650 5900 4500 5900
Connection ~ 9450 4650
Wire Wire Line
	11000 4650 9450 4650
Wire Wire Line
	9450 4650 9450 6475
Wire Wire Line
	6000 4650 6575 4650
Wire Wire Line
	6575 3750 6575 4650
Connection ~ 6575 4650
Wire Wire Line
	6575 4650 9450 4650
Wire Wire Line
	5800 3750 5900 3750
Connection ~ 5900 3750
Wire Wire Line
	5900 3750 6000 3750
Wire Wire Line
	8625 4100 8625 2775
Wire Wire Line
	3025 2950 3025 3250
Wire Wire Line
	3025 3250 4975 3250
Wire Wire Line
	4975 3250 4975 950 
Connection ~ 4975 950 
Wire Wire Line
	4975 950  5875 950 
Wire Wire Line
	4750 2575 6000 2575
Wire Wire Line
	6325 6050 6550 6050
Wire Wire Line
	6550 6050 6550 5975
Wire Wire Line
	6325 6150 6550 6150
Wire Wire Line
	6550 6150 6550 6075
Wire Wire Line
	6325 6250 6550 6250
Wire Wire Line
	6550 6250 6550 6175
Wire Wire Line
	6325 6350 6550 6350
Wire Wire Line
	6550 6350 6550 6275
Wire Wire Line
	6375 1400 6425 1400
Wire Wire Line
	6800 1300 6800 975 
Wire Wire Line
	6800 975  6750 975 
Wire Wire Line
	6850 975  6800 975 
Connection ~ 6800 975 
Wire Wire Line
	6375 1300 6800 1300
Wire Wire Line
	6375 1500 7150 1500
Wire Wire Line
	7150 1500 7150 975 
Wire Wire Line
	7150 975  7150 575 
Connection ~ 7150 975 
Connection ~ 7150 575 
Wire Wire Line
	7150 575  11000 575 
Wire Wire Line
	6425 1400 6425 975 
Wire Wire Line
	6425 975  6450 975 
Connection ~ 6425 1400
Wire Wire Line
	6425 1725 8025 1725
Wire Wire Line
	8025 1725 8025 1075
Wire Wire Line
	6425 1400 6425 1725
Connection ~ 6425 1725
Wire Wire Line
	6800 1300 8625 1300
Connection ~ 6800 1300
Wire Wire Line
	6000 2575 6000 1725
Wire Wire Line
	6000 1725 6425 1725
Wire Wire Line
	5300 3925 5300 4100
Wire Wire Line
	8025 1075 8800 1075
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 60B9662F
P 8800 950
F 0 "#FLG0101" H 8800 1025 50  0001 C CNN
F 1 "PWR_FLAG" H 8800 1123 50  0000 C CNN
F 2 "" H 8800 950 50  0001 C CNN
F 3 "~" H 8800 950 50  0001 C CNN
	1    8800 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 950  8800 1075
Connection ~ 8800 1075
Wire Wire Line
	8800 1075 9650 1075
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 60BA5C85
P 1500 1575
F 0 "#FLG0103" H 1500 1650 50  0001 C CNN
F 1 "PWR_FLAG" V 1500 1702 50  0000 L CNN
F 2 "" H 1500 1575 50  0001 C CNN
F 3 "~" H 1500 1575 50  0001 C CNN
	1    1500 1575
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1500 1575 1725 1575
Connection ~ 1725 1575
Wire Wire Line
	1725 1575 1725 2375
$Comp
L power:GND #PWR0101
U 1 1 60BC4D5D
P 8850 6275
F 0 "#PWR0101" H 8850 6025 50  0001 C CNN
F 1 "GND" H 8855 6102 50  0000 C CNN
F 2 "" H 8850 6275 50  0001 C CNN
F 3 "" H 8850 6275 50  0001 C CNN
	1    8850 6275
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 60BC51C5
P 9150 6275
F 0 "#FLG0102" H 9150 6350 50  0001 C CNN
F 1 "PWR_FLAG" H 9150 6448 50  0000 C CNN
F 2 "" H 9150 6275 50  0001 C CNN
F 3 "~" H 9150 6275 50  0001 C CNN
	1    9150 6275
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 6275 9150 6475
Connection ~ 9150 6475
Wire Wire Line
	8850 6275 8850 6475
Wire Wire Line
	3650 6625 6850 6625
Wire Wire Line
	8625 2075 9050 2075
Wire Wire Line
	8625 1300 8625 2075
NoConn ~ 9050 1975
Wire Wire Line
	5600 4100 8625 4100
Wire Wire Line
	5900 3750 5900 3425
Wire Wire Line
	5900 3425 7725 3425
Wire Wire Line
	7725 3425 7725 4400
Wire Wire Line
	7725 4400 10875 4400
Wire Wire Line
	10875 4400 10875 2875
Wire Wire Line
	10875 2875 10650 2875
Wire Wire Line
	10650 2975 10825 2975
Wire Wire Line
	10825 2975 10825 4025
Wire Wire Line
	5500 4025 10825 4025
Wire Wire Line
	10775 3925 10775 3075
Wire Wire Line
	10775 3075 10650 3075
Wire Wire Line
	5300 3925 10775 3925
NoConn ~ 9050 2575
NoConn ~ 9050 2475
NoConn ~ 9050 2375
Wire Wire Line
	10150 3875 10050 3875
Connection ~ 9450 3875
Connection ~ 9550 3875
Wire Wire Line
	9550 3875 9450 3875
Connection ~ 9650 3875
Wire Wire Line
	9650 3875 9550 3875
Connection ~ 9750 3875
Wire Wire Line
	9750 3875 9650 3875
Connection ~ 9850 3875
Wire Wire Line
	9850 3875 9750 3875
Connection ~ 9950 3875
Wire Wire Line
	9950 3875 9850 3875
Connection ~ 10050 3875
Wire Wire Line
	10050 3875 9950 3875
Wire Wire Line
	9450 3875 9450 4650
Wire Wire Line
	9750 1275 9650 1275
Connection ~ 9650 1275
Connection ~ 8850 6475
Wire Wire Line
	6550 6275 6900 6275
Wire Wire Line
	6550 6175 6900 6175
Wire Wire Line
	6550 6075 6900 6075
Wire Wire Line
	6550 5975 6900 5975
Wire Wire Line
	6850 6625 6850 6475
$Comp
L Connector:Conn_01x08_Female J1
U 1 1 609E92C0
P 7100 5875
F 0 "J1" H 6950 6375 50  0000 L CNN
F 1 "Conn_01x08_Female" H 6625 6300 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x08_P2.54mm_Vertical" H 7100 5875 50  0001 C CNN
F 3 "~" H 7100 5875 50  0001 C CNN
	1    7100 5875
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 5775 6900 5725
Wire Wire Line
	6900 5725 6550 5725
Wire Wire Line
	6900 5875 6900 5825
Wire Wire Line
	6900 5825 6550 5825
Wire Wire Line
	6900 5675 6900 5625
Wire Wire Line
	6900 5625 6550 5625
Wire Wire Line
	6900 5575 6900 5525
Wire Wire Line
	6900 5525 6550 5525
$Comp
L Connector:Conn_01x08_Female J2
U 1 1 60BBE548
P 8050 5850
F 0 "J2" H 7925 6350 50  0000 L CNN
F 1 "Conn_01x08_Female" H 7600 6250 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x08_P2.54mm_Vertical" H 8050 5850 50  0001 C CNN
F 3 "~" H 8050 5850 50  0001 C CNN
	1    8050 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 6475 9450 6475
Wire Wire Line
	8850 6475 9150 6475
Wire Wire Line
	6850 6475 7850 6475
Wire Wire Line
	7850 5550 7850 5650
Connection ~ 7850 6475
Wire Wire Line
	7850 6475 8850 6475
Connection ~ 7850 5650
Wire Wire Line
	7850 5650 7850 5750
Connection ~ 7850 5750
Wire Wire Line
	7850 5750 7850 5850
Connection ~ 7850 5850
Wire Wire Line
	7850 5850 7850 5950
Connection ~ 7850 5950
Wire Wire Line
	7850 5950 7850 6050
Connection ~ 7850 6050
Wire Wire Line
	7850 6050 7850 6150
Connection ~ 7850 6150
Wire Wire Line
	7850 6150 7850 6250
Connection ~ 7850 6250
Wire Wire Line
	7850 6250 7850 6475
$EndSCHEMATC
