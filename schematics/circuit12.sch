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
Text Label 5400 4200 0    50   ~ 0
V+
Text Label 5350 5000 0    50   ~ 0
GND
Wire Wire Line
	3900 4950 3900 4700
Text Label 5350 4600 0    50   ~ 0
Vref
$Comp
L Device:C_Small C8
U 1 1 60BC536C
P 4750 4750
F 0 "C8" V 4699 4836 39  0000 C CNN
F 1 "10uF" V 4699 4711 39  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 4750 4750 50  0001 C CNN
F 3 "~" H 4750 4750 50  0001 C CNN
	1    4750 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 4900 4100 5000
Text Notes 5400 4100 0    50   ~ 0
5V
Text Notes 5350 4500 0    50   ~ 0
2.5V
Wire Wire Line
	4650 4600 4650 4950
Connection ~ 4100 5000
Wire Wire Line
	4650 4600 4750 4600
Wire Wire Line
	4750 4850 4750 5000
Wire Wire Line
	4750 5000 4900 5000
Wire Wire Line
	4900 4850 4900 5000
Wire Wire Line
	4900 4650 4900 4600
Wire Wire Line
	4750 4650 4750 4600
Connection ~ 4750 4600
Wire Wire Line
	4750 4600 4900 4600
Wire Wire Line
	1550 5000 1750 5000
Wire Wire Line
	1550 4750 1550 5000
Wire Wire Line
	1550 4550 1550 4300
$Comp
L Device:C_Small C1
U 1 1 60DC86D8
P 1550 4650
F 0 "C1" V 1600 4550 50  0000 C CNN
F 1 "10uF" V 1600 4900 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 1550 4650 50  0001 C CNN
F 3 "~" H 1550 4650 50  0001 C CNN
	1    1550 4650
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C2
U 1 1 60CBE5F6
P 1750 4650
F 0 "C2" V 1800 4550 50  0000 C CNN
F 1 "100uF" V 1800 4900 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 1750 4650 50  0001 C CNN
F 3 "~" H 1750 4650 50  0001 C CNN
	1    1750 4650
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C3
U 1 1 60CBD3AB
P 2850 4650
F 0 "C3" V 2800 4750 50  0000 C CNN
F 1 "100uF" V 2800 4600 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 2850 4650 50  0001 C CNN
F 3 "~" H 2850 4650 50  0001 C CNN
	1    2850 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 4750 2850 5000
Wire Wire Line
	2850 4550 2850 4200
$Comp
L Device:C_Small C4
U 1 1 60CB80A8
P 3000 4650
F 0 "C4" V 2950 4750 50  0000 C CNN
F 1 "10uF" V 2950 4600 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3000 4650 50  0001 C CNN
F 3 "~" H 3000 4650 50  0001 C CNN
	1    3000 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 4750 3000 5000
Wire Wire Line
	3150 4750 3150 5000
Wire Wire Line
	3300 4750 3300 5000
Wire Wire Line
	3300 4550 3300 4200
Wire Wire Line
	3150 4550 3150 4200
Wire Wire Line
	3000 4550 3000 4200
Wire Wire Line
	2600 4200 2850 4200
Wire Wire Line
	2850 4200 3000 4200
Wire Wire Line
	2600 5000 2850 5000
Wire Wire Line
	2850 5000 3000 5000
Connection ~ 2850 5000
Connection ~ 2850 4200
Connection ~ 3000 5000
Wire Wire Line
	3000 5000 3150 5000
Wire Wire Line
	3150 5000 3300 5000
Connection ~ 3150 5000
Connection ~ 3150 4200
Wire Wire Line
	3150 4200 3300 4200
Wire Wire Line
	3000 4200 3150 4200
Connection ~ 3000 4200
$Comp
L Device:R_Small R2
U 1 1 60C0938B
P 2600 4800
F 0 "R2" V 2600 4762 39  0000 L CNN
F 1 "110K/1%" V 2500 4800 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2600 4800 50  0001 C CNN
F 3 "~" H 2600 4800 50  0001 C CNN
	1    2600 4800
	1    0    0    -1  
$EndComp
Connection ~ 2150 5000
Wire Wire Line
	2150 4600 2150 5000
Connection ~ 2600 5000
Wire Wire Line
	2600 4400 2600 4700
Wire Wire Line
	2600 5000 2600 4900
Connection ~ 2600 4400
Wire Wire Line
	2600 4200 2550 4200
Connection ~ 2600 4200
Wire Wire Line
	2550 4400 2600 4400
$Comp
L Device:R_Small R1
U 1 1 60C054D1
P 2600 4300
F 0 "R1" V 2600 4262 39  0000 L CNN
F 1 "1M/1%" V 2650 4250 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2600 4300 50  0001 C CNN
F 3 "~" H 2600 4300 50  0001 C CNN
	1    2600 4300
	1    0    0    -1  
$EndComp
Connection ~ 1550 4300
$Comp
L Device:L_Small L1
U 1 1 60C00857
P 1550 4150
F 0 "L1" H 1504 4126 50  0000 C CNN
F 1 "10uH" H 1458 4201 39  0000 C CNN
F 2 "Inductor_SMD:L_1210_3225Metric_Pad1.42x2.65mm_HandSolder" H 1550 4150 50  0001 C CNN
F 3 "~" H 1550 4150 50  0001 C CNN
	1    1550 4150
	-1   0    0    1   
$EndComp
Wire Wire Line
	1750 4400 1750 4300
$Comp
L Regulator_Switching:TPS61220DCK U1
U 1 1 60BEF8B9
P 2150 4300
F 0 "U1" H 2250 4050 50  0000 C CNN
F 1 "TPS61220DCK" H 2150 4575 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:Texas_R-PDSO-G6" H 2150 3500 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tps61220.pdf" H 2150 4150 50  0001 C CNN
	1    2150 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C9
U 1 1 60DE2DF4
P 4900 4750
F 0 "C9" V 4849 4836 39  0000 C CNN
F 1 "10uF" V 4849 4711 39  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 4900 4750 50  0001 C CNN
F 3 "~" H 4900 4750 50  0001 C CNN
	1    4900 4750
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_DPST_x2 SW1
U 1 1 60BF481E
P 1250 4500
F 0 "SW1" H 1450 4600 50  0001 C CNN
F 1 "Power Switch" H 1400 4600 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 1250 4500 50  0001 C CNN
F 3 "~" H 1250 4500 50  0001 C CNN
	1    1250 4500
	0    -1   -1   0   
$EndComp
Text Label 5350 3950 0    50   ~ 0
Vbat
Text Notes 5350 3850 0    50   ~ 0
1.2V
Entry Bus Bus
	5550 3550 5650 3650
Connection ~ 4900 5000
Wire Wire Line
	4100 5000 4750 5000
Connection ~ 4750 5000
Wire Wire Line
	4650 4600 4500 4600
Connection ~ 4650 4600
$Comp
L Device:C_Small C5
U 1 1 610A50CC
P 3150 4650
F 0 "C5" V 3100 4750 50  0000 C CNN
F 1 "10uF" V 3100 4600 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3150 4650 50  0001 C CNN
F 3 "~" H 3150 4650 50  0001 C CNN
	1    3150 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C6
U 1 1 610A53F1
P 3300 4650
F 0 "C6" V 3250 4750 50  0000 C CNN
F 1 "10uF" V 3250 4600 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 3300 4650 50  0001 C CNN
F 3 "~" H 3300 4650 50  0001 C CNN
	1    3300 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 3950 1250 4300
Wire Wire Line
	1750 4550 1750 4400
Connection ~ 1750 4300
Wire Wire Line
	1750 4750 1750 5000
Connection ~ 1750 5000
Text Notes 1900 5250 0    50   ~ 0
Boost Converter\nfrom 1.2V to 5V
Wire Notes Line
	1450 5200 1450 3900
Wire Notes Line
	3400 5200 2550 5200
Text Notes 3850 5250 0    50   ~ 0
Reference Voltage\nGenerator
$Comp
L Amplifier_Operational:LM321 U2
U 1 1 60DAB6F6
P 4200 4600
F 0 "U2" H 4200 4850 50  0000 L CNN
F 1 "LM321" H 4200 4750 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 4200 4600 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm321.pdf" H 4200 4600 50  0001 C CNN
	1    4200 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 4950 4650 4950
Wire Wire Line
	4550 4900 4100 4900
Connection ~ 4100 4900
Wire Wire Line
	1750 5000 2150 5000
Connection ~ 1750 4400
Connection ~ 1250 4300
Wire Wire Line
	2150 5000 2600 5000
Wire Notes Line
	1450 5200 1900 5200
Wire Notes Line
	1450 3900 3400 3900
Text Notes 1100 5250 0    50   ~ 0
Energy\nSource
Wire Wire Line
	1250 4300 1550 4300
Wire Wire Line
	1250 5000 1550 5000
Connection ~ 1550 5000
Wire Notes Line
	1350 5200 1400 5200
Wire Notes Line
	1400 5200 1400 3900
Wire Notes Line
	1400 3900 1050 3900
Wire Notes Line
	1050 3900 1050 5200
Wire Notes Line
	1050 5200 1100 5200
Connection ~ 3300 4200
Wire Wire Line
	3750 4950 3750 5000
Wire Wire Line
	3750 4500 3900 4500
Wire Wire Line
	3750 4500 3750 4450
Connection ~ 3750 4500
Wire Wire Line
	3750 4200 3750 4250
Wire Wire Line
	3750 4200 4100 4200
Wire Wire Line
	4100 4200 4100 4300
Wire Wire Line
	4550 4200 4100 4200
Wire Wire Line
	4550 4200 4550 4300
Connection ~ 4100 4200
Wire Notes Line
	3400 3900 3400 5200
$Comp
L Jumper:SolderJumper_2_Open JP3
U 1 1 60E0C5DF
P 3600 4200
F 0 "JP3" H 3605 4125 50  0000 R CNN
F 1 "Solder Jumper" H 4176 4125 50  0000 R CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 3600 4200 50  0001 C CNN
F 3 "~" H 3600 4200 50  0001 C CNN
	1    3600 4200
	1    0    0    1   
$EndComp
Connection ~ 3750 4200
Wire Notes Line
	3450 3900 3450 5200
Wire Notes Line
	3450 3900 4950 3900
Wire Wire Line
	3300 4200 3450 4200
Wire Wire Line
	3750 5000 4100 5000
Wire Wire Line
	3750 5000 3300 5000
Connection ~ 3750 5000
Connection ~ 3300 5000
Wire Notes Line
	3850 5200 3450 5200
Wire Wire Line
	3300 4050 3300 4200
Entry Wire Line
	5550 3950 5650 3850
Entry Wire Line
	5550 4200 5650 4100
Entry Wire Line
	5550 4600 5650 4500
Entry Wire Line
	5550 5000 5650 4900
Wire Wire Line
	4900 5000 5050 5000
Wire Wire Line
	3300 4050 5050 4050
$Comp
L Device:Battery_Cell BT1
U 1 1 60BF138E
P 1250 4900
F 0 "BT1" V 1150 5000 50  0000 L CNN
F 1 "1.2V" V 1150 4750 50  0000 L CNN
F 2 "PsyLinkFootprints:BatteryHolder_Keystone_82_1xAAA" V 1250 4960 50  0001 C CNN
F 3 "~" V 1250 4960 50  0001 C CNN
	1    1250 4900
	1    0    0    -1  
$EndComp
Entry Bus Bus
	1700 3450 1800 3550
Wire Wire Line
	1800 2600 2000 2600
Wire Wire Line
	1800 2700 2000 2700
Wire Wire Line
	1800 2800 2000 2800
Entry Wire Line
	1800 2600 1700 2700
Entry Wire Line
	1800 2700 1700 2800
Entry Wire Line
	1800 2800 1700 2900
Text Label 1850 2800 0    50   ~ 0
D2
Text Label 1850 2700 0    50   ~ 0
D3
Text Label 1850 2600 0    50   ~ 0
D4
Entry Wire Line
	1600 3100 1700 3200
Entry Wire Line
	1600 1900 1700 2000
Entry Wire Line
	1600 2100 1700 2200
Entry Wire Line
	1600 2200 1700 2300
Entry Wire Line
	1600 2300 1700 2400
Entry Wire Line
	1600 2400 1700 2500
Entry Wire Line
	1600 2500 1700 2600
Entry Wire Line
	1600 2600 1700 2700
Entry Wire Line
	1600 2700 1700 2800
Entry Wire Line
	1600 2800 1700 2900
Wire Wire Line
	1350 2700 1600 2700
Text Label 1400 2800 0    50   ~ 0
A7
Text Label 1400 2700 0    50   ~ 0
A6
Text Label 1400 2600 0    50   ~ 0
A5
Text Label 1400 2500 0    50   ~ 0
A4
Text Label 1400 2400 0    50   ~ 0
A3
Text Label 1400 2300 0    50   ~ 0
A2
Text Label 1400 2200 0    50   ~ 0
A1
Text Label 1400 2100 0    50   ~ 0
A0
Text Label 1400 3100 0    50   ~ 0
GND2
Text Label 1400 1900 0    50   ~ 0
V+
Wire Wire Line
	1350 2100 1600 2100
Wire Wire Line
	1350 2200 1600 2200
Wire Wire Line
	1350 2400 1600 2400
Wire Wire Line
	1350 2500 1600 2500
Wire Wire Line
	1350 2600 1600 2600
Wire Wire Line
	1350 2800 1600 2800
Wire Wire Line
	1350 1900 1600 1900
Wire Wire Line
	1350 3100 1600 3100
Wire Wire Line
	1350 2300 1600 2300
$Comp
L Connector:Conn_01x15_Female J1
U 1 1 60C041A0
P 1150 2500
F 0 "J1" H 1050 1700 50  0000 C CNN
F 1 "Left Pin Strip" H 973 3326 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x15_P2.54mm_Vertical" H 1150 2500 50  0001 C CNN
F 3 "~" H 1150 2500 50  0001 C CNN
	1    1150 2500
	-1   0    0    -1  
$EndComp
Text Notes 1300 3750 0    50   ~ 0
Connector to Arduino\nNano 33 BLE Sense
Entry Wire Line
	1600 1800 1700 1900
Entry Wire Line
	1600 2000 1700 2100
Entry Wire Line
	1600 2900 1700 3000
Entry Wire Line
	1600 3000 1700 3100
Entry Wire Line
	1600 3200 1700 3300
Entry Wire Line
	1800 3200 1700 3300
Entry Wire Line
	1800 3100 1700 3200
Entry Wire Line
	1800 3000 1700 3100
Entry Wire Line
	1800 2900 1700 3000
Entry Wire Line
	1800 2500 1700 2600
Entry Wire Line
	1800 2400 1700 2500
Entry Wire Line
	1800 2300 1700 2400
Entry Wire Line
	1800 2200 1700 2300
Entry Wire Line
	1800 2100 1700 2200
Entry Wire Line
	1800 2000 1700 2100
Entry Wire Line
	1800 1900 1700 2000
Entry Wire Line
	1800 1800 1700 1900
Wire Wire Line
	1800 1800 2000 1800
Wire Wire Line
	2000 1900 1800 1900
Wire Wire Line
	1800 2000 2000 2000
Wire Wire Line
	2000 2100 1800 2100
Wire Wire Line
	1800 2200 2000 2200
Wire Wire Line
	2000 2300 1800 2300
Wire Wire Line
	1800 2400 2000 2400
Wire Wire Line
	2000 2500 1800 2500
Wire Wire Line
	1800 2900 2000 2900
Wire Wire Line
	1800 3000 2000 3000
Wire Wire Line
	1800 3100 2000 3100
Wire Wire Line
	1800 3200 2000 3200
Wire Wire Line
	1600 3200 1350 3200
Wire Wire Line
	1350 3000 1600 3000
Wire Wire Line
	1600 2900 1350 2900
Wire Wire Line
	1350 2000 1600 2000
Wire Wire Line
	1600 1800 1350 1800
Text Label 1400 3000 0    50   ~ 0
RST2
Text Label 1850 3000 0    50   ~ 0
RST
Text Label 1850 3100 0    50   ~ 0
RX
Text Label 1850 3200 0    50   ~ 0
TX
Text Label 1400 3200 0    50   ~ 0
VIN
Text Label 1400 2900 0    50   ~ 0
+5V
Text Label 1400 2000 0    50   ~ 0
AREF
Text Label 1400 1800 0    50   ~ 0
D13
Text Label 1850 2900 0    50   ~ 0
GND
Text Label 1850 2400 0    50   ~ 0
D6
Text Label 1850 2500 0    50   ~ 0
D5
Text Label 1850 2300 0    50   ~ 0
D7
Text Label 1850 2200 0    50   ~ 0
D8
Text Label 1850 2100 0    50   ~ 0
D9
Text Label 1850 2000 0    50   ~ 0
D10
Text Label 1850 1900 0    50   ~ 0
D11
Text Label 1850 1800 0    50   ~ 0
D12
Entry Wire Line
	2550 2100 2450 2200
Entry Wire Line
	2550 2200 2450 2300
Entry Wire Line
	2550 2300 2450 2400
Entry Wire Line
	2550 2400 2450 2500
Entry Wire Line
	2550 2500 2450 2600
Entry Wire Line
	2550 2600 2450 2700
Entry Wire Line
	2550 2700 2450 2800
Entry Wire Line
	2550 2800 2450 2900
Entry Wire Line
	2550 3000 2450 3100
Entry Wire Line
	2550 3100 2450 3200
Entry Wire Line
	2550 3200 2450 3300
Wire Wire Line
	2550 2800 2800 2800
Wire Wire Line
	2550 2700 2800 2700
Wire Wire Line
	2550 2600 2800 2600
Wire Wire Line
	2550 2500 2800 2500
Wire Wire Line
	2550 2400 2800 2400
Wire Wire Line
	2550 2300 2800 2300
Wire Wire Line
	2550 2200 2800 2200
Wire Wire Line
	2550 2100 2800 2100
Wire Wire Line
	2550 3000 2800 3000
Wire Wire Line
	2550 3200 2800 3200
Wire Wire Line
	2550 3100 2800 3100
Text Label 2600 2300 0    50   ~ 0
A5
Wire Notes Line
	1250 3700 1050 3700
Wire Notes Line
	1050 3700 1050 1600
Text Notes 2500 3750 0    50   ~ 0
Input/Output\nPin Strip
Wire Notes Line
	2350 1850 3100 1850
Wire Notes Line
	2850 3700 3100 3700
Wire Notes Line
	2500 3700 2350 3700
Text Label 2600 3200 0    50   ~ 0
D13
Text Label 2600 3100 0    50   ~ 0
D12
Text Label 2600 3000 0    50   ~ 0
D11
Text Label 2600 2800 0    50   ~ 0
A0
Text Label 2600 2700 0    50   ~ 0
A1
Text Label 2600 2600 0    50   ~ 0
A2
Text Label 2600 2500 0    50   ~ 0
A3
Text Label 2600 2400 0    50   ~ 0
A4
Text Label 2600 2200 0    50   ~ 0
A6
Text Label 2600 2100 0    50   ~ 0
A7
Text Notes 6450 5250 2    50   ~ 0
https://psylink.me/c12
Wire Wire Line
	5050 4050 5050 4200
Wire Wire Line
	4900 4600 5550 4600
Connection ~ 4900 4600
Connection ~ 5050 5000
Wire Wire Line
	5050 4200 5200 4200
Connection ~ 5050 4200
Wire Wire Line
	5050 4200 5050 4300
Wire Wire Line
	5050 4500 5050 5000
$Comp
L Device:C_Small C10
U 1 1 60CB83B2
P 5050 4400
F 0 "C10" V 5100 4500 50  0000 C CNN
F 1 "10uF" V 5100 4350 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 5050 4400 50  0001 C CNN
F 3 "~" H 5050 4400 50  0001 C CNN
	1    5050 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 5000 5200 5000
Connection ~ 5200 5000
Wire Wire Line
	5200 5000 5550 5000
Wire Wire Line
	5200 4300 5200 4200
Connection ~ 5200 4200
Wire Wire Line
	5200 4200 5550 4200
Wire Wire Line
	3750 4500 3750 4750
Text Label 4250 4200 0    50   ~ 0
OpAmpV+
Text Label 2600 4600 0    50   ~ 0
FB
Wire Wire Line
	1250 3950 5550 3950
Wire Wire Line
	1550 4050 1750 4050
Wire Wire Line
	1750 4050 1750 4200
Wire Wire Line
	1550 4300 1750 4300
Text Label 1600 4050 0    50   ~ 0
L
Wire Wire Line
	1550 4250 1550 4300
Wire Wire Line
	4550 4900 4550 4500
Text Label 3750 4650 2    50   ~ 0
Vdiv
Wire Wire Line
	5200 4500 5200 5000
$Comp
L Device:C_Small C11
U 1 1 60E93F63
P 5200 4400
F 0 "C11" V 5250 4500 50  0000 C CNN
F 1 "10uF" V 5250 4350 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 5200 4400 50  0001 C CNN
F 3 "~" H 5200 4400 50  0001 C CNN
	1    5200 4400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R4
U 1 1 60ABC396
P 3750 4850
F 0 "R4" V 3749 4804 39  0000 L CNN
F 1 "110K/1%" V 3800 4900 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3750 4850 50  0001 C CNN
F 3 "~" H 3750 4850 50  0001 C CNN
	1    3750 4850
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R3
U 1 1 60ABC39C
P 3750 4350
F 0 "R3" V 3749 4314 39  0000 L CNN
F 1 "110K/1%" V 3809 4350 39  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3750 4350 50  0001 C CNN
F 3 "~" H 3750 4350 50  0001 C CNN
	1    3750 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C7
U 1 1 60CB87C5
P 4550 4400
F 0 "C7" H 4621 4481 50  0000 C CNN
F 1 "100uF" H 4818 4318 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 4550 4400 50  0001 C CNN
F 3 "~" H 4550 4400 50  0001 C CNN
	1    4550 4400
	1    0    0    -1  
$EndComp
Entry Bus Bus
	4900 3550 5000 3450
Entry Bus Bus
	4050 3450 4150 3550
Wire Wire Line
	4900 3000 4650 3000
Text Label 4350 3000 2    50   ~ 0
Vbat
Text Label 4850 3000 2    50   ~ 0
A7
Wire Wire Line
	4350 3000 4150 3000
Entry Wire Line
	4900 3000 5000 3100
Entry Wire Line
	4050 3100 4150 3000
Text Notes 4200 3350 0    50   ~ 0
Allows measuring\nbattery charge via\nanalog pin A7
$Comp
L Jumper:SolderJumper_2_Open JP2
U 1 1 60F6BC38
P 4500 3000
F 0 "JP2" H 4571 3080 50  0000 R CNN
F 1 "Solder Jumper" H 4777 2863 50  0000 R CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 4500 3000 50  0001 C CNN
F 3 "~" H 4500 3000 50  0001 C CNN
	1    4500 3000
	1    0    0    1   
$EndComp
Text Label 4750 2350 0    50   ~ 0
D2
Text Label 4200 2350 0    50   ~ 0
D3
Text Label 4200 2500 0    50   ~ 0
GND
Entry Wire Line
	4050 2600 4150 2500
Entry Wire Line
	4050 2450 4150 2350
Entry Wire Line
	4900 2350 5000 2450
Wire Wire Line
	4150 2500 4500 2500
Wire Wire Line
	4750 2350 4900 2350
Wire Wire Line
	4150 2350 4250 2350
$Comp
L Jumper:Jumper_3_Open JP1
U 1 1 6112D134
P 4500 2350
F 0 "JP1" H 4500 2574 50  0000 C CNN
F 1 "Configuration Jumper" H 4500 2483 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 4500 2350 50  0001 C CNN
F 3 "~" H 4500 2350 50  0001 C CNN
	1    4500 2350
	1    0    0    -1  
$EndComp
Text Notes 4100 2750 0    50   ~ 0
Multipurpose jumpers,\nsoftware-configurable
$Comp
L Connector:Conn_01x12_Female J3
U 1 1 61B6B37A
P 3000 2600
F 0 "J3" H 2850 1900 50  0000 L CNN
F 1 "I/O Pin Strip" H 2450 3250 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x12_P2.54mm_Vertical" H 3000 2600 50  0001 C CNN
F 3 "~" H 3000 2600 50  0001 C CNN
	1    3000 2600
	1    0    0    -1  
$EndComp
Entry Wire Line
	2450 3000 2550 2900
Wire Wire Line
	2550 2900 2800 2900
Text Label 2600 2900 0    50   ~ 0
D10
Entry Bus Bus
	2450 3450 2550 3550
Wire Notes Line
	2350 3700 2350 1850
Wire Notes Line
	3100 1850 3100 3700
Entry Bus Bus
	3250 3450 3350 3550
Text Notes 3300 3750 0    50   ~ 0
Power\nPin Strips
Wire Notes Line
	3300 3700 3150 3700
Wire Notes Line
	3900 3700 3700 3700
$Comp
L Jumper:SolderJumper_2_Open JP8
U 1 1 61E229B9
P 5350 3350
F 0 "JP8" H 5350 3250 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 5350 3464 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 5350 3350 50  0001 C CNN
F 3 "~" H 5350 3350 50  0001 C CNN
	1    5350 3350
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x15_Female J2
U 1 1 60BC79E1
P 2200 2500
F 0 "J2" H 2100 1700 50  0000 C CNN
F 1 "Right Pin Strip" H 1980 3324 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x15_P2.54mm_Vertical" H 2200 2500 50  0001 C CNN
F 3 "~" H 2200 2500 50  0001 C CNN
	1    2200 2500
	1    0    0    -1  
$EndComp
Wire Notes Line
	1050 1600 2300 1600
Wire Notes Line
	2300 1600 2300 3700
Wire Notes Line
	2300 3700 2100 3700
$Comp
L Connector:Screw_Terminal_01x01 Screw5
U 1 1 61E5CAC7
P 5700 3350
F 0 "Screw5" H 5800 3400 50  0000 L CNN
F 1 "Center" H 5800 3300 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.7mm_Pad" H 5700 3350 50  0001 C CNN
F 3 "~" H 5700 3350 50  0001 C CNN
	1    5700 3350
	1    0    0    -1  
$EndComp
Entry Wire Line
	5000 3450 5100 3350
Text Label 5100 3350 0    50   ~ 0
Vref
$Comp
L Jumper:SolderJumper_2_Open JP7
U 1 1 61EACCD4
P 5350 3100
F 0 "JP7" H 5350 3000 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 5350 3214 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 5350 3100 50  0001 C CNN
F 3 "~" H 5350 3100 50  0001 C CNN
	1    5350 3100
	1    0    0    -1  
$EndComp
Entry Wire Line
	5000 3200 5100 3100
Text Label 5100 3100 0    50   ~ 0
Vref
$Comp
L Jumper:SolderJumper_2_Open JP6
U 1 1 61EB3A90
P 5350 2850
F 0 "JP6" H 5350 2750 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 5350 2964 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 5350 2850 50  0001 C CNN
F 3 "~" H 5350 2850 50  0001 C CNN
	1    5350 2850
	1    0    0    -1  
$EndComp
Entry Wire Line
	5000 2950 5100 2850
$Comp
L Jumper:SolderJumper_2_Open JP5
U 1 1 61EBAAB1
P 5350 2600
F 0 "JP5" H 5350 2500 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 5350 2714 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 5350 2600 50  0001 C CNN
F 3 "~" H 5350 2600 50  0001 C CNN
	1    5350 2600
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x01 Screw2
U 1 1 61EBAAB7
P 5700 2600
F 0 "Screw2" H 5800 2650 50  0000 L CNN
F 1 "Top Right" H 5800 2550 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.7mm_Pad" H 5700 2600 50  0001 C CNN
F 3 "~" H 5700 2600 50  0001 C CNN
	1    5700 2600
	1    0    0    -1  
$EndComp
Entry Wire Line
	5000 2700 5100 2600
Text Label 5100 2600 0    50   ~ 0
Vref
$Comp
L Jumper:SolderJumper_2_Open JP4
U 1 1 61EC1F68
P 5350 2350
F 0 "JP4" H 5350 2250 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 5350 2464 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 5350 2350 50  0001 C CNN
F 3 "~" H 5350 2350 50  0001 C CNN
	1    5350 2350
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x01 Screw1
U 1 1 61EC1F6E
P 5700 2350
F 0 "Screw1" H 5800 2400 50  0000 L CNN
F 1 "Top Left" H 5800 2300 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.7mm_Pad" H 5700 2350 50  0001 C CNN
F 3 "~" H 5700 2350 50  0001 C CNN
	1    5700 2350
	1    0    0    -1  
$EndComp
Entry Wire Line
	5000 2450 5100 2350
Text Label 5100 2350 0    50   ~ 0
Vref
Text Label 5100 2850 0    50   ~ 0
Vref
Wire Wire Line
	5200 2350 5100 2350
$Comp
L Connector:Screw_Terminal_01x01 Screw4
U 1 1 61EACCDA
P 5700 3100
F 0 "Screw4" H 5800 3150 50  0000 L CNN
F 1 "Bottom Right" H 5800 3050 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.7mm_Pad" H 5700 3100 50  0001 C CNN
F 3 "~" H 5700 3100 50  0001 C CNN
	1    5700 3100
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x01 Screw3
U 1 1 61EB3A96
P 5700 2850
F 0 "Screw3" H 5800 2900 50  0000 L CNN
F 1 "Bottom Left" H 5800 2800 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.7mm_Pad" H 5700 2850 50  0001 C CNN
F 3 "~" H 5700 2850 50  0001 C CNN
	1    5700 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 2600 5100 2600
Wire Wire Line
	5100 2850 5200 2850
Wire Wire Line
	5100 3100 5200 3100
Wire Wire Line
	5100 3350 5200 3350
Wire Notes Line
	6400 3700 6400 2000
Wire Notes Line
	4100 3700 3950 3700
Wire Notes Line
	4950 3900 4950 5200
Wire Notes Line
	4950 5200 4250 5200
Wire Notes Line
	6400 3700 5500 3700
Text Notes 4100 3750 0    50   ~ 0
Jumpers, Electrode Mounting Screws
Entry Wire Line
	3350 2500 3250 2600
Entry Wire Line
	3350 2600 3250 2700
Wire Wire Line
	3350 2600 3600 2600
Wire Wire Line
	3350 2500 3600 2500
Text Label 3400 2600 0    50   ~ 0
V+
Text Label 3400 2500 0    50   ~ 0
GND
Text Label 3400 2700 0    50   ~ 0
Vref
Entry Wire Line
	3250 2800 3350 2700
Wire Wire Line
	3600 2700 3350 2700
Entry Wire Line
	3350 1900 3250 2000
Entry Wire Line
	3350 2000 3250 2100
Wire Wire Line
	3350 2000 3600 2000
Wire Wire Line
	3350 1900 3600 1900
Text Label 3400 2000 0    50   ~ 0
V+
Text Label 3400 1900 0    50   ~ 0
GND
Text Label 3400 2100 0    50   ~ 0
Vref
Entry Wire Line
	3250 2200 3350 2100
Wire Wire Line
	3600 2100 3350 2100
$Comp
L Connector:Conn_01x03_Female J6
U 1 1 61C0B729
P 3800 2600
F 0 "J6" H 3650 2450 50  0000 L CNN
F 1 "Power Pins C" H 3300 2850 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3800 2600 50  0001 C CNN
F 3 "~" H 3800 2600 50  0001 C CNN
	1    3800 2600
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Female J5
U 1 1 61C0B2DC
P 3800 2000
F 0 "J5" H 3650 1850 50  0000 L CNN
F 1 "Power Pins B" H 3300 2250 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3800 2000 50  0001 C CNN
F 3 "~" H 3800 2000 50  0001 C CNN
	1    3800 2000
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Female J4
U 1 1 61C0A3E5
P 3800 1400
F 0 "J4" H 3650 1250 50  0000 L CNN
F 1 "Power Pins A" H 3300 1650 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3800 1400 50  0001 C CNN
F 3 "~" H 3800 1400 50  0001 C CNN
	1    3800 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 1500 3350 1500
Entry Wire Line
	3250 1600 3350 1500
Text Label 3400 1500 0    50   ~ 0
Vref
Text Label 3400 1300 0    50   ~ 0
GND
Text Label 3400 1400 0    50   ~ 0
V+
Wire Wire Line
	3350 1300 3600 1300
Wire Wire Line
	3350 1400 3600 1400
Entry Wire Line
	3350 1400 3250 1500
Entry Wire Line
	3350 1300 3250 1400
Entry Wire Line
	3350 3100 3250 3200
Entry Wire Line
	3350 3200 3250 3300
Wire Wire Line
	3350 3200 3600 3200
Wire Wire Line
	3350 3100 3600 3100
Text Label 3400 3200 0    50   ~ 0
V+
Text Label 3400 3100 0    50   ~ 0
GND
$Comp
L Connector:Conn_01x02_Female J7
U 1 1 61D9C6E7
P 3800 3100
F 0 "J7" H 3650 2900 50  0000 L CNN
F 1 "External Power" H 3300 3250 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 3800 3100 50  0001 C CNN
F 3 "~" H 3800 3100 50  0001 C CNN
	1    3800 3100
	1    0    0    -1  
$EndComp
Wire Notes Line
	3150 3700 3150 1050
Wire Notes Line
	3150 1050 3900 1050
Wire Notes Line
	3900 1050 3900 3700
Wire Notes Line
	3950 3700 3950 2000
Text Notes 4150 1950 0    50   ~ 0
Power LED (optional, reduces battery life)
Text Notes 5100 1750 0    50   ~ 0
Bridge 1-2 if you activate Vref,\non JP3, otherwise Bridge 2-3.
Text Label 4200 1200 0    50   ~ 0
Vref
Text Label 4200 1700 0    50   ~ 0
V+
Wire Wire Line
	4150 1700 4550 1700
Wire Wire Line
	4150 1200 4550 1200
Wire Wire Line
	4150 1450 4500 1450
Wire Wire Line
	4750 1200 4950 1200
Wire Wire Line
	4750 1700 4950 1700
$Comp
L Jumper:SolderJumper_3_Open JP9
U 1 1 61FB71BE
P 4950 1450
F 0 "JP9" V 4904 1518 50  0000 L CNN
F 1 "Power LED Config Jumper" V 4995 1518 50  0000 L CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Open_RoundedPad1.0x1.5mm" H 4950 1450 50  0001 C CNN
F 3 "~" H 4950 1450 50  0001 C CNN
	1    4950 1450
	0    1    1    0   
$EndComp
Text Label 4200 1450 0    50   ~ 0
GND
Wire Wire Line
	4950 1200 4950 1250
Wire Wire Line
	4950 1700 4950 1650
Entry Wire Line
	4050 1300 4150 1200
Entry Wire Line
	4050 1550 4150 1450
Wire Wire Line
	4800 1450 4700 1450
$Comp
L Device:LED_Small D1
U 1 1 61DDB960
P 4600 1450
F 0 "D1" H 4548 1571 50  0000 L CNN
F 1 "Power LED" H 4400 1375 50  0000 L CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4600 1450 50  0001 C CNN
F 3 "~" V 4600 1450 50  0001 C CNN
	1    4600 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R6
U 1 1 61F16495
P 4650 1700
F 0 "R6" V 4650 1700 35  0000 C CNN
F 1 "110/5%" V 4755 1700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4650 1700 50  0001 C CNN
F 3 "~" H 4650 1700 50  0001 C CNN
	1    4650 1700
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R5
U 1 1 61DFC5D9
P 4650 1200
F 0 "R5" V 4650 1200 35  0000 C CNN
F 1 "22/5%" V 4550 1200 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4650 1200 50  0001 C CNN
F 3 "~" H 4650 1200 50  0001 C CNN
	1    4650 1200
	0    1    1    0   
$EndComp
Entry Wire Line
	4050 1800 4150 1700
Wire Notes Line
	3950 1900 3950 1050
Wire Notes Line
	3950 1050 6400 1050
Wire Notes Line
	6400 1050 6400 1900
Wire Notes Line
	4100 1900 3950 1900
Wire Notes Line
	3950 2000 6400 2000
Wire Notes Line
	6400 1900 5800 1900
Wire Bus Line
	5650 3650 5650 4900
Wire Bus Line
	1800 3550 5550 3550
Wire Bus Line
	5000 2450 5000 3450
Wire Bus Line
	4050 1300 4050 3450
Wire Bus Line
	3250 1400 3250 3450
Wire Bus Line
	2450 2200 2450 3450
Wire Bus Line
	1700 1900 1700 3450
$EndSCHEMATC
