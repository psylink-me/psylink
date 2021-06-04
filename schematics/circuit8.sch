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
P 2800 3750
F 0 "R4" V 2799 3704 39  0000 L CNN
F 1 "1M/1%" V 2850 3750 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 2800 3750 50  0001 C CNN
F 3 "~" H 2800 3750 50  0001 C CNN
	1    2800 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R3
U 1 1 60ABC39C
P 2800 3250
F 0 "R3" V 2799 3214 39  0000 L CNN
F 1 "1M/1%" V 2859 3250 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 2800 3250 50  0001 C CNN
F 3 "~" H 2800 3250 50  0001 C CNN
	1    2800 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 3100 3200 3200
Wire Wire Line
	2800 3150 2800 3100
Wire Wire Line
	2800 3850 2800 3900
Wire Wire Line
	2800 3350 2800 3400
Wire Wire Line
	2800 3100 3200 3100
Wire Wire Line
	2800 3400 3000 3400
Connection ~ 2800 3400
Wire Wire Line
	2800 3400 2800 3650
Text Notes 2350 2950 0    50   ~ 0
Power supply module
$Comp
L Regulator_Switching:TPS61220DCK U1
U 1 1 60BEF8B9
P 1950 3200
F 0 "U1" H 1950 3567 50  0000 C CNN
F 1 "TPS61220DCK" H 1950 3475 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:Texas_R-PDSO-G6" H 1950 2400 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tps61220.pdf" H 1950 3050 50  0001 C CNN
	1    1950 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 3200 1100 3200
Wire Wire Line
	1550 3300 1550 3200
Connection ~ 1550 3200
$Comp
L Device:L_Small L1
U 1 1 60C00857
P 1450 3100
F 0 "L1" V 1635 3100 50  0000 C CNN
F 1 "4.7uH" V 1543 3100 50  0000 C CNN
F 2 "Inductor_SMD:L_0805_2012Metric" H 1450 3100 50  0001 C CNN
F 3 "~" H 1450 3100 50  0001 C CNN
	1    1450 3100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1350 3100 1350 3200
Wire Wire Line
	1350 3200 1550 3200
Connection ~ 1350 3200
$Comp
L Device:R_Small R1
U 1 1 60C054D1
P 2400 3200
F 0 "R1" V 2400 3162 39  0000 L CNN
F 1 "1M/1%" V 2450 3150 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 2400 3200 50  0001 C CNN
F 3 "~" H 2400 3200 50  0001 C CNN
	1    2400 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 3300 2400 3300
Connection ~ 2400 3100
Wire Wire Line
	2400 3100 2350 3100
Connection ~ 2400 3300
Wire Wire Line
	2400 3900 1950 3900
Wire Wire Line
	1350 3650 1350 3900
Connection ~ 1350 3900
Wire Wire Line
	2400 3900 2400 3800
Wire Wire Line
	2400 3300 2400 3600
Wire Wire Line
	2700 3450 2700 3100
Wire Wire Line
	2400 3100 2700 3100
Wire Wire Line
	2700 3650 2700 3900
Wire Wire Line
	2700 3900 2400 3900
Connection ~ 2400 3900
Wire Wire Line
	1950 3500 1950 3900
Connection ~ 1950 3900
Wire Wire Line
	1950 3900 1350 3900
$Comp
L Device:Battery_Cell BT1
U 1 1 60BF138E
P 1100 3800
F 0 "BT1" H 1200 3900 50  0000 L CNN
F 1 "1.2V" H 1150 3800 50  0000 L CNN
F 2 "PsyLinkFootprints:BatteryHolder_Keystone_82_1xAAA" V 1100 3860 50  0001 C CNN
F 3 "~" V 1100 3860 50  0001 C CNN
	1    1100 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 60CBD3AB
P 2700 3550
F 0 "C2" H 2500 3550 50  0000 C CNN
F 1 "10uF" V 2600 3650 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 2700 3550 50  0001 C CNN
F 3 "~" H 2700 3550 50  0001 C CNN
	1    2700 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 60CBE5F6
P 1350 3550
F 0 "C1" H 1150 3550 50  0000 C CNN
F 1 "10uF" V 1250 3650 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 1350 3550 50  0001 C CNN
F 3 "~" H 1350 3550 50  0001 C CNN
	1    1350 3550
	-1   0    0    1   
$EndComp
Wire Wire Line
	1350 3200 1350 3450
Text Label 3800 3100 0    50   ~ 0
V+
Text Label 3750 3900 0    50   ~ 0
GND
Connection ~ 3200 3100
Wire Wire Line
	1100 3900 1350 3900
Wire Wire Line
	3600 3600 3600 3500
Wire Wire Line
	3600 3900 3600 3800
Wire Wire Line
	3600 3500 3700 3500
Wire Wire Line
	3700 3500 3700 3850
Wire Wire Line
	3000 3850 3000 3600
Wire Wire Line
	3000 3850 3700 3850
Text Notes 4050 4050 2    50   ~ 0
https://psylink.me/c8
Entry Wire Line
	3950 3900 4050 3800
Entry Wire Line
	3950 3500 4050 3400
Entry Wire Line
	3950 3100 4050 3000
Wire Wire Line
	3950 3900 3600 3900
Connection ~ 3600 3900
Wire Wire Line
	3700 3500 3950 3500
Connection ~ 3700 3500
Text Label 3750 3500 0    50   ~ 0
Vref
Entry Bus Bus
	3950 2700 4050 2800
Entry Bus Bus
	1700 2600 1800 2700
Text Label 3150 1450 0    50   ~ 0
Vref
Text Label 3150 1350 0    50   ~ 0
Vref
Wire Wire Line
	3100 1350 3350 1350
Entry Wire Line
	3000 1550 3100 1450
Entry Wire Line
	3000 1450 3100 1350
Wire Wire Line
	3350 1450 3100 1450
Text Label 3150 1250 0    50   ~ 0
V+
Text Label 3150 1150 0    50   ~ 0
V+
Text Label 3150 1550 0    50   ~ 0
D4
Text Label 3150 1650 0    50   ~ 0
D3
Wire Wire Line
	1800 1750 2000 1750
Wire Wire Line
	1800 1850 2000 1850
Wire Wire Line
	1800 1950 2000 1950
Entry Wire Line
	1800 1750 1700 1850
Entry Wire Line
	1800 1850 1700 1950
Entry Wire Line
	1800 1950 1700 2050
Text Label 1850 1950 0    50   ~ 0
D2
Text Label 1850 1850 0    50   ~ 0
D3
Text Label 1850 1750 0    50   ~ 0
D4
Text Label 3150 1750 0    50   ~ 0
D2
Text Label 3150 1850 0    50   ~ 0
A7
Text Label 3150 1950 0    50   ~ 0
A6
Text Label 3150 2050 0    50   ~ 0
A5
Text Label 3150 2150 0    50   ~ 0
A4
Text Label 3150 2250 0    50   ~ 0
A3
Text Label 3150 2350 0    50   ~ 0
A2
Text Label 3150 2450 0    50   ~ 0
A1
Text Label 3150 2550 0    50   ~ 0
A0
Text Label 3150 1050 0    50   ~ 0
GND
Wire Wire Line
	3100 950  3350 950 
Wire Wire Line
	3100 1050 3350 1050
Wire Wire Line
	3100 1150 3350 1150
Wire Wire Line
	3100 1250 3350 1250
Wire Wire Line
	3100 1650 3350 1650
Wire Wire Line
	3100 1750 3350 1750
Wire Wire Line
	3100 1550 3350 1550
Wire Wire Line
	3100 1850 3350 1850
Wire Wire Line
	3100 1950 3350 1950
Wire Wire Line
	3100 2050 3350 2050
Wire Wire Line
	3100 2150 3350 2150
Wire Wire Line
	3100 2250 3350 2250
Wire Wire Line
	3100 2350 3350 2350
Wire Wire Line
	3100 2450 3350 2450
Wire Wire Line
	3100 2550 3350 2550
Text Label 3150 950  0    50   ~ 0
GND
Entry Wire Line
	3100 2550 3000 2650
Entry Wire Line
	3100 2450 3000 2550
Entry Wire Line
	3100 2350 3000 2450
Entry Wire Line
	3100 2250 3000 2350
Entry Wire Line
	3100 2150 3000 2250
Entry Wire Line
	3100 2050 3000 2150
Entry Wire Line
	3100 1950 3000 2050
Entry Wire Line
	3100 1850 3000 1950
Entry Wire Line
	3100 1750 3000 1850
Entry Wire Line
	3100 1650 3000 1750
Entry Wire Line
	3100 1550 3000 1650
Entry Wire Line
	3100 1250 3000 1350
Entry Wire Line
	3100 1150 3000 1250
Entry Wire Line
	3100 1050 3000 1150
Entry Wire Line
	3100 950  3000 1050
Entry Wire Line
	1600 2250 1700 2350
Entry Wire Line
	1600 1050 1700 1150
Entry Wire Line
	1600 1250 1700 1350
Entry Wire Line
	1600 1350 1700 1450
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
Wire Wire Line
	1350 1850 1600 1850
Text Label 1400 1950 0    50   ~ 0
A7
Text Label 1400 1850 0    50   ~ 0
A6
Text Label 1400 1750 0    50   ~ 0
A5
Text Label 1400 1650 0    50   ~ 0
A4
Text Label 1400 1550 0    50   ~ 0
A3
Text Label 1400 1450 0    50   ~ 0
A2
Text Label 1400 1350 0    50   ~ 0
A1
Text Label 1400 1250 0    50   ~ 0
A0
Text Label 1400 2250 0    50   ~ 0
GND
Text Label 1400 1050 0    50   ~ 0
V+
Wire Wire Line
	1350 1250 1600 1250
Wire Wire Line
	1350 1350 1600 1350
Wire Wire Line
	1350 1550 1600 1550
Wire Wire Line
	1350 1650 1600 1650
Wire Wire Line
	1350 1750 1600 1750
Wire Wire Line
	1350 1950 1600 1950
Wire Wire Line
	1350 1050 1600 1050
Wire Wire Line
	1350 2250 1600 2250
Wire Wire Line
	1350 1450 1600 1450
$Comp
L Connector:Conn_01x15_Female J1
U 1 1 60BC79E1
P 1150 1650
F 0 "J1" V 1223 1630 50  0000 C CNN
F 1 "Left Pin Strip" V 1300 1650 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x15_P2.54mm_Vertical" H 1150 1650 50  0001 C CNN
F 3 "~" H 1150 1650 50  0001 C CNN
	1    1150 1650
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x15_Female J2
U 1 1 60C041A0
P 2200 1650
F 0 "J2" V 2273 1630 50  0000 C CNN
F 1 "Right Pin Strip" V 2350 1650 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x15_P2.54mm_Vertical" H 2200 1650 50  0001 C CNN
F 3 "~" H 2200 1650 50  0001 C CNN
	1    2200 1650
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x17_Female J3
U 1 1 60D14FD7
P 3550 1750
F 0 "J3" V 3650 1750 50  0000 L CNN
F 1 "Pass-through Output Pin Strip" V 3750 1200 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x17_P2.54mm_Vertical" H 3550 1750 50  0001 C CNN
F 3 "~" H 3550 1750 50  0001 C CNN
	1    3550 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 3100 2800 3100
Connection ~ 2700 3100
Connection ~ 2800 3100
Wire Wire Line
	2700 3900 2800 3900
Connection ~ 2700 3900
Connection ~ 2800 3900
Wire Bus Line
	3950 2700 3000 2700
$Comp
L Device:C_Small C3
U 1 1 60BC536C
P 3600 3700
F 0 "C3" H 3400 3700 50  0000 C CNN
F 1 "10uF" V 3500 3800 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 3600 3700 50  0001 C CNN
F 3 "~" H 3600 3700 50  0001 C CNN
	1    3600 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R2
U 1 1 60C0938B
P 2400 3700
F 0 "R2" V 2400 3662 39  0000 L CNN
F 1 "110K/1%" V 2300 3700 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 2400 3700 50  0001 C CNN
F 3 "~" H 2400 3700 50  0001 C CNN
	1    2400 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 3900 3200 3900
Wire Wire Line
	3200 3800 3200 3900
Connection ~ 3200 3900
Wire Wire Line
	3200 3900 3600 3900
$Comp
L Switch:SW_DPST_x2 SW1
U 1 1 60BF481E
P 1100 3400
F 0 "SW1" H 1100 3500 50  0000 C CNN
F 1 "SW_DPST_x2" H 1100 3544 50  0001 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 1100 3400 50  0001 C CNN
F 3 "~" H 1100 3400 50  0001 C CNN
	1    1100 3400
	0    -1   -1   0   
$EndComp
Connection ~ 3000 2700
Wire Bus Line
	1800 2700 3000 2700
Wire Wire Line
	3200 3100 3950 3100
$Comp
L Amplifier_Operational:LM321 U2
U 1 1 60DAB6F6
P 3300 3500
F 0 "U2" H 3300 3750 50  0000 L CNN
F 1 "LM321" H 3300 3650 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 3300 3500 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm321.pdf" H 3300 3500 50  0001 C CNN
	1    3300 3500
	1    0    0    -1  
$EndComp
Connection ~ 3600 3500
Text Notes 3800 3000 0    50   ~ 0
5V
Text Notes 3750 3400 0    50   ~ 0
2.5V
Text Notes 1250 2650 0    50   ~ 0
Arduino\nNano 33\nBLE Sense
Wire Bus Line
	4050 2800 4050 3800
Wire Bus Line
	1700 1150 1700 2600
Wire Bus Line
	3000 1050 3000 2700
$EndSCHEMATC
