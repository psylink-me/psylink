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
Text Label 5200 3550 0    50   ~ 0
V+
Text Label 5150 4350 0    50   ~ 0
GND
Wire Wire Line
	3900 4300 3900 4050
Text Label 5150 3950 0    50   ~ 0
Vref
Entry Bus Bus
	4450 2900 4550 2800
Entry Bus Bus
	1750 2800 1850 2900
Wire Wire Line
	1850 1950 2050 1950
Wire Wire Line
	1850 2050 2050 2050
Wire Wire Line
	1850 2150 2050 2150
Entry Wire Line
	1850 1950 1750 2050
Entry Wire Line
	1850 2050 1750 2150
Entry Wire Line
	1850 2150 1750 2250
Text Label 1900 2150 0    50   ~ 0
D2
Text Label 1900 2050 0    50   ~ 0
D3
Text Label 1900 1950 0    50   ~ 0
D4
Entry Wire Line
	1650 2450 1750 2550
Entry Wire Line
	1650 1250 1750 1350
Entry Wire Line
	1650 1450 1750 1550
Entry Wire Line
	1650 1550 1750 1650
Entry Wire Line
	1650 1650 1750 1750
Entry Wire Line
	1650 1750 1750 1850
Entry Wire Line
	1650 1850 1750 1950
Entry Wire Line
	1650 1950 1750 2050
Entry Wire Line
	1650 2050 1750 2150
Entry Wire Line
	1650 2150 1750 2250
Wire Wire Line
	1400 2050 1650 2050
Text Label 1450 2150 0    50   ~ 0
A7
Text Label 1450 2050 0    50   ~ 0
A6
Text Label 1450 1950 0    50   ~ 0
A5
Text Label 1450 1850 0    50   ~ 0
A4
Text Label 1450 1750 0    50   ~ 0
A3
Text Label 1450 1650 0    50   ~ 0
A2
Text Label 1450 1550 0    50   ~ 0
A1
Text Label 1450 1450 0    50   ~ 0
A0
Text Label 1450 2450 0    50   ~ 0
GND2
Text Label 1450 1250 0    50   ~ 0
V+
Wire Wire Line
	1400 1450 1650 1450
Wire Wire Line
	1400 1550 1650 1550
Wire Wire Line
	1400 1750 1650 1750
Wire Wire Line
	1400 1850 1650 1850
Wire Wire Line
	1400 1950 1650 1950
Wire Wire Line
	1400 2150 1650 2150
Wire Wire Line
	1400 1250 1650 1250
Wire Wire Line
	1400 2450 1650 2450
Wire Wire Line
	1400 1650 1650 1650
$Comp
L Connector:Conn_01x15_Female J2
U 1 1 60BC79E1
P 2250 1850
F 0 "J2" H 2150 1050 50  0000 C CNN
F 1 "Right Pin Strip" H 2074 2674 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x15_P2.54mm_Vertical" H 2250 1850 50  0001 C CNN
F 3 "~" H 2250 1850 50  0001 C CNN
	1    2250 1850
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x15_Female J1
U 1 1 60C041A0
P 1200 1850
F 0 "J1" H 1100 1050 50  0000 C CNN
F 1 "Left Pin Strip" H 1023 2676 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x15_P2.54mm_Vertical" H 1200 1850 50  0001 C CNN
F 3 "~" H 1200 1850 50  0001 C CNN
	1    1200 1850
	-1   0    0    -1  
$EndComp
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
Text Notes 5200 3450 0    50   ~ 0
5V
Text Notes 5150 3850 0    50   ~ 0
2.5V
Text Notes 1350 3100 0    50   ~ 0
Connector to Arduino\nNano 33 BLE Sense
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
Wire Wire Line
	1550 3550 1550 3650
$Comp
L Device:L_Small L1
U 1 1 60C00857
P 1650 3550
F 0 "L1" V 1835 3550 50  0000 C CNN
F 1 "4.7uH" V 1743 3550 50  0000 C CNN
F 2 "Inductor_SMD:L_1206_3216Metric_Pad1.42x1.75mm_HandSolder" H 1650 3550 50  0001 C CNN
F 3 "~" H 1650 3550 50  0001 C CNN
	1    1650 3550
	0    -1   -1   0   
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
Entry Wire Line
	1650 1150 1750 1250
Entry Wire Line
	1650 1350 1750 1450
Entry Wire Line
	1650 2250 1750 2350
Entry Wire Line
	1650 2350 1750 2450
Entry Wire Line
	1650 2550 1750 2650
Entry Wire Line
	1850 2550 1750 2650
Entry Wire Line
	1850 2450 1750 2550
Entry Wire Line
	1850 2350 1750 2450
Entry Wire Line
	1850 2250 1750 2350
Entry Wire Line
	1850 1850 1750 1950
Entry Wire Line
	1850 1750 1750 1850
Entry Wire Line
	1850 1650 1750 1750
Entry Wire Line
	1850 1550 1750 1650
Entry Wire Line
	1850 1450 1750 1550
Entry Wire Line
	1850 1350 1750 1450
Entry Wire Line
	1850 1250 1750 1350
Entry Wire Line
	1850 1150 1750 1250
Wire Wire Line
	1850 1150 2050 1150
Wire Wire Line
	2050 1250 1850 1250
Wire Wire Line
	1850 1350 2050 1350
Wire Wire Line
	2050 1450 1850 1450
Wire Wire Line
	1850 1550 2050 1550
Wire Wire Line
	2050 1650 1850 1650
Wire Wire Line
	1850 1750 2050 1750
Wire Wire Line
	2050 1850 1850 1850
Wire Wire Line
	1850 2250 2050 2250
Wire Wire Line
	1850 2350 2050 2350
Wire Wire Line
	1850 2450 2050 2450
Wire Wire Line
	1850 2550 2050 2550
Wire Wire Line
	1650 2550 1400 2550
Wire Wire Line
	1400 2350 1650 2350
Wire Wire Line
	1650 2250 1400 2250
Wire Wire Line
	1400 1350 1650 1350
Wire Wire Line
	1650 1150 1400 1150
Text Label 1450 2350 0    50   ~ 0
RST2
Text Label 1900 2350 0    50   ~ 0
RST
Text Label 1900 2450 0    50   ~ 0
RX
Text Label 1900 2550 0    50   ~ 0
TX
Text Label 1450 2550 0    50   ~ 0
VIN
Text Label 1450 2250 0    50   ~ 0
+5V
Text Label 1450 1350 0    50   ~ 0
AREF
Text Label 1450 1150 0    50   ~ 0
D13
Text Label 1900 2250 0    50   ~ 0
GND
Text Label 1900 1750 0    50   ~ 0
D6
Text Label 1900 1850 0    50   ~ 0
D5
Text Label 1900 1650 0    50   ~ 0
D7
Text Label 1900 1550 0    50   ~ 0
D8
Text Label 1900 1450 0    50   ~ 0
D9
Text Label 1900 1350 0    50   ~ 0
D10
Text Label 1900 1250 0    50   ~ 0
D11
Text Label 1900 1150 0    50   ~ 0
D12
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
Text Label 5150 3300 0    50   ~ 0
Vbat
Text Notes 5150 3200 0    50   ~ 0
1.2V
Entry Bus Bus
	3600 2800 3700 2900
Wire Wire Line
	4450 2350 4200 2350
Text Label 3900 2350 2    50   ~ 0
Vbat
Text Label 4400 2350 2    50   ~ 0
A7
Wire Wire Line
	3900 2350 3700 2350
Entry Bus Bus
	5350 2900 5450 3000
Entry Wire Line
	4450 2350 4550 2450
Entry Wire Line
	3600 2450 3700 2350
Connection ~ 4900 3950
Connection ~ 4900 4350
$Comp
L Device:C_Small C7
U 1 1 60CB87C5
P 4550 4100
F 0 "C7" H 4486 4175 50  0000 C CNN
F 1 "100uF" H 4542 4039 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4550 4100 50  0001 C CNN
F 3 "~" H 4550 4100 50  0001 C CNN
	1    4550 4100
	1    0    0    -1  
$EndComp
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
Text Notes 3750 2700 0    50   ~ 0
Allows measuring\nbattery charge via\nanalog pin A7
Wire Wire Line
	1550 3650 1750 3650
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
L Connector:Conn_01x17_Female J3
U 1 1 60D14FD7
P 3250 1950
F 0 "J3" H 3091 1079 50  0000 L CNN
F 1 "I/O Pin Strip" H 2693 2876 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x17_P2.54mm_Horizontal" H 3250 1950 50  0001 C CNN
F 3 "~" H 3250 1950 50  0001 C CNN
	1    3250 1950
	1    0    0    -1  
$EndComp
Entry Wire Line
	2800 1150 2700 1250
Entry Wire Line
	2800 1250 2700 1350
Entry Wire Line
	2800 1350 2700 1450
Entry Wire Line
	2800 1450 2700 1550
Entry Wire Line
	2800 1750 2700 1850
Entry Wire Line
	2800 1850 2700 1950
Entry Wire Line
	2800 1950 2700 2050
Entry Wire Line
	2800 2050 2700 2150
Entry Wire Line
	2800 2150 2700 2250
Entry Wire Line
	2800 2250 2700 2350
Entry Wire Line
	2800 2350 2700 2450
Entry Wire Line
	2800 2450 2700 2550
Entry Wire Line
	2800 2550 2700 2650
Entry Wire Line
	2800 2650 2700 2750
Entry Wire Line
	2800 2750 2700 2850
Text Label 2850 1150 0    50   ~ 0
GND
Wire Wire Line
	2800 2450 3050 2450
Wire Wire Line
	2800 2350 3050 2350
Wire Wire Line
	2800 2250 3050 2250
Wire Wire Line
	2800 2150 3050 2150
Wire Wire Line
	2800 2050 3050 2050
Wire Wire Line
	2800 1950 3050 1950
Wire Wire Line
	2800 1850 3050 1850
Wire Wire Line
	2800 1750 3050 1750
Wire Wire Line
	2800 2550 3050 2550
Wire Wire Line
	2800 2750 3050 2750
Wire Wire Line
	2800 2650 3050 2650
Wire Wire Line
	2800 1450 3050 1450
Wire Wire Line
	2800 1350 3050 1350
Wire Wire Line
	2800 1250 3050 1250
Wire Wire Line
	2800 1150 3050 1150
Text Label 2850 1250 0    50   ~ 0
GND
Text Label 2850 2450 0    50   ~ 0
A0
Text Label 2850 2350 0    50   ~ 0
A1
Text Label 2850 2250 0    50   ~ 0
A2
Text Label 2850 2150 0    50   ~ 0
A3
Text Label 2850 2050 0    50   ~ 0
A4
Text Label 2850 1950 0    50   ~ 0
A5
Text Label 2850 1850 0    50   ~ 0
A6
Text Label 2850 1750 0    50   ~ 0
A7
Text Label 2850 2750 0    50   ~ 0
D2
Text Label 2850 2650 0    50   ~ 0
D3
Text Label 2850 2550 0    50   ~ 0
D4
Text Label 2850 1350 0    50   ~ 0
V+
Text Label 2850 1450 0    50   ~ 0
V+
Wire Wire Line
	3050 1650 2800 1650
Entry Wire Line
	2700 1650 2800 1550
Entry Wire Line
	2700 1750 2800 1650
Wire Wire Line
	2800 1550 3050 1550
Text Label 2850 1550 0    50   ~ 0
Vref
Text Label 2850 1650 0    50   ~ 0
Vref
$Comp
L Device:C_Small C10
U 1 1 60CB83B2
P 5050 3750
F 0 "C10" H 5150 3900 50  0000 C CNN
F 1 "100uF" H 5313 3834 50  0000 R CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 5050 3750 50  0001 C CNN
F 3 "~" H 5050 3750 50  0001 C CNN
	1    5050 3750
	1    0    0    -1  
$EndComp
Text Notes 5450 1100 2    50   ~ 0
https://psylink.me/c9
$Comp
L Jumper:SolderJumper_2_Open JP2
U 1 1 60F6BC38
P 4050 2350
F 0 "JP2" H 4100 2100 50  0000 R CNN
F 1 "Solder Jumper" H 4350 2200 50  0000 R CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 4050 2350 50  0001 C CNN
F 3 "~" H 4050 2350 50  0001 C CNN
	1    4050 2350
	1    0    0    1   
$EndComp
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
Wire Bus Line
	1850 2900 2700 2900
Connection ~ 2700 2900
Wire Notes Line
	1300 3050 1100 3050
Wire Notes Line
	1100 3050 1100 950 
Wire Notes Line
	2400 950  2400 3050
Wire Notes Line
	2400 3050 2150 3050
Wire Notes Line
	1100 950  2400 950 
Text Notes 2750 3100 0    50   ~ 0
Input/Output\nPin Strip
Wire Notes Line
	2600 3050 2600 950 
Wire Notes Line
	2600 950  3350 950 
Wire Notes Line
	3350 950  3350 3050
Text Label 4300 1500 0    50   ~ 0
D6
Text Label 3750 1500 0    50   ~ 0
D5
Text Label 3750 1650 0    50   ~ 0
GND
Entry Wire Line
	3600 1750 3700 1650
Entry Wire Line
	3600 1600 3700 1500
Entry Wire Line
	4450 1500 4550 1600
Wire Wire Line
	3700 1650 4050 1650
Wire Wire Line
	4300 1500 4450 1500
Wire Wire Line
	3700 1500 3800 1500
$Comp
L Jumper:Jumper_3_Open JP1
U 1 1 6112D134
P 4050 1500
F 0 "JP1" H 4050 1724 50  0000 C CNN
F 1 "Configuration Jumper" H 4050 1633 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 4050 1500 50  0001 C CNN
F 3 "~" H 4050 1500 50  0001 C CNN
	1    4050 1500
	1    0    0    -1  
$EndComp
Text Notes 3650 1900 0    50   ~ 0
Multipurpose jumpers,\nsoftware-configurable
Wire Notes Line
	3500 1200 4650 1200
Wire Notes Line
	3500 1200 3500 3050
Wire Notes Line
	4650 1200 4650 3050
Text Notes 3900 3100 0    50   ~ 0
Jumpers
Wire Notes Line
	3500 3050 3900 3050
Wire Notes Line
	4250 3050 4650 3050
Connection ~ 3300 3550
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
Wire Wire Line
	3750 4300 3750 4350
Wire Wire Line
	3750 4100 3750 3850
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
	4550 3550 4550 4000
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
Wire Notes Line
	4250 4550 4950 4550
Wire Notes Line
	3100 3050 3350 3050
Wire Notes Line
	2750 3050 2600 3050
Wire Wire Line
	3300 3400 3300 3550
Entry Wire Line
	5350 3300 5450 3200
Entry Wire Line
	5350 3550 5450 3450
Entry Wire Line
	5350 3950 5450 3850
Entry Wire Line
	5350 4350 5450 4250
Wire Wire Line
	4900 3950 5350 3950
Wire Wire Line
	5350 3550 5050 3550
Wire Wire Line
	5050 3550 5050 3650
Wire Wire Line
	4900 4350 5050 4350
Connection ~ 5050 4350
Wire Wire Line
	5050 4350 5350 4350
Wire Notes Line
	4950 3250 4950 4550
Wire Wire Line
	5050 3400 5050 3550
Wire Wire Line
	3300 3400 5050 3400
Connection ~ 5050 3550
Wire Wire Line
	5050 3850 5050 4350
Wire Wire Line
	4550 4200 4550 4250
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
Wire Wire Line
	1250 3300 5350 3300
Wire Bus Line
	4550 1600 4550 2800
Wire Bus Line
	2700 2900 5350 2900
Wire Bus Line
	3600 1600 3600 2800
Wire Bus Line
	5450 3000 5450 4250
Wire Bus Line
	1750 1250 1750 2800
Wire Bus Line
	2700 1250 2700 2900
$EndSCHEMATC
