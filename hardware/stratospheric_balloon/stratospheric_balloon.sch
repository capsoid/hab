EESchema Schematic File Version 2
LIBS:stratospheric_balloon-rescue
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:stratospheric_balloon_sch
LIBS:stm32
LIBS:stratospheric_balloon-cache
EELAYER 25 0
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
Text Notes 7350 6950 0    157  ~ 31
Stratospheric_balloon v0.2
$Comp
L CC1101_MODULE M1
U 1 1 5BFE995A
P 2750 3650
F 0 "M1" H 2250 4250 60  0000 C CNN
F 1 "CC1101_MODULE" H 3300 2600 60  0000 C CNN
F 2 "" H 2750 3650 60  0001 C CNN
F 3 "" H 2750 3650 60  0001 C CNN
	1    2750 3650
	1    0    0    -1  
$EndComp
$Comp
L MPU6050_MODULE M2
U 1 1 5BFEA368
P 4650 3650
F 0 "M2" H 4150 4250 60  0000 C CNN
F 1 "MPU6050_MODULE" H 4650 3450 60  0000 C CNN
F 2 "" H 4650 3650 60  0001 C CNN
F 3 "" H 4650 3650 60  0001 C CNN
	1    4650 3650
	1    0    0    -1  
$EndComp
$Comp
L BME280_MODULE M3
U 1 1 5BFEAB37
P 6000 3350
F 0 "M3" H 5600 3650 60  0000 C CNN
F 1 "BME280_MODULE" H 6000 3050 60  0000 C CNN
F 2 "" H 6100 3050 60  0001 C CNN
F 3 "" H 6100 3050 60  0001 C CNN
	1    6000 3350
	1    0    0    -1  
$EndComp
$Comp
L STM32_BLUE-PILL_MODULE M4
U 1 1 5BFF28D8
P 7900 3650
F 0 "M4" H 7400 4250 60  0000 C CNN
F 1 "STM32_BLUE-PILL_MODULE" H 7900 1950 60  0000 C CNN
F 2 "" V 6300 4700 60  0001 C CNN
F 3 "" V 6300 4700 60  0001 C CNN
	1    7900 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 3950 9250 3950
Wire Wire Line
	8650 4150 9250 4150
Wire Wire Line
	8650 4250 9250 4250
Wire Wire Line
	8650 4050 9250 4050
Text Label 8700 4250 0    60   ~ 0
CC_NSS1
Text Label 8700 4150 0    60   ~ 0
CC_SCK1
Text Label 8700 3950 0    60   ~ 0
CC_MOSI1
Wire Wire Line
	7150 4450 6650 4450
Wire Wire Line
	7150 4550 6650 4550
Wire Wire Line
	7150 4650 6750 4650
Wire Wire Line
	7150 4750 6750 4750
Text Label 6700 4450 0    60   ~ 0
MPU_SCL1
Text Label 6700 4550 0    60   ~ 0
MPU_SDA1
Text Label 6850 4650 0    60   ~ 0
SCL1
Text Label 6850 4750 0    60   ~ 0
SDA1
Wire Wire Line
	7150 3150 6650 3150
Wire Wire Line
	7150 3250 6650 3250
Wire Wire Line
	7150 3350 6650 3350
Wire Wire Line
	7150 3450 6650 3450
Text Label 6700 3150 0    60   ~ 0
BME_NSS2
Text Label 6700 3250 0    60   ~ 0
BME_SCK2
Text Label 6700 3350 0    60   ~ 0
BME_MISO2
Text Label 6700 3450 0    60   ~ 0
BME_MOSI2
$Comp
L GND #PWR01
U 1 1 5BFF8CBA
P 2900 2750
F 0 "#PWR01" H 2900 2500 50  0001 C CNN
F 1 "GND" H 2950 2600 50  0000 C CNN
F 2 "" H 2900 2750 50  0001 C CNN
F 3 "" H 2900 2750 50  0001 C CNN
	1    2900 2750
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR02
U 1 1 5BFF8CD6
P 4900 2750
F 0 "#PWR02" H 4900 2500 50  0001 C CNN
F 1 "GND" H 4900 2600 50  0000 C CNN
F 2 "" H 4900 2750 50  0001 C CNN
F 3 "" H 4900 2750 50  0001 C CNN
	1    4900 2750
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR03
U 1 1 5BFF8D0A
P 6150 2750
F 0 "#PWR03" H 6150 2500 50  0001 C CNN
F 1 "GND" H 6150 2600 50  0000 C CNN
F 2 "" H 6150 2750 50  0001 C CNN
F 3 "" H 6150 2750 50  0001 C CNN
	1    6150 2750
	-1   0    0    1   
$EndComp
Wire Wire Line
	6150 2900 6150 2750
Wire Wire Line
	4900 2900 4900 2750
$Comp
L +3.3V #PWR04
U 1 1 5BFF8DB3
P 2400 2900
F 0 "#PWR04" H 2400 2750 50  0001 C CNN
F 1 "+3.3V" H 2550 3000 50  0000 C CNN
F 2 "" H 2400 2900 50  0001 C CNN
F 3 "" H 2400 2900 50  0001 C CNN
	1    2400 2900
	-1   0    0    -1  
$EndComp
$Comp
L +3.3V #PWR05
U 1 1 5BFF8DFB
P 5000 2900
F 0 "#PWR05" H 5000 2750 50  0001 C CNN
F 1 "+3.3V" H 5000 3040 50  0000 C CNN
F 2 "" H 5000 2900 50  0001 C CNN
F 3 "" H 5000 2900 50  0001 C CNN
	1    5000 2900
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR06
U 1 1 5BFF8E17
P 6250 2900
F 0 "#PWR06" H 6250 2750 50  0001 C CNN
F 1 "+3.3V" H 6250 3040 50  0000 C CNN
F 2 "" H 6250 2900 50  0001 C CNN
F 3 "" H 6250 2900 50  0001 C CNN
	1    6250 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 2900 6250 2900
Wire Wire Line
	5000 2900 5000 2900
Wire Wire Line
	2400 2900 2400 2900
$Comp
L 2xAA BT1
U 1 1 5BFF91AA
P 10250 3800
F 0 "BT1" H 9850 4700 60  0000 C CNN
F 1 "2xAA" H 10600 3050 60  0000 C CNN
F 2 "" H 10250 3800 60  0001 C CNN
F 3 "" H 10250 3800 60  0001 C CNN
	1    10250 3800
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR07
U 1 1 5BFF9261
P 10050 2650
F 0 "#PWR07" H 10050 2500 50  0001 C CNN
F 1 "+3.3V" H 10050 2790 50  0000 C CNN
F 2 "" H 10050 2650 50  0001 C CNN
F 3 "" H 10050 2650 50  0001 C CNN
	1    10050 2650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 5BFF92BC
P 10550 2650
F 0 "#PWR08" H 10550 2400 50  0001 C CNN
F 1 "GND" H 10550 2500 50  0000 C CNN
F 2 "" H 10550 2650 50  0001 C CNN
F 3 "" H 10550 2650 50  0001 C CNN
	1    10550 2650
	-1   0    0    1   
$EndComp
Wire Wire Line
	10050 2650 10050 2750
Wire Wire Line
	10550 2650 10550 2750
$Comp
L LAZER_DIOD LD1
U 1 1 5C00014A
P 4400 4950
F 0 "LD1" H 4100 5450 60  0000 C CNN
F 1 "LAZER_DIOD" H 4400 4750 60  0000 C CNN
F 2 "" H 4400 4950 60  0001 C CNN
F 3 "" H 4400 4950 60  0001 C CNN
	1    4400 4950
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR09
U 1 1 5C0001E5
P 4300 4400
F 0 "#PWR09" H 4300 4250 50  0001 C CNN
F 1 "+3.3V" H 4250 4550 50  0000 C CNN
F 2 "" H 4300 4400 50  0001 C CNN
F 3 "" H 4300 4400 50  0001 C CNN
	1    4300 4400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 5C000244
P 4400 4250
F 0 "#PWR010" H 4400 4000 50  0001 C CNN
F 1 "GND" H 4400 4100 50  0000 C CNN
F 2 "" H 4400 4250 50  0001 C CNN
F 3 "" H 4400 4250 50  0001 C CNN
	1    4400 4250
	-1   0    0    1   
$EndComp
Wire Wire Line
	4400 4250 4400 4400
Wire Wire Line
	4300 4400 4300 4400
Wire Wire Line
	2900 2750 2900 2900
Wire Bus Line
	6550 2400 6550 4450
Entry Wire Line
	6550 3050 6650 3150
Entry Wire Line
	6550 3150 6650 3250
Entry Wire Line
	6550 3250 6650 3350
Entry Wire Line
	6550 3350 6650 3450
Entry Wire Line
	3000 2300 3100 2400
Entry Wire Line
	2900 2300 3000 2400
Entry Wire Line
	2700 2300 2800 2400
Entry Wire Line
	2600 2300 2700 2400
Entry Wire Line
	2500 2300 2600 2400
Entry Wire Line
	2400 2300 2500 2400
Wire Wire Line
	2500 2400 2500 2900
Wire Wire Line
	2600 2400 2600 2900
Wire Wire Line
	2700 2400 2700 2900
Wire Wire Line
	2800 2400 2800 2900
Wire Wire Line
	3000 2400 3000 2900
Wire Wire Line
	3100 2400 3100 2900
Text Label 2700 2850 1    60   ~ 0
CC_MISO1
Text Label 2500 2850 1    60   ~ 0
CC_MOSI1
Text Label 2600 2850 1    60   ~ 0
CC_SCK1
Text Label 2800 2850 1    60   ~ 0
CC_GDO2
Text Label 3000 2850 1    60   ~ 0
CC_GDO0
Text Label 3100 2850 1    60   ~ 0
CC_NSS1
Wire Bus Line
	2400 2300 9250 2300
Entry Bus Bus
	6450 2300 6550 2400
Entry Bus Bus
	6450 2300 6550 2400
Entry Wire Line
	6550 3650 6650 3750
Entry Wire Line
	6550 3750 6650 3850
Wire Wire Line
	6650 3750 7150 3750
Wire Wire Line
	7150 3850 6650 3850
Text Label 7100 3850 2    60   ~ 0
CC_GDO2
Text Label 7100 3750 2    60   ~ 0
CC_GDO0
Text Label 8700 4050 0    60   ~ 0
CC_MISO1
Entry Wire Line
	4200 2300 4300 2400
Entry Wire Line
	4500 2300 4600 2400
Entry Wire Line
	4600 2300 4700 2400
Entry Wire Line
	4700 2300 4800 2400
Wire Wire Line
	4300 2900 4300 2400
Wire Wire Line
	4600 2900 4600 2400
Wire Wire Line
	4700 2900 4700 2400
Wire Wire Line
	4800 2900 4800 2400
Entry Wire Line
	5650 2300 5750 2400
Entry Wire Line
	5750 2300 5850 2400
Entry Wire Line
	5850 2300 5950 2400
Entry Wire Line
	5950 2300 6050 2400
Wire Wire Line
	6050 2400 6050 2900
Wire Wire Line
	5950 2400 5950 2900
Wire Wire Line
	5850 2400 5850 2900
Wire Wire Line
	5750 2400 5750 2900
Text Label 6050 2900 1    60   ~ 0
BME_SCK2
Text Label 5750 2900 1    60   ~ 0
BME_MISO2
Text Label 5950 2900 1    60   ~ 0
BME_MOSI2
Text Label 5850 2900 1    60   ~ 0
BME_NSS2
$Comp
L GND #PWR011
U 1 1 5C0E5937
P 7050 4950
F 0 "#PWR011" H 7050 4700 50  0001 C CNN
F 1 "GND" H 7050 4800 50  0000 C CNN
F 2 "" H 7050 4950 50  0001 C CNN
F 3 "" H 7050 4950 50  0001 C CNN
	1    7050 4950
	0    1    1    0   
$EndComp
Wire Wire Line
	7150 4950 7050 4950
$Comp
L +3.3V #PWR012
U 1 1 5C0E59CA
P 6700 5000
F 0 "#PWR012" H 6700 4850 50  0001 C CNN
F 1 "+3.3V" H 6650 5150 50  0000 C CNN
F 2 "" H 6700 5000 50  0001 C CNN
F 3 "" H 6700 5000 50  0001 C CNN
	1    6700 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 5000 6700 5050
Wire Wire Line
	6700 5050 7150 5050
$Comp
L GND #PWR013
U 1 1 5C0E5B15
P 8800 3150
F 0 "#PWR013" H 8800 2900 50  0001 C CNN
F 1 "GND" H 8800 3000 50  0000 C CNN
F 2 "" H 8800 3150 50  0001 C CNN
F 3 "" H 8800 3150 50  0001 C CNN
	1    8800 3150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8650 3150 8800 3150
Wire Wire Line
	8650 3250 8750 3250
Wire Wire Line
	8750 3250 8750 3150
Connection ~ 8750 3150
$Comp
L +3.3V #PWR014
U 1 1 5C0E5C1F
P 9150 3250
F 0 "#PWR014" H 9150 3100 50  0001 C CNN
F 1 "+3.3V" H 9100 3400 50  0000 C CNN
F 2 "" H 9150 3250 50  0001 C CNN
F 3 "" H 9150 3250 50  0001 C CNN
	1    9150 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 3350 9150 3350
Wire Wire Line
	9150 3350 9150 3250
Entry Wire Line
	6550 4350 6650 4450
Entry Wire Line
	6550 4450 6650 4550
Text Label 4800 2850 1    60   ~ 0
MPU_SCL1
Text Label 4700 2850 1    60   ~ 0
MPU_SDA1
Wire Wire Line
	7150 3650 6650 3650
Entry Wire Line
	6550 3550 6650 3650
Text Label 6700 3650 0    60   ~ 0
MPU_INT
Text Label 4300 2850 1    60   ~ 0
MPU_INT
Wire Wire Line
	4500 4400 4500 4300
Wire Wire Line
	4500 4300 5000 4300
Text Label 4550 4300 0    60   ~ 0
LASER_EN
Wire Wire Line
	7150 3550 6700 3550
Text Label 6700 3550 0    60   ~ 0
LASER_EN
Wire Notes Line
	1600 1050 1600 1950
Wire Notes Line
	1600 1950 3750 1950
Wire Notes Line
	3750 1950 3750 1050
Wire Notes Line
	3750 1050 1600 1050
Wire Notes Line
	1600 1150 3750 1150
Wire Notes Line
	2250 1050 2250 1950
Text Notes 1650 1150 0    60   ~ 0
M1 CC1101
Text Notes 3050 1150 0    60   ~ 0
M4 BluePill
Text Notes 1700 1250 0    60   ~ 0
1 +3.3V
Text Notes 1700 1350 0    60   ~ 0
2 SI
Text Notes 1700 1450 0    60   ~ 0
3 SCK
Text Notes 1700 1550 0    60   ~ 0
4 SO
Text Notes 1700 1650 0    60   ~ 0
5 GDO2
Text Notes 1700 1750 0    60   ~ 0
6 GND
Text Notes 1700 1850 0    60   ~ 0
7 GDO0
Text Notes 1700 1950 0    60   ~ 0
8 CSN
Text Notes 2950 1350 0    60   ~ 0
17 PA7\n
Text Notes 2950 1450 0    60   ~ 0
15 PA5
Text Notes 2950 1550 0    60   ~ 0
16 PA6+18 PB0
Text Notes 2950 1650 0    60   ~ 0
32 PA11
Text Notes 2950 1850 0    60   ~ 0
31 PA9
Text Notes 2950 1950 0    60   ~ 0
38 PA11
Text Notes 2350 1350 0    60   ~ 0
CC_MOSI1
Text Notes 2350 1450 0    60   ~ 0
CC_SCK1
Text Notes 2350 1550 0    60   ~ 0
CC_MISO1
Text Notes 2350 1650 0    60   ~ 0
CC_GDO2
Text Notes 2350 1850 0    60   ~ 0
CC_GDO0
Text Notes 2350 1950 0    60   ~ 0
CC_NSS1
Wire Notes Line
	2850 1950 2850 1050
Text Notes 2400 1150 0    60   ~ 0
Signal
Text Notes 4200 1150 0    60   ~ 0
M2 MPU6050
Text Notes 5000 1150 0    60   ~ 0
Signal
Text Notes 5400 1150 0    60   ~ 0
M4 BluePill
Text Notes 4200 1250 0    60   ~ 0
1 INT
Text Notes 4200 1650 0    60   ~ 0
5 SDA
Text Notes 4200 1750 0    60   ~ 0
6 SCL
Text Notes 4200 1350 0    60   ~ 0
2 ADD
Text Notes 4200 1450 0    60   ~ 0
3 XCL
Text Notes 4200 1550 0    60   ~ 0
4 XDA
Text Notes 4200 1850 0    60   ~ 0
7 GND
Text Notes 4200 1950 0    60   ~ 0
8 VCC
Text Notes 4900 1250 0    60   ~ 0
MPU_INT
Text Notes 5450 1250 0    60   ~ 0
30 PA9
Text Notes 4900 1350 0    60   ~ 0
---
Text Notes 5450 1350 0    60   ~ 0
---
Text Notes 4900 1450 0    60   ~ 0
---
Text Notes 5450 1450 0    60   ~ 0
---
Text Notes 4900 1550 0    60   ~ 0
---
Text Notes 5450 1550 0    60   ~ 0
---
Text Notes 4900 1650 0    60   ~ 0
MPU_SDA1
Text Notes 5450 1650 0    60   ~ 0
43 PB7
Text Notes 4900 1750 0    60   ~ 0
MPU_SCL1
Text Notes 5450 1750 0    60   ~ 0
42 PB6
Wire Notes Line
	4200 1050 4200 1950
Wire Notes Line
	4200 1950 5950 1950
Wire Notes Line
	5950 1950 5950 1050
Wire Notes Line
	5950 1050 4200 1050
Wire Notes Line
	4200 1150 5950 1150
Wire Notes Line
	4850 1050 4850 1950
Wire Notes Line
	5400 1050 5400 1950
Text Notes 6300 1150 0    60   ~ 0
M3 BME280
Text Notes 7100 1150 0    60   ~ 0
Signal
Text Notes 7750 1150 0    60   ~ 0
M4 BluePill
Text Notes 6350 1250 0    60   ~ 0
1 SDO
Text Notes 6350 1350 0    60   ~ 0
2 SCB
Text Notes 6350 1450 0    60   ~ 0
3 SDA
Text Notes 6350 1550 0    60   ~ 0
4 SCL
Text Notes 6350 1650 0    60   ~ 0
5 GND
Text Notes 6350 1750 0    60   ~ 0
6 VCC
Text Notes 7000 1250 0    60   ~ 0
BME_MISO2
Text Notes 7000 1350 0    60   ~ 0
BME_NSS2
Text Notes 7000 1450 0    60   ~ 0
BME_MOSI2
Text Notes 7000 1550 0    60   ~ 0
BME_SCK2
Text Notes 7700 1250 0    60   ~ 0
27 PB14
Text Notes 7700 1350 0    60   ~ 0
25 BME_NSS2
Text Notes 7700 1450 0    60   ~ 0
28 PB15
Text Notes 7700 1550 0    60   ~ 0
29 PA8
Wire Notes Line
	6300 1050 8350 1050
Wire Notes Line
	8350 1050 8350 1950
Wire Notes Line
	8350 1950 6300 1950
Wire Notes Line
	6300 1950 6300 1050
Wire Notes Line
	6300 1150 8350 1150
Wire Notes Line
	6900 1050 6900 1950
Wire Notes Line
	7600 1050 7650 1050
Wire Notes Line
	7650 1050 7650 1950
Text Label 8700 3850 0    60   ~ 0
CC_CHIP_RDYn
Text Label 9650 5200 0    60   ~ 0
CC_CHIP_RDYn
Text Label 9650 5300 0    60   ~ 0
CC_MISO1
Wire Wire Line
	8650 3850 9200 3850
Wire Bus Line
	9350 2400 9350 4150
Entry Bus Bus
	9250 2300 9350 2400
Entry Wire Line
	9250 3950 9350 3850
Entry Wire Line
	9250 4050 9350 3950
Entry Wire Line
	9250 4150 9350 4050
Entry Wire Line
	9250 4250 9350 4150
Wire Wire Line
	9550 5200 10300 5200
Wire Wire Line
	9550 5200 9550 5300
Wire Wire Line
	9550 5300 10300 5300
Text Notes 9050 5050 0    60   ~ 0
CC_CHIP_RDYn connected to CC_MISO1
$Comp
L GY-GPS6MV2 M?
U 1 1 5C543870
P 5750 5700
F 0 "M?" H 5250 6300 60  0000 C CNN
F 1 "GY-GPS6MV2" H 6200 4650 60  0000 C CNN
F 2 "" H 3950 6100 60  0001 C CNN
F 3 "" H 3950 6100 60  0001 C CNN
	1    5750 5700
	1    0    0    -1  
$EndComp
$Comp
L SIM800C M?
U 1 1 5C544788
P 2150 6500
F 0 "M?" H 2500 7900 60  0000 C CNN
F 1 "SIM800C" H 2600 7800 60  0000 C CNN
F 2 "" H 650 7550 60  0001 C CNN
F 3 "" H 650 7550 60  0001 C CNN
	1    2150 6500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5C544955
P 2250 7700
F 0 "#PWR?" H 2250 7450 50  0001 C CNN
F 1 "GND" H 2300 7550 50  0000 C CNN
F 2 "" H 2250 7700 50  0001 C CNN
F 3 "" H 2250 7700 50  0001 C CNN
	1    2250 7700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 7600 2250 7700
Wire Wire Line
	3150 7650 3150 7600
Wire Wire Line
	2250 7650 3150 7650
Connection ~ 2250 7650
Wire Wire Line
	2350 7600 2350 7650
Connection ~ 2350 7650
Wire Wire Line
	2450 7600 2450 7650
Connection ~ 2450 7650
Wire Wire Line
	2550 7600 2550 7650
Connection ~ 2550 7650
Wire Wire Line
	2650 7600 2650 7650
Connection ~ 2650 7650
Wire Wire Line
	2750 7600 2750 7650
Connection ~ 2750 7650
Wire Wire Line
	2850 7600 2850 7650
Connection ~ 2850 7650
Wire Wire Line
	2950 7600 2950 7650
Connection ~ 2950 7650
Wire Wire Line
	3050 7600 3050 7650
Connection ~ 3050 7650
Wire Wire Line
	800  5300 1950 5300
Wire Wire Line
	1950 5400 1650 5400
Wire Wire Line
	1650 5400 1650 5300
Connection ~ 1650 5300
$Comp
L C_Small C?
U 1 1 5C5451AA
P 1350 5450
F 0 "C?" H 1360 5520 50  0000 L CNN
F 1 "10p" H 1450 5400 50  0000 L CNN
F 2 "" H 1350 5450 50  0001 C CNN
F 3 "" H 1350 5450 50  0001 C CNN
	1    1350 5450
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5C5451E9
P 1200 5450
F 0 "C?" H 1210 5520 50  0000 L CNN
F 1 "33p" H 1150 5700 50  0000 L CNN
F 2 "" H 1200 5450 50  0001 C CNN
F 3 "" H 1200 5450 50  0001 C CNN
	1    1200 5450
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5C545222
P 1050 5450
F 0 "C?" H 1060 5520 50  0000 L CNN
F 1 "4.7u" H 950 5700 50  0000 L CNN
F 2 "" H 1050 5450 50  0001 C CNN
F 3 "" H 1050 5450 50  0001 C CNN
	1    1050 5450
	1    0    0    -1  
$EndComp
$Comp
L CP1_Small C?
U 1 1 5C545255
P 900 5450
F 0 "C?" H 910 5520 50  0000 L CNN
F 1 "100u" H 650 5400 50  0000 L CNN
F 2 "" H 900 5450 50  0001 C CNN
F 3 "" H 900 5450 50  0001 C CNN
	1    900  5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	800  5100 800  5300
Wire Wire Line
	900  5350 900  5300
Connection ~ 900  5300
Wire Wire Line
	1050 5350 1050 5300
Connection ~ 1050 5300
Wire Wire Line
	1200 5350 1200 5300
Connection ~ 1200 5300
Wire Wire Line
	1350 5350 1350 5300
Connection ~ 1350 5300
$Comp
L GND #PWR?
U 1 1 5C54555A
P 900 5650
F 0 "#PWR?" H 900 5400 50  0001 C CNN
F 1 "GND" H 900 5500 50  0000 C CNN
F 2 "" H 900 5650 50  0001 C CNN
F 3 "" H 900 5650 50  0001 C CNN
	1    900  5650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5C545601
P 1050 5650
F 0 "#PWR?" H 1050 5400 50  0001 C CNN
F 1 "GND" H 1050 5500 50  0000 C CNN
F 2 "" H 1050 5650 50  0001 C CNN
F 3 "" H 1050 5650 50  0001 C CNN
	1    1050 5650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5C545630
P 1200 5650
F 0 "#PWR?" H 1200 5400 50  0001 C CNN
F 1 "GND" H 1200 5500 50  0000 C CNN
F 2 "" H 1200 5650 50  0001 C CNN
F 3 "" H 1200 5650 50  0001 C CNN
	1    1200 5650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5C54565F
P 1350 5650
F 0 "#PWR?" H 1350 5400 50  0001 C CNN
F 1 "GND" H 1350 5500 50  0000 C CNN
F 2 "" H 1350 5650 50  0001 C CNN
F 3 "" H 1350 5650 50  0001 C CNN
	1    1350 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	900  5550 900  5650
Wire Wire Line
	1050 5550 1050 5650
Wire Wire Line
	1200 5550 1200 5650
Wire Wire Line
	1350 5550 1350 5650
Text Notes 750  5050 0    60   ~ 0
4.5V/2A\n
$Comp
L 3xAA BT?
U 1 1 5C547599
P -3000 6500
F 0 "BT?" H -3400 7400 60  0000 C CNN
F 1 "3xAA" H -1950 5750 60  0000 C CNN
F 2 "" H -3000 6500 60  0001 C CNN
F 3 "" H -3000 6500 60  0001 C CNN
	1    -3000 6500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5C54795E
P -3850 4650
F 0 "#PWR?" H -3850 4400 50  0001 C CNN
F 1 "GND" H -3800 4500 50  0000 C CNN
F 2 "" H -3850 4650 50  0001 C CNN
F 3 "" H -3850 4650 50  0001 C CNN
	1    -3850 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	-3700 4250 -3850 4250
Wire Wire Line
	-3850 4250 -3850 4650
Wire Wire Line
	-3700 4350 -3850 4350
Connection ~ -3850 4350
Wire Wire Line
	-3700 4450 -3850 4450
Connection ~ -3850 4450
Wire Wire Line
	-3700 4550 -3850 4550
Connection ~ -3850 4550
Wire Wire Line
	5700 4950 5700 4350
Wire Wire Line
	5800 4950 5800 4350
Text Label 5700 4700 1    60   ~ 0
GPS_RX
Text Label 5800 4700 1    60   ~ 0
GPS_TX
$Comp
L +3.3V #PWR?
U 1 1 5C548211
P 5600 4850
F 0 "#PWR?" H 5600 4700 50  0001 C CNN
F 1 "+3.3V" H 5450 4950 50  0000 C CNN
F 2 "" H 5600 4850 50  0001 C CNN
F 3 "" H 5600 4850 50  0001 C CNN
	1    5600 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 4850 5600 4950
$Comp
L GND #PWR?
U 1 1 5C54838E
P 5900 4850
F 0 "#PWR?" H 5900 4600 50  0001 C CNN
F 1 "GND" H 5900 4700 50  0000 C CNN
F 2 "" H 5900 4850 50  0001 C CNN
F 3 "" H 5900 4850 50  0001 C CNN
	1    5900 4850
	-1   0    0    1   
$EndComp
Wire Wire Line
	5900 4850 5900 4950
$Comp
L GND #PWR?
U 1 1 5C5485CD
P -2200 7400
F 0 "#PWR?" H -2200 7150 50  0001 C CNN
F 1 "GND" H -2150 7250 50  0000 C CNN
F 2 "" H -2200 7400 50  0001 C CNN
F 3 "" H -2200 7400 50  0001 C CNN
	1    -2200 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2200 7400 -2200 7350
$Comp
L STM32F103C8Tx-RESCUE-stratospheric_balloon U?
U 1 1 5C549133
P -3600 550
F 0 "U?" H -3600 575 50  0000 L BNN
F 1 "STM32F103C8Tx" H -550 575 50  0000 R BNN
F 2 "Housings_QFP:LQFP-48_7x7mm_Pitch0.5mm" H -550 525 50  0001 R TNN
F 3 "" H -3350 -1150 50  0001 C CNN
	1    -3600 550 
	1    0    0    -1  
$EndComp
$EndSCHEMATC
