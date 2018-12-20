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
#include <i2c.h>
#include <stdio.h>
#include <stdlib.h>

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
struct device *mpu6050;

void main(void)
{
    printk("[%s  %s] Hello World from %s!\n", __DATE__, __TIME__, CONFIG_BOARD);

    bme280 = device_get_binding("BME280");
    if (!bme280)
    {
        printk("Failed to init BME280!\n");
    }
    mpu6050 = device_get_binding("MPU6050");
    if (!mpu6050)
    {
        printk("Failed to init MPU6050!\n");
    }

    //__ASSERT(0, "fail\n");

    cc1101_init("SPI_1", "GPIOA", 3, 0, 2, 1);

    while (1)
    {
        k_sleep(1000);
    }
}

static int cmd_mpu6050_reset(const struct shell *shell, size_t argc, char **argv)
{
       struct device *i2c = device_get_binding("I2C_1");
       __ASSERT_NO_MSG(i2c);

       if (i2c_reg_write_byte(i2c, 0x68, 0x6B, 0x80) < 0) {
           printk("Failed to wake up chip.");
       }
       /*
       k_busy_wait(100);
       u8_t v;
       if (i2c_reg_read_byte(i2c, 0x68, 0x6B, &v) < 0) {
           printk("Failed to wake up chip.");
       }
       */
       k_sleep(10);

       if (i2c_reg_write_byte(i2c, 0x68, 0x6B, 0x00) < 0) {
           printk("Failed to wake up chip.");
       }

       return 0;
}

static int cmd_mpu6050_read(const struct shell *shell, size_t argc, char **argv)
{
    __ASSERT_NO_MSG(mpu6050);

    struct sensor_value temp[3];

    if (sensor_sample_fetch(mpu6050))
    {
        printk("Failed to read data from mpu6050\n.");
    }

    sensor_channel_get(mpu6050, SENSOR_CHAN_ACCEL_XYZ, &temp[0]);
    PR("A X: %d.%06d\n", temp[0].val1, abs(temp[0].val2));
    PR("A Y: %d.%06d\n", temp[1].val1, abs(temp[1].val2));
    PR("A Z: %d.%06d\n", temp[2].val1, abs(temp[2].val2));

    sensor_channel_get(mpu6050, SENSOR_CHAN_GYRO_XYZ, &temp[0]);
    PR("G X: %d.%06d\n", temp[0].val1, abs(temp[0].val2));
    PR("G Y: %d.%06d\n", temp[1].val1, abs(temp[1].val2));
    PR("G Z: %d.%06d\n", temp[2].val1, abs(temp[2].val2));

    sensor_channel_get(mpu6050, SENSOR_CHAN_DIE_TEMP, &temp[0]);
    PR("T: %d.%06d\n", temp[0].val1, abs(temp[0].val2));

    return 0;
}

static int cmd_bme280_read(const struct shell *shell, size_t argc, char **argv)
{
    __ASSERT_NO_MSG(bme280);

    struct sensor_value temp, press, humidity;

    sensor_sample_fetch(bme280);
    if (sensor_sample_fetch(bme280))
    {
        printk("Failed to read data from bm280\n.");
    }

    sensor_channel_get(bme280, SENSOR_CHAN_AMBIENT_TEMP, &temp);
    sensor_channel_get(bme280, SENSOR_CHAN_PRESS, &press);
    sensor_channel_get(bme280, SENSOR_CHAN_HUMIDITY, &humidity);

    PR("T: %d.%06d; press: %d.%06d; humidity: %d.%06d\n",
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

static int cmd_cc1101_init(const struct shell *shell, size_t argc, char **argv)
{
    ARG_UNUSED(argc);
    ARG_UNUSED(argv);

    cc1101_init("SPI_1", "GPIOA", 3, 0, 2, 1);

    return 0;
}

static int cmd_cc1101_rr(const struct shell *shell, size_t argc, char **argv)
{
    ARG_UNUSED(argc);
    ARG_UNUSED(argv);

    __ASSERT(argc == 2, "wrong format");

    u8_t v;
    u8_t reg = atoi(argv[1]);
    cc1101_read_reg(reg, &v);
    PR("reg %02x = %u\n", reg, v);

    return 0;
}

static int cmd_cc1101_wr(const struct shell *shell, size_t argc, char **argv)
{
    ARG_UNUSED(argc);
    ARG_UNUSED(argv);

    cc1101_write_reg(0, 0);

    return 0;
}

SHELL_CREATE_STATIC_SUBCMD_SET(mpu6050_commands)
{
    SHELL_CMD(read, NULL, "read mpu6050", cmd_mpu6050_read),
    SHELL_CMD(reset, NULL, "reset mpu6050", cmd_mpu6050_reset),
    SHELL_SUBCMD_SET_END
};

SHELL_CREATE_STATIC_SUBCMD_SET(bme280_commands)
{
    SHELL_CMD(read, NULL, "read bme280", cmd_bme280_read),
    SHELL_SUBCMD_SET_END
};

SHELL_CREATE_STATIC_SUBCMD_SET(cc1101_commands)
{
    SHELL_CMD(reset, NULL, "reset RF", cmd_cc1101_reset),
    SHELL_CMD(init, NULL, "init RF", cmd_cc1101_init),
    SHELL_CMD(rr, NULL, "'cc1101 rr <reg>' reads cc1101 <reg> value", cmd_cc1101_rr),
    SHELL_CMD(wr, NULL, "'cc1101 wr <reg> <val>' writes cc1101 <reg> with <val>", cmd_cc1101_wr),
    SHELL_SUBCMD_SET_END
};

SHELL_CMD_REGISTER(bme280, &bme280_commands, "Control RF chip.", NULL);
SHELL_CMD_REGISTER(cc1101, &cc1101_commands, "Read pressure/temperature/humidity", NULL);
SHELL_CMD_REGISTER(mpu6050, &mpu6050_commands, "Read mpu6050", NULL);
