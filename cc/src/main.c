/*
 * Copyright (c) 2012-2014 Wind River Systems, Inc.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <zephyr.h>

#include <device.h>
#include <misc/printk.h>
#include <misc/__assert.h>
#include <sensor.h>
#include <spi.h>
#include <stdio.h>

#include "cc1101.h"


void main(void)
{
    printk("[%s  %s] Hello World from %s!\n", __DATE__, __TIME__, CONFIG_BOARD);
    cc1101_init("SPI_1", "GPIOA", 1);

    struct device *bme = device_get_binding("BME280");

    while (1) {
        struct sensor_value temp, press, humidity;

        sensor_sample_fetch(bme);
        sensor_channel_get(bme, SENSOR_CHAN_AMBIENT_TEMP, &temp);
        sensor_channel_get(bme, SENSOR_CHAN_PRESS, &press);
        sensor_channel_get(bme, SENSOR_CHAN_HUMIDITY, &humidity);

        /*
           printf("temp: %d.%06d; press: %d.%06d; humidity: %d.%06d\n",
           temp.val1, temp.val2, press.val1, press.val2,
           humidity.val1, humidity.val2);
           */

        k_sleep(1000);
    }
}
