#!/bin/bash

ZEPHYR_MODULES_ROOT=${PWD}/sdk/modules
ZEPHYR_STM32_MODULE=${ZEPHYR_MODULES_ROOT}/hal/stm32

# Install python requirements
python3 -m venv .venv
source .venv/bin/activate
pip install pyyaml pyelftools

# Download and unpack SDK
wget https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.10.3/zephyr-sdk-0.10.3-setup.run
chmod +x zephyr-sdk-0.10.3-setup.run
./zephyr-sdk-0.10.3-setup.run -- -d ${PWD}/sdk

mkdir -p ${ZEPHYR_MODULES_ROOT}
git clone https://github.com/zephyrproject-rtos/hal_stm32 ${ZEPHYR_STM32_MODULE}
cd ${ZEPHYR_STM32_MODULE}
git co 20776221282b6447c6330a041bc27758c8f593f3
