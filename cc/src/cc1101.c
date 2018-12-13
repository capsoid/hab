#include <zephyr.h>
#include <spi.h>
#include <gpio.h>
#include <misc/printk.h>
#include <misc/__assert.h>

#include "cc1101.h"

struct cc1101_data {
    struct device *spi_dev;
    struct spi_config *spi_cfg;
    struct device *spi_gpio_port;
    u32_t cs_pin;
    u32_t chip_ready_pin;
    u32_t gdo0_pin;
    u32_t gdo2_pin;
};

static struct cc1101_data cc1101_data;

void cc1101_read_reg(u8_t reg, u8_t *val)
{
    u8_t cmd[2] = {reg | 0x80, 0};

    const struct spi_buf tx_buf = { .buf = &cmd, .len = 2 };
          struct spi_buf rx_buf = { .buf = val,  .len = 1 };
    const struct spi_buf_set rx = { .buffers = &rx_buf, .count = 1 };
    const struct spi_buf_set tx = { .buffers = &tx_buf, .count = 1 };

    int ret = spi_transceive(cc1101_data.spi_dev, cc1101_data.spi_cfg, &tx, &rx);
    __ASSERT(!ret, "spi_transceive failed, %d\n", ret);
}

void cc1101_write_reg(u8_t reg, u8_t val)
{
    u8_t cmd[2] = {reg, val};
    const struct spi_buf tx_buf = { .buf = cmd, .len = 2 };
    const struct spi_buf_set tx = { .buffers = &tx_buf, .count = 1 };

    int ret = spi_write(cc1101_data.spi_dev, cc1101_data.spi_cfg, &tx);
    __ASSERT(!ret, "spi_write failed, %d\n", ret);
}

void cc1101_strobe_cmd(u8_t strobe)
{
    const struct spi_buf tx_buf = { .buf = &strobe, .len = 1 };
    const struct spi_buf_set tx = { .buffers = &tx_buf, .count = 1 };

    int ret = spi_write(cc1101_data.spi_dev, cc1101_data.spi_cfg, &tx);
    __ASSERT(!ret, "spi_write failed, %d\n", ret);
}

void cc1101_read_status_reg(u8_t reg, u8_t *val)
{
    u8_t cmd[2] = {reg | 0x40, 0};

    const struct spi_buf tx_buf = { .buf = &cmd, .len = 2 };
          struct spi_buf rx_buf = { .buf = val,  .len = 1 };
    const struct spi_buf_set rx = { .buffers = &rx_buf, .count = 1 };
    const struct spi_buf_set tx = { .buffers = &tx_buf, .count = 1 };

    int ret = spi_transceive(cc1101_data.spi_dev, cc1101_data.spi_cfg, &tx, &rx);
    __ASSERT(!ret, "spi_transceive failed, %d\n", ret);
}

void cc1101_init(const char *spi_name, const char *gpio_port, u32_t cs_pin,
                 u32_t chip_ready_pin, u32_t gdo0_pin, u32_t gdo2_pin)
{
    int ret;
    static struct spi_cs_control spi_cs;
    static struct spi_config spi_cfg;

    struct device *spi_dev = device_get_binding(spi_name);
    __ASSERT(spi_dev, "Binding to %s failed.", spi_name);

    struct device *spi_gpio_port = device_get_binding(gpio_port);
    __ASSERT(spi_gpio_port, "Binding to %s failed.", gpio_port);

    spi_cs.gpio_dev = spi_gpio_port;
    spi_cs.gpio_pin = cs_pin;
    spi_cs.delay = 200; // uS, time to wait for MISO goes low after CS went low

    spi_cfg.frequency = 6000000;
    spi_cfg.operation = SPI_OP_MODE_MASTER | SPI_WORD_SET(8) | SPI_TRANSFER_MSB | SPI_MODE_CPOL | SPI_MODE_CPHA;
    spi_cfg.slave = 0;
    spi_cfg.cs = &spi_cs;

    cc1101_data.spi_dev = spi_dev;
    cc1101_data.spi_cfg = &spi_cfg;
    cc1101_data.spi_gpio_port = spi_gpio_port;
    cc1101_data.cs_pin = cs_pin;
    cc1101_data.chip_ready_pin = chip_ready_pin;
    cc1101_data.gdo0_pin = gdo0_pin;
    cc1101_data.gdo2_pin = gdo2_pin;

    ret = gpio_pin_configure(spi_gpio_port, cs_pin, GPIO_DIR_OUT);
    __ASSERT_NO_MSG(!ret);
    ret = gpio_pin_configure(spi_gpio_port, chip_ready_pin, GPIO_DIR_IN);
    __ASSERT_NO_MSG(!ret);
    ret = gpio_pin_configure(spi_gpio_port, gdo0_pin, GPIO_DIR_IN);
    __ASSERT_NO_MSG(!ret);
    ret = gpio_pin_configure(spi_gpio_port, gdo2_pin, GPIO_DIR_IN);
    __ASSERT_NO_MSG(!ret);

    #define _CS(x) do { \
        ret = gpio_pin_write(spi_gpio_port, cs_pin, x);  __ASSERT_NO_MSG(!ret); \
    } while (0);

    // power on reset procedure
    _CS(1);
    k_busy_wait(1);
    _CS(0);
    k_busy_wait(1);
    _CS(1);
    k_busy_wait(41);

    _CS(0)

    // TODO: wait for CHIP_RDYn according to power on reset procedure described in manual
    /*

    u32_t val;
    ret = gpio_pin_read(spi_chip_ready_port, chip_ready_pin, &val);
    __ASSERT_NO_MSG(!ret);

    */

    k_busy_wait(100);
    _CS(1);

    cc1101_reset();
}

void cc1101_reset(void)
{
    cc1101_strobe_cmd(CC1101_SRES);
}

void cc1101_configure(const cc1101_cfg_t *cfg)
{
    cc1101_write_reg(CC1101_FSCTRL1,  cfg->FSCTRL1);
    cc1101_write_reg(CC1101_FSCTRL0,  cfg->FSCTRL0);
    cc1101_write_reg(CC1101_FREQ2,    cfg->FREQ2);
    cc1101_write_reg(CC1101_FREQ1,    cfg->FREQ1);
    cc1101_write_reg(CC1101_FREQ0,    cfg->FREQ0);
    cc1101_write_reg(CC1101_MDMCFG4,  cfg->MDMCFG4);
    cc1101_write_reg(CC1101_MDMCFG3,  cfg->MDMCFG3);
    cc1101_write_reg(CC1101_MDMCFG2,  cfg->MDMCFG2);
    cc1101_write_reg(CC1101_MDMCFG1,  cfg->MDMCFG1);
    cc1101_write_reg(CC1101_MDMCFG0,  cfg->MDMCFG0);
    cc1101_write_reg(CC1101_CHANNR,   cfg->CHANNR);
    cc1101_write_reg(CC1101_DEVIATN,  cfg->DEVIATN);
    cc1101_write_reg(CC1101_FREND1,   cfg->FREND1);
    cc1101_write_reg(CC1101_FREND0,   cfg->FREND0);
    cc1101_write_reg(CC1101_MCSM0 ,   cfg->MCSM0 );
    cc1101_write_reg(CC1101_FOCCFG,   cfg->FOCCFG);
    cc1101_write_reg(CC1101_BSCFG,    cfg->BSCFG);
    cc1101_write_reg(CC1101_AGCCTRL2, cfg->AGCCTRL2);
    cc1101_write_reg(CC1101_AGCCTRL1, cfg->AGCCTRL1);
    cc1101_write_reg(CC1101_AGCCTRL0, cfg->AGCCTRL0);
    cc1101_write_reg(CC1101_FSCAL3,   cfg->FSCAL3);
    cc1101_write_reg(CC1101_FSCAL2,   cfg->FSCAL2);
    cc1101_write_reg(CC1101_FSCAL1,   cfg->FSCAL1);
    cc1101_write_reg(CC1101_FSCAL0,   cfg->FSCAL0);
    cc1101_write_reg(CC1101_FSTEST,   cfg->FSTEST);
    cc1101_write_reg(CC1101_TEST2,    cfg->TEST2);
    cc1101_write_reg(CC1101_TEST1,    cfg->TEST1);
    cc1101_write_reg(CC1101_TEST0,    cfg->TEST0);
    cc1101_write_reg(CC1101_FIFOTHR,  cfg->FIFOTHR);
    cc1101_write_reg(CC1101_IOCFG2,   cfg->IOCFG2);
    cc1101_write_reg(CC1101_IOCFG0,   cfg->IOCFG0);
    cc1101_write_reg(CC1101_PKTCTRL1, cfg->PKTCTRL1);
    cc1101_write_reg(CC1101_PKTCTRL0, cfg->PKTCTRL0);
    cc1101_write_reg(CC1101_ADDR,     cfg->ADDR);
    cc1101_write_reg(CC1101_PKTLEN,   cfg->PKTLEN);
}

void cc1101_burst_write(u8_t addr, u8_t *buf, u8_t size)
{
    u8_t cmd = addr | 0x40;
    const struct spi_buf tx_buf[2] = {
        { .buf = &cmd, .len = 1 },
        { .buf = buf,  .len = size },
    };
    const struct spi_buf_set tx = { .buffers = tx_buf, .count = 2 };

    int ret = spi_write(cc1101_data.spi_dev, cc1101_data.spi_cfg, &tx);
    __ASSERT(!ret, "spi_write failed, %d\n", ret);
}

void cc1101_burst_read(u8_t addr, u8_t *buf, u8_t size)
{
    u8_t cmd = addr | 0x80 | 0x40;

    const struct spi_buf tx_buf = { .buf = &cmd, .len = 1 };
          struct spi_buf rx_buf = { .buf = buf,  .len = size };
    const struct spi_buf_set rx = { .buffers = &rx_buf, .count = 1 };
    const struct spi_buf_set tx = { .buffers = &tx_buf, .count = 1 };

    int ret = spi_transceive(cc1101_data.spi_dev, cc1101_data.spi_cfg, &tx, &rx);
    __ASSERT(!ret, "spi_transceive failed, %d\n", ret);
}
