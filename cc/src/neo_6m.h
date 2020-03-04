#include <device.h>
#include <logging/log.h>
#include <uart.h>

#define CONFIG_UART_DEVICE     "UART_3"
#define CONFIG_NEO_6M_DRV_NAME "NEO_6M"

LOG_MODULE_REGISTER(NEO_6M, CONFIG_LOG_LEVEL_DBG);

struct neo_6m_data
{
    struct device *uart;
    struct uart_config uart_config;
};

static struct neo_6m_data neo_6m_data;

int neo_6m_init(struct device *device);
int neo_6m_read_gps_data(struct device *device, unsigned char *buffer, unsigned int size);
int neo_6m_read_uart(struct neo_6m_data *data, unsigned char *buffer, unsigned int size);
int neo_6m_uart_init(struct neo_6m_data *data);
int neo_6m_read_gps_message(unsigned char *buffer, unsigned int size);
static void uart_read_isr(struct device *device);
static int uart_read_symbol(struct device *device, char *symbol);
