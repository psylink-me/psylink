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
L Connector:Conn_01x01_Female GND
U 1 1 6088CF1C
P 4150 4100
F 0 "GND" H 3850 4000 50  0000 L BNN
F 1 "Electrode" H 3850 3950 50  0000 L CNN
F 2 "" H 4150 4100 50  0001 C CNN
F 3 "~" H 4150 4100 50  0001 C CNN
	1    4150 4100
	1    0    0    -1  
$EndComp
Text Notes 4200 4450 2    50   ~ 0
https://psylink.me/c7
$Comp
L MCU_Module:Arduino_Nano_v3.x A?
U 1 1 60849281
P 1600 2150
F 0 "A?" H 1600 1061 50  0001 C CNN
F 1 "Arduino Nano 33 BLE Sense" H 650 1450 50  0001 C BNN
F 2 "Module:Arduino_Nan" H 1600 2150 50  0001 C CIN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 1600 2150 50  0001 C CNN
	1    1600 2150
	1    0    0    -1  
$EndComp
Text Notes 2700 1300 0    50   ~ 0
Signal pocessing module\n(one per electrode)
Wire Wire Line
	1700 1150 1700 1100
Wire Wire Line
	2350 2150 2100 2150
Wire Wire Line
	2100 2250 2350 2250
Wire Wire Line
	2350 2350 2100 2350
Wire Wire Line
	2100 2450 2350 2450
Wire Wire Line
	2100 2550 2350 2550
Wire Wire Line
	2100 2650 2350 2650
Wire Wire Line
	2100 2750 2350 2750
Wire Wire Line
	2100 2850 2350 2850
Wire Wire Line
	2350 2950 2100 2950
Wire Wire Line
	2100 2950 2100 3150
Wire Wire Line
	2100 3150 1700 3150
Wire Wire Line
	1700 1100 2150 1100
Wire Wire Line
	2150 1100 2150 2050
Wire Wire Line
	2150 2050 2350 2050
Text Label 2200 2050 0    50   ~ 0
V+
Text Label 2200 2150 0    50   ~ 0
A0
Text Label 2200 2250 0    50   ~ 0
A1
Text Label 2200 2350 0    50   ~ 0
A2
Text Label 2200 2450 0    50   ~ 0
A3
Text Label 2200 2550 0    50   ~ 0
A4
Text Label 2200 2650 0    50   ~ 0
A5
Text Label 2200 2750 0    50   ~ 0
A6
Text Label 2200 2850 0    50   ~ 0
A7
Text Label 2200 2950 0    50   ~ 0
GND
$Comp
L Device:R_Small R?
U 1 1 60ABC396
P 2900 4150
F 0 "R?" H 2959 4196 50  0001 L CNN
F 1 "1M/1%" V 2959 4150 50  0000 C TNN
F 2 "" H 2900 4150 50  0001 C CNN
F 3 "~" H 2900 4150 50  0001 C CNN
	1    2900 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 60ABC39C
P 2900 3650
F 0 "R?" H 2959 3696 50  0001 L CNN
F 1 "1M/1%" V 2959 3650 50  0000 C TNN
F 2 "" H 2900 3650 50  0001 C CNN
F 3 "~" H 2900 3650 50  0001 C CNN
	1    2900 3650
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM324 U?
U 5 1 60AC745E
P 3400 3900
F 0 "U?" H 3358 3946 50  0001 L CNN
F 1 "LM324" H 3358 3855 50  0001 L CNN
F 2 "" H 3350 4000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 3450 4100 50  0001 C CNN
	5    3400 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 3500 3300 3600
Wire Wire Line
	2900 3550 2900 3500
Wire Wire Line
	2700 3500 2900 3500
Wire Wire Line
	2700 4300 2900 4300
Wire Wire Line
	2900 4250 2900 4300
Wire Wire Line
	2900 3750 2900 3800
Wire Wire Line
	2900 3500 3300 3500
Connection ~ 2900 3500
Wire Wire Line
	2900 3800 3100 3800
Connection ~ 2900 3800
Wire Wire Line
	2900 3800 2900 4050
Wire Wire Line
	2900 4300 3300 4300
Connection ~ 2900 4300
Wire Wire Line
	3100 4000 3100 4250
Wire Wire Line
	3300 4200 3300 4300
Connection ~ 3300 4300
Connection ~ 3300 3500
Wire Wire Line
	3800 3700 3800 3900
Text Label 3800 3700 0    50   ~ 0
Vref
Text Label 3800 3600 0    50   ~ 0
GND
Text Label 3850 3500 0    50   ~ 0
V+
Wire Wire Line
	3300 3500 3950 3500
Wire Wire Line
	3800 3700 3950 3700
Connection ~ 3800 3900
Wire Wire Line
	3800 3900 3800 4100
Wire Wire Line
	3800 4100 3950 4100
$Comp
L Connector:Conn_01x10_Female J?
U 1 1 609DCCA7
P 2550 2450
F 0 "J?" H 2578 2426 50  0001 L CNN
F 1 "Pin Strip" V 2578 2380 50  0000 C TNN
F 2 "" H 2550 2450 50  0001 C CNN
F 3 "~" H 2550 2450 50  0001 C CNN
	1    2550 2450
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Female J?
U 1 1 60AE5E63
P 4150 3600
F 0 "J?" H 4178 3626 50  0001 L CNN
F 1 "Pin Strip" H 3800 3850 50  0000 L BNN
F 2 "" H 4150 3600 50  0001 C CNN
F 3 "~" H 4150 3600 50  0001 C CNN
	1    4150 3600
	1    0    0    -1  
$EndComp
Text Notes 2350 3300 0    50   ~ 0
Power supply module
Wire Wire Line
	3800 4250 3800 4100
Wire Wire Line
	3100 4250 3800 4250
Connection ~ 3800 4100
Wire Wire Line
	3800 3900 3700 3900
Wire Wire Line
	3300 4300 3750 4300
Wire Wire Line
	3750 3600 3950 3600
Wire Wire Line
	3750 4300 3750 3600
$Comp
L Amplifier_Operational:LM324 U1
U 1 1 60AC7464
P 3400 3900
F 0 "U1" H 3400 4200 50  0000 L TNN
F 1 "LM324" H 3400 4100 50  0000 L TNN
F 2 "" H 3350 4000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 3450 4100 50  0001 C CNN
	1    3400 3900
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Switching:TPS61220DCK U?
U 1 1 60BEF8B9
P 1950 3600
F 0 "U?" H 1950 3967 50  0001 C CNN
F 1 "TPS61220DCK" H 1950 3875 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:Texas_R-PDSO-G6" H 1950 2800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tps61220.pdf" H 1950 3450 50  0001 C CNN
	1    1950 3600
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_DPST_x2 SW?
U 1 1 60BF481E
P 1100 3800
F 0 "SW?" H 1100 4035 50  0001 C CNN
F 1 "SW_DPST_x2" H 1100 3944 50  0001 C CNN
F 2 "" H 1100 3800 50  0001 C CNN
F 3 "~" H 1100 3800 50  0001 C CNN
	1    1100 3800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1350 3600 1100 3600
Wire Wire Line
	1550 3700 1550 3600
Connection ~ 1550 3600
$Comp
L Device:L_Small L?
U 1 1 60C00857
P 1450 3500
F 0 "L?" V 1635 3500 50  0001 C CNN
F 1 "4.7uH" V 1543 3500 50  0000 C CNN
F 2 "" H 1450 3500 50  0001 C CNN
F 3 "~" H 1450 3500 50  0001 C CNN
	1    1450 3500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1350 3500 1350 3600
Wire Wire Line
	1350 3600 1550 3600
Connection ~ 1350 3600
$Comp
L Device:R_Small R?
U 1 1 60C054D1
P 2400 3600
F 0 "R?" H 2459 3646 50  0001 L CNN
F 1 "1M/1%" V 2500 3550 50  0000 C TNN
F 2 "" H 2400 3600 50  0001 C CNN
F 3 "~" H 2400 3600 50  0001 C CNN
	1    2400 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 3700 2400 3700
Connection ~ 2400 3500
Wire Wire Line
	2400 3500 2350 3500
$Comp
L Device:R_Small R?
U 1 1 60C0938B
P 2400 4100
F 0 "R?" H 2459 4146 50  0001 L CNN
F 1 "110K/1%" V 2500 4100 50  0000 C TNN
F 2 "" H 2400 4100 50  0001 C CNN
F 3 "~" H 2400 4100 50  0001 C CNN
	1    2400 4100
	1    0    0    -1  
$EndComp
Connection ~ 2400 3700
Wire Wire Line
	2400 4300 1950 4300
Wire Wire Line
	1350 4050 1350 4300
Connection ~ 1350 4300
Wire Wire Line
	1350 4300 1100 4300
Wire Wire Line
	2400 4300 2400 4200
Wire Wire Line
	2400 3700 2400 4000
Wire Wire Line
	2700 3850 2700 3500
Wire Wire Line
	2400 3500 2700 3500
Wire Wire Line
	2700 4050 2700 4300
Wire Wire Line
	2700 4300 2400 4300
Connection ~ 2400 4300
Wire Wire Line
	1950 3900 1950 4300
Connection ~ 1950 4300
Wire Wire Line
	1950 4300 1350 4300
$Comp
L Connector:TestPoint_Probe TP?
U 1 1 60C1B779
P 2700 3500
F 0 "TP?" H 2853 3601 50  0001 L CNN
F 1 "5V" H 2850 3600 50  0000 L CNN
F 2 "" H 2900 3500 50  0001 C CNN
F 3 "~" H 2900 3500 50  0001 C CNN
	1    2700 3500
	1    0    0    -1  
$EndComp
Connection ~ 2700 3500
$Comp
L Device:Battery_Cell BT?
U 1 1 60BF138E
P 1100 4200
F 0 "BT?" H 1218 4296 50  0001 L CNN
F 1 "1.2V" H 1150 4200 50  0000 L CNN
F 2 "" V 1100 4260 50  0001 C CNN
F 3 "~" V 1100 4260 50  0001 C CNN
	1    1100 4200
	1    0    0    -1  
$EndComp
Connection ~ 2700 4300
Connection ~ 2900 2650
Wire Wire Line
	3850 2300 3850 2650
Wire Wire Line
	2900 2650 3850 2650
Wire Wire Line
	2800 2050 2800 2650
Wire Wire Line
	2900 2650 2900 2600
Wire Wire Line
	2800 2650 2900 2650
Connection ~ 2900 2350
Wire Wire Line
	2900 2400 2900 2350
$Comp
L Device:R_Small R?
U 1 1 60B97881
P 2900 2500
F 0 "R?" H 2959 2546 50  0001 L CNN
F 1 "1K/5%" H 2724 2535 50  0000 C TNN
F 2 "" H 2900 2500 50  0001 C CNN
F 3 "~" H 2900 2500 50  0001 C CNN
	1    2900 2500
	-1   0    0    1   
$EndComp
Wire Wire Line
	2900 1850 2900 2350
Wire Wire Line
	3050 2350 2900 2350
Wire Wire Line
	3500 1750 3500 2350
Wire Wire Line
	3500 2350 3250 2350
Wire Wire Line
	3100 2200 3700 2200
Wire Wire Line
	3100 2200 3100 2050
Wire Wire Line
	4000 2300 3850 2300
Text Label 3850 2300 0    50   ~ 0
Vref
Wire Wire Line
	2800 1650 2900 1650
Wire Wire Line
	2800 1650 2800 1850
Text Notes 3220 1658 0    50   ~ 0
Non-inverting\n  Amplifier,\n Gain = 221
Wire Wire Line
	3800 1400 3800 2000
Wire Wire Line
	3100 1400 3800 1400
Wire Wire Line
	3100 1450 3100 1400
Connection ~ 3700 2200
$Comp
L Device:R_Small R?
U 1 1 60A4EB85
P 2800 1950
F 0 "R?" H 2859 1996 50  0001 L CNN
F 1 "560K/1%" H 3000 1850 50  0000 C TNN
F 2 "" H 2800 1950 50  0001 C CNN
F 3 "~" H 2800 1950 50  0001 C CNN
	1    2800 1950
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x01_Female J?
U 1 1 60B84C8E
P 2500 1650
F 0 "J?" H 2528 1676 50  0001 L CNN
F 1 "Electrode" H 2300 1550 50  0000 L CNN
F 2 "" H 2500 1650 50  0001 C CNN
F 3 "~" H 2500 1650 50  0001 C CNN
	1    2500 1650
	-1   0    0    1   
$EndComp
$Comp
L Amplifier_Operational:LM324 U2
U 1 1 60B8B2F6
P 3200 1750
F 0 "U2" H 3350 1650 50  0000 C CNN
F 1 "LM324" H 3300 1550 50  0000 C CNN
F 2 "" H 3150 1850 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 3250 1950 50  0001 C CNN
	1    3200 1750
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM324 U?
U 5 1 60B8C1AA
P 3200 1750
F 0 "U?" H 3158 1796 50  0001 L CNN
F 1 "LM324" H 3158 1705 50  0001 L CNN
F 2 "" H 3150 1850 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 3250 1950 50  0001 C CNN
	5    3200 1750
	1    0    0    -1  
$EndComp
Connection ~ 3500 1750
Wire Wire Line
	3500 1750 4000 1750
Wire Wire Line
	3800 2000 3800 2100
Connection ~ 3800 2000
Wire Wire Line
	3700 2000 3800 2000
Wire Wire Line
	3700 2200 4000 2200
$Comp
L Device:R_Small R?
U 1 1 60B9EE88
P 3150 2350
F 0 "R?" H 3209 2396 50  0001 L CNN
F 1 "220K/5%" V 3050 2350 50  0000 C TNN
F 2 "" H 3150 2350 50  0001 C CNN
F 3 "~" H 3150 2350 50  0001 C CNN
	1    3150 2350
	0    1    1    0   
$EndComp
Wire Wire Line
	3800 2100 4000 2100
$Comp
L Device:C_Small C?
U 1 1 60A9958B
P 3700 2100
F 0 "C?" V 3471 2100 50  0001 C CNN
F 1 "100nF" H 3696 2231 50  0000 C BNN
F 2 "" H 3700 2100 50  0001 C CNN
F 3 "~" H 3700 2100 50  0001 C CNN
	1    3700 2100
	-1   0    0    1   
$EndComp
Text Label 3850 2200 0    50   ~ 0
GND
Text Label 3900 2100 0    50   ~ 0
V+
Text Label 3900 1750 0    50   ~ 0
A0
$Comp
L Connector:Conn_01x01_Female J?
U 1 1 609EE752
P 4200 1750
F 0 "J?" H 4228 1776 50  0001 L CNN
F 1 "Signal" H 4000 1900 50  0000 L CNN
F 2 "" H 4200 1750 50  0001 C CNN
F 3 "~" H 4200 1750 50  0001 C CNN
	1    4200 1750
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Female J?
U 1 1 609E9F94
P 4200 2200
F 0 "J?" H 4228 2226 50  0001 L CNN
F 1 "Pin Strip" H 3900 1950 50  0000 L BNN
F 2 "" H 4200 2200 50  0001 C CNN
F 3 "~" H 4200 2200 50  0001 C CNN
	1    4200 2200
	1    0    0    -1  
$EndComp
Text Notes 1400 2250 0    50   ~ 0
Arduino\nNano 33\nBLE Sense
$Comp
L Device:C_Small C?
U 1 1 60CBD3AB
P 2700 3950
F 0 "C?" V 2471 3950 50  0001 C CNN
F 1 "10uF" V 2600 4050 50  0000 R CNN
F 2 "" H 2700 3950 50  0001 C CNN
F 3 "~" H 2700 3950 50  0001 C CNN
	1    2700 3950
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60CBE5F6
P 1350 3950
F 0 "C?" V 1121 3950 50  0001 C CNN
F 1 "10uF" V 1250 4050 50  0000 R CNN
F 2 "" H 1350 3950 50  0001 C CNN
F 3 "~" H 1350 3950 50  0001 C CNN
	1    1350 3950
	-1   0    0    1   
$EndComp
Wire Wire Line
	1350 3600 1350 3850
Connection ~ 2800 1650
Wire Wire Line
	2700 1650 2800 1650
$Comp
L Connector:TestPoint_Probe TP?
U 1 1 60A4C531
P 3800 3900
F 0 "TP?" H 3953 4001 50  0001 L CNN
F 1 "2.5V" H 3950 4000 50  0000 L CNN
F 2 "" H 4000 3900 50  0001 C CNN
F 3 "~" H 4000 3900 50  0001 C CNN
	1    3800 3900
	1    0    0    -1  
$EndComp
$EndSCHEMATC
