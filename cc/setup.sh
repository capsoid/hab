#!/bin/bash

# Install python requirements
python3 -m venv .venv
source .venv/bin/activate
pip install pyyaml pyelftools

# Download and unpack SDK
# wget https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.10.3/zephyr-sdk-0.10.3-setup.run
chmod +x zephyr-sdk-0.10.3-setup.run
./zephyr-sdk-0.10.3-setup.run -- -d ${PWD}/sdk
