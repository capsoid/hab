/*
 * Copyright (c) 2012-2014 Wind River Systems, Inc.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <zephyr.h>

#include <device.h>
#include <misc/printk.h>
#include <sensor.h>
#include <spi.h>
#include <stdio.h>

struct spi_config cc1101_spi_config = {
    .frequency = 24000000,
    .operation = SPI_OP_MODE_MASTER | SPI_WORD_SET(8) | SPI_TRANSFER_MSB | SPI_MODE_CPOL | SPI_MODE_CPHA,
    .slave = 0,
    .cs = NULL,
};

u8_t cmd = 42;
struct spi_buf tx_buf = { .buf = &cmd, .len = 1 };
struct spi_buf_set tx_bufs = { .buffers = &tx_buf, .count = 1 };

void main(void)
{
    printk("[%s  %s] Hello World from %s!\n", __DATE__, __TIME__, CONFIG_BOARD);

    struct device *bme = device_get_binding("BME280");
    struct device *cc1101 = device_get_binding("SPI_1");

    printf("dev %p name %s\n", bme, bme->config->name);

    spi_write(cc1101, &cc1101_spi_config, &tx_bufs);

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
