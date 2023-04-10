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
L Connector:Conn_01x01_Female J?
U 1 1 60850DA8
P 950 1850
F 0 "J?" H 978 1876 50  0001 L CNN
F 1 "Piece of Aluminum taped to the Skin #1" H 978 1830 50  0000 L CNN
F 2 "" H 950 1850 50  0001 C CNN
F 3 "~" H 950 1850 50  0001 C CNN
	1    950  1850
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Female J?
U 1 1 60851BA8
P 950 1950
F 0 "J?" H 978 1976 50  0001 L CNN
F 1 "Piece of Aluminum taped to the Skin #2" H 978 1930 50  0000 L CNN
F 2 "" H 950 1950 50  0001 C CNN
F 3 "~" H 950 1950 50  0001 C CNN
	1    950  1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 1550 1550 1750
Wire Wire Line
	1550 1750 750  1750
Wire Wire Line
	750  1750 750  1850
Wire Wire Line
	1450 1550 1450 1650
Wire Wire Line
	1450 1650 650  1650
Wire Wire Line
	650  1650 650  1950
Wire Wire Line
	650  1950 750  1950
Text Notes 2550 2200 2    50   ~ 0
https://psylink.me/c1
$EndSCHEMATC
