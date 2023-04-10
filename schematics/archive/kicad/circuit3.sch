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
L MCU_Module:Arduino_Nano_v3.x A?
U 1 1 6084E6AA
P 1550 1050
F 0 "A?" H 1550 -39 50  0001 C CNN
F 1 "Arduino_Nano_v3.x" H 1550 -130 50  0001 C CNN
F 2 "Module:Arduino_Nano" H 1550 1050 50  0001 C CIN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 1550 1050 50  0001 C CNN
	1    1550 1050
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x07_Female J?
U 1 1 6084EAAC
P 1950 2100
F 0 "J?" H 1978 2076 50  0001 L CNN
F 1 "Electrodes" H 1978 2080 50  0000 L CNN
F 2 "" H 1950 2100 50  0001 C CNN
F 3 "~" H 1950 2100 50  0001 C CNN
	1    1950 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 1550 1550 1800
Wire Wire Line
	1550 1800 1750 1800
Wire Wire Line
	1450 1550 1450 1900
Wire Wire Line
	1450 1900 1750 1900
Wire Wire Line
	1350 1550 1350 2000
Wire Wire Line
	1350 2000 1750 2000
Wire Wire Line
	1250 1550 1250 2100
Wire Wire Line
	1250 2100 1750 2100
$Comp
L Connector:Conn_01x01_Female J?
U 1 1 60850B8F
P 1850 2850
F 0 "J?" H 1878 2876 50  0001 L CNN
F 1 "Ground Electrode" H 1878 2830 50  0000 L CNN
F 2 "" H 1850 2850 50  0001 C CNN
F 3 "~" H 1850 2850 50  0001 C CNN
	1    1850 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60852BDF
P 850 2700
F 0 "R?" V 643 2700 50  0001 C CNN
F 1 "560K/5%" V 735 2700 50  0000 C CNN
F 2 "" V 780 2700 50  0001 C CNN
F 3 "~" H 850 2700 50  0001 C CNN
	1    850  2700
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 60855985
P 2300 2700
F 0 "R?" V 2093 2700 50  0001 C CNN
F 1 "560K/5%" V 2185 2700 50  0000 C CNN
F 2 "" V 2230 2700 50  0001 C CNN
F 3 "~" H 2300 2700 50  0001 C CNN
	1    2300 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	2550 1150 2600 1150
Wire Wire Line
	1250 2700 1250 2850
Wire Wire Line
	1750 2200 1150 2200
Wire Wire Line
	1150 2200 1150 1550
Wire Wire Line
	1750 2300 1050 2300
Wire Wire Line
	1050 2300 1050 1550
Wire Wire Line
	1750 2400 950  2400
Wire Wire Line
	950  2400 950  1550
Wire Wire Line
	550  1150 550  2700
Wire Wire Line
	2600 2700 2600 1150
Wire Wire Line
	1650 2850 1250 2850
Wire Wire Line
	550  2700 700  2700
$Comp
L Connector:TestPoint_Probe TP?
U 1 1 6085E024
P 1250 2700
F 0 "TP?" H 1403 2801 50  0001 L CNN
F 1 "1.65V" H 1402 2755 50  0000 L CNN
F 2 "" H 1450 2700 50  0001 C CNN
F 3 "~" H 1450 2700 50  0001 C CNN
	1    1250 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 2700 2600 2700
Wire Wire Line
	1000 2700 1250 2700
Connection ~ 1250 2700
Wire Wire Line
	1250 2700 2150 2700
Text Notes 1750 3100 0    50   ~ 0
https://psylink.me/c3
$EndSCHEMATC
