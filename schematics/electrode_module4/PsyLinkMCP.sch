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
	3200 2900 3800 2900
$Comp
L Connector_Generic:Conn_01x03 J1
U 1 1 62366A59
P 4000 3000
F 0 "J1" H 4080 3042 50  0000 L CNN
F 1 "PowerInput" H 4080 2951 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 4000 3000 50  0001 C CNN
F 3 "~" H 4000 3000 50  0001 C CNN
	1    4000 3000
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR047
U 1 1 62366A4E
P 3650 3000
F 0 "#PWR047" H 3650 2850 50  0001 C CNN
F 1 "VCC" V 3650 3150 50  0000 L CNN
F 2 "" H 3650 3000 50  0001 C CNN
F 3 "" H 3650 3000 50  0001 C CNN
	1    3650 3000
	0    -1   -1   0   
$EndComp
Text Notes 3350 2800 0    50   ~ 0
Connectors
Text Notes 1200 1050 0    50   ~ 0
Differential Amplifiers x4
Wire Wire Line
	3650 3100 3800 3100
Wire Wire Line
	3650 3000 3800 3000
$Comp
L Connector_Generic:Conn_01x04 J3
U 1 1 62366A3E
P 4000 3900
F 0 "J3" H 4080 3892 50  0000 L CNN
F 1 "OutputPins" H 4080 3801 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 4000 3900 50  0001 C CNN
F 3 "~" H 4000 3900 50  0001 C CNN
	1    4000 3900
	1    0    0    -1  
$EndComp
Text Label 3550 3800 0    50   ~ 0
out4
Text Label 3550 3900 0    50   ~ 0
out3
Text Label 3550 4000 0    50   ~ 0
out2
Text Label 3550 4100 0    50   ~ 0
out1
Entry Wire Line
	3150 4200 3250 4100
Entry Wire Line
	3150 4100 3250 4000
Entry Wire Line
	3150 4000 3250 3900
Entry Wire Line
	3150 3900 3250 3800
Wire Wire Line
	3250 4100 3800 4100
Wire Wire Line
	3250 4000 3800 4000
Wire Wire Line
	3250 3900 3800 3900
Wire Wire Line
	3250 3800 3800 3800
$Comp
L Jumper:SolderJumper_2_Bridged JP41
U 1 1 6248801C
P 4000 6800
F 0 "JP41" H 4000 6877 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 4000 6914 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 4000 6800 50  0001 C CNN
F 3 "~" H 4000 6800 50  0001 C CNN
	1    4000 6800
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP40
U 1 1 62488022
P 4000 6450
F 0 "JP40" H 4000 6527 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 4000 6564 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 4000 6450 50  0001 C CNN
F 3 "~" H 4000 6450 50  0001 C CNN
	1    4000 6450
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP31
U 1 1 62488028
P 4000 6100
F 0 "JP31" H 4000 6177 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 4000 6214 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 4000 6100 50  0001 C CNN
F 3 "~" H 4000 6100 50  0001 C CNN
	1    4000 6100
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP30
U 1 1 6248802E
P 4000 5750
F 0 "JP30" H 4000 5827 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 4000 5864 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 4000 5750 50  0001 C CNN
F 3 "~" H 4000 5750 50  0001 C CNN
	1    4000 5750
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP21
U 1 1 62488034
P 4000 5400
F 0 "JP21" H 4000 5477 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 4000 5514 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 4000 5400 50  0001 C CNN
F 3 "~" H 4000 5400 50  0001 C CNN
	1    4000 5400
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP20
U 1 1 6248803A
P 4000 5050
F 0 "JP20" H 4000 5127 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 4000 5164 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 4000 5050 50  0001 C CNN
F 3 "~" H 4000 5050 50  0001 C CNN
	1    4000 5050
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP11
U 1 1 62488040
P 4000 4700
F 0 "JP11" H 4000 4777 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 4000 4814 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 4000 4700 50  0001 C CNN
F 3 "~" H 4000 4700 50  0001 C CNN
	1    4000 4700
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Bridged JP10
U 1 1 62488046
P 4000 4350
F 0 "JP10" H 4000 4427 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 4000 4464 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 4000 4350 50  0001 C CNN
F 3 "~" H 4000 4350 50  0001 C CNN
	1    4000 4350
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x01 EL10
U 1 1 6248804C
P 4350 4350
F 0 "EL10" H 4430 4392 50  0000 L CNN
F 1 "Electrode" H 4430 4301 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.7mm_Pad" H 4350 4350 50  0001 C CNN
F 3 "~" H 4350 4350 50  0001 C CNN
	1    4350 4350
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x01 EL11
U 1 1 62488052
P 4350 4700
F 0 "EL11" H 4430 4742 50  0000 L CNN
F 1 "Electrode" H 4430 4651 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.7mm_Pad" H 4350 4700 50  0001 C CNN
F 3 "~" H 4350 4700 50  0001 C CNN
	1    4350 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 4350 3850 4350
Wire Wire Line
	3400 4700 3850 4700
Wire Wire Line
	3400 5050 3850 5050
Wire Wire Line
	3400 5400 3850 5400
Wire Wire Line
	3400 5750 3850 5750
Wire Wire Line
	3400 6100 3850 6100
Wire Wire Line
	3400 6450 3850 6450
Wire Wire Line
	3400 6800 3850 6800
$Comp
L Connector:Screw_Terminal_01x01 EL41
U 1 1 62488060
P 4350 6800
F 0 "EL41" H 4430 6842 50  0000 L CNN
F 1 "Electrode" H 4430 6751 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.7mm_Pad" H 4350 6800 50  0001 C CNN
F 3 "~" H 4350 6800 50  0001 C CNN
	1    4350 6800
	1    0    0    -1  
$EndComp
Text Notes 4800 7150 2    50   ~ 0
https://psylink.me/c10.2
Wire Wire Line
	3400 6900 3400 6800
Connection ~ 3400 6800
Wire Wire Line
	3250 6800 3400 6800
Wire Wire Line
	3400 6550 3400 6450
Connection ~ 3400 6450
Wire Wire Line
	3250 6450 3400 6450
Wire Wire Line
	3400 6200 3400 6100
Connection ~ 3400 6100
Wire Wire Line
	3250 6100 3400 6100
Wire Wire Line
	3400 5850 3400 5750
Connection ~ 3400 5750
Wire Wire Line
	3250 5750 3400 5750
Wire Wire Line
	3400 5500 3400 5400
Wire Wire Line
	3400 4800 3400 4700
Wire Wire Line
	3400 4450 3400 4350
Connection ~ 3400 4350
Wire Wire Line
	3250 4350 3400 4350
Connection ~ 3400 4700
Wire Wire Line
	3250 4700 3400 4700
Wire Wire Line
	3400 5150 3400 5050
Connection ~ 3400 5050
Wire Wire Line
	3250 5050 3400 5050
$Comp
L Connector_Generic:Conn_01x01 EX21
U 1 1 6248807D
P 3600 5150
F 0 "EX21" H 3680 5192 50  0000 L CNN
F 1 "ElectrodeTestPin" H 3680 5101 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 3600 5150 50  0001 C CNN
F 3 "~" H 3600 5150 50  0001 C CNN
	1    3600 5150
	1    0    0    -1  
$EndComp
Connection ~ 3400 5400
Wire Wire Line
	3250 5400 3400 5400
$Comp
L Connector_Generic:Conn_01x01 EX41
U 1 1 62488085
P 3600 6900
F 0 "EX41" H 3680 6942 50  0000 L CNN
F 1 "ElectrodeTestPin" H 3680 6851 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 3600 6900 50  0001 C CNN
F 3 "~" H 3600 6900 50  0001 C CNN
	1    3600 6900
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 EX40
U 1 1 6248808B
P 3600 6550
F 0 "EX40" H 3680 6592 50  0000 L CNN
F 1 "ElectrodeTestPin" H 3680 6501 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 3600 6550 50  0001 C CNN
F 3 "~" H 3600 6550 50  0001 C CNN
	1    3600 6550
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 EX31
U 1 1 62488091
P 3600 6200
F 0 "EX31" H 3680 6242 50  0000 L CNN
F 1 "ElectrodeTestPin" H 3680 6151 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 3600 6200 50  0001 C CNN
F 3 "~" H 3600 6200 50  0001 C CNN
	1    3600 6200
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 EX30
U 1 1 62488097
P 3600 5850
F 0 "EX30" H 3680 5892 50  0000 L CNN
F 1 "ElectrodeTestPin" H 3680 5801 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 3600 5850 50  0001 C CNN
F 3 "~" H 3600 5850 50  0001 C CNN
	1    3600 5850
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 EX20
U 1 1 6248809D
P 3600 5500
F 0 "EX20" H 3680 5542 50  0000 L CNN
F 1 "ElectrodeTestPin" H 3680 5451 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 3600 5500 50  0001 C CNN
F 3 "~" H 3600 5500 50  0001 C CNN
	1    3600 5500
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 EX10
U 1 1 624880A3
P 3600 4450
F 0 "EX10" H 3680 4492 50  0000 L CNN
F 1 "ElectrodeTestPin" H 3680 4401 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 3600 4450 50  0001 C CNN
F 3 "~" H 3600 4450 50  0001 C CNN
	1    3600 4450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 EX11
U 1 1 624880A9
P 3600 4800
F 0 "EX11" H 3680 4842 50  0000 L CNN
F 1 "ElectrodeTestPin" H 3680 4751 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x01_P2.54mm_Vertical" H 3600 4800 50  0001 C CNN
F 3 "~" H 3600 4800 50  0001 C CNN
	1    3600 4800
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x01 EL40
U 1 1 624880AF
P 4350 6450
F 0 "EL40" H 4430 6492 50  0000 L CNN
F 1 "Electrode" H 4430 6401 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.7mm_Pad" H 4350 6450 50  0001 C CNN
F 3 "~" H 4350 6450 50  0001 C CNN
	1    4350 6450
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x01 EL31
U 1 1 624880B5
P 4350 6100
F 0 "EL31" H 4430 6142 50  0000 L CNN
F 1 "Electrode" H 4430 6051 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.7mm_Pad" H 4350 6100 50  0001 C CNN
F 3 "~" H 4350 6100 50  0001 C CNN
	1    4350 6100
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x01 EL30
U 1 1 624880BB
P 4350 5750
F 0 "EL30" H 4430 5792 50  0000 L CNN
F 1 "Electrode" H 4430 5701 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.7mm_Pad" H 4350 5750 50  0001 C CNN
F 3 "~" H 4350 5750 50  0001 C CNN
	1    4350 5750
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x01 EL20
U 1 1 624880C7
P 4350 5050
F 0 "EL20" H 4430 5092 50  0000 L CNN
F 1 "Electrode" H 4430 5001 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.7mm_Pad" H 4350 5050 50  0001 C CNN
F 3 "~" H 4350 5050 50  0001 C CNN
	1    4350 5050
	1    0    0    -1  
$EndComp
Text Label 3250 6800 0    50   ~ 0
in41
Text Label 3250 6450 0    50   ~ 0
in40
Text Label 3250 6100 0    50   ~ 0
in31
Text Label 3250 4350 0    50   ~ 0
in10
Entry Wire Line
	3150 5500 3250 5400
Entry Wire Line
	3150 5150 3250 5050
Entry Wire Line
	3150 4800 3250 4700
Entry Wire Line
	3150 4450 3250 4350
Text Label 3250 5400 0    50   ~ 0
in21
Text Label 3250 5050 0    50   ~ 0
in20
Text Label 3250 4700 0    50   ~ 0
in11
Text Label 3250 5750 0    50   ~ 0
in30
Entry Wire Line
	3150 6900 3250 6800
Entry Wire Line
	3150 6550 3250 6450
Entry Wire Line
	3150 6200 3250 6100
Entry Wire Line
	3150 5850 3250 5750
Wire Bus Line
	800  7000 900  7100
Wire Wire Line
	1300 2100 1550 2100
Connection ~ 1300 2100
Connection ~ 1300 1900
Wire Wire Line
	1250 2100 1300 2100
$Comp
L Device:R_Small R11
U 1 1 6253B240
P 1300 2000
F 0 "R11" V 1300 2000 39  0000 C CNN
F 1 "1M/1%" H 1400 1850 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1230 2000 50  0001 C CNN
F 3 "~" H 1300 2000 50  0001 C CNN
	1    1300 2000
	1    0    0    -1  
$EndComp
Text Label 900  2100 0    50   ~ 0
in11
Wire Wire Line
	1050 2100 900  2100
Wire Wire Line
	1050 1700 900  1700
Text Label 900  1700 0    50   ~ 0
in10
Entry Wire Line
	800  2200 900  2100
Entry Wire Line
	800  1800 900  1700
Wire Wire Line
	1300 1700 1550 1700
Wire Wire Line
	1200 1900 1300 1900
Connection ~ 1300 1700
Wire Wire Line
	1250 1700 1300 1700
$Comp
L Device:R_Small R10
U 1 1 6253B256
P 1300 1800
F 0 "R10" V 1300 1800 39  0000 C CNN
F 1 "1M/1%" H 1400 2000 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1230 1800 50  0001 C CNN
F 3 "~" H 1300 1800 50  0001 C CNN
	1    1300 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C11
U 1 1 6253B25C
P 1150 2100
F 0 "C11" V 1250 2100 50  0000 C CNN
F 1 "100pF" V 1300 2100 50  0000 C TNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1188 1950 50  0001 C CNN
F 3 "~" H 1150 2100 50  0001 C CNN
	1    1150 2100
	0    1    1    0   
$EndComp
Wire Wire Line
	1550 1900 1300 1900
$Comp
L power:VCC #PWR012
U 1 1 6253B263
P 1950 1400
F 0 "#PWR012" H 1950 1250 50  0001 C CNN
F 1 "VCC" H 1950 1550 50  0000 C CNN
F 2 "" H 1950 1400 50  0001 C CNN
F 3 "" H 1950 1400 50  0001 C CNN
	1    1950 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C12
U 1 1 6253B26F
P 2250 1400
F 0 "C12" V 2350 1400 50  0000 C CNN
F 1 "100nF" V 2100 1400 50  0000 C TNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2288 1250 50  0001 C CNN
F 3 "~" H 2250 1400 50  0001 C CNN
	1    2250 1400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2350 1400 2400 1400
Wire Wire Line
	1850 1450 1850 1400
Wire Wire Line
	1850 1400 1950 1400
Connection ~ 1950 1400
Wire Wire Line
	1950 1400 2050 1400
Wire Wire Line
	2050 1450 2050 1400
Connection ~ 2050 1400
Wire Wire Line
	2050 1400 2150 1400
Text Label 2500 1900 0    50   ~ 0
out1
Entry Wire Line
	2600 1900 2700 2000
Wire Wire Line
	2100 2300 2100 2350
Wire Wire Line
	2450 2300 2450 1900
Wire Wire Line
	2350 2300 2450 2300
Wire Wire Line
	2100 2400 2150 2400
Wire Wire Line
	2150 2300 2100 2300
$Comp
L Device:R_Small R13
U 1 1 6253B284
P 2250 2400
F 0 "R13" V 2250 2400 39  0000 C CNN
F 1 "200/1%" V 2300 2400 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2180 2400 50  0001 C CNN
F 3 "~" H 2250 2400 50  0001 C CNN
	1    2250 2400
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R12
U 1 1 6253B28A
P 2250 2300
F 0 "R12" V 2250 2300 39  0000 C CNN
F 1 "100k/1%" V 2300 2300 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2180 2300 50  0001 C CNN
F 3 "~" H 2250 2300 50  0001 C CNN
	1    2250 2300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2600 1900 2450 1900
$Comp
L MCP6N11:MCP6N11 U10
U 1 1 6253B291
P 1950 1900
F 0 "U10" H 1600 2350 50  0000 L CNN
F 1 "MCP6N11" H 2250 2050 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 2500 1350 50  0001 C CNN
F 3 "" H 2500 1350 50  0001 C CNN
	1    1950 1900
	1    0    0    -1  
$EndComp
Connection ~ 2450 1900
Wire Wire Line
	2050 2350 2100 2350
Connection ~ 2100 2350
Wire Wire Line
	2100 2350 2100 2400
$Comp
L MCP6N11:REF #PWR010
U 1 1 6253B29B
P 1200 1900
F 0 "#PWR010" H 1300 2000 50  0001 C CNN
F 1 "REF" H 1200 2050 50  0000 C CNN
F 2 "" H 1200 1900 50  0001 C CNN
F 3 "" H 1200 1900 50  0001 C CNN
	1    1200 1900
	0    -1   -1   0   
$EndComp
$Comp
L MCP6N11:REF #PWR013
U 1 1 6253B2A1
P 2350 2400
F 0 "#PWR013" H 2450 2500 50  0001 C CNN
F 1 "REF" H 2350 2550 50  0000 C CNN
F 2 "" H 2350 2400 50  0001 C CNN
F 3 "" H 2350 2400 50  0001 C CNN
	1    2350 2400
	0    1    1    0   
$EndComp
Text Notes 950  2800 0    50   ~ 0
Note: R23 has 400 Ohms, lowering gain\nby half, compensating an interference\nbug on the out2 trace of PCBs B3.X
$Comp
L Device:C_Small C10
U 1 1 6253B2A8
P 1150 1700
F 0 "C10" V 1250 1700 50  0000 C CNN
F 1 "100pF" V 1300 1700 50  0000 C TNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1188 1550 50  0001 C CNN
F 3 "~" H 1150 1700 50  0001 C CNN
	1    1150 1700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1300 3750 1550 3750
Connection ~ 1300 3750
Connection ~ 1300 3550
Wire Wire Line
	1200 3550 1300 3550
Wire Wire Line
	1550 3550 1300 3550
Wire Wire Line
	1250 3750 1300 3750
$Comp
L Device:R_Small R21
U 1 1 6254DD61
P 1300 3650
F 0 "R21" V 1300 3650 39  0000 C CNN
F 1 "1M/1%" H 1400 3500 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1230 3650 50  0001 C CNN
F 3 "~" H 1300 3650 50  0001 C CNN
	1    1300 3650
	1    0    0    -1  
$EndComp
Text Label 900  3750 0    50   ~ 0
in21
Wire Wire Line
	1050 3750 900  3750
Wire Wire Line
	1050 3350 900  3350
Text Label 900  3350 0    50   ~ 0
in20
Entry Wire Line
	800  3850 900  3750
Entry Wire Line
	800  3450 900  3350
Wire Wire Line
	1300 3350 1550 3350
Connection ~ 1300 3350
Wire Wire Line
	1250 3350 1300 3350
$Comp
L Device:C_Small C20
U 1 1 6254DD76
P 1150 3350
F 0 "C20" V 1250 3350 50  0000 C CNN
F 1 "100pF" V 1300 3350 50  0000 C TNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1188 3200 50  0001 C CNN
F 3 "~" H 1150 3350 50  0001 C CNN
	1    1150 3350
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R20
U 1 1 6254DD7C
P 1300 3450
F 0 "R20" V 1300 3450 39  0000 C CNN
F 1 "1M/1%" H 1400 3650 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1230 3450 50  0001 C CNN
F 3 "~" H 1300 3450 50  0001 C CNN
	1    1300 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C21
U 1 1 6254DD82
P 1150 3750
F 0 "C21" V 1250 3750 50  0000 C CNN
F 1 "100pF" V 1300 3750 50  0000 C TNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1188 3600 50  0001 C CNN
F 3 "~" H 1150 3750 50  0001 C CNN
	1    1150 3750
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR022
U 1 1 6254DD88
P 1950 3050
F 0 "#PWR022" H 1950 2900 50  0001 C CNN
F 1 "VCC" H 1950 3200 50  0000 C CNN
F 2 "" H 1950 3050 50  0001 C CNN
F 3 "" H 1950 3050 50  0001 C CNN
	1    1950 3050
	1    0    0    -1  
$EndComp
Connection ~ 1950 3050
Wire Wire Line
	1850 3050 1950 3050
Wire Wire Line
	1950 3050 2050 3050
$Comp
L Device:C_Small C22
U 1 1 6254DD97
P 2250 3050
F 0 "C22" V 2350 3050 50  0000 C CNN
F 1 "100nF" V 2100 3050 50  0000 C TNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2288 2900 50  0001 C CNN
F 3 "~" H 2250 3050 50  0001 C CNN
	1    2250 3050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2350 3050 2400 3050
Wire Wire Line
	1850 3100 1850 3050
Wire Wire Line
	2050 3100 2050 3050
Connection ~ 2050 3050
Wire Wire Line
	2050 3050 2150 3050
Text Label 2500 3550 0    50   ~ 0
out2
Entry Wire Line
	2600 3550 2700 3650
Wire Wire Line
	2100 3950 2100 4000
Connection ~ 2100 4000
Wire Wire Line
	2450 3950 2450 3550
Connection ~ 2450 3550
Wire Wire Line
	2350 3950 2450 3950
Wire Wire Line
	2100 4050 2150 4050
Wire Wire Line
	2150 3950 2100 3950
$Comp
L Device:R_Small R23
U 1 1 6254DDAB
P 2250 4050
F 0 "R23" V 2250 4050 39  0000 C CNN
F 1 "400/1%" V 2300 4050 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2180 4050 50  0001 C CNN
F 3 "~" H 2250 4050 50  0001 C CNN
	1    2250 4050
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R22
U 1 1 6254DDB1
P 2250 3950
F 0 "R22" V 2250 3950 39  0000 C CNN
F 1 "100k/1%" V 2300 3950 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2180 3950 50  0001 C CNN
F 3 "~" H 2250 3950 50  0001 C CNN
	1    2250 3950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2600 3550 2450 3550
$Comp
L MCP6N11:MCP6N11 U20
U 1 1 6254DDB8
P 1950 3550
F 0 "U20" H 1600 4000 50  0000 L CNN
F 1 "MCP6N11" H 2250 3700 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 2500 3000 50  0001 C CNN
F 3 "" H 2500 3000 50  0001 C CNN
	1    1950 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 4000 2100 4000
Wire Wire Line
	2100 4000 2100 4050
$Comp
L MCP6N11:REF #PWR020
U 1 1 6254DDC0
P 1200 3550
F 0 "#PWR020" H 1300 3650 50  0001 C CNN
F 1 "REF" H 1200 3700 50  0000 C CNN
F 2 "" H 1200 3550 50  0001 C CNN
F 3 "" H 1200 3550 50  0001 C CNN
	1    1200 3550
	0    -1   -1   0   
$EndComp
$Comp
L MCP6N11:REF #PWR023
U 1 1 6254DDC6
P 2350 4050
F 0 "#PWR023" H 2450 4150 50  0001 C CNN
F 1 "REF" H 2350 4200 50  0000 C CNN
F 2 "" H 2350 4050 50  0001 C CNN
F 3 "" H 2350 4050 50  0001 C CNN
	1    2350 4050
	0    1    1    0   
$EndComp
Wire Wire Line
	1300 5100 1550 5100
Connection ~ 1300 5100
Connection ~ 1300 4900
Wire Wire Line
	1200 4900 1300 4900
Wire Wire Line
	1550 4900 1300 4900
Wire Wire Line
	1250 5100 1300 5100
$Comp
L Device:R_Small R31
U 1 1 62563B8F
P 1300 5000
F 0 "R31" V 1300 5000 39  0000 C CNN
F 1 "1M/1%" H 1400 4850 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1230 5000 50  0001 C CNN
F 3 "~" H 1300 5000 50  0001 C CNN
	1    1300 5000
	1    0    0    -1  
$EndComp
Text Label 900  5100 0    50   ~ 0
in31
Wire Wire Line
	1050 5100 900  5100
Wire Wire Line
	1050 4700 900  4700
Text Label 900  4700 0    50   ~ 0
in30
Entry Wire Line
	800  5200 900  5100
Entry Wire Line
	800  4800 900  4700
Wire Wire Line
	1300 4700 1550 4700
Connection ~ 1300 4700
Wire Wire Line
	1250 4700 1300 4700
$Comp
L Device:C_Small C30
U 1 1 62563BA4
P 1150 4700
F 0 "C30" V 1250 4700 50  0000 C CNN
F 1 "100pF" V 1300 4700 50  0000 C TNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1188 4550 50  0001 C CNN
F 3 "~" H 1150 4700 50  0001 C CNN
	1    1150 4700
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R30
U 1 1 62563BAA
P 1300 4800
F 0 "R30" V 1300 4800 39  0000 C CNN
F 1 "1M/1%" H 1400 5000 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1230 4800 50  0001 C CNN
F 3 "~" H 1300 4800 50  0001 C CNN
	1    1300 4800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C31
U 1 1 62563BB0
P 1150 5100
F 0 "C31" V 1250 5100 50  0000 C CNN
F 1 "100pF" V 1300 5100 50  0000 C TNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1188 4950 50  0001 C CNN
F 3 "~" H 1150 5100 50  0001 C CNN
	1    1150 5100
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR032
U 1 1 62563BB6
P 1950 4400
F 0 "#PWR032" H 1950 4250 50  0001 C CNN
F 1 "VCC" H 1950 4550 50  0000 C CNN
F 2 "" H 1950 4400 50  0001 C CNN
F 3 "" H 1950 4400 50  0001 C CNN
	1    1950 4400
	1    0    0    -1  
$EndComp
Connection ~ 1950 4400
Wire Wire Line
	1850 4400 1950 4400
Wire Wire Line
	1950 4400 2050 4400
$Comp
L Device:C_Small C32
U 1 1 62563BC5
P 2250 4400
F 0 "C32" V 2350 4400 50  0000 C CNN
F 1 "100nF" V 2100 4400 50  0000 C TNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2288 4250 50  0001 C CNN
F 3 "~" H 2250 4400 50  0001 C CNN
	1    2250 4400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2350 4400 2400 4400
Wire Wire Line
	1850 4450 1850 4400
Wire Wire Line
	2050 4450 2050 4400
Connection ~ 2050 4400
Wire Wire Line
	2050 4400 2150 4400
Text Label 2500 4900 0    50   ~ 0
out3
Entry Wire Line
	2600 4900 2700 5000
Wire Wire Line
	2100 5300 2100 5350
Connection ~ 2100 5350
Wire Wire Line
	2450 5300 2450 4900
Connection ~ 2450 4900
Wire Wire Line
	2350 5300 2450 5300
Wire Wire Line
	2100 5400 2150 5400
Wire Wire Line
	2150 5300 2100 5300
$Comp
L Device:R_Small R33
U 1 1 62563BD9
P 2250 5400
F 0 "R33" V 2250 5400 39  0000 C CNN
F 1 "200/1%" V 2300 5400 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2180 5400 50  0001 C CNN
F 3 "~" H 2250 5400 50  0001 C CNN
	1    2250 5400
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R32
U 1 1 62563BDF
P 2250 5300
F 0 "R32" V 2250 5300 39  0000 C CNN
F 1 "100k/1%" V 2300 5300 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2180 5300 50  0001 C CNN
F 3 "~" H 2250 5300 50  0001 C CNN
	1    2250 5300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2600 4900 2450 4900
$Comp
L MCP6N11:MCP6N11 U30
U 1 1 62563BE6
P 1950 4900
F 0 "U30" H 1600 5350 50  0000 L CNN
F 1 "MCP6N11" H 2250 5050 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 2500 4350 50  0001 C CNN
F 3 "" H 2500 4350 50  0001 C CNN
	1    1950 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 5350 2100 5350
Wire Wire Line
	2100 5350 2100 5400
$Comp
L MCP6N11:REF #PWR030
U 1 1 62563BEE
P 1200 4900
F 0 "#PWR030" H 1300 5000 50  0001 C CNN
F 1 "REF" H 1200 5050 50  0000 C CNN
F 2 "" H 1200 4900 50  0001 C CNN
F 3 "" H 1200 4900 50  0001 C CNN
	1    1200 4900
	0    -1   -1   0   
$EndComp
$Comp
L MCP6N11:REF #PWR033
U 1 1 62563BF4
P 2350 5400
F 0 "#PWR033" H 2450 5500 50  0001 C CNN
F 1 "REF" H 2350 5550 50  0000 C CNN
F 2 "" H 2350 5400 50  0001 C CNN
F 3 "" H 2350 5400 50  0001 C CNN
	1    2350 5400
	0    1    1    0   
$EndComp
Wire Wire Line
	1300 6450 1550 6450
Connection ~ 1300 6450
Connection ~ 1300 6250
Wire Wire Line
	1200 6250 1300 6250
Wire Wire Line
	1550 6250 1300 6250
Wire Wire Line
	1250 6450 1300 6450
$Comp
L Device:R_Small R41
U 1 1 62577317
P 1300 6350
F 0 "R41" V 1300 6350 39  0000 C CNN
F 1 "1M/1%" H 1400 6200 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1230 6350 50  0001 C CNN
F 3 "~" H 1300 6350 50  0001 C CNN
	1    1300 6350
	1    0    0    -1  
$EndComp
Text Label 900  6450 0    50   ~ 0
in41
Wire Wire Line
	1050 6450 900  6450
Wire Wire Line
	1050 6050 900  6050
Text Label 900  6050 0    50   ~ 0
in40
Entry Wire Line
	800  6550 900  6450
Entry Wire Line
	800  6150 900  6050
Wire Wire Line
	1300 6050 1550 6050
Connection ~ 1300 6050
Wire Wire Line
	1250 6050 1300 6050
$Comp
L Device:C_Small C40
U 1 1 6257732C
P 1150 6050
F 0 "C40" V 1250 6050 50  0000 C CNN
F 1 "100pF" V 1300 6050 50  0000 C TNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1188 5900 50  0001 C CNN
F 3 "~" H 1150 6050 50  0001 C CNN
	1    1150 6050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R40
U 1 1 62577332
P 1300 6150
F 0 "R40" V 1300 6150 39  0000 C CNN
F 1 "1M/1%" H 1400 6350 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1230 6150 50  0001 C CNN
F 3 "~" H 1300 6150 50  0001 C CNN
	1    1300 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C41
U 1 1 62577338
P 1150 6450
F 0 "C41" V 1250 6450 50  0000 C CNN
F 1 "100pF" V 1300 6450 50  0000 C TNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1188 6300 50  0001 C CNN
F 3 "~" H 1150 6450 50  0001 C CNN
	1    1150 6450
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR042
U 1 1 6257733E
P 1950 5750
F 0 "#PWR042" H 1950 5600 50  0001 C CNN
F 1 "VCC" H 1950 5900 50  0000 C CNN
F 2 "" H 1950 5750 50  0001 C CNN
F 3 "" H 1950 5750 50  0001 C CNN
	1    1950 5750
	1    0    0    -1  
$EndComp
Connection ~ 1950 5750
Wire Wire Line
	1850 5750 1950 5750
Wire Wire Line
	1950 5750 2050 5750
$Comp
L Device:C_Small C42
U 1 1 6257734D
P 2250 5750
F 0 "C42" V 2350 5750 50  0000 C CNN
F 1 "100nF" V 2100 5750 50  0000 C TNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2288 5600 50  0001 C CNN
F 3 "~" H 2250 5750 50  0001 C CNN
	1    2250 5750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2350 5750 2400 5750
Wire Wire Line
	1850 5800 1850 5750
Wire Wire Line
	2050 5800 2050 5750
Connection ~ 2050 5750
Wire Wire Line
	2050 5750 2150 5750
Text Label 2500 6250 0    50   ~ 0
out4
Entry Wire Line
	2600 6250 2700 6350
Wire Wire Line
	2100 6650 2100 6700
Connection ~ 2100 6700
Wire Wire Line
	2450 6650 2450 6250
Connection ~ 2450 6250
Wire Wire Line
	2350 6650 2450 6650
Wire Wire Line
	2100 6750 2150 6750
Wire Wire Line
	2150 6650 2100 6650
$Comp
L Device:R_Small R43
U 1 1 62577361
P 2250 6750
F 0 "R43" V 2250 6750 39  0000 C CNN
F 1 "200/1%" V 2300 6750 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2180 6750 50  0001 C CNN
F 3 "~" H 2250 6750 50  0001 C CNN
	1    2250 6750
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Small R42
U 1 1 62577367
P 2250 6650
F 0 "R42" V 2250 6650 39  0000 C CNN
F 1 "100k/1%" V 2300 6650 50  0000 C TNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2180 6650 50  0001 C CNN
F 3 "~" H 2250 6650 50  0001 C CNN
	1    2250 6650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2600 6250 2450 6250
$Comp
L MCP6N11:MCP6N11 U40
U 1 1 6257736E
P 1950 6250
F 0 "U40" H 1600 6700 50  0000 L CNN
F 1 "MCP6N11" H 2250 6400 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 2500 5700 50  0001 C CNN
F 3 "" H 2500 5700 50  0001 C CNN
	1    1950 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 6700 2100 6700
Wire Wire Line
	2100 6700 2100 6750
$Comp
L MCP6N11:REF #PWR040
U 1 1 62577376
P 1200 6250
F 0 "#PWR040" H 1300 6350 50  0001 C CNN
F 1 "REF" H 1200 6400 50  0000 C CNN
F 2 "" H 1200 6250 50  0001 C CNN
F 3 "" H 1200 6250 50  0001 C CNN
	1    1200 6250
	0    -1   -1   0   
$EndComp
$Comp
L MCP6N11:REF #PWR043
U 1 1 6257737C
P 2350 6750
F 0 "#PWR043" H 2450 6850 50  0001 C CNN
F 1 "REF" H 2350 6900 50  0000 C CNN
F 2 "" H 2350 6750 50  0001 C CNN
F 3 "" H 2350 6750 50  0001 C CNN
	1    2350 6750
	0    1    1    0   
$EndComp
Entry Bus Bus
	2700 7000 2800 7100
Wire Bus Line
	3050 7100 3150 7000
$Comp
L MCP6N11:REF #PWR0101
U 1 1 6266AAB9
P 3650 3100
F 0 "#PWR0101" H 3750 3200 50  0001 C CNN
F 1 "REF" V 3650 3300 50  0000 C CNN
F 2 "" H 3650 3100 50  0001 C CNN
F 3 "" H 3650 3100 50  0001 C CNN
	1    3650 3100
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 626CA5B2
P 1850 6700
F 0 "#PWR0103" H 1850 6450 50  0001 C CNN
F 1 "GND" H 1855 6527 50  0001 C CNN
F 2 "" H 1850 6700 50  0001 C CNN
F 3 "" H 1850 6700 50  0001 C CNN
	1    1850 6700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 626D1671
P 1850 5350
F 0 "#PWR0104" H 1850 5100 50  0001 C CNN
F 1 "GND" H 1855 5177 50  0001 C CNN
F 2 "" H 1850 5350 50  0001 C CNN
F 3 "" H 1850 5350 50  0001 C CNN
	1    1850 5350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 626DD584
P 1850 4000
F 0 "#PWR0105" H 1850 3750 50  0001 C CNN
F 1 "GND" H 1855 3827 50  0001 C CNN
F 2 "" H 1850 4000 50  0001 C CNN
F 3 "" H 1850 4000 50  0001 C CNN
	1    1850 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 626E9337
P 1850 2350
F 0 "#PWR0106" H 1850 2100 50  0001 C CNN
F 1 "GND" H 1855 2177 50  0001 C CNN
F 2 "" H 1850 2350 50  0001 C CNN
F 3 "" H 1850 2350 50  0001 C CNN
	1    1850 2350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 626F5245
P 2400 3050
F 0 "#PWR0107" H 2400 2800 50  0001 C CNN
F 1 "GND" H 2405 2877 50  0001 C CNN
F 2 "" H 2400 3050 50  0001 C CNN
F 3 "" H 2400 3050 50  0001 C CNN
	1    2400 3050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 62700FB5
P 2400 1400
F 0 "#PWR0108" H 2400 1150 50  0001 C CNN
F 1 "GND" H 2405 1227 50  0001 C CNN
F 2 "" H 2400 1400 50  0001 C CNN
F 3 "" H 2400 1400 50  0001 C CNN
	1    2400 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 62706EAD
P 2400 4400
F 0 "#PWR0109" H 2400 4150 50  0001 C CNN
F 1 "GND" H 2405 4227 50  0001 C CNN
F 2 "" H 2400 4400 50  0001 C CNN
F 3 "" H 2400 4400 50  0001 C CNN
	1    2400 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 62712A4B
P 2400 5750
F 0 "#PWR0110" H 2400 5500 50  0001 C CNN
F 1 "GND" H 2405 5577 50  0001 C CNN
F 2 "" H 2400 5750 50  0001 C CNN
F 3 "" H 2400 5750 50  0001 C CNN
	1    2400 5750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 6271E56D
P 3200 2900
F 0 "#PWR0112" H 3200 2650 50  0001 C CNN
F 1 "GND" H 3205 2727 50  0001 C CNN
F 2 "" H 3200 2900 50  0001 C CNN
F 3 "" H 3200 2900 50  0001 C CNN
	1    3200 2900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 62718814
P 3200 3350
F 0 "#PWR0111" H 3200 3100 50  0001 C CNN
F 1 "GND" H 3205 3177 50  0001 C CNN
F 2 "" H 3200 3350 50  0001 C CNN
F 3 "" H 3200 3350 50  0001 C CNN
	1    3200 3350
	1    0    0    -1  
$EndComp
$Comp
L MCP6N11:REF #PWR0102
U 1 1 62676D80
P 3650 3550
F 0 "#PWR0102" H 3750 3650 50  0001 C CNN
F 1 "REF" V 3650 3750 50  0000 C CNN
F 2 "" H 3650 3550 50  0001 C CNN
F 3 "" H 3650 3550 50  0001 C CNN
	1    3650 3550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3650 3450 3800 3450
Wire Wire Line
	3650 3550 3800 3550
$Comp
L power:VCC #PWR049
U 1 1 62366A8D
P 3650 3450
F 0 "#PWR049" H 3650 3300 50  0001 C CNN
F 1 "VCC" V 3650 3600 50  0000 L CNN
F 2 "" H 3650 3450 50  0001 C CNN
F 3 "" H 3650 3450 50  0001 C CNN
	1    3650 3450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3200 3350 3800 3350
$Comp
L Connector_Generic:Conn_01x03 J2
U 1 1 62366A93
P 4000 3450
F 0 "J2" H 4080 3492 50  0000 L CNN
F 1 "PowerPassThru" H 4080 3401 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 4000 3450 50  0001 C CNN
F 3 "~" H 4000 3450 50  0001 C CNN
	1    4000 3450
	1    0    0    -1  
$EndComp
$Comp
L MCP6N11:REF #PWR09
U 1 1 6281C196
P 4900 2150
F 0 "#PWR09" H 5000 2250 50  0001 C CNN
F 1 "REF" H 4905 2323 50  0000 C CNN
F 2 "" H 4900 2150 50  0001 C CNN
F 3 "" H 4900 2150 50  0001 C CNN
	1    4900 2150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C5
U 1 1 6281C190
P 4900 2250
F 0 "C5" V 5000 2250 50  0000 C CNN
F 1 "10uF" V 4750 2250 50  0000 C TNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4938 2100 50  0001 C CNN
F 3 "~" H 4900 2250 50  0001 C CNN
	1    4900 2250
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR011
U 1 1 6281C18A
P 4900 2350
F 0 "#PWR011" H 4900 2100 50  0001 C CNN
F 1 "GND" H 4905 2177 50  0001 C CNN
F 2 "" H 4900 2350 50  0001 C CNN
F 3 "" H 4900 2350 50  0001 C CNN
	1    4900 2350
	1    0    0    -1  
$EndComp
$Comp
L MCP6N11:REF #PWR07
U 1 1 62803787
P 4500 2150
F 0 "#PWR07" H 4600 2250 50  0001 C CNN
F 1 "REF" H 4505 2323 50  0000 C CNN
F 2 "" H 4500 2150 50  0001 C CNN
F 3 "" H 4500 2150 50  0001 C CNN
	1    4500 2150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 6280377B
P 4500 2250
F 0 "C4" V 4600 2250 50  0000 C CNN
F 1 "100nF" V 4350 2250 50  0000 C TNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4538 2100 50  0001 C CNN
F 3 "~" H 4500 2250 50  0001 C CNN
	1    4500 2250
	-1   0    0    1   
$EndComp
$Comp
L MCP6N11:REF #PWR06
U 1 1 627FBD70
P 4100 2350
F 0 "#PWR06" H 4200 2450 50  0001 C CNN
F 1 "REF" H 4105 2523 50  0000 C CNN
F 2 "" H 4100 2350 50  0001 C CNN
F 3 "" H 4100 2350 50  0001 C CNN
	1    4100 2350
	-1   0    0    1   
$EndComp
$Comp
L power:VCC #PWR01
U 1 1 627EFFF6
P 3300 2150
F 0 "#PWR01" H 3300 2000 50  0001 C CNN
F 1 "VCC" H 3315 2323 50  0000 C CNN
F 2 "" H 3300 2150 50  0001 C CNN
F 3 "" H 3300 2150 50  0001 C CNN
	1    3300 2150
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR03
U 1 1 627EA02A
P 3700 2150
F 0 "#PWR03" H 3700 2000 50  0001 C CNN
F 1 "VCC" H 3715 2323 50  0000 C CNN
F 2 "" H 3700 2150 50  0001 C CNN
F 3 "" H 3700 2150 50  0001 C CNN
	1    3700 2150
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR05
U 1 1 627E2A3B
P 4100 2150
F 0 "#PWR05" H 4100 2000 50  0001 C CNN
F 1 "VCC" H 4115 2323 50  0000 C CNN
F 2 "" H 4100 2150 50  0001 C CNN
F 3 "" H 4100 2150 50  0001 C CNN
	1    4100 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 627C3E8C
P 4500 2350
F 0 "#PWR08" H 4500 2100 50  0001 C CNN
F 1 "GND" H 4505 2177 50  0001 C CNN
F 2 "" H 4500 2350 50  0001 C CNN
F 3 "" H 4500 2350 50  0001 C CNN
	1    4500 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 627C3E86
P 4100 2250
F 0 "C3" V 4200 2250 50  0000 C CNN
F 1 "100nF" V 3950 2250 50  0000 C TNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4138 2100 50  0001 C CNN
F 3 "~" H 4100 2250 50  0001 C CNN
	1    4100 2250
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR04
U 1 1 627B70E4
P 3700 2350
F 0 "#PWR04" H 3700 2100 50  0001 C CNN
F 1 "GND" H 3705 2177 50  0001 C CNN
F 2 "" H 3700 2350 50  0001 C CNN
F 3 "" H 3700 2350 50  0001 C CNN
	1    3700 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 627B70DE
P 3700 2250
F 0 "C2" V 3800 2250 50  0000 C CNN
F 1 "10uF" V 3550 2250 50  0000 C TNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3738 2100 50  0001 C CNN
F 3 "~" H 3700 2250 50  0001 C CNN
	1    3700 2250
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR02
U 1 1 62793B67
P 3300 2350
F 0 "#PWR02" H 3300 2100 50  0001 C CNN
F 1 "GND" H 3305 2177 50  0001 C CNN
F 2 "" H 3300 2350 50  0001 C CNN
F 3 "" H 3300 2350 50  0001 C CNN
	1    3300 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 627A15B0
P 3300 2250
F 0 "C1" V 3400 2250 50  0000 C CNN
F 1 "100nF" V 3150 2250 50  0000 C TNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3338 2100 50  0001 C CNN
F 3 "~" H 3300 2250 50  0001 C CNN
	1    3300 2250
	-1   0    0    1   
$EndComp
$Comp
L Connector:Screw_Terminal_01x01 EL21
U 1 1 624880C1
P 4300 5400
F 0 "EL21" H 4380 5442 50  0000 L CNN
F 1 "Electrode" H 4380 5351 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.7mm_Pad" H 4300 5400 50  0001 C CNN
F 3 "~" H 4300 5400 50  0001 C CNN
	1    4300 5400
	1    0    0    -1  
$EndComp
Wire Bus Line
	900  7100 3050 7100
Wire Bus Line
	2700 2000 2700 7000
Wire Bus Line
	800  1800 800  7000
Wire Bus Line
	3150 3900 3150 7000
$EndSCHEMATC
