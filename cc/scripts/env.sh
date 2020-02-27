export ZEPHYR_TOOLCHAIN_VARIANT=zephyr
export ZEPHYR_SDK_INSTALL_DIR=${PWD}/sdk
export ZEPHYR_MODULES=${PWD}/modules/hal/stm32

source .venv/bin/activate
source zephyr/zephyr-env.sh
