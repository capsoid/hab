cmake_minimum_required(VERSION 3.8.2)

set(BOARD stm32_min_dev)
set(CONF_FILE prj.conf)

include($ENV{ZEPHYR_BASE}/cmake/app/boilerplate.cmake NO_POLICY_SCOPE)
project(capsoid_controller)

target_sources(app PRIVATE src/main.c)
