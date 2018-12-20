cmake_minimum_required(VERSION 3.8.2)

set(BOARD stm32_min_dev)
set(CONF_FILE prj.conf)

include($ENV{ZEPHYR_BASE}/cmake/app/boilerplate.cmake NO_POLICY_SCOPE)
project(capsoid_controller)

target_sources(app PRIVATE src/main.c src/ieee802154_cc1101.c)

include_directories(src)

get_target_property(_src app SOURCES)
add_custom_target(tags
    ctags -R --c-kinds=+p ${_src}
    "$ENV{ZEPHYR_BASE}/kernel"
    "$ENV{ZEPHYR_BASE}/include"
    "$ENV{ZEPHYR_BASE}/lib"
    "$ENV{ZEPHYR_BASE}/subsys"
    "$ENV{ZEPHYR_BASE}/drivers"
    "$ENV{ZEPHYR_BASE}/soc"
    "$ENV{ZEPHYR_BASE}/arch"
    WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
)

#list (SORT _variableNames)
#foreach (_variableName ${_variableNames})
#    message(STATUS "${_variableName}=${${_variableName}}")
#endforeach()
