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
L Connector:Conn_01x04_Female J?
U 1 1 6084EAAC
P 1950 1900
F 0 "J?" H 1978 1876 50  0001 L CNN
F 1 "Electrodes" H 1978 1830 50  0000 L CNN
F 2 "" H 1950 1900 50  0001 C CNN
F 3 "~" H 1950 1900 50  0001 C CNN
	1    1950 1900
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
Text Notes 1650 2300 0    50   ~ 0
https://psylink.me/c2
$EndSCHEMATC
