/*
 * Copyright (c) 2012-2014 Wind River Systems, Inc.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <zephyr.h>

#include <device.h>
#include <misc/__assert.h>
#include <misc/printk.h>
#include <sensor.h>
#include <shell/shell.h>
#include <spi.h>
#include <stdio.h>

#include "cc1101.h"

#define PR(fmt, ...)						\
    shell_fprintf(shell, SHELL_NORMAL, fmt, ##__VA_ARGS__)
#define PR_ERROR(fmt, ...)					\
    shell_fprintf(shell, SHELL_ERROR, fmt, ##__VA_ARGS__)
#define PR_INFO(fmt, ...)					\
    shell_fprintf(shell, SHELL_INFO, fmt, ##__VA_ARGS__)
#define PR_WARNING(fmt, ...)					\
    shell_fprintf(shell, SHELL_WARNING, fmt, ##__VA_ARGS__)

struct device *bme280;

void main(void)
{
    printk("[%s  %s] Hello World from %s!\n", __DATE__, __TIME__, CONFIG_BOARD);

    bme280 = device_get_binding("BME280"); __ASSERT_NO_MSG(bme280);

    //__ASSERT(0, "fail\n");

    cc1101_init("SPI_1", "GPIOA", 1, "GPIOB", 2);

    while (1)
    {
        k_sleep(1000);
    }
}

static int cmd_bme280_read(const struct shell *shell, size_t argc, char **argv)
{
    struct sensor_value temp, press, humidity;

    sensor_sample_fetch(bme280);
    sensor_channel_get(bme280, SENSOR_CHAN_AMBIENT_TEMP, &temp);
    sensor_channel_get(bme280, SENSOR_CHAN_PRESS, &press);
    sensor_channel_get(bme280, SENSOR_CHAN_HUMIDITY, &humidity);

    printf("temp: %d.%06d; press: %d.%06d; humidity: %d.%06d\n",
            temp.val1, temp.val2, press.val1, press.val2,
            humidity.val1, humidity.val2);

    return 0;
}

static int cmd_cc1101_reset(const struct shell *shell, size_t argc, char **argv)
{
    ARG_UNUSED(argc);
    ARG_UNUSED(argv);

    cc1101_reset();

    return 0;
}

static int cmd_cc1101_rr(const struct shell *shell, size_t argc, char **argv)
{
    ARG_UNUSED(argc);
    ARG_UNUSED(argv);

    u8_t v;
    cc1101_read_reg(0, &v);

    return 0;
}

static int cmd_cc1101_wr(const struct shell *shell, size_t argc, char **argv)
{
    ARG_UNUSED(argc);
    ARG_UNUSED(argv);

    cc1101_write_reg(0, 0);

    return 0;
}

SHELL_CREATE_STATIC_SUBCMD_SET(bme280_commands)
{
    SHELL_CMD(read, NULL, "read bme280", cmd_bme280_read),
    SHELL_SUBCMD_SET_END
};

SHELL_CREATE_STATIC_SUBCMD_SET(cc1101_commands)
{
    SHELL_CMD(reset, NULL, "reset RF", cmd_cc1101_reset),
    SHELL_CMD(rr, NULL, "'cc1101 rr <reg>' reads cc1101 <reg> value", cmd_cc1101_rr),
    SHELL_CMD(wr, NULL, "'cc1101 wr <reg> <val>' writes cc1101 <reg> with <val>", cmd_cc1101_wr),
    SHELL_SUBCMD_SET_END
};

SHELL_CMD_REGISTER(bme280, &bme280_commands, "Control RF chip.", NULL);
SHELL_CMD_REGISTER(cc1101, &cc1101_commands, "Read pressure/temperature/humidity", NULL);

