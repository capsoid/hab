Capsoid Controller
##################

Overview
********
TBD

Building and Running
********************

$(SRC) - assumed to be the directory where you cloned this repository sources

1. Download the latest (0.9.5) Zephyr SDK (https://github.com/zephyrproject-rtos/meta-zephyr-sdk/releases/download/0.9.5/zephyr-sdk-0.9.5-setup.run). Zephyr SDK provides everything you need to build/flash/debug your firmwares.

2. Install it to $(ZEPHYR_SDK_INSTALL_DIR), in my case it is /opt/zephyr-sdk

3. Clone Zephyr OS sources from here: https://github.com/vslapik/zephyr, switch to vs branch.

4. Make the following environment variables exported:
ZEPHYR_TOOLCHAIN_VARIANT=zephyr
ZEPHYR_BASE=/home/vslapik/src/zephyr
ZEPHYR_SDK_INSTALL_DIR=/opt/zephyr-sdk

5. `cd $(SRC)build`

6. `cmake -GNinja ..` - to prepare build

7. `ninja` - to build the image

8. `ninja flash` - to flash the image

If you want to reconfigure the project run `ninja menuconfig` and after that build again.
If something goes wrong just `rm -rf` for everything in build subdir and start over.
