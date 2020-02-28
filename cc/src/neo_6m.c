#include "neo_6m.h"
#include <device.h>
#include <errno.h>
#include <logging/log.h>
#include <uart.h>

int neo_6m_uart_init(struct neo_6m_data *data)
{
    data->uart = device_get_binding(CONFIG_UART_DEVICE);

    if (!data->uart)
    {
        LOG_DBG("UART device is not found %", CONFIG_UART_DEVICE);
        return -EINVAL;
    }

    data->uart_config.baudrate = 9600;
    data->uart_config.parity = 0;
    data->uart_config.stop_bits = 1;
    data->uart_config.data_bits = 8;
    data->uart_config.flow_ctrl = UART_CFG_FLOW_CTRL_NONE;

    int err = uart_configure(data->uart, &data->uart_config);

    return err;
}

int neo_6m_init(struct device *device)
{
    struct neo_6m_data *data = device->driver_data;

    if (neo_6m_uart_init(data) < 0)
    {
        return -EINVAL;
    }

    return 0;
}

int neo_6m_read_uart(struct neo_6m_data *data, unsigned char *buffer, unsigned int size)
{
    for (int i = size; i > 0; i--)
    {
        int status = -1;
        while (!status)
        {
            status = uart_poll_in(data->uart, buffer + i);
        }
    }

    return 0;
}

int neo_6m_read_gps_data(struct device *device, unsigned char *buffer, unsigned int size)
{
    struct neo_6m_data *data = device->driver_data;

    return neo_6m_read_uart(data, buffer, size);
}

DEVICE_AND_API_INIT(
    neo_6m,
    CONFIG_NEO_6M_DRV_NAME,
    neo_6m_init,
    &neo_6m_data,
    (void *)1488,
    POST_KERNEL,
    45,
    (void *)228);
