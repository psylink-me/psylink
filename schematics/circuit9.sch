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
Wire Wire Line
	4150 3550 4150 3650
Wire Wire Line
	3750 3600 3750 3550
Wire Wire Line
	3750 4300 3750 4350
Wire Wire Line
	3750 3850 3950 3850
Text Label 5200 3550 0    50   ~ 0
V+
Text Label 5150 4350 0    50   ~ 0
GND
Wire Wire Line
	3950 4300 3950 4050
Entry Wire Line
	5350 4350 5450 4250
Entry Wire Line
	5350 3950 5450 3850
Entry Wire Line
	5350 3550 5450 3450
Text Label 5150 3950 0    50   ~ 0
Vref
Entry Bus Bus
	5350 2900 5450 2800
Entry Bus Bus
	1850 2800 1950 2900
Wire Wire Line
	1950 1950 2150 1950
Wire Wire Line
	1950 2050 2150 2050
Wire Wire Line
	1950 2150 2150 2150
Entry Wire Line
	1950 1950 1850 2050
Entry Wire Line
	1950 2050 1850 2150
Entry Wire Line
	1950 2150 1850 2250
Text Label 2000 2150 0    50   ~ 0
D2
Text Label 2000 2050 0    50   ~ 0
D3
Text Label 2000 1950 0    50   ~ 0
D4
Entry Wire Line
	1750 2450 1850 2550
Entry Wire Line
	1750 1250 1850 1350
Entry Wire Line
	1750 1450 1850 1550
Entry Wire Line
	1750 1550 1850 1650
Entry Wire Line
	1750 1650 1850 1750
Entry Wire Line
	1750 1750 1850 1850
Entry Wire Line
	1750 1850 1850 1950
Entry Wire Line
	1750 1950 1850 2050
Entry Wire Line
	1750 2050 1850 2150
Entry Wire Line
	1750 2150 1850 2250
Wire Wire Line
	1500 2050 1750 2050
Text Label 1550 2150 0    50   ~ 0
A7
Text Label 1550 2050 0    50   ~ 0
A6
Text Label 1550 1950 0    50   ~ 0
A5
Text Label 1550 1850 0    50   ~ 0
A4
Text Label 1550 1750 0    50   ~ 0
A3
Text Label 1550 1650 0    50   ~ 0
A2
Text Label 1550 1550 0    50   ~ 0
A1
Text Label 1550 1450 0    50   ~ 0
A0
Text Label 1550 2450 0    50   ~ 0
GND2
Text Label 1550 1250 0    50   ~ 0
V+
Wire Wire Line
	1500 1450 1750 1450
Wire Wire Line
	1500 1550 1750 1550
Wire Wire Line
	1500 1750 1750 1750
Wire Wire Line
	1500 1850 1750 1850
Wire Wire Line
	1500 1950 1750 1950
Wire Wire Line
	1500 2150 1750 2150
Wire Wire Line
	1500 1250 1750 1250
Wire Wire Line
	1500 2450 1750 2450
Wire Wire Line
	1500 1650 1750 1650
$Comp
L Connector:Conn_01x15_Female J2
U 1 1 60BC79E1
P 2350 1850
F 0 "J2" V 2423 1830 50  0000 C CNN
F 1 "Left Pin Strip" V 2500 1850 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x15_P2.54mm_Vertical" H 2350 1850 50  0001 C CNN
F 3 "~" H 2350 1850 50  0001 C CNN
	1    2350 1850
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x15_Female J1
U 1 1 60C041A0
P 1300 1850
F 0 "J1" V 1373 1830 50  0000 C CNN
F 1 "Right Pin Strip" V 1450 1850 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x15_P2.54mm_Vertical" H 1300 1850 50  0001 C CNN
F 3 "~" H 1300 1850 50  0001 C CNN
	1    1300 1850
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Small C8
U 1 1 60BC536C
P 4800 4100
F 0 "C8" V 4749 4186 39  0000 C CNN
F 1 "100uF" V 4749 4061 39  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4800 4100 50  0001 C CNN
F 3 "~" H 4800 4100 50  0001 C CNN
	1    4800 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 4350 4150 4350
Wire Wire Line
	4150 4250 4150 4350
Text Notes 5200 3450 0    50   ~ 0
5V
Text Notes 5150 3850 0    50   ~ 0
2.5V
Text Notes 1400 2850 0    50   ~ 0
Arduino\nNano 33\nBLE Sense
$Comp
L Amplifier_Operational:LM321 U2
U 1 1 60DAB6F6
P 4250 3950
F 0 "U2" H 4250 4200 50  0000 L CNN
F 1 "LM321" H 4250 4100 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 4250 3950 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm321.pdf" H 4250 3950 50  0001 C CNN
	1    4250 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 3950 4700 4300
Connection ~ 4150 4350
Wire Wire Line
	4700 3950 4800 3950
Wire Wire Line
	4800 4200 4800 4350
Wire Wire Line
	4800 4350 4950 4350
Wire Wire Line
	4950 4200 4950 4350
Wire Wire Line
	4950 4000 4950 3950
Wire Wire Line
	4800 4000 4800 3950
Connection ~ 4800 3950
Wire Wire Line
	4800 3950 4950 3950
Wire Wire Line
	1450 4350 1650 4350
Connection ~ 1450 4350
Wire Wire Line
	1200 4350 1450 4350
Wire Wire Line
	1450 4100 1450 4350
Wire Wire Line
	1450 3900 1450 3650
$Comp
L Device:C_Small C1
U 1 1 60DC86D8
P 1450 4000
F 0 "C1" V 1500 3900 50  0000 C CNN
F 1 "100uF" V 1500 4300 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 1450 4000 50  0001 C CNN
F 3 "~" H 1450 4000 50  0001 C CNN
	1    1450 4000
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C2
U 1 1 60CBE5F6
P 1650 4000
F 0 "C2" V 1700 3900 50  0000 C CNN
F 1 "100uF" V 1700 4300 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 1650 4000 50  0001 C CNN
F 3 "~" H 1650 4000 50  0001 C CNN
	1    1650 4000
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C3
U 1 1 60CBD3AB
P 3100 4000
F 0 "C3" V 3050 4100 50  0000 C CNN
F 1 "100uF" V 3050 3950 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 3100 4000 50  0001 C CNN
F 3 "~" H 3100 4000 50  0001 C CNN
	1    3100 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 4100 3100 4350
Wire Wire Line
	3100 3900 3100 3550
$Comp
L Device:C_Small C4
U 1 1 60CB80A8
P 3250 4000
F 0 "C4" V 3200 4100 50  0000 C CNN
F 1 "100uF" V 3200 3950 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 3250 4000 50  0001 C CNN
F 3 "~" H 3250 4000 50  0001 C CNN
	1    3250 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 4100 3250 4350
Wire Wire Line
	3400 4100 3400 4350
Wire Wire Line
	3550 4100 3550 4350
Wire Wire Line
	3550 3900 3550 3550
Wire Wire Line
	3400 3900 3400 3550
Wire Wire Line
	3250 3900 3250 3550
Wire Wire Line
	2850 3550 3100 3550
Wire Wire Line
	3100 3550 3250 3550
Wire Wire Line
	2850 4350 3100 4350
Wire Wire Line
	3100 4350 3250 4350
Connection ~ 3100 4350
Connection ~ 3100 3550
Connection ~ 3250 4350
Wire Wire Line
	3250 4350 3400 4350
Wire Wire Line
	3400 4350 3550 4350
Connection ~ 3400 4350
Connection ~ 3400 3550
Wire Wire Line
	3400 3550 3550 3550
Wire Wire Line
	3250 3550 3400 3550
Connection ~ 3250 3550
$Comp
L Device:R_Small R2
U 1 1 60C0938B
P 2850 4150
F 0 "R2" V 2850 4112 39  0000 L CNN
F 1 "110K/1%" V 2750 4150 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 2850 4150 50  0001 C CNN
F 3 "~" H 2850 4150 50  0001 C CNN
	1    2850 4150
	1    0    0    -1  
$EndComp
Connection ~ 2400 4350
Wire Wire Line
	2400 3950 2400 4350
Connection ~ 2850 4350
Wire Wire Line
	2850 3750 2850 4050
Wire Wire Line
	2850 4350 2850 4250
Wire Wire Line
	2850 4350 2400 4350
Connection ~ 2850 3750
Wire Wire Line
	2850 3550 2800 3550
Connection ~ 2850 3550
Wire Wire Line
	2800 3750 2850 3750
$Comp
L Device:R_Small R1
U 1 1 60C054D1
P 2850 3650
F 0 "R1" V 2850 3612 39  0000 L CNN
F 1 "1M/1%" V 2900 3600 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 2850 3650 50  0001 C CNN
F 3 "~" H 2850 3650 50  0001 C CNN
	1    2850 3650
	1    0    0    -1  
$EndComp
Connection ~ 1450 3650
Wire Wire Line
	1450 3550 1450 3650
$Comp
L Device:L_Small L1
U 1 1 60C00857
P 1550 3550
F 0 "L1" V 1735 3550 50  0000 C CNN
F 1 "4.7uH" V 1643 3550 50  0000 C CNN
F 2 "Inductor_SMD:L_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 1550 3550 50  0001 C CNN
F 3 "~" H 1550 3550 50  0001 C CNN
	1    1550 3550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2000 3750 2000 3650
Wire Wire Line
	1450 3650 1200 3650
$Comp
L Regulator_Switching:TPS61220DCK U1
U 1 1 60BEF8B9
P 2400 3650
F 0 "U1" H 2500 3400 50  0000 C CNN
F 1 "TPS61220DCK" H 2400 3925 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:Texas_R-PDSO-G6" H 2400 2850 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tps61220.pdf" H 2400 3500 50  0001 C CNN
	1    2400 3650
	1    0    0    -1  
$EndComp
Text Notes 2750 3200 0    79   ~ 0
Power supply module
$Comp
L Device:C_Small C9
U 1 1 60DE2DF4
P 4950 4100
F 0 "C9" V 4899 4186 39  0000 C CNN
F 1 "100uF" V 4899 4061 39  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4950 4100 50  0001 C CNN
F 3 "~" H 4950 4100 50  0001 C CNN
	1    4950 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 4350 5050 4350
Entry Wire Line
	1750 1150 1850 1250
Entry Wire Line
	1750 1350 1850 1450
Entry Wire Line
	1750 2250 1850 2350
Entry Wire Line
	1750 2350 1850 2450
Entry Wire Line
	1750 2550 1850 2650
Entry Wire Line
	1950 2550 1850 2650
Entry Wire Line
	1950 2450 1850 2550
Entry Wire Line
	1950 2350 1850 2450
Entry Wire Line
	1950 2250 1850 2350
Entry Wire Line
	1950 1850 1850 1950
Entry Wire Line
	1950 1750 1850 1850
Entry Wire Line
	1950 1650 1850 1750
Entry Wire Line
	1950 1550 1850 1650
Entry Wire Line
	1950 1450 1850 1550
Entry Wire Line
	1950 1350 1850 1450
Entry Wire Line
	1950 1250 1850 1350
Entry Wire Line
	1950 1150 1850 1250
Wire Wire Line
	1950 1150 2150 1150
Wire Wire Line
	2150 1250 1950 1250
Wire Wire Line
	1950 1350 2150 1350
Wire Wire Line
	2150 1450 1950 1450
Wire Wire Line
	1950 1550 2150 1550
Wire Wire Line
	2150 1650 1950 1650
Wire Wire Line
	1950 1750 2150 1750
Wire Wire Line
	2150 1850 1950 1850
Wire Wire Line
	1950 2250 2150 2250
Wire Wire Line
	1950 2350 2150 2350
Wire Wire Line
	1950 2450 2150 2450
Wire Wire Line
	1950 2550 2150 2550
Wire Wire Line
	1750 2550 1500 2550
Wire Wire Line
	1500 2350 1750 2350
Wire Wire Line
	1750 2250 1500 2250
Wire Wire Line
	1500 1350 1750 1350
Wire Wire Line
	1750 1150 1500 1150
Text Label 1550 2350 0    50   ~ 0
RST2
Text Label 2000 2350 0    50   ~ 0
RST
Text Label 2000 2450 0    50   ~ 0
RX
Text Label 2000 2550 0    50   ~ 0
TX
Text Label 1550 2550 0    50   ~ 0
VIN
Text Label 1550 2250 0    50   ~ 0
+5V
Text Label 1550 1350 0    50   ~ 0
AREF
Text Label 1550 1150 0    50   ~ 0
D13
Text Label 2000 2250 0    50   ~ 0
GND
Text Label 2000 1750 0    50   ~ 0
D6
Text Label 2000 1850 0    50   ~ 0
D5
Text Label 2000 1650 0    50   ~ 0
D7
Text Label 2000 1550 0    50   ~ 0
D8
Text Label 2000 1450 0    50   ~ 0
D9
Text Label 2000 1350 0    50   ~ 0
D10
Text Label 2000 1250 0    50   ~ 0
D11
Text Label 2000 1150 0    50   ~ 0
D12
$Comp
L Switch:SW_DPST_x2 SW1
U 1 1 60BF481E
P 1200 3850
F 0 "SW1" H 1400 3950 50  0000 C CNN
F 1 "SW_DPST_x2" H 1200 3994 50  0001 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 1200 3850 50  0001 C CNN
F 3 "~" H 1200 3850 50  0001 C CNN
	1    1200 3850
	0    -1   -1   0   
$EndComp
$Comp
L Device:Battery_Cell BT1
U 1 1 60BF138E
P 1200 4250
F 0 "BT1" V 1100 4350 50  0000 L CNN
F 1 "1.2V" V 1100 4100 50  0000 L CNN
F 2 "PsyLinkFootprints:BatteryHolder_Keystone_82_1xAAA" V 1200 4310 50  0001 C CNN
F 3 "~" V 1200 4310 50  0001 C CNN
	1    1200 4250
	1    0    0    -1  
$EndComp
Entry Wire Line
	5350 3300 5450 3200
Text Label 5150 3300 0    50   ~ 0
Vbat
Text Notes 5150 3200 0    50   ~ 0
1.2V
$Comp
L Jumper:SolderJumper_2_Open JP2
U 1 1 60F6BC38
P 4950 2250
F 0 "JP2" H 5022 2368 50  0000 R CNN
F 1 "Solder Jumper" H 5250 2450 50  0000 R CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 4950 2250 50  0001 C CNN
F 3 "~" H 4950 2250 50  0001 C CNN
	1    4950 2250
	-1   0    0    1   
$EndComp
Entry Bus Bus
	4500 2800 4400 2900
Wire Wire Line
	5350 2250 5100 2250
Text Label 4750 2250 2    50   ~ 0
Vbat
Text Label 5350 2250 2    50   ~ 0
A7
Wire Wire Line
	4800 2250 4600 2250
Entry Bus Bus
	5350 2900 5450 3000
Entry Wire Line
	5350 2250 5450 2350
Entry Wire Line
	4500 2350 4600 2250
Wire Wire Line
	5050 3650 5050 3550
Wire Wire Line
	3750 3800 3750 3850
Wire Wire Line
	5050 3550 5350 3550
Connection ~ 4950 3950
Wire Wire Line
	4950 4350 5050 4350
Connection ~ 4950 4350
Connection ~ 5050 4350
Wire Wire Line
	3750 3550 4150 3550
$Comp
L Device:C_Small C7
U 1 1 60CB87C5
P 4550 4150
F 0 "C7" H 4486 4225 50  0000 C CNN
F 1 "100uF" H 4542 4089 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4550 4150 50  0001 C CNN
F 3 "~" H 4550 4150 50  0001 C CNN
	1    4550 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 3950 5350 3950
Wire Wire Line
	5050 3850 5050 4350
Connection ~ 3750 3550
Connection ~ 3750 3850
Wire Wire Line
	3750 3850 3750 4100
Connection ~ 3750 4350
Wire Wire Line
	4550 3650 4150 3650
Connection ~ 4150 3650
Wire Wire Line
	4550 4250 4150 4250
Connection ~ 4150 4250
Wire Wire Line
	4150 4350 4800 4350
Connection ~ 4800 4350
Wire Wire Line
	3950 4300 4700 4300
Wire Wire Line
	4700 3950 4550 3950
Connection ~ 4700 3950
$Comp
L Device:C_Small C5
U 1 1 610A50CC
P 3400 4000
F 0 "C5" V 3350 4100 50  0000 C CNN
F 1 "100uF" V 3350 3950 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 3400 4000 50  0001 C CNN
F 3 "~" H 3400 4000 50  0001 C CNN
	1    3400 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C6
U 1 1 610A53F1
P 3550 4000
F 0 "C6" V 3500 4100 50  0000 C CNN
F 1 "100uF" V 3500 3950 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 3550 4000 50  0001 C CNN
F 3 "~" H 3550 4000 50  0001 C CNN
	1    3550 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 3550 5050 3550
Connection ~ 4150 3550
Connection ~ 5050 3550
Connection ~ 1200 3650
$Comp
L Jumper:Jumper_3_Open JP1
U 1 1 6112D134
P 4950 1800
F 0 "JP1" H 4950 2024 50  0000 C CNN
F 1 "Configuration Jumper" H 4950 1933 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 4950 1800 50  0001 C CNN
F 3 "~" H 4950 1800 50  0001 C CNN
	1    4950 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 1800 4700 1800
Wire Wire Line
	5200 1800 5350 1800
Wire Wire Line
	4600 1950 4950 1950
Entry Wire Line
	5350 1800 5450 1900
Entry Wire Line
	4500 1900 4600 1800
Entry Wire Line
	4500 2050 4600 1950
Text Label 4600 1950 0    50   ~ 0
GND
Text Label 4600 1800 0    50   ~ 0
D5
Text Label 5200 1800 0    50   ~ 0
D6
Wire Wire Line
	1200 3300 1200 3650
Text Notes 4600 2750 0    50   ~ 0
Allows measuring\nbattery charge via\nanalog pin A7
Text Notes 5450 1150 2    50   ~ 0
https://psylink.me/c9
Wire Wire Line
	1450 3650 1650 3650
Wire Wire Line
	1650 3900 1650 3650
Connection ~ 1650 3650
Wire Wire Line
	1650 4100 1650 4350
Connection ~ 1650 4350
$Comp
L Device:R_Small R5
U 1 1 60CB6FA7
P 1850 3800
F 0 "R5" V 1850 3762 39  0000 L CNN
F 1 "?" V 1870 3896 50  0001 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 1850 3800 50  0001 C CNN
F 3 "~" H 1850 3800 50  0001 C CNN
	1    1850 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C11
U 1 1 60CB73E6
P 1850 4150
F 0 "C11" V 1800 4250 50  0000 C CNN
F 1 "?uF" V 1799 4089 50  0001 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 1850 4150 50  0001 C CNN
F 3 "~" H 1850 4150 50  0001 C CNN
	1    1850 4150
	-1   0    0    1   
$EndComp
Wire Wire Line
	1850 3550 1850 3700
Wire Wire Line
	1850 3550 2000 3550
Wire Wire Line
	1850 4250 1850 4350
Wire Wire Line
	1650 3550 1850 3550
Connection ~ 1850 3550
Wire Wire Line
	1650 3650 2000 3650
Connection ~ 2000 3650
Wire Wire Line
	1650 4350 1850 4350
Connection ~ 1850 4350
Wire Notes Line
	1750 3500 1750 4400
Wire Notes Line
	1750 4400 1950 4400
Wire Notes Line
	1950 4400 1950 3500
Wire Wire Line
	1850 3900 1850 4050
Wire Notes Line
	1750 3500 1950 3500
Text Notes 2150 4600 0    50   ~ 0
Boost Converter\nfrom 1.2V to 5V
Wire Notes Line
	2100 4550 1300 4550
Wire Notes Line
	1300 4550 1300 3250
Wire Notes Line
	1300 3250 3650 3250
Wire Notes Line
	3650 3250 3650 4550
Wire Notes Line
	3650 4550 2800 4550
Wire Wire Line
	3550 3550 3750 3550
Connection ~ 3550 3550
Wire Wire Line
	3550 4350 3750 4350
Connection ~ 3550 4350
Text Notes 4150 4600 0    50   ~ 0
Reference Voltage\nGenerator
Wire Notes Line
	4100 4550 3700 4550
Wire Notes Line
	3700 4550 3700 3250
Wire Notes Line
	3700 3250 5000 3250
Wire Notes Line
	5000 3250 5000 3500
Wire Notes Line
	5000 4550 4550 4550
$Comp
L Connector:Conn_01x17_Female J3
U 1 1 60D14FD7
P 3450 1950
F 0 "J3" V 3550 1950 50  0000 L CNN
F 1 "Pass-through Output Pin Strip" V 3650 1400 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x17_P2.54mm_Horizontal" H 3450 1950 50  0001 C CNN
F 3 "~" H 3450 1950 50  0001 C CNN
	1    3450 1950
	1    0    0    -1  
$EndComp
Entry Wire Line
	3000 1150 2900 1250
Entry Wire Line
	3000 1250 2900 1350
Entry Wire Line
	3000 1350 2900 1450
Entry Wire Line
	3000 1450 2900 1550
Entry Wire Line
	3000 1750 2900 1850
Entry Wire Line
	3000 1850 2900 1950
Entry Wire Line
	3000 1950 2900 2050
Entry Wire Line
	3000 2050 2900 2150
Entry Wire Line
	3000 2150 2900 2250
Entry Wire Line
	3000 2250 2900 2350
Entry Wire Line
	3000 2350 2900 2450
Entry Wire Line
	3000 2450 2900 2550
Entry Wire Line
	3000 2550 2900 2650
Entry Wire Line
	3000 2650 2900 2750
Entry Wire Line
	3000 2750 2900 2850
Text Label 3050 1150 0    50   ~ 0
GND
Wire Wire Line
	3000 2450 3250 2450
Wire Wire Line
	3000 2350 3250 2350
Wire Wire Line
	3000 2250 3250 2250
Wire Wire Line
	3000 2150 3250 2150
Wire Wire Line
	3000 2050 3250 2050
Wire Wire Line
	3000 1950 3250 1950
Wire Wire Line
	3000 1850 3250 1850
Wire Wire Line
	3000 1750 3250 1750
Wire Wire Line
	3000 2550 3250 2550
Wire Wire Line
	3000 2750 3250 2750
Wire Wire Line
	3000 2650 3250 2650
Wire Wire Line
	3000 1450 3250 1450
Wire Wire Line
	3000 1350 3250 1350
Wire Wire Line
	3000 1250 3250 1250
Wire Wire Line
	3000 1150 3250 1150
Text Label 3050 1250 0    50   ~ 0
GND
Text Label 3050 2450 0    50   ~ 0
A0
Text Label 3050 2350 0    50   ~ 0
A1
Text Label 3050 2250 0    50   ~ 0
A2
Text Label 3050 2150 0    50   ~ 0
A3
Text Label 3050 2050 0    50   ~ 0
A4
Text Label 3050 1950 0    50   ~ 0
A5
Text Label 3050 1850 0    50   ~ 0
A6
Text Label 3050 1750 0    50   ~ 0
A7
Text Label 3050 2750 0    50   ~ 0
D2
Text Label 3050 2650 0    50   ~ 0
D3
Text Label 3050 2550 0    50   ~ 0
D4
Text Label 3050 1350 0    50   ~ 0
V+
Text Label 3050 1450 0    50   ~ 0
V+
Wire Wire Line
	3250 1650 3000 1650
Entry Wire Line
	2900 1650 3000 1550
Entry Wire Line
	2900 1750 3000 1650
Wire Wire Line
	3000 1550 3250 1550
Text Label 3050 1550 0    50   ~ 0
Vref
Text Label 3050 1650 0    50   ~ 0
Vref
Connection ~ 2900 2900
Wire Bus Line
	1950 2900 2900 2900
Text Notes 1982 4534 2    39   ~ 0
Snubber\n(optional)
$Comp
L Device:C_Small C10
U 1 1 60CB83B2
P 5050 3750
F 0 "C10" H 4971 3828 50  0000 C CNN
F 1 "100uF" H 5313 3834 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 5050 3750 50  0001 C CNN
F 3 "~" H 5050 3750 50  0001 C CNN
	1    5050 3750
	1    0    0    -1  
$EndComp
Wire Notes Line
	5000 3500 4850 3500
Wire Notes Line
	4850 3900 5000 3900
Wire Notes Line
	5000 3900 5000 4550
Wire Notes Line
	4850 3500 4850 3900
Wire Wire Line
	4550 3650 4550 4050
Wire Wire Line
	1200 3300 5350 3300
Wire Bus Line
	5450 1900 5450 2800
Wire Bus Line
	2900 2900 5350 2900
Wire Bus Line
	4500 1900 4500 2800
Wire Bus Line
	5450 3000 5450 4250
Wire Bus Line
	1850 1250 1850 2800
Wire Bus Line
	2900 1250 2900 2900
Wire Wire Line
	1850 4350 2400 4350
$EndSCHEMATC
