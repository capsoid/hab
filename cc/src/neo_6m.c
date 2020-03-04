#include "neo_6m.h"
#include <device.h>
#include <errno.h>
#include <logging/log.h>
#include <ring_buffer.h>
#include <uart.h>

#define NMEA_BUFFER_SIZE 128

RING_BUF_DECLARE(uart_buffer, NMEA_BUFFER_SIZE);

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

    int status = uart_configure(data->uart, &data->uart_config);

    if (status != 0)
    {
        return status;
    }

    uart_irq_rx_disable(data->uart);
    uart_irq_rx_disable(data->uart);

    uart_irq_callback_set(data->uart, uart_read_isr);

    while (uart_irq_rx_ready(data->uart))
    {
        char dummy = 0;
        uart_fifo_read(data->uart, &dummy, 1);
    }

    uart_irq_rx_enable(data->uart);

    return status;
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

int neo_6m_read_uart_batch(struct neo_6m_data *data, unsigned char *buffer, unsigned int size)
{
    for (int i = size; i > 0; i--)
    {
        int status = -1;
        while (status != 0)
        {
            status = uart_poll_in(data->uart, buffer + size - i);
        }
    }

    return 0;
}

static int uart_read_symbol(struct device *device, char *symbol)
{
    int nbytes = uart_fifo_read(device, symbol, 1);

    if (nbytes < 0)
    {
        uart_irq_rx_disable(device);

        return -EIO;
    }

    return nbytes;
}

static void uart_read_isr(struct device *device)
{
    while (uart_irq_update(device) && uart_irq_is_pending(device))
    {
        if (!uart_irq_rx_ready(device))
        {
            continue;
        }

        char symbol = 0;
        int nbytes = uart_read_symbol(device, &symbol);

        if (nbytes < 0)
        {
            return;
        }

        ring_buf_put(&uart_buffer, &symbol, 1);

    }
}

int neo_6m_read_gps_data(struct device *device, unsigned char *buffer, unsigned int size)
{
    struct neo_6m_data *data = device->driver_data;

    return neo_6m_read_uart_batch(data, buffer, size);
}

int neo_6m_read_gps_message(unsigned char *buffer, unsigned int size)
{

    int i = 0;
    char current = 0;
    char prev = 0;

    do
    {
        int nbytes = ring_buf_get(&uart_buffer, &current, 1);

        if (nbytes < 1)
        {
            continue;
        }

        if(current == '$')
        {
            buffer[i++] = current;
            break;
        }

    } while(true);

    do
    {
        prev = current;

        int nbytes = ring_buf_get(&uart_buffer, &current, 1);

        if (nbytes < 1)
        {
            continue;
        }

        buffer[i++] = current;

        if (prev == '\r' && current == '\n')
        {
            return 0;
        }

    } while (true);

    printk("The whole buffer is %s\n", buffer);
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
