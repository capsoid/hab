#!/bin/bash

ZEPHYR_MODULES_ROOT=${PWD}/sdk/modules
ZEPHYR_STM32_MODULE=${ZEPHYR_MODULES_ROOT}/hal/stm32

# Install python requirements
python3 -m venv .venv
source .venv/bin/activate
pip install pyyaml pyelftools pykwalify west

# Download and unpack SDK
wget https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.11.0/zephyr-sdk-0.11.0-setup.run
chmod +x zephyr-sdk-0.11.0-setup.run
./zephyr-sdk-0.11.0-setup.run -- -d ${PWD}/sdk
