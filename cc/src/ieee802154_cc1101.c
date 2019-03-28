/* ieee802154_cc1101.c - TI CC1101 driver */

/*
 * Copyright (c) 2018 Intel Corporation.
 * Copyright (c) 2018 Matthias Boesl.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#define CONFIG_NET_BUF_USER_DATA_SIZE 512

#include <errno.h>
#include <kernel.h>
#include <arch/cpu.h>

#include <device.h>
#include <init.h>
#include <net/net_pkt.h>

#include <misc/byteorder.h>
#include <string.h>
#include <random/rand32.h>

#include <spi.h>
#include <gpio.h>

#include "ieee802154_cc1101.h"
#include "ieee802154_cc1101_rf.h"

#define CFG_CC1101_DRV_NAME "CC1101"
#define CFG_CC1101_SPI_DRV_NAME "SPI_1"
#define CFG_CC1101_SPI_FREQ 6000000
#define CFG_CC1101_GPIO_SPI_CS_DRV_NAME "GPIOA"
#define CFG_CC1101_GPIO_SPI_CS_PIN 3
#define CFG_CC1101_GPIO_GDO0_DRV_NAME "GPIOA"
#define CFG_CC1101_GPIO_GDO0_PIN 2
#define CFG_CC1101_GPIO_GDO1_DRV_NAME "GPIOA"
#define CFG_CC1101_GPIO_GDO1_PIN 1

static struct spi_cs_control            cs_ctrl;
static struct cc1101_gpio_configuration gpios[CC1101_GPIO_IDX_MAX];
static struct cc1101_context            cc1101_context;

/***********************
 * Debugging functions *
 **********************/
static void _cc1101_print_status(u8_t status)
{
    switch (status) {
        case CC1101_STATUS_SLEEP:
            printk("Sleep\n");
            break;
        case CC1101_STATUS_IDLE:
            printk("Idling\n");
            break;
        case CC1101_STATUS_XOFF:
            printk("XOFF\n");
            break;
        case CC1101_STATUS_VCOON_MC:
            printk("VCOON_MC\n");
            break;
        case CC1101_STATUS_REGON_MC:
            printk("REGON_MC\n");
            break;
        case CC1101_STATUS_MANCAL:
            printk("MANCAL\n");
            break;
        case CC1101_STATUS_VCOON:
            printk("VCOON\n");
            break;
        case CC1101_STATUS_REGON:
            printk("REGON\n");
            break;
        case CC1101_STATUS_STARTCAL:
            printk("STARTCAL\n");
            break;
        case CC1101_STATUS_BWBOOST:
            printk("BWBOOST\n");
            break;
        case CC1101_STATUS_FS_LOCK:
            printk("FS LOCK\n");
            break;
        case CC1101_STATUS_IFADCON:
            printk("IFADCON\n");
            break;
        case CC1101_STATUS_ENDCAL:
            printk("ENDCAL\n");
            break;
        case CC1101_STATUS_RX:
            printk("RX\n");
            break;
        case CC1101_STATUS_RX_END:
            printk("RX END\n");
            break;
        case CC1101_STATUS_RX_RST:
            printk("RX RST\n");
            break;
        case CC1101_STATUS_TXRX_SWITCH:
            printk("TXRX SW\n");
            break;
        case CC1101_STATUS_RXFIFO_OVERFLOW:
            printk("RX FIFO OF\n");
            break;
        case CC1101_STATUS_FSTXON:
            printk("FSTXON\n");
            break;
        case CC1101_STATUS_TX:
            printk("TX\n");
            break;
        case CC1101_STATUS_TX_END:
            printk("TX END\n");
            break;
        case CC1101_STATUS_RXTX_SWITCH:
            printk("RXTX SW\n");
            break;
        case CC1101_STATUS_TXFIFO_UNDERFLOW:
            printk("TX UF\n");
            break;
        default:
            printk("UNKNOWN %d\n", status);
            break;
    }
}

/*********************
 * Generic functions *
 ********************/

bool _cc1101_access_reg(struct cc1101_context *ctx, bool read, u8_t addr,
        void *data, size_t length, bool burst)
{
    u8_t cmd_buf[2];
    const struct spi_buf buf[2] = {
        {
            .buf = cmd_buf,
            .len = 1,
        },
        {
            .buf = data,
            .len = length,

        }
    };
    struct spi_buf_set tx = { .buffers = buf };

    /*
       printk("%s: addr 0x%02x - Data %p Length %u - %s, %s",
       read ? "Read" : "Write", addr, data, length,
       extended ? "extended" : "normal",
       burst ? "burst" : "single");
       */

    cmd_buf[0] = 0;

    if (burst) {
        cmd_buf[0] |= CC1101_ACCESS_BURST;
    }

    cmd_buf[0] |= addr;

    if (read) {
        const struct spi_buf_set rx = {
            .buffers = buf,
            .count = 2
        };

        cmd_buf[0] |= CC1101_ACCESS_RD;

        tx.count = 1;

        return (spi_transceive(ctx->spi, &ctx->spi_cfg, &tx, &rx) == 0);
    }

    /* CC1101_ACCESS_WR is 0 so no need to play with it */
    tx.count =  data ? 2 : 1;

    return (spi_write(ctx->spi, &ctx->spi_cfg, &tx) == 0);
}

static u8_t get_status(struct cc1101_context *ctx)
{
    u8_t status;

    if (_cc1101_access_reg(ctx, true, CC1101_REG_MARCSTATE,
                &status, 1, true)) {
        return status & CC1101_STATUS_MASK;
    }

    /* We cannot get the status, so let's assume about readyness */
    return CC1101_STATUS_CHIP_NOT_READY;
}

/******************
 * GPIO functions *
 *****************/

struct cc1101_gpio_configuration *cc1101_configure_gpios(void)
{
    struct device *gdo0_dev = device_get_binding(CFG_CC1101_GPIO_GDO0_DRV_NAME);
    if (!gdo0_dev) {
        printk("Unable to get GDO0 GPIO device\n");
        return NULL;
    }

    struct device *gdo1_dev = device_get_binding(CFG_CC1101_GPIO_GDO1_DRV_NAME);
    if (!gdo1_dev) {
        printk("Unable to get GDO1 GPIO device\n");
        return NULL;
    }

    struct device *cs_dev = device_get_binding(CFG_CC1101_GPIO_SPI_CS_DRV_NAME);
    if (!cs_dev) {
        printk("Unable to get CS GPIO device\n");
        return NULL;
    }

    if (gpio_pin_configure(gdo0_dev, CFG_CC1101_GPIO_GDO0_PIN, GPIO_DIR_IN | GPIO_INT | GPIO_PUD_PULL_DOWN | GPIO_INT_EDGE | GPIO_INT_ACTIVE_HIGH)) {
        printk("Unable to configure GDO0 pin\n");
        return NULL;
    }

    if (gpio_pin_configure(gdo1_dev, CFG_CC1101_GPIO_GDO1_PIN, GPIO_DIR_IN | GPIO_INT | GPIO_PUD_PULL_DOWN | GPIO_INT_EDGE |GPIO_INT_ACTIVE_HIGH)) {
        printk("Unable to configure GDO1 pin\n");
        return NULL;
    }

    if (gpio_pin_configure(cs_dev, CFG_CC1101_GPIO_SPI_CS_PIN, GPIO_DIR_OUT)) {
        printk("Unable to configure CS pin\n");
        return NULL;
    }

    gpios[CC1101_GPIO_IDX_GPIO0].dev = gdo0_dev;
    gpios[CC1101_GPIO_IDX_GPIO0].pin = CFG_CC1101_GPIO_GDO0_PIN;
    gpios[CC1101_GPIO_IDX_GPIO1].dev = gdo1_dev;
    gpios[CC1101_GPIO_IDX_GPIO1].pin = CFG_CC1101_GPIO_GDO1_PIN;

    return &gpios[0];
}

static inline void gdo_int_handler(struct device *port,
        struct gpio_callback *cb, u32_t pins)
{

    struct cc1101_context *cc1101 =
        CONTAINER_OF(cb, struct cc1101_context, rx_tx_cb);

    printk("int\n");

    if (atomic_get(&cc1101->tx) == 1) {
        if (atomic_get(&cc1101->tx_start) == 0) {
            atomic_set(&cc1101->tx_start, 1);
        } else {
            atomic_set(&cc1101->tx, 0);
        }

        k_sem_give(&cc1101->tx_sync);
    } else {
        if (atomic_get(&cc1101->rx) == 1) {
            k_sem_give(&cc1101->rx_lock);
            atomic_set(&cc1101->rx, 0);
        } else {
            atomic_set(&cc1101->rx, 1);
        }
    }
}

static void enable_gpio_interrupt(struct cc1101_context *cc1101, u8_t nr, bool enable)
{
    if (enable) {
        gpio_pin_enable_callback(
                cc1101->gpios[nr].dev,
                cc1101->gpios[nr].pin);
    } else {
        gpio_pin_disable_callback(
                cc1101->gpios[nr].dev,
                cc1101->gpios[nr].pin);
    }
}

static void setup_gpio_callback(struct device *dev)
{
    struct cc1101_context *cc1101 = dev->driver_data;

    gpio_init_callback(&cc1101->rx_tx_cb, gdo_int_handler,
            BIT(cc1101->gpios[CC1101_GPIO_IDX_GPIO0].pin) | BIT(cc1101->gpios[CC1101_GPIO_IDX_GPIO1].pin));
    gpio_add_callback(cc1101->gpios[CC1101_GPIO_IDX_GPIO0].dev,
            &cc1101->rx_tx_cb);

//    gpio_init_callback(&cc1101->rx_tx_cb, gdo_int_handler,
//            BIT(cc1101->gpios[CC1101_GPIO_IDX_GPIO1].pin));
//    gpio_add_callback(cc1101->gpios[CC1101_GPIO_IDX_GPIO1].dev,
//            &cc1101->rx_tx_cb);
}

/****************
 * RF functions *
 ***************/
bool rf_install_settings(struct device *dev,
        const struct cc1101_rf_registers_set *rf_settings)
{
    struct cc1101_context *cc1101 = dev->driver_data;

    if (!_cc1101_access_reg(cc1101, false, CC1101_REG_FIFOTHR,
                (void *)rf_settings->registers,
                CC1101_RF_REGS, true)) {
        printk("Could not install RF settings\n");
        return false;
    }

    cc1101->rf_settings = rf_settings;

    return true;
}

static int rf_calibrate(struct cc1101_context *ctx)
{
    printk("CC1101 calibrate\n");

    if (!instruct_scal(ctx)) {
        printk("Could not calibrate RF\n");
        return -EIO;
    }

    k_busy_wait(5 * USEC_PER_MSEC);

    /* We need to re-enable RX as SCAL shuts off the freq synth */
    if (!instruct_sidle(ctx) ||
            !instruct_sfrx(ctx) ||
            !instruct_srx(ctx)) {
        printk("Could not switch to RX\n");
        return -EIO;
    }

    k_busy_wait(10 * USEC_PER_MSEC);

    _cc1101_print_status(get_status(ctx));

    return 0;
}

/****************
 * TX functions *
 ***************/

static inline bool write_txfifo(struct cc1101_context *ctx,
        void *data, size_t length)
{
    return _cc1101_access_reg(ctx, false,
            CC1101_REG_TXFIFO,
            data, length, true);
}

/****************
 * RX functions *
 ***************/

static inline bool read_rxfifo(struct cc1101_context *ctx,
        void *data, size_t length)
{
    return _cc1101_access_reg(ctx, true,
            CC1101_REG_RXFIFO,
            data, length, true);
}

static inline u8_t get_packet_length(struct cc1101_context *ctx)
{
    u8_t len;

    if (_cc1101_access_reg(ctx, true, CC1101_REG_RXFIFO,
                &len, 1, true)) {
        return len + CC1101_FCS_LEN;
    }

    return 0;
}

static inline u8_t get_rx_bytes(struct cc1101_context *ctx)
{
    u8_t rx_bytes;

    if (!_cc1101_access_reg(ctx, true, CC1101_REG_RXBYTES,
                &rx_bytes, 1, true)) {
        return 0;
    }

    if (rx_bytes & 0x80) {
        printk("overflow\n");
    }

    return rx_bytes & 0x7F;
}

static inline bool verify_rxfifo_validity(struct cc1101_context *ctx,
        u8_t pkt_len)
{
    u8_t rx_bytes;

    if (!_cc1101_access_reg(ctx, true, CC1101_REG_RXBYTES,
                &rx_bytes, 1, true)) {
        return false;
    }

    /* packet should be at least 3 bytes as a ACK */
    if (pkt_len < 5 || rx_bytes > (pkt_len)) {
        return false;
    }

    return true;
}

static inline bool read_rxfifo_content(struct cc1101_context *ctx, u8_t *buf, u8_t len)
{
    if (!read_rxfifo(ctx, buf, len) ||
            (get_status(ctx) == CC1101_STATUS_RXFIFO_OVERFLOW)) {
        return false;
    }

    //net_buf_add(frag, len);

    return true;
}

static inline bool verify_crc(struct cc1101_context *ctx,
        u8_t *buf, u8_t len)

//static inline bool verify_crc(struct cc1101_context *ctx,
//        struct net_pkt *pkt, u8_t len)
{
    /*
    u8_t *fcs = pkt->frags->data + len - CC1101_FCS_LEN;

    if (!read_rxfifo(ctx, fcs, 2)) {
        return false;
    }

    if (!(fcs[1] & CC1101_FCS_CRC_OK)) {
        return false;
    }

    //	net_pkt_set_ieee802154_rssi(pkt, fcs[0]);
    //	net_pkt_set_ieee802154_lqi(pkt, fcs[1] & CC1101_FCS_LQI_MASK);
    */

    return true;
}

static void cc1101_rx(struct device *dev)
{
    struct cc1101_context *cc1101 = dev->driver_data;
    u8_t buf[0x80] = {0};
    u8_t pkt_len;
    u8_t rx_len;
    u8_t status;

    while (1) {

        k_sem_take(&cc1101->rx_lock, K_FOREVER);

        status = get_status(cc1101);
        _cc1101_print_status(status);

        pkt_len = get_packet_length(cc1101);
        rx_len = get_rx_bytes(cc1101);

        printk("read len: %d datalen %d\n", rx_len, pkt_len);

        if (status == CC1101_STATUS_STARTCAL) {
            printk("start CAL error\n");
            goto flush;
        }

        if (status == CC1101_STATUS_RXFIFO_OVERFLOW) {
            printk("RX FIFO OF error\n");
            goto flush;
        }

        if (status == CC1101_STATUS_TXFIFO_UNDERFLOW) {
            printk("TX FIFO UF error\n");
            goto flush;
        }

        if (!verify_rxfifo_validity(cc1101, pkt_len)) {
            printk("Invalid frame\n");
            goto flush;
        }

        if (!read_rxfifo_content(cc1101, buf, pkt_len)) {
            printk("No content read\n");
            goto flush;
        }

        if (!verify_crc(cc1101, buf, pkt_len)) {
            printk("Bad packet CRC\n");
            goto flush;
        }

        /*
           if (ieee802154_radio_handle_ack(cc1101->iface, pkt) == NET_OK) {
           printk("ACK packet handled\n");
           goto flush;
           }
           */

        printk("Caught a packet (%u)\n", pkt_len);
        printk("got '%s'\n", buf);
/*
        if (net_recv_data(cc1101->iface, pkt) < 0) {
            printk("Packet dropped by NET stack\n");
            goto flush;
        }
        net_analyze_stack("CC1101 Rx Fiber stack",
                K_THREAD_STACK_BUFFER(cc1101->rx_stack),
                K_THREAD_STACK_SIZEOF(cc1101->rx_stack));
        */
        continue;
flush:
        printk("Flushing RX\n");
        instruct_sidle(cc1101);
        instruct_sfrx(cc1101);
        instruct_srx(cc1101);
/*
        if (pkt) {
            net_pkt_unref(pkt);
        }
        */
    }
}

/********************
 * Radio device API *
 *******************/
int cc1101_cca(struct device *dev)
{
    struct cc1101_context *cc1101 = dev->driver_data;
    u8_t status;

    if (atomic_get(&cc1101->rx) == 0) {
        if (_cc1101_access_reg(cc1101, true, CC1101_REG_PKTSTATUS,
                    &status, 1, true)) {
            return status & CHANNEL_IS_CLEAR;
        }
    }

    printk("Busy\n");

    return -EBUSY;
}

int cc1101_set_channel(struct device *dev, u16_t channel)
{
    struct cc1101_context *cc1101 = dev->driver_data;

    if (atomic_get(&cc1101->rx) == 0) {
        if (!write_reg_channel(cc1101, channel) ||
                rf_calibrate(cc1101)) {
            printk("Could not set channel %u\n", channel);
            return -EIO;
        }
    } else {
        printk("Busy\n");
    }

    return 0;
}

int cc1101_set_txpower(struct device *dev, s16_t dbm)
{
    struct cc1101_context *cc1101 = dev->driver_data;
    u8_t pa_value;

    printk("set rf power to %d dbm\n", dbm);

    switch (dbm) {
        case -30:
            pa_value = CC1101_PA_MINUS_30;
            break;
        case -20:
            pa_value = CC1101_PA_MINUS_20;
            break;
        case -15:
            pa_value = CC1101_PA_MINUS_15;
            break;
        case -10:
            pa_value = CC1101_PA_MINUS_10;
            break;
        case 0:
            pa_value = CC1101_PA_0;
            break;
        case 5:
            pa_value = CC1101_PA_5;
            break;
        case 7:
            pa_value = CC1101_PA_7;
            break;
        case 10:
            pa_value = CC1101_PA_10;
            break;
        default:
            printk("Unhandled value\n");
            return -EINVAL;
    }

    if (atomic_get(&cc1101->rx) == 0) {
        if (!_cc1101_access_reg(cc1101, false, CC1101_REG_PATABLE,
                    &pa_value, 1, true)) {
            printk("Could not set PA\n");
            return -EIO;
        }
    }

    return 0;
}

//int cc1101_tx(struct device *dev, struct net_pkt *pkt, struct net_buf *frag)
int cc1101_tx(struct device *dev, u8_t *data, u8_t len)
{
    struct cc1101_context *cc1101 = dev->driver_data;
    /*
    //	u8_t *frame = frag->data - net_pkt_ll_reserve(pkt);
    //	u8_t len = net_pkt_ll_reserve(pkt) + frag->len;
    u8_t *frame = frag->data;
    u8_t len = frag->len;
    */
    bool status = false;

    //printk("%p (%u)\n", data, len);

    if (!instruct_sidle(cc1101) ||
            !instruct_sfrx(cc1101) ||
            !instruct_sftx(cc1101) ||
            !instruct_sfstxon(cc1101)) {
        printk("Cannot switch to TX mode\n");
        goto out;
    }

    if (!write_txfifo(cc1101, &len, CC1101_PHY_HDR_LEN) ||
            !write_txfifo(cc1101, data, len)) {
        printk("Cannot fill-in TX fifo\n");
        goto out;
    }

    atomic_set(&cc1101->tx, 1);
    atomic_set(&cc1101->tx_start, 0);

    if (!instruct_stx(cc1101)) {
        printk("Cannot start transmission\n");
        goto out;
    }

    /* Wait for SYNC to be sent */
    if (k_sem_take(&cc1101->tx_sync, 100) != 0) {
        printk("Faild to take tx_sync sem\n");
    }
    if (atomic_get(&cc1101->tx_start) == 1) {
        /* Now wait for the packet to be fully sent */
        k_sem_take(&cc1101->tx_sync, 100);
        if (k_sem_take(&cc1101->tx_sync, 100) != 0) {
            printk("Faild to take tx_sync sem\n");
        }
    }

out:
    _cc1101_print_status(get_status(cc1101));

    if (atomic_get(&cc1101->tx) == 1 &&
            get_rx_bytes(cc1101) != 0) {
        printk("TX Failed\n");

        atomic_set(&cc1101->tx_start, 0);
        instruct_sftx(cc1101);
        status = false;
    } else {
        status = true;
    }

    atomic_set(&cc1101->tx, 0);

    /* Get back to RX */
    instruct_srx(cc1101);

    return status ? 0 : -EIO;
}

int cc1101_start(struct device *dev)
{
    struct cc1101_context *cc1101 = dev->driver_data;

    if (!instruct_sidle(cc1101) ||
            !instruct_sftx(cc1101) ||
            !instruct_sfrx(cc1101) ||
            rf_calibrate(cc1101)) {
        printk("Could not proceed\n");
        return -EIO;
    }

    enable_gpio_interrupt(cc1101, CC1101_GPIO_IDX_GPIO0, true);
    enable_gpio_interrupt(cc1101, CC1101_GPIO_IDX_GPIO1, true);

    _cc1101_print_status(get_status(cc1101));

    return 0;
}

int cc1101_stop(struct device *dev)
{
    struct cc1101_context *cc1101 = dev->driver_data;

    enable_gpio_interrupt(cc1101, CC1101_GPIO_IDX_GPIO0, false);
    enable_gpio_interrupt(cc1101, CC1101_GPIO_IDX_GPIO1, false);

    if (!instruct_spwd(cc1101)) {
        printk("Could not proceed\n");
        return -EIO;
    }

    return 0;
}
/*
static u16_t cc1101_get_channel_count(struct device *dev)
{
    struct cc1101_context *cc1101 = dev->driver_data;

    return cc1101->rf_settings->channel_limit;
}
*/

/******************
 * Initialization *
 *****************/

int power_on_and_setup(struct device *dev)
{
    struct cc1101_context *cc1101 = dev->driver_data;

    if (!instruct_sres(cc1101)) {
        printk("Cannot reset\n");
        return -EIO;
    }

    if (!rf_install_settings(dev, &cc1101_rf_settings)) {
        printk("Cannot write settings\n");
        return -EIO;
    }

    if (!write_reg_iocfg2(cc1101, CC1101_SETTING_IOCFG2) ||
            !write_reg_iocfg1(cc1101, CC1101_SETTING_IOCFG1) ||
            !write_reg_iocfg0(cc1101, CC1101_SETTING_IOCFG0)) {
        printk("Cannot configure GPIOs\n");
        return -EIO;
    }

    setup_gpio_callback(dev);

    return rf_calibrate(cc1101);
}

static int configure_spi(struct device *dev)
{
    struct cc1101_context *cc1101 = dev->driver_data;

    cc1101->spi = device_get_binding(
            CFG_CC1101_SPI_DRV_NAME);
    if (!cc1101->spi) {
        printk("Unable to get SPI device\n");
        return -ENODEV;
    }

    cs_ctrl.gpio_dev = device_get_binding(
            CFG_CC1101_GPIO_SPI_CS_DRV_NAME);
    if (!cs_ctrl.gpio_dev) {
        printk("Unable to get GPIO SPI CS device\n");
        return -ENODEV;
    }

    cs_ctrl.gpio_pin = CFG_CC1101_GPIO_SPI_CS_PIN;
    cs_ctrl.delay = 10;

    cc1101->spi_cfg.cs = &cs_ctrl;

    printk("SPI GPIO CS configured on %s:%u\n",
            CFG_CC1101_GPIO_SPI_CS_DRV_NAME,
            CFG_CC1101_GPIO_SPI_CS_PIN);

    cc1101->spi_cfg.operation = SPI_WORD_SET(8);
    cc1101->spi_cfg.frequency = CFG_CC1101_SPI_FREQ;

    return 0;
}

static int cc1101_init(struct device *dev)
{
    struct cc1101_context *cc1101 = dev->driver_data;

    atomic_set(&cc1101->tx, 0);
    atomic_set(&cc1101->tx_start, 0);
    atomic_set(&cc1101->rx, 0);
    k_sem_init(&cc1101->rx_lock, 0, 1);
    k_sem_init(&cc1101->tx_sync, 0, 1);

    cc1101->gpios = cc1101_configure_gpios();
    if (!cc1101->gpios) {
        printk("Configuring GPIOS failed\n");
        return -EIO;
    }

    if (configure_spi(dev) != 0) {
        printk("Configuring SPI failed\n");
        return -EIO;
    }

    printk("GPIO and SPI configured\n");

    if (power_on_and_setup(dev) != 0) {
        printk("Configuring CC1101 failed\n");
        return -EIO;
    }
    k_thread_create(&cc1101->rx_thread, cc1101->rx_stack,
            CFG_CC1101_RX_STACK_SIZE,
            (k_thread_entry_t)cc1101_rx,
            dev, NULL, NULL, K_PRIO_COOP(2), 0, 0);
    k_thread_name_set(&cc1101->rx_thread, "cc1101_rx");

    printk("CC1101 initialized\n");

    return 0;
}

DEVICE_AND_API_INIT(cc1101, CFG_CC1101_DRV_NAME, cc1101_init, &cc1101_context, (void *)42, APPLICATION, 0, (void *)43);
