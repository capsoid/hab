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
P 1100 2000
F 0 "M1" H 600 2600 60  0000 C CNN
F 1 "CC1101_MODULE" H 1650 950 60  0000 C CNN
F 2 "" H 1100 2000 60  0001 C CNN
F 3 "" H 1100 2000 60  0001 C CNN
	1    1100 2000
	1    0    0    -1  
$EndComp
$Comp
L MPU6050_MODULE M2
U 1 1 5BFEA368
P 2400 2000
F 0 "M2" H 1900 2600 60  0000 C CNN
F 1 "MPU6050_MODULE" H 2400 1800 60  0000 C CNN
F 2 "" H 2400 2000 60  0001 C CNN
F 3 "" H 2400 2000 60  0001 C CNN
	1    2400 2000
	1    0    0    -1  
$EndComp
$Comp
L BME280_MODULE M3
U 1 1 5BFEAB37
P 3750 1700
F 0 "M3" H 3350 2000 60  0000 C CNN
F 1 "BME280_MODULE" H 3750 1400 60  0000 C CNN
F 2 "" H 3850 1400 60  0001 C CNN
F 3 "" H 3850 1400 60  0001 C CNN
	1    3750 1700
	1    0    0    -1  
$EndComp
$Comp
L STM32_BLUE-PILL_MODULE M4
U 1 1 5BFF28D8
P 5650 2000
F 0 "M4" H 5150 2600 60  0000 C CNN
F 1 "STM32_BLUE-PILL_MODULE" H 5650 300 60  0000 C CNN
F 2 "" V 4050 3050 60  0001 C CNN
F 3 "" V 4050 3050 60  0001 C CNN
	1    5650 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 2300 7000 2300
Wire Wire Line
	6400 2500 7000 2500
Wire Wire Line
	6400 2600 7000 2600
Wire Wire Line
	6400 2400 7000 2400
Text Label 6450 2600 0    60   ~ 0
CC_NSS1
Text Label 6450 2500 0    60   ~ 0
CC_SCK1
Text Label 6450 2300 0    60   ~ 0
CC_MOSI1
Wire Wire Line
	4900 2800 4400 2800
Wire Wire Line
	4900 2900 4400 2900
Wire Wire Line
	4900 3000 4500 3000
Wire Wire Line
	4900 3100 4500 3100
Text Label 4450 2800 0    60   ~ 0
MPU_SCL1
Text Label 4450 2900 0    60   ~ 0
MPU_SDA1
Text Label 4600 3000 0    60   ~ 0
SCL1
Text Label 4600 3100 0    60   ~ 0
SDA1
Wire Wire Line
	4900 1500 4400 1500
Wire Wire Line
	4900 1600 4400 1600
Wire Wire Line
	4900 1700 4400 1700
Wire Wire Line
	4900 1800 4400 1800
Text Label 4450 1500 0    60   ~ 0
BME_NSS2
Text Label 4450 1600 0    60   ~ 0
BME_SCK2
Text Label 4450 1700 0    60   ~ 0
BME_MISO2
Text Label 4450 1800 0    60   ~ 0
BME_MOSI2
$Comp
L GND #PWR01
U 1 1 5BFF8CBA
P 1250 1100
F 0 "#PWR01" H 1250 850 50  0001 C CNN
F 1 "GND" H 1300 950 50  0000 C CNN
F 2 "" H 1250 1100 50  0001 C CNN
F 3 "" H 1250 1100 50  0001 C CNN
	1    1250 1100
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR02
U 1 1 5BFF8CD6
P 2650 1100
F 0 "#PWR02" H 2650 850 50  0001 C CNN
F 1 "GND" H 2650 950 50  0000 C CNN
F 2 "" H 2650 1100 50  0001 C CNN
F 3 "" H 2650 1100 50  0001 C CNN
	1    2650 1100
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR03
U 1 1 5BFF8D0A
P 3900 1100
F 0 "#PWR03" H 3900 850 50  0001 C CNN
F 1 "GND" H 3900 950 50  0000 C CNN
F 2 "" H 3900 1100 50  0001 C CNN
F 3 "" H 3900 1100 50  0001 C CNN
	1    3900 1100
	-1   0    0    1   
$EndComp
Wire Wire Line
	3900 1250 3900 1100
Wire Wire Line
	2650 1250 2650 1100
$Comp
L +3.3V #PWR04
U 1 1 5BFF8DB3
P 750 1250
F 0 "#PWR04" H 750 1100 50  0001 C CNN
F 1 "+3.3V" H 900 1350 50  0000 C CNN
F 2 "" H 750 1250 50  0001 C CNN
F 3 "" H 750 1250 50  0001 C CNN
	1    750  1250
	-1   0    0    -1  
$EndComp
$Comp
L +3.3V #PWR05
U 1 1 5BFF8DFB
P 2750 1250
F 0 "#PWR05" H 2750 1100 50  0001 C CNN
F 1 "+3.3V" H 2750 1390 50  0000 C CNN
F 2 "" H 2750 1250 50  0001 C CNN
F 3 "" H 2750 1250 50  0001 C CNN
	1    2750 1250
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR06
U 1 1 5BFF8E17
P 4000 1250
F 0 "#PWR06" H 4000 1100 50  0001 C CNN
F 1 "+3.3V" H 4000 1390 50  0000 C CNN
F 2 "" H 4000 1250 50  0001 C CNN
F 3 "" H 4000 1250 50  0001 C CNN
	1    4000 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 1250 4000 1250
Wire Wire Line
	2750 1250 2750 1250
Wire Wire Line
	750  1250 750  1250
$Comp
L 2xAA BT1
U 1 1 5BFF91AA
P -1200 8300
F 0 "BT1" H -1600 9200 60  0000 C CNN
F 1 "2xAA" H -850 7550 60  0000 C CNN
F 2 "" H -1200 8300 60  0001 C CNN
F 3 "" H -1200 8300 60  0001 C CNN
	1    -1200 8300
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR07
U 1 1 5BFF9261
P -1400 7150
F 0 "#PWR07" H -1400 7000 50  0001 C CNN
F 1 "+3.3V" H -1400 7290 50  0000 C CNN
F 2 "" H -1400 7150 50  0001 C CNN
F 3 "" H -1400 7150 50  0001 C CNN
	1    -1400 7150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 5BFF92BC
P -900 7150
F 0 "#PWR08" H -900 6900 50  0001 C CNN
F 1 "GND" H -900 7000 50  0000 C CNN
F 2 "" H -900 7150 50  0001 C CNN
F 3 "" H -900 7150 50  0001 C CNN
	1    -900 7150
	-1   0    0    1   
$EndComp
Wire Wire Line
	-1400 7150 -1400 7250
Wire Wire Line
	-900 7150 -900 7250
$Comp
L LAZER_DIOD LD1
U 1 1 5C00014A
P 300 9450
F 0 "LD1" H 0   9950 60  0000 C CNN
F 1 "LAZER_DIOD" H 300 9250 60  0000 C CNN
F 2 "" H 300 9450 60  0001 C CNN
F 3 "" H 300 9450 60  0001 C CNN
	1    300  9450
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR09
U 1 1 5C0001E5
P 200 8900
F 0 "#PWR09" H 200 8750 50  0001 C CNN
F 1 "+3.3V" H 150 9050 50  0000 C CNN
F 2 "" H 200 8900 50  0001 C CNN
F 3 "" H 200 8900 50  0001 C CNN
	1    200  8900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 5C000244
P 300 8750
F 0 "#PWR010" H 300 8500 50  0001 C CNN
F 1 "GND" H 300 8600 50  0000 C CNN
F 2 "" H 300 8750 50  0001 C CNN
F 3 "" H 300 8750 50  0001 C CNN
	1    300  8750
	-1   0    0    1   
$EndComp
Wire Wire Line
	300  8750 300  8900
Wire Wire Line
	200  8900 200  8900
Wire Wire Line
	1250 1100 1250 1250
Wire Bus Line
	4300 750  4300 2800
Entry Wire Line
	4300 1400 4400 1500
Entry Wire Line
	4300 1500 4400 1600
Entry Wire Line
	4300 1600 4400 1700
Entry Wire Line
	4300 1700 4400 1800
Entry Wire Line
	1350 650  1450 750 
Entry Wire Line
	1250 650  1350 750 
Entry Wire Line
	1050 650  1150 750 
Entry Wire Line
	950  650  1050 750 
Entry Wire Line
	850  650  950  750 
Entry Wire Line
	750  650  850  750 
Wire Wire Line
	850  750  850  1250
Wire Wire Line
	950  750  950  1250
Wire Wire Line
	1050 750  1050 1250
Wire Wire Line
	1150 750  1150 1250
Wire Wire Line
	1350 750  1350 1250
Wire Wire Line
	1450 750  1450 1250
Text Label 1050 1200 1    60   ~ 0
CC_MISO1
Text Label 850  1200 1    60   ~ 0
CC_MOSI1
Text Label 950  1200 1    60   ~ 0
CC_SCK1
Text Label 1150 1200 1    60   ~ 0
CC_GDO2
Text Label 1350 1200 1    60   ~ 0
CC_GDO0
Text Label 1450 1200 1    60   ~ 0
CC_NSS1
Entry Bus Bus
	4200 650  4300 750 
Entry Bus Bus
	4200 650  4300 750 
Entry Wire Line
	4300 2000 4400 2100
Entry Wire Line
	4300 2100 4400 2200
Wire Wire Line
	4400 2100 4900 2100
Wire Wire Line
	4900 2200 4400 2200
Text Label 4850 2200 2    60   ~ 0
CC_GDO2
Text Label 4850 2100 2    60   ~ 0
CC_GDO0
Text Label 6450 2400 0    60   ~ 0
CC_MISO1
Entry Wire Line
	1950 650  2050 750 
Entry Wire Line
	2250 650  2350 750 
Entry Wire Line
	2350 650  2450 750 
Entry Wire Line
	2450 650  2550 750 
Wire Wire Line
	2050 1250 2050 750 
Wire Wire Line
	2350 1250 2350 750 
Wire Wire Line
	2450 1250 2450 750 
Wire Wire Line
	2550 1250 2550 750 
Entry Wire Line
	3400 650  3500 750 
Entry Wire Line
	3500 650  3600 750 
Entry Wire Line
	3600 650  3700 750 
Entry Wire Line
	3700 650  3800 750 
Wire Wire Line
	3800 750  3800 1250
Wire Wire Line
	3700 750  3700 1250
Wire Wire Line
	3600 750  3600 1250
Wire Wire Line
	3500 750  3500 1250
Text Label 3800 1250 1    60   ~ 0
BME_SCK2
Text Label 3500 1250 1    60   ~ 0
BME_MISO2
Text Label 3700 1250 1    60   ~ 0
BME_MOSI2
Text Label 3600 1250 1    60   ~ 0
BME_NSS2
$Comp
L GND #PWR011
U 1 1 5C0E5937
P 4800 3300
F 0 "#PWR011" H 4800 3050 50  0001 C CNN
F 1 "GND" H 4800 3150 50  0000 C CNN
F 2 "" H 4800 3300 50  0001 C CNN
F 3 "" H 4800 3300 50  0001 C CNN
	1    4800 3300
	0    1    1    0   
$EndComp
Wire Wire Line
	4900 3300 4800 3300
$Comp
L +3.3V #PWR012
U 1 1 5C0E59CA
P 4450 3350
F 0 "#PWR012" H 4450 3200 50  0001 C CNN
F 1 "+3.3V" H 4400 3500 50  0000 C CNN
F 2 "" H 4450 3350 50  0001 C CNN
F 3 "" H 4450 3350 50  0001 C CNN
	1    4450 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 3350 4450 3400
Wire Wire Line
	4450 3400 4900 3400
$Comp
L GND #PWR013
U 1 1 5C0E5B15
P 6550 1500
F 0 "#PWR013" H 6550 1250 50  0001 C CNN
F 1 "GND" H 6550 1350 50  0000 C CNN
F 2 "" H 6550 1500 50  0001 C CNN
F 3 "" H 6550 1500 50  0001 C CNN
	1    6550 1500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6400 1500 6550 1500
Wire Wire Line
	6400 1600 6500 1600
Wire Wire Line
	6500 1600 6500 1500
Connection ~ 6500 1500
$Comp
L +3.3V #PWR014
U 1 1 5C0E5C1F
P 6900 1600
F 0 "#PWR014" H 6900 1450 50  0001 C CNN
F 1 "+3.3V" H 6850 1750 50  0000 C CNN
F 2 "" H 6900 1600 50  0001 C CNN
F 3 "" H 6900 1600 50  0001 C CNN
	1    6900 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 1700 6900 1700
Wire Wire Line
	6900 1700 6900 1600
Entry Wire Line
	4300 2700 4400 2800
Entry Wire Line
	4300 2800 4400 2900
Text Label 2550 1200 1    60   ~ 0
MPU_SCL1
Text Label 2450 1200 1    60   ~ 0
MPU_SDA1
Wire Wire Line
	4900 2000 4400 2000
Entry Wire Line
	4300 1900 4400 2000
Text Label 4450 2000 0    60   ~ 0
MPU_INT
Text Label 2050 1200 1    60   ~ 0
MPU_INT
Wire Wire Line
	400  8900 400  8800
Wire Wire Line
	400  8800 900  8800
Text Label 450  8800 0    60   ~ 0
LASER_EN
Wire Wire Line
	4900 1900 4450 1900
Text Label 4450 1900 0    60   ~ 0
LASER_EN
Text Label 6450 2200 0    60   ~ 0
CC_CHIP_RDYn
Text Label 5050 4200 0    60   ~ 0
CC_CHIP_RDYn
Text Label 5050 4300 0    60   ~ 0
CC_MISO1
Wire Wire Line
	6400 2200 6950 2200
Wire Bus Line
	7100 750  7100 2500
Entry Bus Bus
	7000 650  7100 750 
Entry Wire Line
	7000 2300 7100 2200
Entry Wire Line
	7000 2400 7100 2300
Entry Wire Line
	7000 2500 7100 2400
Entry Wire Line
	7000 2600 7100 2500
Wire Wire Line
	4950 4200 5700 4200
Wire Wire Line
	4950 4200 4950 4300
Wire Wire Line
	4950 4300 5700 4300
Text Notes 4450 4050 0    60   ~ 0
CC_CHIP_RDYn connected to CC_MISO1
$Comp
L GY-GPS6MV2 M?
U 1 1 5C543870
P 3200 3550
F 0 "M?" H 2700 4150 60  0000 C CNN
F 1 "GY-GPS6MV2" H 3650 2500 60  0000 C CNN
F 2 "" H 1400 3950 60  0001 C CNN
F 3 "" H 1400 3950 60  0001 C CNN
	1    3200 3550
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
P 9600 2250
F 0 "BT?" H 9200 3150 60  0000 C CNN
F 1 "3xAA" H 10650 1500 60  0000 C CNN
F 2 "" H 9600 2250 60  0001 C CNN
F 3 "" H 9600 2250 60  0001 C CNN
	1    9600 2250
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
	-3850 3750 -3850 4650
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
	3150 2800 3150 2200
Wire Wire Line
	3250 2800 3250 2200
Text Label 3150 2550 1    60   ~ 0
GPS_RX
Text Label 3250 2550 1    60   ~ 0
GPS_TX
$Comp
L +3.3V #PWR?
U 1 1 5C548211
P 3050 2700
F 0 "#PWR?" H 3050 2550 50  0001 C CNN
F 1 "+3.3V" H 2900 2800 50  0000 C CNN
F 2 "" H 3050 2700 50  0001 C CNN
F 3 "" H 3050 2700 50  0001 C CNN
	1    3050 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 2700 3050 2800
$Comp
L GND #PWR?
U 1 1 5C54838E
P 3350 2700
F 0 "#PWR?" H 3350 2450 50  0001 C CNN
F 1 "GND" H 3350 2550 50  0000 C CNN
F 2 "" H 3350 2700 50  0001 C CNN
F 3 "" H 3350 2700 50  0001 C CNN
	1    3350 2700
	-1   0    0    1   
$EndComp
Wire Wire Line
	3350 2700 3350 2800
$Comp
L GND #PWR?
U 1 1 5C5485CD
P 10400 3150
F 0 "#PWR?" H 10400 2900 50  0001 C CNN
F 1 "GND" H 10450 3000 50  0000 C CNN
F 2 "" H 10400 3150 50  0001 C CNN
F 3 "" H 10400 3150 50  0001 C CNN
	1    10400 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 3150 10400 3100
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
Text Label 850  6500 0    60   ~ 0
GSM_TX
Text Label 850  6600 0    60   ~ 0
GSM_RX
Wire Wire Line
	850  5900 1950 5900
Wire Wire Line
	850  6000 1450 6000
Wire Wire Line
	850  6100 1450 6100
Wire Wire Line
	850  6200 1450 6200
Text Label 850  5900 0    60   ~ 0
GSM_SIM_VDD
Text Label 850  6000 0    60   ~ 0
GSM_SIM_DATA
Text Label 850  6100 0    60   ~ 0
GSM_SIM_CLK
Text Label 850  6200 0    60   ~ 0
GSM_SIM_RST
Wire Wire Line
	1450 5700 1950 5700
$Comp
L R R?
U 1 1 5CA6279D
P 1600 6000
F 0 "R?" V 1680 6000 50  0000 C CNN
F 1 "R" V 1600 6000 50  0000 C CNN
F 2 "" V 1530 6000 50  0001 C CNN
F 3 "" H 1600 6000 50  0001 C CNN
	1    1600 6000
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 5CA627E5
P 1600 6100
F 0 "R?" V 1680 6100 50  0000 C CNN
F 1 "R" V 1600 6100 50  0000 C CNN
F 2 "" V 1530 6100 50  0001 C CNN
F 3 "" H 1600 6100 50  0001 C CNN
	1    1600 6100
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 5CA62828
P 1600 6200
F 0 "R?" V 1680 6200 50  0000 C CNN
F 1 "R" V 1600 6200 50  0000 C CNN
F 2 "" V 1530 6200 50  0001 C CNN
F 3 "" H 1600 6200 50  0001 C CNN
	1    1600 6200
	0    1    1    0   
$EndComp
Wire Wire Line
	1750 6000 1950 6000
Wire Wire Line
	1750 6100 1950 6100
Wire Wire Line
	1750 6200 1950 6200
$Comp
L C_Small C?
U 1 1 5CA63034
P 1800 6350
F 0 "C?" H 1810 6420 50  0000 L CNN
F 1 "22p" H 1900 6300 50  0000 L CNN
F 2 "" H 1800 6350 50  0001 C CNN
F 3 "" H 1800 6350 50  0001 C CNN
	1    1800 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 6250 1800 6000
Connection ~ 1800 6000
$Comp
L GND #PWR?
U 1 1 5CA63468
P 1800 6700
F 0 "#PWR?" H 1800 6450 50  0001 C CNN
F 1 "GND" H 1800 6550 50  0000 C CNN
F 2 "" H 1800 6700 50  0001 C CNN
F 3 "" H 1800 6700 50  0001 C CNN
	1    1800 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 6450 1800 6700
Text Label 1450 5700 0    60   ~ 0
GSM_PWRKEY
$Comp
L Q_NPN_BCE Q?
U 1 1 5CA63DC4
P 1550 7250
F 0 "Q?" H 1750 7300 50  0000 L CNN
F 1 "Q_NPN_BCE" H 1750 7200 50  0000 L CNN
F 2 "" H 1750 7350 50  0001 C CNN
F 3 "" H 1550 7250 50  0001 C CNN
	1    1550 7250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5CA63E7F
P 1650 7600
F 0 "#PWR?" H 1650 7350 50  0001 C CNN
F 1 "GND" H 1650 7450 50  0000 C CNN
F 2 "" H 1650 7600 50  0001 C CNN
F 3 "" H 1650 7600 50  0001 C CNN
	1    1650 7600
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5CA63EC3
P 1300 7450
F 0 "R?" V 1380 7450 50  0000 C CNN
F 1 "R" V 1300 7450 50  0000 C CNN
F 2 "" V 1230 7450 50  0001 C CNN
F 3 "" H 1300 7450 50  0001 C CNN
	1    1300 7450
	-1   0    0    1   
$EndComp
$Comp
L R R?
U 1 1 5CA63F2B
P 1100 7250
F 0 "R?" V 1180 7250 50  0000 C CNN
F 1 "R" V 1100 7250 50  0000 C CNN
F 2 "" V 1030 7250 50  0001 C CNN
F 3 "" H 1100 7250 50  0001 C CNN
	1    1100 7250
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR?
U 1 1 5CA63F88
P 1300 7650
F 0 "#PWR?" H 1300 7400 50  0001 C CNN
F 1 "GND" H 1300 7500 50  0000 C CNN
F 2 "" H 1300 7650 50  0001 C CNN
F 3 "" H 1300 7650 50  0001 C CNN
	1    1300 7650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 7600 1650 7450
Wire Wire Line
	1300 7600 1300 7650
Wire Wire Line
	1250 7250 1350 7250
Wire Wire Line
	1300 7300 1300 7250
Connection ~ 1300 7250
Wire Wire Line
	1650 7050 1650 6950
Wire Wire Line
	1650 6950 1400 6950
Wire Wire Line
	950  7250 800  7250
Text Label 1400 6950 0    60   ~ 0
GSM_PWRKEY
Text Label 800  7250 0    60   ~ 0
PWRKEY
$Comp
L R R?
U 1 1 5CA65686
P 4350 7200
F 0 "R?" V 4430 7200 50  0000 C CNN
F 1 "R" V 4350 7200 50  0000 C CNN
F 2 "" V 4280 7200 50  0001 C CNN
F 3 "" H 4350 7200 50  0001 C CNN
	1    4350 7200
	0    -1   -1   0   
$EndComp
$Comp
L C_Small C?
U 1 1 5CA65792
P 4100 7400
F 0 "C?" H 4110 7470 50  0000 L CNN
F 1 "22p" H 4200 7350 50  0000 L CNN
F 2 "" H 4100 7400 50  0001 C CNN
F 3 "" H 4100 7400 50  0001 C CNN
	1    4100 7400
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5CA65806
P 4600 7400
F 0 "C?" H 4610 7470 50  0000 L CNN
F 1 "22p" H 4700 7350 50  0000 L CNN
F 2 "" H 4600 7400 50  0001 C CNN
F 3 "" H 4600 7400 50  0001 C CNN
	1    4600 7400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5CA658F1
P 4100 7550
F 0 "#PWR?" H 4100 7300 50  0001 C CNN
F 1 "GND" H 4100 7400 50  0000 C CNN
F 2 "" H 4100 7550 50  0001 C CNN
F 3 "" H 4100 7550 50  0001 C CNN
	1    4100 7550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5CA65953
P 4600 7550
F 0 "#PWR?" H 4600 7300 50  0001 C CNN
F 1 "GND" H 4600 7400 50  0000 C CNN
F 2 "" H 4600 7550 50  0001 C CNN
F 3 "" H 4600 7550 50  0001 C CNN
	1    4600 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 7550 4100 7500
Wire Wire Line
	4600 7550 4600 7500
Wire Wire Line
	3650 7200 4200 7200
Wire Wire Line
	4100 7200 4100 7300
Wire Wire Line
	4500 7200 4850 7200
Wire Wire Line
	4600 7200 4600 7300
Connection ~ 4600 7200
Connection ~ 4100 7200
Wire Wire Line
	3400 6500 3650 6500
Wire Wire Line
	3650 6500 3650 7200
Wire Bus Line
	750  650  7000 650 
Text Notes 1000 4950 0    60   ~ 0
The power supply range of SIM800C is from 3.4V to 4.4V. Recommended voltage is 4.0V. The transmitting\nburst will cause voltage drop and the power supply must be able to provide sufficient current up to 2A. For the\nVBAT input, a bypass capacitor (low ESR) such as a 100 µF is strongly recommended.
$Comp
L SIM_Card J?
U 1 1 5CA678FC
P 6350 5900
F 0 "J?" H 6250 6400 50  0000 R CNN
F 1 "SIM_Card" H 6300 6300 50  0000 R CNN
F 2 "" H 6350 6250 50  0000 C CNN
F 3 "" H 6300 5900 50  0000 C CNN
	1    6350 5900
	1    0    0    -1  
$EndComp
$Comp
L SD_Card J?
U 1 1 5CA67BCF
P 8500 5100
F 0 "J?" H 7850 5650 50  0000 C CNN
F 1 "SD_Card" H 9100 4550 50  0000 C CNN
F 2 "10067847-001" H 8700 5450 50  0001 C CNN
F 3 "" H 8500 5100 50  0001 C CNN
	1    8500 5100
	1    0    0    -1  
$EndComp
Text Notes -3350 5400 0    60   ~ 0
SWD
$Comp
L LM1117-3.3 U?
U 1 1 5CA68356
P 7600 3250
F 0 "U?" H 7450 3375 50  0000 C CNN
F 1 "LM1117-3.3" H 7600 3375 50  0000 L CNN
F 2 "" H 7600 3250 50  0001 C CNN
F 3 "" H 7600 3250 50  0001 C CNN
	1    7600 3250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5CA68499
P 7600 3550
F 0 "#PWR?" H 7600 3300 50  0001 C CNN
F 1 "GND" H 7650 3400 50  0000 C CNN
F 2 "" H 7600 3550 50  0001 C CNN
F 3 "" H 7600 3550 50  0001 C CNN
	1    7600 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 1200 7250 1200
Wire Wire Line
	7250 1200 7250 3350
Wire Wire Line
	7250 3250 7300 3250
Wire Wire Line
	7900 3250 8200 3250
$Comp
L +3.3V #PWR?
U 1 1 5CA689E6
P 8200 3250
F 0 "#PWR?" H 8200 3100 50  0001 C CNN
F 1 "+3.3V" H 8200 3390 50  0000 C CNN
F 2 "" H 8200 3250 50  0001 C CNN
F 3 "" H 8200 3250 50  0001 C CNN
	1    8200 3250
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5CA68BBF
P 7250 3450
F 0 "C?" H 7260 3520 50  0000 L CNN
F 1 "22p" H 7350 3400 50  0000 L CNN
F 2 "" H 7250 3450 50  0001 C CNN
F 3 "" H 7250 3450 50  0001 C CNN
	1    7250 3450
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5CA68D8F
P 7950 3450
F 0 "C?" H 7960 3520 50  0000 L CNN
F 1 "22p" H 8050 3400 50  0000 L CNN
F 2 "" H 7950 3450 50  0001 C CNN
F 3 "" H 7950 3450 50  0001 C CNN
	1    7950 3450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5CA68E12
P 7250 3650
F 0 "#PWR?" H 7250 3400 50  0001 C CNN
F 1 "GND" H 7300 3500 50  0000 C CNN
F 2 "" H 7250 3650 50  0001 C CNN
F 3 "" H 7250 3650 50  0001 C CNN
	1    7250 3650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5CA68E86
P 7950 3650
F 0 "#PWR?" H 7950 3400 50  0001 C CNN
F 1 "GND" H 8000 3500 50  0000 C CNN
F 2 "" H 7950 3650 50  0001 C CNN
F 3 "" H 7950 3650 50  0001 C CNN
	1    7950 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 3650 7950 3550
Wire Wire Line
	7950 3350 7950 3250
Connection ~ 7950 3250
Connection ~ 7250 3250
Wire Wire Line
	7250 3650 7250 3550
$Comp
L Q_NMOS_DGS Q?
U 1 1 5CA69712
P 10550 4100
F 0 "Q?" H 10750 4150 50  0000 L CNN
F 1 "Q_NMOS_DGS" H 10750 4050 50  0000 L CNN
F 2 "" H 10750 4200 50  0001 C CNN
F 3 "" H 10550 4100 50  0001 C CNN
	1    10550 4100
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5CA69B16
P 10300 4300
F 0 "R?" V 10380 4300 50  0000 C CNN
F 1 "R" V 10300 4300 50  0000 C CNN
F 2 "" V 10230 4300 50  0001 C CNN
F 3 "" H 10300 4300 50  0001 C CNN
	1    10300 4300
	-1   0    0    1   
$EndComp
$Comp
L R R?
U 1 1 5CA69B1C
P 10100 4100
F 0 "R?" V 10180 4100 50  0000 C CNN
F 1 "R" V 10100 4100 50  0000 C CNN
F 2 "" V 10030 4100 50  0001 C CNN
F 3 "" H 10100 4100 50  0001 C CNN
	1    10100 4100
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR?
U 1 1 5CA69B22
P 10300 4500
F 0 "#PWR?" H 10300 4250 50  0001 C CNN
F 1 "GND" H 10300 4350 50  0000 C CNN
F 2 "" H 10300 4500 50  0001 C CNN
F 3 "" H 10300 4500 50  0001 C CNN
	1    10300 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 4450 10300 4500
Wire Wire Line
	10250 4100 10350 4100
Wire Wire Line
	10300 4150 10300 4100
Connection ~ 10300 4100
Wire Wire Line
	9950 4100 9800 4100
$Comp
L GND #PWR?
U 1 1 5CA69DA0
P 10650 4500
F 0 "#PWR?" H 10650 4250 50  0001 C CNN
F 1 "GND" H 10650 4350 50  0000 C CNN
F 2 "" H 10650 4500 50  0001 C CNN
F 3 "" H 10650 4500 50  0001 C CNN
	1    10650 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	10650 4300 10650 4500
$Comp
L Conn_01x02 J?
U 1 1 5CA6A0D7
P 10850 3700
F 0 "J?" H 10850 3800 50  0000 C CNN
F 1 "Conn_01x02" H 10850 3500 50  0000 C CNN
F 2 "" H 10850 3700 50  0001 C CNN
F 3 "" H 10850 3700 50  0001 C CNN
	1    10850 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	10650 3800 10650 3900
Wire Wire Line
	10650 3700 8800 3700
Wire Wire Line
	8800 3700 8800 2800
Wire Wire Line
	8800 2800 7250 2800
Connection ~ 7250 2800
$Comp
L GND #PWR?
U 1 1 5CA6AB48
P 5100 6050
F 0 "#PWR?" H 5100 5800 50  0001 C CNN
F 1 "GND" H 5100 5900 50  0000 C CNN
F 2 "" H 5100 6050 50  0001 C CNN
F 3 "" H 5100 6050 50  0001 C CNN
	1    5100 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 5800 5850 5800
Wire Wire Line
	5250 5700 5850 5700
Text Label 5250 5600 0    60   ~ 0
GSM_SIM_VDD
Text Label 5250 6100 0    60   ~ 0
GSM_SIM_DATA
Text Label 5250 5800 0    60   ~ 0
GSM_SIM_CLK
Text Label 5250 5700 0    60   ~ 0
GSM_SIM_RST
Wire Wire Line
	5850 5600 5250 5600
Wire Wire Line
	5850 6100 5250 6100
Wire Wire Line
	5850 5900 5100 5900
Wire Wire Line
	5100 5900 5100 6050
$Comp
L R R?
U 1 1 5CA6C0C0
P 1250 6850
F 0 "R?" V 1330 6850 50  0000 C CNN
F 1 "R" V 1250 6850 50  0000 C CNN
F 2 "" V 1180 6850 50  0001 C CNN
F 3 "" H 1250 6850 50  0001 C CNN
	1    1250 6850
	-1   0    0    1   
$EndComp
$Comp
L R R?
U 1 1 5CA6C174
P 1500 6600
F 0 "R?" V 1580 6600 50  0000 C CNN
F 1 "R" V 1500 6600 50  0000 C CNN
F 2 "" V 1430 6600 50  0001 C CNN
F 3 "" H 1500 6600 50  0001 C CNN
	1    1500 6600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	850  6600 1350 6600
Wire Wire Line
	1650 6600 1950 6600
$Comp
L GND #PWR?
U 1 1 5CA6C5F6
P 1250 7000
F 0 "#PWR?" H 1250 6750 50  0001 C CNN
F 1 "GND" H 1250 6850 50  0000 C CNN
F 2 "" H 1250 7000 50  0001 C CNN
F 3 "" H 1250 7000 50  0001 C CNN
	1    1250 7000
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5CA6C67C
P 1350 6500
F 0 "R?" V 1430 6500 50  0000 C CNN
F 1 "R" V 1350 6500 50  0000 C CNN
F 2 "" V 1280 6500 50  0001 C CNN
F 3 "" H 1350 6500 50  0001 C CNN
	1    1350 6500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	850  6500 1200 6500
Wire Wire Line
	1500 6500 1950 6500
Wire Wire Line
	1250 6700 1700 6700
Wire Wire Line
	1700 6700 1700 6500
Connection ~ 1700 6500
$Comp
L SW_Push SW?
U 1 1 5CA6D854
P -4750 3550
F 0 "SW?" H -4700 3650 50  0000 L CNN
F 1 "SW_Push" H -4750 3490 50  0000 C CNN
F 2 "" H -4750 3750 50  0001 C CNN
F 3 "" H -4750 3750 50  0001 C CNN
	1    -4750 3550
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR?
U 1 1 5CA6DAFB
P -4750 3800
F 0 "#PWR?" H -4750 3550 50  0001 C CNN
F 1 "GND" H -4700 3650 50  0000 C CNN
F 2 "" H -4750 3800 50  0001 C CNN
F 3 "" H -4750 3800 50  0001 C CNN
	1    -4750 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	-4750 3350 -3700 3350
$Comp
L R R?
U 1 1 5CA6E0D6
P -4450 3050
F 0 "R?" V -4370 3050 50  0000 C CNN
F 1 "R" V -4450 3050 50  0000 C CNN
F 2 "" V -4520 3050 50  0001 C CNN
F 3 "" H -4450 3050 50  0001 C CNN
	1    -4450 3050
	-1   0    0    1   
$EndComp
$Comp
L C_Small C?
U 1 1 5CA6E4C2
P -4450 3550
F 0 "C?" H -4440 3620 50  0000 L CNN
F 1 "22p" H -4350 3500 50  0000 L CNN
F 2 "" H -4450 3550 50  0001 C CNN
F 3 "" H -4450 3550 50  0001 C CNN
	1    -4450 3550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5CA6E6B6
P -4450 3800
F 0 "#PWR?" H -4450 3550 50  0001 C CNN
F 1 "GND" H -4400 3650 50  0000 C CNN
F 2 "" H -4450 3800 50  0001 C CNN
F 3 "" H -4450 3800 50  0001 C CNN
	1    -4450 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	-4450 3200 -4450 3450
Connection ~ -4450 3350
Wire Wire Line
	-4450 3650 -4450 3800
Wire Wire Line
	-3950 950  -3700 950 
Wire Wire Line
	-3950 550  -3950 950 
Wire Wire Line
	-3700 850  -3950 850 
Connection ~ -3950 850 
Wire Wire Line
	-3700 750  -3950 750 
Connection ~ -3950 750 
Wire Wire Line
	-3700 650  -3950 650 
Connection ~ -3950 650 
$Comp
L +3.3V #PWR?
U 1 1 5CA6F28B
P -3950 550
F 0 "#PWR?" H -3950 400 50  0001 C CNN
F 1 "+3.3V" H -4000 700 50  0000 C CNN
F 2 "" H -3950 550 50  0001 C CNN
F 3 "" H -3950 550 50  0001 C CNN
	1    -3950 550 
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 5CA6F707
P -4450 2850
F 0 "#PWR?" H -4450 2700 50  0001 C CNN
F 1 "+3.3V" H -4500 3000 50  0000 C CNN
F 2 "" H -4450 2850 50  0001 C CNN
F 3 "" H -4450 2850 50  0001 C CNN
	1    -4450 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	-4450 2900 -4450 2850
$Comp
L R R?
U 1 1 5CA70366
P -150 2650
F 0 "R?" V -70 2650 50  0000 C CNN
F 1 "R" V -150 2650 50  0000 C CNN
F 2 "" V -220 2650 50  0001 C CNN
F 3 "" H -150 2650 50  0001 C CNN
	1    -150 2650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	-4750 3750 -4750 3800
Wire Wire Line
	-3700 3750 -3850 3750
Connection ~ -3850 4250
$Comp
L R R?
U 1 1 5CA7116B
P -4050 3500
F 0 "R?" V -3970 3500 50  0000 C CNN
F 1 "R" V -4050 3500 50  0000 C CNN
F 2 "" V -4120 3500 50  0001 C CNN
F 3 "" H -4050 3500 50  0001 C CNN
	1    -4050 3500
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 5CA71D1A
P -4050 3600
F 0 "R?" V -3970 3600 50  0000 C CNN
F 1 "R" V -4050 3600 50  0000 C CNN
F 2 "" V -4120 3600 50  0001 C CNN
F 3 "" H -4050 3600 50  0001 C CNN
	1    -4050 3600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	-3900 3500 -3850 3500
Wire Wire Line
	-3850 3500 -3850 3600
Wire Wire Line
	-3850 3600 -3900 3600
Wire Wire Line
	-3700 3550 -3850 3550
Connection ~ -3850 3550
$Comp
L GND #PWR?
U 1 1 5CA7204E
P -4200 3800
F 0 "#PWR?" H -4200 3550 50  0001 C CNN
F 1 "GND" H -4150 3650 50  0000 C CNN
F 2 "" H -4200 3800 50  0001 C CNN
F 3 "" H -4200 3800 50  0001 C CNN
	1    -4200 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	-4200 3800 -4200 3600
$Comp
L +3.3V #PWR?
U 1 1 5CA7229E
P -4200 3300
F 0 "#PWR?" H -4200 3150 50  0001 C CNN
F 1 "+3.3V" H -4250 3450 50  0000 C CNN
F 2 "" H -4200 3300 50  0001 C CNN
F 3 "" H -4200 3300 50  0001 C CNN
	1    -4200 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	-4200 3300 -4200 3500
$Comp
L R R?
U 1 1 5CA72659
P -150 2500
F 0 "R?" V -70 2500 50  0000 C CNN
F 1 "R" V -150 2500 50  0000 C CNN
F 2 "" V -220 2500 50  0001 C CNN
F 3 "" H -150 2500 50  0001 C CNN
	1    -150 2500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	-300 2500 -350 2500
Wire Wire Line
	-350 2500 -350 2650
Wire Wire Line
	-350 2650 -300 2650
Wire Wire Line
	-450 2550 -350 2550
Connection ~ -350 2550
$Comp
L GND #PWR?
U 1 1 5CA72957
P 50 2700
F 0 "#PWR?" H 50  2450 50  0001 C CNN
F 1 "GND" H 100 2550 50  0000 C CNN
F 2 "" H 50  2700 50  0001 C CNN
F 3 "" H 50  2700 50  0001 C CNN
	1    50   2700
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 5CA729E6
P 50 2450
F 0 "#PWR?" H 50  2300 50  0001 C CNN
F 1 "+3.3V" H 0   2600 50  0000 C CNN
F 2 "" H 50  2450 50  0001 C CNN
F 3 "" H 50  2450 50  0001 C CNN
	1    50   2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	50   2450 50   2500
Wire Wire Line
	50   2500 0    2500
Wire Wire Line
	0    2650 50   2650
Wire Wire Line
	50   2650 50   2700
$Comp
L Crystal Y?
U 1 1 5CA7322D
P -1900 5450
F 0 "Y?" H -1900 5600 50  0000 C CNN
F 1 "Crystal" H -1900 5300 50  0000 C CNN
F 2 "" H -1900 5450 50  0001 C CNN
F 3 "" H -1900 5450 50  0001 C CNN
	1    -1900 5450
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5CA732E7
P -2250 5950
F 0 "C?" H -2240 6020 50  0000 L CNN
F 1 "22p" H -2150 5900 50  0000 L CNN
F 2 "" H -2250 5950 50  0001 C CNN
F 3 "" H -2250 5950 50  0001 C CNN
	1    -2250 5950
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5CA7339B
P -1550 5950
F 0 "C?" H -1540 6020 50  0000 L CNN
F 1 "22p" H -1450 5900 50  0000 L CNN
F 2 "" H -1550 5950 50  0001 C CNN
F 3 "" H -1550 5950 50  0001 C CNN
	1    -1550 5950
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5CA734F7
P -1900 5750
F 0 "R?" V -1820 5750 50  0000 C CNN
F 1 "R" V -1900 5750 50  0000 C CNN
F 2 "" V -1970 5750 50  0001 C CNN
F 3 "" H -1900 5750 50  0001 C CNN
	1    -1900 5750
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR?
U 1 1 5CA735D9
P -2250 6150
F 0 "#PWR?" H -2250 5900 50  0001 C CNN
F 1 "GND" H -2200 6000 50  0000 C CNN
F 2 "" H -2250 6150 50  0001 C CNN
F 3 "" H -2250 6150 50  0001 C CNN
	1    -2250 6150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5CA73674
P -1550 6150
F 0 "#PWR?" H -1550 5900 50  0001 C CNN
F 1 "GND" H -1500 6000 50  0000 C CNN
F 2 "" H -1550 6150 50  0001 C CNN
F 3 "" H -1550 6150 50  0001 C CNN
	1    -1550 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	-2050 5450 -2250 5450
Wire Wire Line
	-2250 5050 -2250 5850
Wire Wire Line
	-2250 6050 -2250 6150
Wire Wire Line
	-2050 5750 -2250 5750
Connection ~ -2250 5750
Wire Wire Line
	-1750 5450 -1550 5450
Wire Wire Line
	-1550 5250 -1550 5850
Wire Wire Line
	-1550 6050 -1550 6150
Wire Wire Line
	-1750 5750 -1550 5750
Connection ~ -1550 5750
Wire Wire Line
	-2250 5050 -1350 5050
Connection ~ -2250 5450
Wire Wire Line
	-1550 5250 -1350 5250
Connection ~ -1550 5450
$Comp
L Crystal Y?
U 1 1 5CA743E7
P -550 5450
F 0 "Y?" H -550 5600 50  0000 C CNN
F 1 "Crystal" H -550 5300 50  0000 C CNN
F 2 "" H -550 5450 50  0001 C CNN
F 3 "" H -550 5450 50  0001 C CNN
	1    -550 5450
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5CA743ED
P -900 5950
F 0 "C?" H -890 6020 50  0000 L CNN
F 1 "22p" H -800 5900 50  0000 L CNN
F 2 "" H -900 5950 50  0001 C CNN
F 3 "" H -900 5950 50  0001 C CNN
	1    -900 5950
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5CA743F3
P -200 5950
F 0 "C?" H -190 6020 50  0000 L CNN
F 1 "22p" H -100 5900 50  0000 L CNN
F 2 "" H -200 5950 50  0001 C CNN
F 3 "" H -200 5950 50  0001 C CNN
	1    -200 5950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5CA743FF
P -900 6150
F 0 "#PWR?" H -900 5900 50  0001 C CNN
F 1 "GND" H -850 6000 50  0000 C CNN
F 2 "" H -900 6150 50  0001 C CNN
F 3 "" H -900 6150 50  0001 C CNN
	1    -900 6150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5CA74405
P -200 6150
F 0 "#PWR?" H -200 5900 50  0001 C CNN
F 1 "GND" H -150 6000 50  0000 C CNN
F 2 "" H -200 6150 50  0001 C CNN
F 3 "" H -200 6150 50  0001 C CNN
	1    -200 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	-700 5450 -900 5450
Wire Wire Line
	-900 5050 -900 5850
Wire Wire Line
	-900 6050 -900 6150
Connection ~ -900 5750
Wire Wire Line
	-400 5450 -200 5450
Wire Wire Line
	-200 5250 -200 5850
Wire Wire Line
	-200 6050 -200 6150
Connection ~ -200 5750
Wire Wire Line
	-900 5050 0    5050
Connection ~ -900 5450
Wire Wire Line
	-200 5250 0    5250
Connection ~ -200 5450
Wire Wire Line
	-450 4450 -150 4450
Wire Wire Line
	-450 4550 -150 4550
Text Label -300 4450 0    60   ~ 0
8MHZ_A
Text Label -300 4550 0    60   ~ 0
8MHZ_B
Text Label -1700 5050 0    60   ~ 0
8MHZ_A
Text Label -1500 5250 0    60   ~ 0
8MHZ_B
Wire Wire Line
	-450 4150 -150 4150
Wire Wire Line
	-450 4250 -150 4250
Text Label -300 4150 0    60   ~ 0
32KHZ_A
Text Label -300 4250 0    60   ~ 0
32KHZ_B
Text Label -450 5050 0    60   ~ 0
32KHZ_A
Text Label -150 5250 0    60   ~ 0
32KHZ_B
$Comp
L Conn_01x04 J?
U 1 1 5CA75E53
P -3250 5750
F 0 "J?" H -3250 5950 50  0000 C CNN
F 1 "Conn_01x04" H -3250 5450 50  0000 C CNN
F 2 "" H -3250 5750 50  0001 C CNN
F 3 "" H -3250 5750 50  0001 C CNN
	1    -3250 5750
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 5CA7600C
P -2950 5900
F 0 "#PWR?" H -2950 5650 50  0001 C CNN
F 1 "GND" H -2900 5750 50  0000 C CNN
F 2 "" H -2950 5900 50  0001 C CNN
F 3 "" H -2950 5900 50  0001 C CNN
	1    -2950 5900
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR?
U 1 1 5CA76149
P -2950 5500
F 0 "#PWR?" H -2950 5350 50  0001 C CNN
F 1 "+3.3V" H -3000 5650 50  0000 C CNN
F 2 "" H -2950 5500 50  0001 C CNN
F 3 "" H -2950 5500 50  0001 C CNN
	1    -2950 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	-3050 5550 -2950 5550
Wire Wire Line
	-2950 5550 -2950 5500
Wire Wire Line
	-3050 5850 -2950 5850
Wire Wire Line
	-2950 5850 -2950 5900
Wire Wire Line
	-3050 5650 -2550 5650
Wire Wire Line
	-3050 5750 -2550 5750
Text Label -2900 5750 0    60   ~ 0
SWD_CLK
Text Label -2900 5650 0    60   ~ 0
SWD_IO
Wire Wire Line
	-450 1950 0    1950
Wire Wire Line
	-450 2050 0    2050
Text Label -300 1950 0    60   ~ 0
SWD_IO
Text Label -300 2050 0    60   ~ 0
SWD_CLK
$EndSCHEMATC
