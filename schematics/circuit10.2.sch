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
Wire Wire Line
	1500 1850 1750 1850
Connection ~ 1500 1850
Connection ~ 1500 1650
Wire Wire Line
	1450 1850 1500 1850
$Comp
L Device:R_Small R2
U 1 1 6095A52B
P 1500 1750
F 0 "R2" V 1500 1750 39  0000 C CNN
F 1 "1M/1%" H 1600 1600 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1430 1750 50  0001 C CNN
F 3 "~" H 1500 1750 50  0001 C CNN
	1    1500 1750
	1    0    0    -1  
$EndComp
Text Label 1100 1850 0    50   ~ 0
in2
Text Label 2500 1650 0    50   ~ 0
out1
Wire Wire Line
	2600 1650 2450 1650
Wire Wire Line
	1250 1850 1100 1850
Wire Wire Line
	1250 1450 1100 1450
Text Label 1100 1450 0    50   ~ 0
in1
Entry Wire Line
	1000 1950 1100 1850
Entry Wire Line
	1000 1550 1100 1450
$Comp
L power:GNDS #PWR013
U 1 1 608F17B2
P 2150 1950
F 0 "#PWR013" H 2150 1700 50  0001 C CNN
F 1 "GNDS" V 2100 1750 50  0000 C CNN
F 2 "" H 2150 1950 50  0001 C CNN
F 3 "" H 2150 1950 50  0001 C CNN
	1    2150 1950
	0    -1   -1   0   
$EndComp
Connection ~ 2050 1350
Wire Wire Line
	2150 1350 2050 1350
Wire Wire Line
	1500 1450 1750 1450
Wire Wire Line
	1400 1650 1500 1650
Connection ~ 1500 1450
Wire Wire Line
	2350 1350 2400 1350
$Comp
L Device:C_Small C9
U 1 1 608CA25E
P 2250 1350
F 0 "C9" V 2350 1350 50  0000 C CNN
F 1 "100nF" V 2100 1350 50  0000 C TNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2288 1200 50  0001 C CNN
F 3 "~" H 2250 1350 50  0001 C CNN
	1    2250 1350
	0    -1   -1   0   
$EndComp
$Comp
L power:Earth #PWR017
U 1 1 608D13B5
P 2400 1350
F 0 "#PWR017" H 2400 1100 50  0001 C CNN
F 1 "Earth" H 2400 1200 50  0001 C CNN
F 2 "" H 2400 1350 50  0001 C CNN
F 3 "~" H 2400 1350 50  0001 C CNN
	1    2400 1350
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Instrumentation:INA128 U1
U 1 1 6089F0CF
P 2050 1650
F 0 "U1" H 2300 1550 50  0000 L CNN
F 1 "INA128" H 2350 1500 50  0000 C TNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 2150 1650 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ina128.pdf" H 2150 1650 50  0001 C CNN
	1    2050 1650
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR06
U 1 1 608D7F4C
P 2050 1950
F 0 "#PWR06" H 2050 1700 50  0001 C CNN
F 1 "Earth" H 2050 1800 50  0001 C CNN
F 2 "" H 2050 1950 50  0001 C CNN
F 3 "~" H 2050 1950 50  0001 C CNN
	1    2050 1950
	-1   0    0    -1  
$EndComp
$Comp
L power:VCC #PWR05
U 1 1 614556C0
P 2050 1350
F 0 "#PWR05" H 2050 1200 50  0001 C CNN
F 1 "VCC" H 2050 1500 50  0000 C CNN
F 2 "" H 2050 1350 50  0001 C CNN
F 3 "" H 2050 1350 50  0001 C CNN
	1    2050 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 1450 1500 1450
$Comp
L Device:R_Small R9
U 1 1 608BC652
P 1700 1650
F 0 "R9" V 1700 1650 39  0000 C CNN
F 1 "100/1%" V 1600 1650 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1630 1650 50  0001 C CNN
F 3 "~" H 1700 1650 50  0001 C CNN
	1    1700 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 1750 1750 1750
Wire Wire Line
	1700 1550 1750 1550
$Comp
L power:GNDS #PWR01
U 1 1 608F6785
P 1400 1650
F 0 "#PWR01" H 1400 1400 50  0001 C CNN
F 1 "GNDS" H 1400 1500 50  0000 C CNN
F 2 "" H 1400 1650 50  0001 C CNN
F 3 "" H 1400 1650 50  0001 C CNN
	1    1400 1650
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C1
U 1 1 6093EE1D
P 1350 1450
F 0 "C1" V 1450 1450 50  0000 C CNN
F 1 "100pF" V 1500 1450 50  0000 C TNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1388 1300 50  0001 C CNN
F 3 "~" H 1350 1450 50  0001 C CNN
	1    1350 1450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R1
U 1 1 60941D1F
P 1500 1550
F 0 "R1" V 1500 1550 39  0000 C CNN
F 1 "1M/1%" H 1600 1750 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1430 1550 50  0001 C CNN
F 3 "~" H 1500 1550 50  0001 C CNN
	1    1500 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 6095A525
P 1350 1850
F 0 "C2" V 1450 1850 50  0000 C CNN
F 1 "100pF" V 1500 1850 50  0000 C TNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1388 1700 50  0001 C CNN
F 3 "~" H 1350 1850 50  0001 C CNN
	1    1350 1850
	0    1    1    0   
$EndComp
Wire Wire Line
	1500 2800 1750 2800
Connection ~ 1500 2800
Connection ~ 1500 2600
Wire Wire Line
	1450 2800 1500 2800
$Comp
L Device:R_Small R4
U 1 1 614840A0
P 1500 2700
F 0 "R4" V 1500 2700 39  0000 C CNN
F 1 "1M/1%" H 1600 2550 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1430 2700 50  0001 C CNN
F 3 "~" H 1500 2700 50  0001 C CNN
	1    1500 2700
	1    0    0    -1  
$EndComp
Text Label 2500 2600 0    50   ~ 0
out2
Wire Wire Line
	2600 2600 2450 2600
Wire Wire Line
	1250 2800 1100 2800
Wire Wire Line
	1250 2400 1100 2400
Entry Wire Line
	1000 2900 1100 2800
Entry Wire Line
	1000 2500 1100 2400
$Comp
L power:GNDS #PWR014
U 1 1 614840AF
P 2150 2900
F 0 "#PWR014" H 2150 2650 50  0001 C CNN
F 1 "GNDS" V 2100 2700 50  0000 C CNN
F 2 "" H 2150 2900 50  0001 C CNN
F 3 "" H 2150 2900 50  0001 C CNN
	1    2150 2900
	0    -1   -1   0   
$EndComp
Connection ~ 2050 2300
Wire Wire Line
	2150 2300 2050 2300
Wire Wire Line
	1500 2400 1750 2400
Wire Wire Line
	1400 2600 1500 2600
Connection ~ 1500 2400
Wire Wire Line
	2350 2300 2400 2300
$Comp
L Device:C_Small C10
U 1 1 614840BB
P 2250 2300
F 0 "C10" V 2350 2300 50  0000 C CNN
F 1 "100nF" V 2100 2300 50  0000 C TNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2288 2150 50  0001 C CNN
F 3 "~" H 2250 2300 50  0001 C CNN
	1    2250 2300
	0    -1   -1   0   
$EndComp
$Comp
L power:Earth #PWR018
U 1 1 614840C1
P 2400 2300
F 0 "#PWR018" H 2400 2050 50  0001 C CNN
F 1 "Earth" H 2400 2150 50  0001 C CNN
F 2 "" H 2400 2300 50  0001 C CNN
F 3 "~" H 2400 2300 50  0001 C CNN
	1    2400 2300
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Instrumentation:INA128 U2
U 1 1 614840C7
P 2050 2600
F 0 "U2" H 2300 2500 50  0000 L CNN
F 1 "INA128" H 2350 2450 50  0000 C TNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 2150 2600 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ina128.pdf" H 2150 2600 50  0001 C CNN
	1    2050 2600
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR08
U 1 1 614840CD
P 2050 2900
F 0 "#PWR08" H 2050 2650 50  0001 C CNN
F 1 "Earth" H 2050 2750 50  0001 C CNN
F 2 "" H 2050 2900 50  0001 C CNN
F 3 "~" H 2050 2900 50  0001 C CNN
	1    2050 2900
	-1   0    0    -1  
$EndComp
$Comp
L power:VCC #PWR07
U 1 1 614840D3
P 2050 2300
F 0 "#PWR07" H 2050 2150 50  0001 C CNN
F 1 "VCC" H 2050 2450 50  0000 C CNN
F 2 "" H 2050 2300 50  0001 C CNN
F 3 "" H 2050 2300 50  0001 C CNN
	1    2050 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 2400 1500 2400
$Comp
L Device:R_Small R10
U 1 1 614840DA
P 1700 2600
F 0 "R10" V 1700 2600 39  0000 C CNN
F 1 "200/1%" V 1600 2600 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1630 2600 50  0001 C CNN
F 3 "~" H 1700 2600 50  0001 C CNN
	1    1700 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 2700 1750 2700
Wire Wire Line
	1700 2500 1750 2500
$Comp
L power:GNDS #PWR02
U 1 1 614840E2
P 1400 2600
F 0 "#PWR02" H 1400 2350 50  0001 C CNN
F 1 "GNDS" H 1400 2450 50  0000 C CNN
F 2 "" H 1400 2600 50  0001 C CNN
F 3 "" H 1400 2600 50  0001 C CNN
	1    1400 2600
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C3
U 1 1 614840E8
P 1350 2400
F 0 "C3" V 1450 2400 50  0000 C CNN
F 1 "100pF" V 1500 2400 50  0000 C TNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1388 2250 50  0001 C CNN
F 3 "~" H 1350 2400 50  0001 C CNN
	1    1350 2400
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R3
U 1 1 614840EE
P 1500 2500
F 0 "R3" V 1500 2500 39  0000 C CNN
F 1 "1M/1%" H 1600 2700 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1430 2500 50  0001 C CNN
F 3 "~" H 1500 2500 50  0001 C CNN
	1    1500 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 614840F4
P 1350 2800
F 0 "C4" V 1450 2800 50  0000 C CNN
F 1 "100pF" V 1500 2800 50  0000 C TNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1388 2650 50  0001 C CNN
F 3 "~" H 1350 2800 50  0001 C CNN
	1    1350 2800
	0    1    1    0   
$EndComp
Wire Wire Line
	1500 4100 1750 4100
Connection ~ 1500 4100
Connection ~ 1500 3900
Wire Wire Line
	1450 4100 1500 4100
$Comp
L Device:R_Small R6
U 1 1 6148F9D7
P 1500 4000
F 0 "R6" V 1500 4000 39  0000 C CNN
F 1 "1M/1%" H 1600 3850 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1430 4000 50  0001 C CNN
F 3 "~" H 1500 4000 50  0001 C CNN
	1    1500 4000
	1    0    0    -1  
$EndComp
Text Label 2500 3900 0    50   ~ 0
out3
Wire Wire Line
	2600 3900 2450 3900
Wire Wire Line
	1250 4100 1100 4100
Wire Wire Line
	1250 3700 1100 3700
Entry Wire Line
	2600 3900 2700 4000
Entry Wire Line
	1000 4200 1100 4100
Entry Wire Line
	1000 3800 1100 3700
$Comp
L power:GNDS #PWR015
U 1 1 6148F9E6
P 2150 4200
F 0 "#PWR015" H 2150 3950 50  0001 C CNN
F 1 "GNDS" V 2100 4000 50  0000 C CNN
F 2 "" H 2150 4200 50  0001 C CNN
F 3 "" H 2150 4200 50  0001 C CNN
	1    2150 4200
	0    -1   -1   0   
$EndComp
Connection ~ 2050 3600
Wire Wire Line
	2150 3600 2050 3600
Wire Wire Line
	1500 3700 1750 3700
Wire Wire Line
	1400 3900 1500 3900
Connection ~ 1500 3700
Wire Wire Line
	2350 3600 2400 3600
$Comp
L Device:C_Small C11
U 1 1 6148F9F2
P 2250 3600
F 0 "C11" V 2350 3600 50  0000 C CNN
F 1 "100nF" V 2100 3600 50  0000 C TNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2288 3450 50  0001 C CNN
F 3 "~" H 2250 3600 50  0001 C CNN
	1    2250 3600
	0    -1   -1   0   
$EndComp
$Comp
L power:Earth #PWR019
U 1 1 6148F9F8
P 2400 3600
F 0 "#PWR019" H 2400 3350 50  0001 C CNN
F 1 "Earth" H 2400 3450 50  0001 C CNN
F 2 "" H 2400 3600 50  0001 C CNN
F 3 "~" H 2400 3600 50  0001 C CNN
	1    2400 3600
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Instrumentation:INA128 U3
U 1 1 6148F9FE
P 2050 3900
F 0 "U3" H 2300 3800 50  0000 L CNN
F 1 "INA128" H 2350 3750 50  0000 C TNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 2150 3900 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ina128.pdf" H 2150 3900 50  0001 C CNN
	1    2050 3900
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR010
U 1 1 6148FA04
P 2050 4200
F 0 "#PWR010" H 2050 3950 50  0001 C CNN
F 1 "Earth" H 2050 4050 50  0001 C CNN
F 2 "" H 2050 4200 50  0001 C CNN
F 3 "~" H 2050 4200 50  0001 C CNN
	1    2050 4200
	-1   0    0    -1  
$EndComp
$Comp
L power:VCC #PWR09
U 1 1 6148FA0A
P 2050 3600
F 0 "#PWR09" H 2050 3450 50  0001 C CNN
F 1 "VCC" H 2050 3750 50  0000 C CNN
F 2 "" H 2050 3600 50  0001 C CNN
F 3 "" H 2050 3600 50  0001 C CNN
	1    2050 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 3700 1500 3700
$Comp
L Device:R_Small R11
U 1 1 6148FA11
P 1700 3900
F 0 "R11" V 1700 3900 39  0000 C CNN
F 1 "100/1%" V 1600 3900 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1630 3900 50  0001 C CNN
F 3 "~" H 1700 3900 50  0001 C CNN
	1    1700 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 4000 1750 4000
Wire Wire Line
	1700 3800 1750 3800
$Comp
L power:GNDS #PWR03
U 1 1 6148FA19
P 1400 3900
F 0 "#PWR03" H 1400 3650 50  0001 C CNN
F 1 "GNDS" H 1400 3750 50  0000 C CNN
F 2 "" H 1400 3900 50  0001 C CNN
F 3 "" H 1400 3900 50  0001 C CNN
	1    1400 3900
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C5
U 1 1 6148FA1F
P 1350 3700
F 0 "C5" V 1450 3700 50  0000 C CNN
F 1 "100pF" V 1500 3700 50  0000 C TNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1388 3550 50  0001 C CNN
F 3 "~" H 1350 3700 50  0001 C CNN
	1    1350 3700
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R5
U 1 1 6148FA25
P 1500 3800
F 0 "R5" V 1500 3800 39  0000 C CNN
F 1 "1M/1%" H 1600 4000 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1430 3800 50  0001 C CNN
F 3 "~" H 1500 3800 50  0001 C CNN
	1    1500 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C6
U 1 1 6148FA2B
P 1350 4100
F 0 "C6" V 1450 4100 50  0000 C CNN
F 1 "100pF" V 1500 4100 50  0000 C TNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1388 3950 50  0001 C CNN
F 3 "~" H 1350 4100 50  0001 C CNN
	1    1350 4100
	0    1    1    0   
$EndComp
Wire Wire Line
	1500 5050 1750 5050
Connection ~ 1500 5050
Connection ~ 1500 4850
Wire Wire Line
	1450 5050 1500 5050
$Comp
L Device:R_Small R8
U 1 1 61492F92
P 1500 4950
F 0 "R8" V 1500 4950 39  0000 C CNN
F 1 "1M/1%" H 1600 4800 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1430 4950 50  0001 C CNN
F 3 "~" H 1500 4950 50  0001 C CNN
	1    1500 4950
	1    0    0    -1  
$EndComp
Text Label 2500 4850 0    50   ~ 0
out4
Wire Wire Line
	2600 4850 2450 4850
Wire Wire Line
	1250 5050 1100 5050
Wire Wire Line
	1250 4650 1100 4650
Entry Wire Line
	2600 4850 2700 4950
Entry Wire Line
	1000 5150 1100 5050
Entry Wire Line
	1000 4750 1100 4650
$Comp
L power:GNDS #PWR016
U 1 1 61492FA1
P 2150 5150
F 0 "#PWR016" H 2150 4900 50  0001 C CNN
F 1 "GNDS" V 2100 4950 50  0000 C CNN
F 2 "" H 2150 5150 50  0001 C CNN
F 3 "" H 2150 5150 50  0001 C CNN
	1    2150 5150
	0    -1   -1   0   
$EndComp
Connection ~ 2050 4550
Wire Wire Line
	2150 4550 2050 4550
Wire Wire Line
	1500 4650 1750 4650
Wire Wire Line
	1400 4850 1500 4850
Connection ~ 1500 4650
Wire Wire Line
	2350 4550 2400 4550
$Comp
L Device:C_Small C12
U 1 1 61492FAD
P 2250 4550
F 0 "C12" V 2350 4550 50  0000 C CNN
F 1 "100nF" V 2100 4550 50  0000 C TNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2288 4400 50  0001 C CNN
F 3 "~" H 2250 4550 50  0001 C CNN
	1    2250 4550
	0    -1   -1   0   
$EndComp
$Comp
L power:Earth #PWR020
U 1 1 61492FB3
P 2400 4550
F 0 "#PWR020" H 2400 4300 50  0001 C CNN
F 1 "Earth" H 2400 4400 50  0001 C CNN
F 2 "" H 2400 4550 50  0001 C CNN
F 3 "~" H 2400 4550 50  0001 C CNN
	1    2400 4550
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Instrumentation:INA128 U4
U 1 1 61492FB9
P 2050 4850
F 0 "U4" H 2300 4750 50  0000 L CNN
F 1 "INA128" H 2350 4700 50  0000 C TNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 2150 4850 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ina128.pdf" H 2150 4850 50  0001 C CNN
	1    2050 4850
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR012
U 1 1 61492FBF
P 2050 5150
F 0 "#PWR012" H 2050 4900 50  0001 C CNN
F 1 "Earth" H 2050 5000 50  0001 C CNN
F 2 "" H 2050 5150 50  0001 C CNN
F 3 "~" H 2050 5150 50  0001 C CNN
	1    2050 5150
	-1   0    0    -1  
$EndComp
$Comp
L power:VCC #PWR011
U 1 1 61492FC5
P 2050 4550
F 0 "#PWR011" H 2050 4400 50  0001 C CNN
F 1 "VCC" H 2050 4700 50  0000 C CNN
F 2 "" H 2050 4550 50  0001 C CNN
F 3 "" H 2050 4550 50  0001 C CNN
	1    2050 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 4650 1500 4650
$Comp
L Device:R_Small R12
U 1 1 61492FCC
P 1700 4850
F 0 "R12" V 1700 4850 39  0000 C CNN
F 1 "100/1%" V 1600 4850 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1630 4850 50  0001 C CNN
F 3 "~" H 1700 4850 50  0001 C CNN
	1    1700 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 4950 1750 4950
Wire Wire Line
	1700 4750 1750 4750
$Comp
L power:GNDS #PWR04
U 1 1 61492FD4
P 1400 4850
F 0 "#PWR04" H 1400 4600 50  0001 C CNN
F 1 "GNDS" H 1400 4700 50  0000 C CNN
F 2 "" H 1400 4850 50  0001 C CNN
F 3 "" H 1400 4850 50  0001 C CNN
	1    1400 4850
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C7
U 1 1 61492FDA
P 1350 4650
F 0 "C7" V 1450 4650 50  0000 C CNN
F 1 "100pF" V 1500 4650 50  0000 C TNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1388 4500 50  0001 C CNN
F 3 "~" H 1350 4650 50  0001 C CNN
	1    1350 4650
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R7
U 1 1 61492FE0
P 1500 4750
F 0 "R7" V 1500 4750 39  0000 C CNN
F 1 "1M/1%" H 1600 4950 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1430 4750 50  0001 C CNN
F 3 "~" H 1500 4750 50  0001 C CNN
	1    1500 4750
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C8
U 1 1 61492FE6
P 1350 5050
F 0 "C8" V 1450 5050 50  0000 C CNN
F 1 "100pF" V 1500 5050 50  0000 C TNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1388 4900 50  0001 C CNN
F 3 "~" H 1350 5050 50  0001 C CNN
	1    1350 5050
	0    1    1    0   
$EndComp
Entry Wire Line
	2600 2600 2700 2700
Entry Wire Line
	2600 1650 2700 1750
Entry Bus Bus
	1000 5300 1100 5400
Entry Bus Bus
	2700 5300 2800 5400
Entry Bus Bus
	3150 5400 3250 5300
Entry Wire Line
	3250 4100 3350 4000
Entry Wire Line
	3250 4450 3350 4350
Entry Wire Line
	3250 4800 3350 4700
Entry Wire Line
	3250 5150 3350 5050
Text Label 3350 4000 0    50   ~ 0
in5
Text Label 3350 2950 0    50   ~ 0
in2
Text Label 3350 3300 0    50   ~ 0
in3
Text Label 3350 3650 0    50   ~ 0
in4
Entry Wire Line
	3250 2700 3350 2600
Entry Wire Line
	3250 3050 3350 2950
Entry Wire Line
	3250 3400 3350 3300
Entry Wire Line
	3250 3750 3350 3650
Text Label 3350 2600 0    50   ~ 0
in1
Text Label 3350 4350 0    50   ~ 0
in6
Text Label 3350 4700 0    50   ~ 0
in7
Text Label 3350 5050 0    50   ~ 0
in8
Wire Wire Line
	3350 2100 3900 2100
Wire Wire Line
	3350 2200 3900 2200
Wire Wire Line
	3350 2300 3900 2300
Wire Wire Line
	3350 2400 3900 2400
Entry Wire Line
	3250 2200 3350 2100
Entry Wire Line
	3250 2300 3350 2200
Entry Wire Line
	3250 2400 3350 2300
Entry Wire Line
	3250 2500 3350 2400
Text Label 3650 2100 0    50   ~ 0
out1
Text Label 3650 2200 0    50   ~ 0
out2
Text Label 3650 2300 0    50   ~ 0
out3
Text Label 3650 2400 0    50   ~ 0
out4
$Comp
L Connector_Generic:Conn_01x04 J3
U 1 1 6150DD4D
P 4100 2200
F 0 "J3" H 4180 2192 50  0000 L CNN
F 1 "OutputPins" H 4180 2101 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 4100 2200 50  0001 C CNN
F 3 "~" H 4100 2200 50  0001 C CNN
	1    4100 2200
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR028
U 1 1 6151A45F
P 3300 1200
F 0 "#PWR028" H 3300 950 50  0001 C CNN
F 1 "Earth" H 3300 1050 50  0001 C CNN
F 2 "" H 3300 1200 50  0001 C CNN
F 3 "~" H 3300 1200 50  0001 C CNN
	1    3300 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 1300 3900 1300
Wire Wire Line
	3750 1400 3900 1400
Text Notes 1300 1100 0    50   ~ 0
Differential Amplifiers x4
Text Notes 3450 1100 0    50   ~ 0
Connectors
$Comp
L power:VCC #PWR027
U 1 1 6151AB70
P 3750 1300
F 0 "#PWR027" H 3750 1150 50  0001 C CNN
F 1 "VCC" V 3750 1450 50  0000 L CNN
F 2 "" H 3750 1300 50  0001 C CNN
F 3 "" H 3750 1300 50  0001 C CNN
	1    3750 1300
	0    -1   -1   0   
$EndComp
Text Label 1100 2800 0    50   ~ 0
in4
Text Label 1100 2400 0    50   ~ 0
in3
Text Label 1100 4650 0    50   ~ 0
in8
Text Label 1100 4100 0    50   ~ 0
in5
Text Label 1100 5050 0    50   ~ 0
in7
$Comp
L Connector_Generic:Conn_01x03 J1
U 1 1 61581386
P 4100 1300
F 0 "J1" H 4180 1342 50  0000 L CNN
F 1 "PowerInput" H 4180 1251 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 4100 1300 50  0001 C CNN
F 3 "~" H 4100 1300 50  0001 C CNN
	1    4100 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 1200 3900 1200
$Comp
L power:GNDS #PWR021
U 1 1 61586120
P 3750 1400
F 0 "#PWR021" H 3750 1150 50  0001 C CNN
F 1 "GNDS" V 3750 1150 50  0000 C CNN
F 2 "" H 3750 1400 50  0001 C CNN
F 3 "" H 3750 1400 50  0001 C CNN
	1    3750 1400
	0    1    1    0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x01 EL3
U 1 1 61588080
P 4450 3300
F 0 "EL3" H 4530 3342 50  0000 L CNN
F 1 "Electrode" H 4530 3251 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.7mm_Pad" H 4450 3300 50  0001 C CNN
F 3 "~" H 4450 3300 50  0001 C CNN
	1    4450 3300
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x01 EL4
U 1 1 61588310
P 4450 3650
F 0 "EL4" H 4530 3692 50  0000 L CNN
F 1 "Electrode" H 4530 3601 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.7mm_Pad" H 4450 3650 50  0001 C CNN
F 3 "~" H 4450 3650 50  0001 C CNN
	1    4450 3650
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x01 EL5
U 1 1 6158876C
P 4450 4000
F 0 "EL5" H 4530 4042 50  0000 L CNN
F 1 "Electrode" H 4530 3951 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.7mm_Pad" H 4450 4000 50  0001 C CNN
F 3 "~" H 4450 4000 50  0001 C CNN
	1    4450 4000
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x01 EL6
U 1 1 61588AD3
P 4450 4350
F 0 "EL6" H 4530 4392 50  0000 L CNN
F 1 "Electrode" H 4530 4301 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.7mm_Pad" H 4450 4350 50  0001 C CNN
F 3 "~" H 4450 4350 50  0001 C CNN
	1    4450 4350
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x01 EL7
U 1 1 61588D63
P 4450 4700
F 0 "EL7" H 4530 4742 50  0000 L CNN
F 1 "Electrode" H 4530 4651 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.7mm_Pad" H 4450 4700 50  0001 C CNN
F 3 "~" H 4450 4700 50  0001 C CNN
	1    4450 4700
	1    0    0    -1  
$EndComp
Text Label 1100 3700 0    50   ~ 0
in6
$Comp
L power:Earth #PWR0101
U 1 1 61593CF0
P 3300 1650
F 0 "#PWR0101" H 3300 1400 50  0001 C CNN
F 1 "Earth" H 3300 1500 50  0001 C CNN
F 2 "" H 3300 1650 50  0001 C CNN
F 3 "~" H 3300 1650 50  0001 C CNN
	1    3300 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 1750 3900 1750
Wire Wire Line
	3750 1850 3900 1850
$Comp
L power:VCC #PWR0102
U 1 1 61593CF8
P 3750 1750
F 0 "#PWR0102" H 3750 1600 50  0001 C CNN
F 1 "VCC" V 3750 1900 50  0000 L CNN
F 2 "" H 3750 1750 50  0001 C CNN
F 3 "" H 3750 1750 50  0001 C CNN
	1    3750 1750
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J2
U 1 1 61593CFE
P 4100 1750
F 0 "J2" H 4180 1792 50  0000 L CNN
F 1 "PowerPassThru" H 4180 1701 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 4100 1750 50  0001 C CNN
F 3 "~" H 4100 1750 50  0001 C CNN
	1    4100 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 1650 3900 1650
$Comp
L power:GNDS #PWR0103
U 1 1 61593D05
P 3750 1850
F 0 "#PWR0103" H 3750 1600 50  0001 C CNN
F 1 "GNDS" V 3750 1600 50  0000 C CNN
F 2 "" H 3750 1850 50  0001 C CNN
F 3 "" H 3750 1850 50  0001 C CNN
	1    3750 1850
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 EX1
U 1 1 61554949
P 3700 2700
F 0 "EX1" H 3780 2742 50  0000 L CNN
F 1 "ElectrodeTestPin" H 3780 2651 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 3700 2700 50  0001 C CNN
F 3 "~" H 3700 2700 50  0001 C CNN
	1    3700 2700
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 EX2
U 1 1 6155C4B7
P 3700 3050
F 0 "EX2" H 3780 3092 50  0000 L CNN
F 1 "ElectrodeTestPin" H 3780 3001 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 3700 3050 50  0001 C CNN
F 3 "~" H 3700 3050 50  0001 C CNN
	1    3700 3050
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 EX4
U 1 1 6156AB00
P 3700 3750
F 0 "EX4" H 3780 3792 50  0000 L CNN
F 1 "ElectrodeTestPin" H 3780 3701 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 3700 3750 50  0001 C CNN
F 3 "~" H 3700 3750 50  0001 C CNN
	1    3700 3750
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 EX5
U 1 1 6156D80B
P 3700 4100
F 0 "EX5" H 3780 4142 50  0000 L CNN
F 1 "ElectrodeTestPin" H 3780 4051 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 3700 4100 50  0001 C CNN
F 3 "~" H 3700 4100 50  0001 C CNN
	1    3700 4100
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 EX6
U 1 1 61570C12
P 3700 4450
F 0 "EX6" H 3780 4492 50  0000 L CNN
F 1 "ElectrodeTestPin" H 3780 4401 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 3700 4450 50  0001 C CNN
F 3 "~" H 3700 4450 50  0001 C CNN
	1    3700 4450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 EX7
U 1 1 61573D6F
P 3700 4800
F 0 "EX7" H 3780 4842 50  0000 L CNN
F 1 "ElectrodeTestPin" H 3780 4751 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 3700 4800 50  0001 C CNN
F 3 "~" H 3700 4800 50  0001 C CNN
	1    3700 4800
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 EX8
U 1 1 61577101
P 3700 5150
F 0 "EX8" H 3780 5192 50  0000 L CNN
F 1 "ElectrodeTestPin" H 3780 5101 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 3700 5150 50  0001 C CNN
F 3 "~" H 3700 5150 50  0001 C CNN
	1    3700 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 3650 3500 3650
$Comp
L Connector_Generic:Conn_01x01 EX3
U 1 1 6156365E
P 3700 3400
F 0 "EX3" H 3780 3442 50  0000 L CNN
F 1 "ElectrodeTestPin" H 3780 3351 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 3700 3400 50  0001 C CNN
F 3 "~" H 3700 3400 50  0001 C CNN
	1    3700 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 3300 3500 3300
Wire Wire Line
	3500 3400 3500 3300
Wire Wire Line
	3350 2950 3500 2950
Wire Wire Line
	3350 2600 3500 2600
Wire Wire Line
	3500 2700 3500 2600
Wire Wire Line
	3500 3050 3500 2950
Wire Wire Line
	3500 3750 3500 3650
Wire Wire Line
	3350 4000 3500 4000
Wire Wire Line
	3500 4100 3500 4000
Wire Wire Line
	3350 4350 3500 4350
Wire Wire Line
	3500 4450 3500 4350
Wire Wire Line
	3350 4700 3500 4700
Wire Wire Line
	3500 4800 3500 4700
Wire Wire Line
	3350 5050 3500 5050
Wire Wire Line
	3500 5150 3500 5050
Text Notes 4900 5400 2    50   ~ 0
https://psylink.me/c10.2
$Comp
L Connector:Screw_Terminal_01x01 EL8
U 1 1 61589066
P 4450 5050
F 0 "EL8" H 4530 5092 50  0000 L CNN
F 1 "Electrode" H 4530 5001 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.7mm_Pad" H 4450 5050 50  0001 C CNN
F 3 "~" H 4450 5050 50  0001 C CNN
	1    4450 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 5050 3950 5050
Connection ~ 3500 5050
Wire Wire Line
	3500 4700 3950 4700
Connection ~ 3500 4700
Wire Wire Line
	3500 4350 3950 4350
Connection ~ 3500 4350
Wire Wire Line
	3500 4000 3950 4000
Connection ~ 3500 4000
Wire Wire Line
	3500 3650 3950 3650
Connection ~ 3500 3650
Wire Wire Line
	3500 3300 3950 3300
Connection ~ 3500 3300
Wire Wire Line
	3500 2950 3950 2950
Connection ~ 3500 2950
Wire Wire Line
	3500 2600 3950 2600
Connection ~ 3500 2600
$Comp
L Connector:Screw_Terminal_01x01 EL1
U 1 1 6157FCEA
P 4450 2600
F 0 "EL1" H 4530 2642 50  0000 L CNN
F 1 "Electrode" H 4530 2551 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.7mm_Pad" H 4450 2600 50  0001 C CNN
F 3 "~" H 4450 2600 50  0001 C CNN
	1    4450 2600
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x01 EL2
U 1 1 61587D23
P 4450 2950
F 0 "EL2" H 4530 2992 50  0000 L CNN
F 1 "Electrode" H 4530 2901 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.7mm_Pad" H 4450 2950 50  0001 C CNN
F 3 "~" H 4450 2950 50  0001 C CNN
	1    4450 2950
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP1
U 1 1 6203BD45
P 4100 2600
F 0 "JP1" H 4100 2677 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 4100 2714 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 4100 2600 50  0001 C CNN
F 3 "~" H 4100 2600 50  0001 C CNN
	1    4100 2600
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP2
U 1 1 620472B9
P 4100 2950
F 0 "JP2" H 4100 3027 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 4100 3064 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 4100 2950 50  0001 C CNN
F 3 "~" H 4100 2950 50  0001 C CNN
	1    4100 2950
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP3
U 1 1 6204778E
P 4100 3300
F 0 "JP3" H 4100 3377 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 4100 3414 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 4100 3300 50  0001 C CNN
F 3 "~" H 4100 3300 50  0001 C CNN
	1    4100 3300
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP4
U 1 1 62047B6F
P 4100 3650
F 0 "JP4" H 4100 3727 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 4100 3764 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 4100 3650 50  0001 C CNN
F 3 "~" H 4100 3650 50  0001 C CNN
	1    4100 3650
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP5
U 1 1 62047E20
P 4100 4000
F 0 "JP5" H 4100 4077 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 4100 4114 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 4100 4000 50  0001 C CNN
F 3 "~" H 4100 4000 50  0001 C CNN
	1    4100 4000
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP6
U 1 1 62048237
P 4100 4350
F 0 "JP6" H 4100 4427 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 4100 4464 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 4100 4350 50  0001 C CNN
F 3 "~" H 4100 4350 50  0001 C CNN
	1    4100 4350
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP7
U 1 1 62048539
P 4100 4700
F 0 "JP7" H 4100 4777 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 4100 4814 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 4100 4700 50  0001 C CNN
F 3 "~" H 4100 4700 50  0001 C CNN
	1    4100 4700
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP8
U 1 1 62048939
P 4100 5050
F 0 "JP8" H 4100 5127 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 4100 5164 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 4100 5050 50  0001 C CNN
F 3 "~" H 4100 5050 50  0001 C CNN
	1    4100 5050
	1    0    0    -1  
$EndComp
Text Notes 1100 3350 0    50   ~ 0
Note: R10 has 200 Ohms, lowering gain\nby half, compensating an interference\nbug on the out2 trace of PCBs B3.X
Wire Notes Line
	1750 2600 1750 3100
Wire Bus Line
	1100 5400 3150 5400
Wire Bus Line
	2700 1750 2700 5300
Wire Bus Line
	1000 1550 1000 5300
Wire Bus Line
	3250 2200 3250 5300
$EndSCHEMATC
