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
Text Label 5400 3550 0    50   ~ 0
V+
Text Label 5350 4350 0    50   ~ 0
GND
Wire Wire Line
	3900 4300 3900 4050
Text Label 5350 3950 0    50   ~ 0
Vref
$Comp
L Device:C_Small C8
U 1 1 60BC536C
P 4750 4100
F 0 "C8" V 4699 4186 39  0000 C CNN
F 1 "100uF" V 4699 4061 39  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4750 4100 50  0001 C CNN
F 3 "~" H 4750 4100 50  0001 C CNN
	1    4750 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 4250 4100 4350
Text Notes 5400 3450 0    50   ~ 0
5V
Text Notes 5350 3850 0    50   ~ 0
2.5V
Wire Wire Line
	4650 3950 4650 4300
Connection ~ 4100 4350
Wire Wire Line
	4650 3950 4750 3950
Wire Wire Line
	4750 4200 4750 4350
Wire Wire Line
	4750 4350 4900 4350
Wire Wire Line
	4900 4200 4900 4350
Wire Wire Line
	4900 4000 4900 3950
Wire Wire Line
	4750 4000 4750 3950
Connection ~ 4750 3950
Wire Wire Line
	4750 3950 4900 3950
Wire Wire Line
	1550 4350 1750 4350
Wire Wire Line
	1550 4100 1550 4350
Wire Wire Line
	1550 3900 1550 3650
$Comp
L Device:C_Small C1
U 1 1 60DC86D8
P 1550 4000
F 0 "C1" V 1600 3900 50  0000 C CNN
F 1 "100uF" V 1600 4300 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 1550 4000 50  0001 C CNN
F 3 "~" H 1550 4000 50  0001 C CNN
	1    1550 4000
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C2
U 1 1 60CBE5F6
P 1750 4000
F 0 "C2" V 1800 3900 50  0000 C CNN
F 1 "100uF" V 1800 4300 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 1750 4000 50  0001 C CNN
F 3 "~" H 1750 4000 50  0001 C CNN
	1    1750 4000
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C3
U 1 1 60CBD3AB
P 2850 4000
F 0 "C3" V 2800 4100 50  0000 C CNN
F 1 "100uF" V 2800 3950 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 2850 4000 50  0001 C CNN
F 3 "~" H 2850 4000 50  0001 C CNN
	1    2850 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 4100 2850 4350
Wire Wire Line
	2850 3900 2850 3550
$Comp
L Device:C_Small C4
U 1 1 60CB80A8
P 3000 4000
F 0 "C4" V 2950 4100 50  0000 C CNN
F 1 "100uF" V 2950 3950 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 3000 4000 50  0001 C CNN
F 3 "~" H 3000 4000 50  0001 C CNN
	1    3000 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 4100 3000 4350
Wire Wire Line
	3150 4100 3150 4350
Wire Wire Line
	3300 4100 3300 4350
Wire Wire Line
	3300 3900 3300 3550
Wire Wire Line
	3150 3900 3150 3550
Wire Wire Line
	3000 3900 3000 3550
Wire Wire Line
	2600 3550 2850 3550
Wire Wire Line
	2850 3550 3000 3550
Wire Wire Line
	2600 4350 2850 4350
Wire Wire Line
	2850 4350 3000 4350
Connection ~ 2850 4350
Connection ~ 2850 3550
Connection ~ 3000 4350
Wire Wire Line
	3000 4350 3150 4350
Wire Wire Line
	3150 4350 3300 4350
Connection ~ 3150 4350
Connection ~ 3150 3550
Wire Wire Line
	3150 3550 3300 3550
Wire Wire Line
	3000 3550 3150 3550
Connection ~ 3000 3550
$Comp
L Device:R_Small R2
U 1 1 60C0938B
P 2600 4150
F 0 "R2" V 2600 4112 39  0000 L CNN
F 1 "110K/1%" V 2500 4150 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 2600 4150 50  0001 C CNN
F 3 "~" H 2600 4150 50  0001 C CNN
	1    2600 4150
	1    0    0    -1  
$EndComp
Connection ~ 2150 4350
Wire Wire Line
	2150 3950 2150 4350
Connection ~ 2600 4350
Wire Wire Line
	2600 3750 2600 4050
Wire Wire Line
	2600 4350 2600 4250
Connection ~ 2600 3750
Wire Wire Line
	2600 3550 2550 3550
Connection ~ 2600 3550
Wire Wire Line
	2550 3750 2600 3750
$Comp
L Device:R_Small R1
U 1 1 60C054D1
P 2600 3650
F 0 "R1" V 2600 3612 39  0000 L CNN
F 1 "1M/1%" V 2650 3600 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 2600 3650 50  0001 C CNN
F 3 "~" H 2600 3650 50  0001 C CNN
	1    2600 3650
	1    0    0    -1  
$EndComp
Connection ~ 1550 3650
$Comp
L Device:L_Small L1
U 1 1 60C00857
P 1550 3500
F 0 "L1" H 1504 3476 50  0000 C CNN
F 1 "4.7uH" H 1458 3551 39  0000 C CNN
F 2 "Inductor_SMD:L_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 1550 3500 50  0001 C CNN
F 3 "~" H 1550 3500 50  0001 C CNN
	1    1550 3500
	-1   0    0    1   
$EndComp
Wire Wire Line
	1750 3750 1750 3650
$Comp
L Regulator_Switching:TPS61220DCK U1
U 1 1 60BEF8B9
P 2150 3650
F 0 "U1" H 2250 3400 50  0000 C CNN
F 1 "TPS61220DCK" H 2150 3925 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:Texas_R-PDSO-G6" H 2150 2850 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tps61220.pdf" H 2150 3500 50  0001 C CNN
	1    2150 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C9
U 1 1 60DE2DF4
P 4900 4100
F 0 "C9" V 4849 4186 39  0000 C CNN
F 1 "100uF" V 4849 4061 39  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4900 4100 50  0001 C CNN
F 3 "~" H 4900 4100 50  0001 C CNN
	1    4900 4100
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_DPST_x2 SW1
U 1 1 60BF481E
P 1250 3850
F 0 "SW1" H 1450 3950 50  0001 C CNN
F 1 "Power Switch" H 1400 3950 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 1250 3850 50  0001 C CNN
F 3 "~" H 1250 3850 50  0001 C CNN
	1    1250 3850
	0    -1   -1   0   
$EndComp
Text Label 5350 3300 0    50   ~ 0
Vbat
Text Notes 5350 3200 0    50   ~ 0
1.2V
Entry Bus Bus
	5550 2900 5650 3000
Connection ~ 4900 4350
Wire Wire Line
	4100 4350 4750 4350
Connection ~ 4750 4350
Wire Wire Line
	4650 3950 4500 3950
Connection ~ 4650 3950
$Comp
L Device:C_Small C5
U 1 1 610A50CC
P 3150 4000
F 0 "C5" V 3100 4100 50  0000 C CNN
F 1 "100uF" V 3100 3950 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 3150 4000 50  0001 C CNN
F 3 "~" H 3150 4000 50  0001 C CNN
	1    3150 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C6
U 1 1 610A53F1
P 3300 4000
F 0 "C6" V 3250 4100 50  0000 C CNN
F 1 "100uF" V 3250 3950 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 3300 4000 50  0001 C CNN
F 3 "~" H 3300 4000 50  0001 C CNN
	1    3300 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 3300 1250 3650
Wire Wire Line
	1750 3900 1750 3750
Connection ~ 1750 3650
Wire Wire Line
	1750 4100 1750 4350
Connection ~ 1750 4350
Text Notes 1900 4600 0    50   ~ 0
Boost Converter\nfrom 1.2V to 5V
Wire Notes Line
	1450 4550 1450 3250
Wire Notes Line
	3400 4550 2550 4550
Text Notes 3850 4600 0    50   ~ 0
Reference Voltage\nGenerator
$Comp
L Amplifier_Operational:LM321 U2
U 1 1 60DAB6F6
P 4200 3950
F 0 "U2" H 4200 4200 50  0000 L CNN
F 1 "LM321" H 4200 4100 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 4200 3950 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm321.pdf" H 4200 3950 50  0001 C CNN
	1    4200 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 4300 4650 4300
Wire Wire Line
	4550 4250 4100 4250
Connection ~ 4100 4250
Wire Wire Line
	1750 4350 2150 4350
Connection ~ 1750 3750
Connection ~ 1250 3650
Wire Wire Line
	2150 4350 2600 4350
Wire Notes Line
	1450 4550 1900 4550
Wire Notes Line
	1450 3250 3400 3250
Text Notes 1100 4600 0    50   ~ 0
Energy\nSource
Wire Wire Line
	1250 3650 1550 3650
Wire Wire Line
	1250 4350 1550 4350
Connection ~ 1550 4350
Wire Notes Line
	1350 4550 1400 4550
Wire Notes Line
	1400 4550 1400 3250
Wire Notes Line
	1400 3250 1050 3250
Wire Notes Line
	1050 3250 1050 4550
Wire Notes Line
	1050 4550 1100 4550
Connection ~ 3300 3550
Wire Wire Line
	3750 4300 3750 4350
Wire Wire Line
	3750 3850 3900 3850
Wire Wire Line
	3750 3850 3750 3800
Connection ~ 3750 3850
Wire Wire Line
	3750 3550 3750 3600
Wire Wire Line
	3750 3550 4100 3550
Wire Wire Line
	4100 3550 4100 3650
Wire Wire Line
	4550 3550 4100 3550
Wire Wire Line
	4550 3550 4550 3650
Connection ~ 4100 3550
Wire Notes Line
	3400 3250 3400 4550
$Comp
L Jumper:SolderJumper_2_Open JP3
U 1 1 60E0C5DF
P 3600 3550
F 0 "JP3" H 3605 3475 50  0000 R CNN
F 1 "Solder Jumper" H 4176 3475 50  0000 R CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 3600 3550 50  0001 C CNN
F 3 "~" H 3600 3550 50  0001 C CNN
	1    3600 3550
	1    0    0    1   
$EndComp
Connection ~ 3750 3550
Wire Notes Line
	3450 3250 3450 4550
Wire Notes Line
	3450 3250 4950 3250
Wire Wire Line
	3300 3550 3450 3550
Wire Wire Line
	3750 4350 4100 4350
Wire Wire Line
	3750 4350 3300 4350
Connection ~ 3750 4350
Connection ~ 3300 4350
Wire Notes Line
	3850 4550 3450 4550
Wire Wire Line
	3300 3400 3300 3550
Entry Wire Line
	5550 3300 5650 3200
Entry Wire Line
	5550 3550 5650 3450
Entry Wire Line
	5550 3950 5650 3850
Entry Wire Line
	5550 4350 5650 4250
Wire Wire Line
	4900 4350 5050 4350
Wire Wire Line
	3300 3400 5050 3400
$Comp
L Device:Battery_Cell BT1
U 1 1 60BF138E
P 1250 4250
F 0 "BT1" V 1150 4350 50  0000 L CNN
F 1 "1.2V" V 1150 4100 50  0000 L CNN
F 2 "PsyLinkFootprints:BatteryHolder_Keystone_82_1xAAA" V 1250 4310 50  0001 C CNN
F 3 "~" V 1250 4310 50  0001 C CNN
	1    1250 4250
	1    0    0    -1  
$EndComp
Entry Bus Bus
	4400 2900 4500 2800
Entry Bus Bus
	1700 2800 1800 2900
Wire Wire Line
	1800 1950 2000 1950
Wire Wire Line
	1800 2050 2000 2050
Wire Wire Line
	1800 2150 2000 2150
Entry Wire Line
	1800 1950 1700 2050
Entry Wire Line
	1800 2050 1700 2150
Entry Wire Line
	1800 2150 1700 2250
Text Label 1850 2150 0    50   ~ 0
D2
Text Label 1850 2050 0    50   ~ 0
D3
Text Label 1850 1950 0    50   ~ 0
D4
Entry Wire Line
	1600 2450 1700 2550
Entry Wire Line
	1600 1250 1700 1350
Entry Wire Line
	1600 1450 1700 1550
Entry Wire Line
	1600 1550 1700 1650
Entry Wire Line
	1600 1650 1700 1750
Entry Wire Line
	1600 1750 1700 1850
Entry Wire Line
	1600 1850 1700 1950
Entry Wire Line
	1600 1950 1700 2050
Entry Wire Line
	1600 2050 1700 2150
Entry Wire Line
	1600 2150 1700 2250
Wire Wire Line
	1350 2050 1600 2050
Text Label 1400 2150 0    50   ~ 0
A7
Text Label 1400 2050 0    50   ~ 0
A6
Text Label 1400 1950 0    50   ~ 0
A5
Text Label 1400 1850 0    50   ~ 0
A4
Text Label 1400 1750 0    50   ~ 0
A3
Text Label 1400 1650 0    50   ~ 0
A2
Text Label 1400 1550 0    50   ~ 0
A1
Text Label 1400 1450 0    50   ~ 0
A0
Text Label 1400 2450 0    50   ~ 0
GND2
Text Label 1400 1250 0    50   ~ 0
V+
Wire Wire Line
	1350 1450 1600 1450
Wire Wire Line
	1350 1550 1600 1550
Wire Wire Line
	1350 1750 1600 1750
Wire Wire Line
	1350 1850 1600 1850
Wire Wire Line
	1350 1950 1600 1950
Wire Wire Line
	1350 2150 1600 2150
Wire Wire Line
	1350 1250 1600 1250
Wire Wire Line
	1350 2450 1600 2450
Wire Wire Line
	1350 1650 1600 1650
$Comp
L Connector:Conn_01x15_Female J2
U 1 1 60BC79E1
P 2200 1850
F 0 "J2" H 2100 1050 50  0000 C CNN
F 1 "Right Pin Strip" H 2024 2674 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x15_P2.54mm_Vertical" H 2200 1850 50  0001 C CNN
F 3 "~" H 2200 1850 50  0001 C CNN
	1    2200 1850
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x15_Female J1
U 1 1 60C041A0
P 1150 1850
F 0 "J1" H 1050 1050 50  0000 C CNN
F 1 "Left Pin Strip" H 973 2676 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x15_P2.54mm_Vertical" H 1150 1850 50  0001 C CNN
F 3 "~" H 1150 1850 50  0001 C CNN
	1    1150 1850
	-1   0    0    -1  
$EndComp
Text Notes 1300 3100 0    50   ~ 0
Connector to Arduino\nNano 33 BLE Sense
Entry Wire Line
	1600 1150 1700 1250
Entry Wire Line
	1600 1350 1700 1450
Entry Wire Line
	1600 2250 1700 2350
Entry Wire Line
	1600 2350 1700 2450
Entry Wire Line
	1600 2550 1700 2650
Entry Wire Line
	1800 2550 1700 2650
Entry Wire Line
	1800 2450 1700 2550
Entry Wire Line
	1800 2350 1700 2450
Entry Wire Line
	1800 2250 1700 2350
Entry Wire Line
	1800 1850 1700 1950
Entry Wire Line
	1800 1750 1700 1850
Entry Wire Line
	1800 1650 1700 1750
Entry Wire Line
	1800 1550 1700 1650
Entry Wire Line
	1800 1450 1700 1550
Entry Wire Line
	1800 1350 1700 1450
Entry Wire Line
	1800 1250 1700 1350
Entry Wire Line
	1800 1150 1700 1250
Wire Wire Line
	1800 1150 2000 1150
Wire Wire Line
	2000 1250 1800 1250
Wire Wire Line
	1800 1350 2000 1350
Wire Wire Line
	2000 1450 1800 1450
Wire Wire Line
	1800 1550 2000 1550
Wire Wire Line
	2000 1650 1800 1650
Wire Wire Line
	1800 1750 2000 1750
Wire Wire Line
	2000 1850 1800 1850
Wire Wire Line
	1800 2250 2000 2250
Wire Wire Line
	1800 2350 2000 2350
Wire Wire Line
	1800 2450 2000 2450
Wire Wire Line
	1800 2550 2000 2550
Wire Wire Line
	1600 2550 1350 2550
Wire Wire Line
	1350 2350 1600 2350
Wire Wire Line
	1600 2250 1350 2250
Wire Wire Line
	1350 1350 1600 1350
Wire Wire Line
	1600 1150 1350 1150
Text Label 1400 2350 0    50   ~ 0
RST2
Text Label 1850 2350 0    50   ~ 0
RST
Text Label 1850 2450 0    50   ~ 0
RX
Text Label 1850 2550 0    50   ~ 0
TX
Text Label 1400 2550 0    50   ~ 0
VIN
Text Label 1400 2250 0    50   ~ 0
+5V
Text Label 1400 1350 0    50   ~ 0
AREF
Text Label 1400 1150 0    50   ~ 0
D13
Text Label 1850 2250 0    50   ~ 0
GND
Text Label 1850 1750 0    50   ~ 0
D6
Text Label 1850 1850 0    50   ~ 0
D5
Text Label 1850 1650 0    50   ~ 0
D7
Text Label 1850 1550 0    50   ~ 0
D8
Text Label 1850 1450 0    50   ~ 0
D9
Text Label 1850 1350 0    50   ~ 0
Vbat
Text Label 1850 1250 0    50   ~ 0
D11
Text Label 1850 1150 0    50   ~ 0
D12
Entry Bus Bus
	3550 2800 3650 2900
Wire Wire Line
	4400 2350 4150 2350
Text Label 3850 2350 2    50   ~ 0
Vbat
Text Label 4350 2350 2    50   ~ 0
A7
Wire Wire Line
	3850 2350 3650 2350
Entry Wire Line
	4400 2350 4500 2450
Entry Wire Line
	3550 2450 3650 2350
Text Notes 3700 2700 0    50   ~ 0
Allows measuring\nbattery charge via\nanalog pin A7
$Comp
L Connector:Conn_01x17_Female J3
U 1 1 60D14FD7
P 3200 1950
F 0 "J3" H 3041 1079 50  0000 L CNN
F 1 "I/O Pin Strip" H 2643 2876 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x17_P2.54mm_Horizontal" H 3200 1950 50  0001 C CNN
F 3 "~" H 3200 1950 50  0001 C CNN
	1    3200 1950
	1    0    0    -1  
$EndComp
Entry Wire Line
	2750 1150 2650 1250
Entry Wire Line
	2750 1250 2650 1350
Entry Wire Line
	2750 1350 2650 1450
Entry Wire Line
	2750 1450 2650 1550
Entry Wire Line
	2750 1750 2650 1850
Entry Wire Line
	2750 1850 2650 1950
Entry Wire Line
	2750 1950 2650 2050
Entry Wire Line
	2750 2050 2650 2150
Entry Wire Line
	2750 2150 2650 2250
Entry Wire Line
	2750 2250 2650 2350
Entry Wire Line
	2750 2350 2650 2450
Entry Wire Line
	2750 2450 2650 2550
Entry Wire Line
	2750 2550 2650 2650
Entry Wire Line
	2750 2650 2650 2750
Entry Wire Line
	2750 2750 2650 2850
Wire Wire Line
	2750 2450 3000 2450
Wire Wire Line
	2750 2350 3000 2350
Wire Wire Line
	2750 2250 3000 2250
Wire Wire Line
	2750 2150 3000 2150
Wire Wire Line
	2750 2050 3000 2050
Wire Wire Line
	2750 1950 3000 1950
Wire Wire Line
	2750 1850 3000 1850
Wire Wire Line
	2750 1750 3000 1750
Wire Wire Line
	2750 2550 3000 2550
Wire Wire Line
	2750 2750 3000 2750
Wire Wire Line
	2750 2650 3000 2650
Wire Wire Line
	2750 1450 3000 1450
Wire Wire Line
	2750 1350 3000 1350
Wire Wire Line
	2750 1250 3000 1250
Wire Wire Line
	2750 1150 3000 1150
Text Label 2800 1950 0    50   ~ 0
A5
Wire Wire Line
	3000 1650 2750 1650
Entry Wire Line
	2650 1650 2750 1550
Entry Wire Line
	2650 1750 2750 1650
Wire Wire Line
	2750 1550 3000 1550
$Comp
L Jumper:SolderJumper_2_Open JP2
U 1 1 60F6BC38
P 4000 2350
F 0 "JP2" H 4050 2100 50  0000 R CNN
F 1 "Solder Jumper" H 4300 2200 50  0000 R CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 4000 2350 50  0001 C CNN
F 3 "~" H 4000 2350 50  0001 C CNN
	1    4000 2350
	1    0    0    1   
$EndComp
Wire Bus Line
	1800 2900 2650 2900
Wire Notes Line
	1250 3050 1050 3050
Wire Notes Line
	1050 3050 1050 950 
Wire Notes Line
	2350 950  2350 3050
Wire Notes Line
	2350 3050 2100 3050
Wire Notes Line
	1050 950  2350 950 
Text Notes 2700 3100 0    50   ~ 0
Input/Output\nPin Strip
Wire Notes Line
	2550 3050 2550 950 
Wire Notes Line
	2550 950  3300 950 
Wire Notes Line
	3300 950  3300 3050
Text Label 4250 1500 0    50   ~ 0
D2
Text Label 3700 1500 0    50   ~ 0
D3
Text Label 3700 1650 0    50   ~ 0
GND
Entry Wire Line
	3550 1750 3650 1650
Entry Wire Line
	3550 1600 3650 1500
Entry Wire Line
	4400 1500 4500 1600
Wire Wire Line
	3650 1650 4000 1650
Wire Wire Line
	4250 1500 4400 1500
Wire Wire Line
	3650 1500 3750 1500
$Comp
L Jumper:Jumper_3_Open JP1
U 1 1 6112D134
P 4000 1500
F 0 "JP1" H 4000 1724 50  0000 C CNN
F 1 "Configuration Jumper" H 4000 1633 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 4000 1500 50  0001 C CNN
F 3 "~" H 4000 1500 50  0001 C CNN
	1    4000 1500
	1    0    0    -1  
$EndComp
Text Notes 3600 1900 0    50   ~ 0
Multipurpose jumpers,\nsoftware-configurable
Wire Notes Line
	3450 1200 4600 1200
Wire Notes Line
	3450 1200 3450 3050
Wire Notes Line
	4600 1200 4600 3050
Text Notes 3850 3100 0    50   ~ 0
Jumpers
Wire Notes Line
	3450 3050 3850 3050
Wire Notes Line
	4200 3050 4600 3050
Wire Notes Line
	3050 3050 3300 3050
Wire Notes Line
	2700 3050 2550 3050
Text Label 2800 2750 0    50   ~ 0
D13
Text Label 2800 2650 0    50   ~ 0
D12
Text Label 2800 2550 0    50   ~ 0
D11
Text Label 2800 2450 0    50   ~ 0
A0
Text Label 2800 2350 0    50   ~ 0
A1
Text Label 2800 2250 0    50   ~ 0
A2
Text Label 2800 1350 0    50   ~ 0
V+
Text Label 2800 1250 0    50   ~ 0
GND
Text Label 2800 1150 0    50   ~ 0
GND
Text Label 2800 2150 0    50   ~ 0
A3
Text Label 2800 2050 0    50   ~ 0
A4
Text Label 2800 1850 0    50   ~ 0
A6
Text Label 2800 1750 0    50   ~ 0
A7
Text Label 2800 1650 0    50   ~ 0
Vref
Text Label 2800 1550 0    50   ~ 0
Vref
Text Label 2800 1450 0    50   ~ 0
V+
Text Notes 5650 4600 2    50   ~ 0
https://psylink.me/c9
Wire Wire Line
	5050 3400 5050 3550
Wire Wire Line
	4900 3950 5550 3950
Connection ~ 4900 3950
Connection ~ 5050 4350
Wire Wire Line
	5050 3550 5200 3550
Connection ~ 5050 3550
Wire Wire Line
	5050 3550 5050 3650
Wire Wire Line
	5050 3850 5050 4350
$Comp
L Device:C_Small C10
U 1 1 60CB83B2
P 5050 3750
F 0 "C10" V 5100 3850 50  0000 C CNN
F 1 "100uF" V 5100 3700 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 5050 3750 50  0001 C CNN
F 3 "~" H 5050 3750 50  0001 C CNN
	1    5050 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 4350 5200 4350
Connection ~ 5200 4350
Wire Wire Line
	5200 4350 5550 4350
Wire Wire Line
	5200 3650 5200 3550
Connection ~ 5200 3550
Wire Wire Line
	5200 3550 5550 3550
Connection ~ 2650 2900
Wire Wire Line
	3750 3850 3750 4100
Text Label 4250 3550 0    50   ~ 0
OpAmpV+
Text Label 2600 3950 0    50   ~ 0
FB
Wire Wire Line
	1250 3300 5550 3300
Wire Wire Line
	1550 3400 1750 3400
Wire Wire Line
	1750 3400 1750 3550
Wire Wire Line
	1550 3650 1750 3650
Text Label 1600 3400 0    50   ~ 0
L
Wire Wire Line
	1550 3600 1550 3650
Wire Wire Line
	4550 4250 4550 3850
Text Label 3750 4000 2    50   ~ 0
Vdiv
Wire Wire Line
	5200 3850 5200 4350
$Comp
L Device:C_Small C11
U 1 1 60E93F63
P 5200 3750
F 0 "C11" V 5250 3850 50  0000 C CNN
F 1 "100uF" V 5250 3700 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 5200 3750 50  0001 C CNN
F 3 "~" H 5200 3750 50  0001 C CNN
	1    5200 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R4
U 1 1 60ABC396
P 3750 4200
F 0 "R4" V 3749 4154 39  0000 L CNN
F 1 "1M/1%" V 3800 4200 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 3750 4200 50  0001 C CNN
F 3 "~" H 3750 4200 50  0001 C CNN
	1    3750 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R3
U 1 1 60ABC39C
P 3750 3700
F 0 "R3" V 3749 3664 39  0000 L CNN
F 1 "1M/1%" V 3809 3700 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 3750 3700 50  0001 C CNN
F 3 "~" H 3750 3700 50  0001 C CNN
	1    3750 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C7
U 1 1 60CB87C5
P 4550 3750
F 0 "C7" H 4621 3831 50  0000 C CNN
F 1 "100uF" H 4818 3668 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4550 3750 50  0001 C CNN
F 3 "~" H 4550 3750 50  0001 C CNN
	1    4550 3750
	1    0    0    -1  
$EndComp
Wire Notes Line
	4250 4550 4750 4550
Wire Notes Line
	4950 3250 4950 4500
Wire Bus Line
	4500 1600 4500 2800
Wire Bus Line
	2650 2900 5550 2900
Wire Bus Line
	3550 1600 3550 2800
Wire Bus Line
	5650 3000 5650 4250
Wire Bus Line
	1700 1250 1700 2800
Wire Bus Line
	2650 1250 2650 2900
$EndSCHEMATC
