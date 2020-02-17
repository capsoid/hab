cmake_minimum_required(VERSION 3.16.1)

set(BOARD capsoid)

set(BOARD_ROOT ${CMAKE_CURRENT_LIST_DIR})

set(CONF_FILE prj.conf)

set(ZEPHYR_MODULES $ENV{ZEPHYR_MODULES})

include($ENV{ZEPHYR_BASE}/cmake/app/boilerplate.cmake NO_POLICY_SCOPE)
project(capsoid_controller)

target_sources(app PRIVATE src/main.c src/ieee802154_cc1101.c src/cc1101.c)

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


set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
file(CREATE_LINK ${CMAKE_CURRENT_BINARY_DIR}/compile_commands.json ${CMAKE_CURRENT_SOURCE_DIR}/src/compile_commands.json SYMBOLIC)

#list (SORT _variableNames)
#foreach (_variableName ${_variableNames})
#    message(STATUS "${_variableName}=${${_variableName}}")
#endforeach()
