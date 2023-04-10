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
P 4550 2950
F 0 "GND" H 4578 2976 50  0000 L BNN
F 1 "Electrode" H 4578 2930 50  0000 L CNN
F 2 "" H 4550 2950 50  0001 C CNN
F 3 "~" H 4550 2950 50  0001 C CNN
	1    4550 2950
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint_Probe TP?
U 1 1 60A4C531
P 4200 2750
F 0 "TP?" H 4353 2851 50  0001 L CNN
F 1 "3V" H 4352 2805 50  0000 L CNN
F 2 "" H 4400 2750 50  0001 C CNN
F 3 "~" H 4400 2750 50  0001 C CNN
	1    4200 2750
	1    0    0    -1  
$EndComp
Text Notes 4950 3350 2    50   ~ 0
https://psylink.me/c6
$Comp
L MCU_Module:Arduino_Nano_v3.x A?
U 1 1 60849281
P 1600 2150
F 0 "A?" H 1600 1061 50  0001 C CNN
F 1 "Arduino Nano 33 BLE Sense" H 1600 970 50  0000 C BNN
F 2 "Module:Arduino_Nan" H 1600 2150 50  0001 C CIN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 1600 2150 50  0001 C CNN
	1    1600 2150
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_DPST_x2 SW?
U 1 1 6090AB67
P 2900 2550
F 0 "SW?" H 2900 2785 50  0001 C CNN
F 1 "SW_DPST_x2" H 2900 2694 50  0001 C CNN
F 2 "" H 2900 2550 50  0001 C CNN
F 3 "~" H 2900 2550 50  0001 C CNN
	1    2900 2550
	0    -1   -1   0   
$EndComp
Text Notes 3700 1450 0    50   ~ 0
Gain = 50
$Comp
L Amplifier_Instrumentation:INA128 U?
U 1 1 6089F0CF
P 3650 1600
F 0 "U?" H 4094 1646 50  0001 L CNN
F 1 "INA128" H 4094 1555 50  0000 R TNN
F 2 "" H 3750 1600 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ina128.pdf" H 3750 1600 50  0001 C CNN
	1    3650 1600
	1    0    0    -1  
$EndComp
Text Notes 2550 1150 0    50   ~ 0
Signal pocessing module (one per electrode pair)
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
L Connector:Conn_01x03_Female J?
U 1 1 609E9F94
P 4550 2000
F 0 "J?" H 4578 2026 50  0001 L CNN
F 1 "Pin Strip" H 4578 1935 50  0000 L BNN
F 2 "" H 4550 2000 50  0001 C CNN
F 3 "~" H 4550 2000 50  0001 C CNN
	1    4550 2000
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Female J?
U 1 1 609EE752
P 4550 1600
F 0 "J?" H 4578 1626 50  0001 L CNN
F 1 "Signal" H 4578 1580 50  0000 L CNN
F 2 "" H 4550 1600 50  0001 C CNN
F 3 "~" H 4550 1600 50  0001 C CNN
	1    4550 1600
	1    0    0    -1  
$EndComp
Text Label 4250 1600 0    50   ~ 0
A0
Text Label 4250 1900 0    50   ~ 0
V+
Text Label 4200 2000 0    50   ~ 0
GND
Text Label 4200 2100 0    50   ~ 0
Vref
$Comp
L Device:R_Small R?
U 1 1 60A30E37
P 3300 1600
F 0 "R?" H 3359 1646 50  0001 L CNN
F 1 "1K/1%" V 3359 1600 50  0000 C TNN
F 2 "" H 3300 1600 50  0001 C CNN
F 3 "~" H 3300 1600 50  0001 C CNN
	1    3300 1600
	-1   0    0    1   
$EndComp
Wire Wire Line
	3300 1500 3350 1500
Wire Wire Line
	3350 1700 3300 1700
$Comp
L Device:R_Small R?
U 1 1 60A49475
P 2950 1950
F 0 "R?" H 3009 1996 50  0001 L CNN
F 1 "1M/1%" V 3009 1950 50  0000 C TNN
F 2 "" H 2950 1950 50  0001 C CNN
F 3 "~" H 2950 1950 50  0001 C CNN
	1    2950 1950
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 60A514AB
P 2800 1500
F 0 "C?" V 2571 1500 50  0001 C CNN
F 1 "100pF" V 2663 1500 50  0000 C CNN
F 2 "" H 2800 1500 50  0001 C CNN
F 3 "~" H 2800 1500 50  0001 C CNN
	1    2800 1500
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 60A4EB85
P 3050 1950
F 0 "R?" H 3109 1996 50  0001 L CNN
F 1 "1M/1%" V 3109 1950 50  0000 C TNN
F 2 "" H 3050 1950 50  0001 C CNN
F 3 "~" H 3050 1950 50  0001 C CNN
	1    3050 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 1400 3050 1400
Connection ~ 3050 1400
Wire Wire Line
	3050 1400 3050 1850
Wire Wire Line
	3350 1800 2950 1800
Wire Wire Line
	2950 1800 2950 1850
$Comp
L Device:C_Small C?
U 1 1 60A4694A
P 2950 1400
F 0 "C?" V 2721 1400 50  0001 C CNN
F 1 "100pF" V 2813 1400 50  0000 C CNN
F 2 "" H 2950 1400 50  0001 C CNN
F 3 "~" H 2950 1400 50  0001 C CNN
	1    2950 1400
	0    1    1    0   
$EndComp
Wire Wire Line
	2700 1400 2850 1400
Wire Wire Line
	2900 1500 2950 1500
Wire Wire Line
	2950 1500 2950 1800
Connection ~ 2950 1800
$Comp
L Device:C_Small C?
U 1 1 60A9958B
P 4000 1800
F 0 "C?" V 3771 1800 50  0001 C CNN
F 1 "100nF" V 4137 1800 50  0000 C BNN
F 2 "" H 4000 1800 50  0001 C CNN
F 3 "~" H 4000 1800 50  0001 C CNN
	1    4000 1800
	0    1    1    0   
$EndComp
Wire Wire Line
	2950 2050 2950 2100
$Comp
L Connector:Conn_01x02_Female J?
U 1 1 60A5C264
P 2500 1500
F 0 "J?" V 2438 1312 50  0001 R CNN
F 1 "Electrodes" H 2392 1312 50  0000 C TNN
F 2 "" H 2500 1500 50  0001 C CNN
F 3 "~" H 2500 1500 50  0001 C CNN
	1    2500 1500
	-1   0    0    1   
$EndComp
$Comp
L Device:Battery BT?
U 1 1 6090704F
P 2900 2950
F 0 "BT?" H 3008 2996 50  0001 L CNN
F 1 "6V" H 3008 2950 50  0000 C CNN
F 2 "" V 2900 3010 50  0001 C CNN
F 3 "~" V 2900 3010 50  0001 C CNN
	1    2900 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 60ABC396
P 3300 3000
F 0 "R?" H 3359 3046 50  0001 L CNN
F 1 "1M/1%" V 3359 3000 50  0000 C TNN
F 2 "" H 3300 3000 50  0001 C CNN
F 3 "~" H 3300 3000 50  0001 C CNN
	1    3300 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 60ABC39C
P 3300 2500
F 0 "R?" H 3359 2546 50  0001 L CNN
F 1 "1M/1%" V 3359 2500 50  0000 C TNN
F 2 "" H 3300 2500 50  0001 C CNN
F 3 "~" H 3300 2500 50  0001 C CNN
	1    3300 2500
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM324 U?
U 5 1 60AC745E
P 3800 2750
F 0 "U?" H 3758 2796 50  0001 L CNN
F 1 "LM324" H 3758 2705 50  0001 L CNN
F 2 "" H 3750 2850 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 3850 2950 50  0001 C CNN
	5    3800 2750
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM324 U1
U 1 1 60AC7464
P 3800 2750
F 0 "U1" H 3800 3117 50  0000 L TNN
F 1 "LM324" H 3800 3026 50  0000 L TNN
F 2 "" H 3750 2850 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2902-n.pdf" H 3850 2950 50  0001 C CNN
	1    3800 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 2350 3700 2450
Wire Wire Line
	3300 2400 3300 2350
Wire Wire Line
	2900 3150 3100 3150
Wire Wire Line
	2900 2350 3100 2350
$Comp
L Device:CP_Small C?
U 1 1 60AFD9F6
P 3100 2700
F 0 "C?" H 3188 2746 50  0001 L CNN
F 1 "10uF" V 3188 2700 50  0000 C TNN
F 2 "" H 3100 2700 50  0001 C CNN
F 3 "~" H 3100 2700 50  0001 C CNN
	1    3100 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 2600 3100 2350
Connection ~ 3100 2350
Wire Wire Line
	3100 2800 3100 3150
Connection ~ 3100 3150
Wire Wire Line
	3100 2350 3300 2350
Wire Wire Line
	3100 3150 3300 3150
Wire Wire Line
	3300 3100 3300 3150
Wire Wire Line
	3300 2600 3300 2650
Wire Wire Line
	3300 2350 3700 2350
Connection ~ 3300 2350
Wire Wire Line
	3300 2650 3500 2650
Connection ~ 3300 2650
Wire Wire Line
	3300 2650 3300 2900
Wire Wire Line
	3300 3150 3700 3150
Connection ~ 3300 3150
Wire Wire Line
	3500 2850 3500 3100
Wire Wire Line
	3700 3050 3700 3150
Connection ~ 3700 3150
Connection ~ 3700 2350
Wire Wire Line
	4200 2550 4200 2750
Text Label 4200 2550 0    50   ~ 0
Vref
Text Label 4200 2450 0    50   ~ 0
GND
Text Label 4250 2350 0    50   ~ 0
V+
Wire Wire Line
	3700 2350 4350 2350
Wire Wire Line
	4200 2550 4350 2550
Connection ~ 4200 2750
Wire Wire Line
	4200 2750 4200 2950
Wire Wire Line
	4200 2950 4350 2950
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
P 4550 2450
F 0 "J?" H 4578 2476 50  0001 L CNN
F 1 "Pin Strip" H 4578 2385 50  0000 L BNN
F 2 "" H 4550 2450 50  0001 C CNN
F 3 "~" H 4550 2450 50  0001 C CNN
	1    4550 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 1300 4150 1300
Wire Wire Line
	4050 1600 4350 1600
Wire Wire Line
	3750 2100 4350 2100
Wire Wire Line
	3750 1900 3750 2100
Wire Wire Line
	4150 1900 4350 1900
Wire Wire Line
	3650 1900 3650 2000
Connection ~ 3750 2100
Wire Wire Line
	2950 2100 3050 2100
Connection ~ 3050 2100
Wire Wire Line
	3050 2100 3050 2050
Wire Wire Line
	3050 2100 3750 2100
Text Notes 3050 2300 0    50   ~ 0
Power supply module
Wire Wire Line
	4200 3100 4200 2950
Wire Wire Line
	3500 3100 4200 3100
Connection ~ 4200 2950
Wire Wire Line
	4200 2750 4100 2750
Wire Wire Line
	3700 3150 4150 3150
Wire Wire Line
	4150 2450 4350 2450
Wire Wire Line
	4150 3150 4150 2450
Wire Wire Line
	4150 1300 4150 1800
Wire Wire Line
	3650 2000 3850 2000
Wire Wire Line
	3900 1800 3850 1800
Wire Wire Line
	3850 1800 3850 2000
Connection ~ 3850 2000
Wire Wire Line
	3850 2000 4350 2000
Wire Wire Line
	4100 1800 4150 1800
Connection ~ 4150 1800
Wire Wire Line
	4150 1800 4150 1900
$EndSCHEMATC
