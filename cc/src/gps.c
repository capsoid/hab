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
