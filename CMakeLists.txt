cmake_minimum_required(VERSION 2.8.11)

project(FeedbackApp LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -Wall")

find_package(Qt5 COMPONENTS Core Quick REQUIRED)

include(InstallRequiredSystemLibraries)

file(GLOB SOURCES
    src/*.h
    src/*.cpp
    src/**/*.h
    src/**/*.cpp
)

set(FeedbackApp_MAJOR_VERSION 1)
set(FeedbackApp_MINOR_VERSION 0)
set(FeedbackApp_PATCH_VERSION 0)
set(FeedbackApp_VERSION ${FeedbackApp_MAJOR_VERSION}.${FeedbackApp_MINOR_VERSION}.${FeedbackApp_PATCH_VERSION} )

add_executable(${PROJECT_NAME} ${SOURCES} "main.cpp" "qml.qrc")

target_link_libraries(${PROJECT_NAME} Qt5::Core Qt5::Quick)

SET(CMAKE_INSTALL_PREFIX "${CMAKE_CURRENT_SOURCE_DIR}/bin")
MESSAGE(STATUS "CMAKE_INSTALL_PREFIX: " ${CMAKE_INSTALL_PREFIX} )
MESSAGE(STATUS "CMAKE_PREFIX_PATH: " ${CMAKE_PREFIX_PATH})

install(TARGETS ${PROJECT_NAME} DESTINATION ${CMAKE_INSTALL_PREFIX})
INSTALL(FILES ${CMAKE_INSTALL_SYSTEM_RUNTIME_LIBS} DESTINATION ${CMAKE_INSTALL_PREFIX} COMPONENT Libraries)
INSTALL(FILES ${CMAKE_CURRENT_SOURCE_DIR}/shared/data DESTINATION ${CMAKE_INSTALL_PREFIX})

find_program(TOOL_WINDEPLOYQT NAMES windeployqt PATHS "${CMAKE_PREFIX_PATH}/tools/qt5")
find_program(TOOL_WINDEPLOYQT_DEBUG NAMES windeployqt PATHS "${CMAKE_PREFIX_PATH}/debug/tools/qt5")

STRING(REGEX REPLACE "bin/windeployqt.exe" "qml" QML_DIR ${TOOL_WINDEPLOYQT})
MESSAGE(STATUS "QML_DIR: " ${QML_DIR})
MESSAGE(STATUS "CMAKE_PREFIX_PATH: " ${CMAKE_PREFIX_PATH})
MESSAGE(STATUS "TOOL_WINDEPLOYQT_DEBUG: " ${TOOL_WINDEPLOYQT_DEBUG})

if(NOT TOOL_WINDEPLOYQT AND NOT TOOL_WINDEPLOYQT_DEBUG)
    message(FATAL_ERROR "Could not find windeployqt")
endif()


install(CODE "

        execute_process(
                COMMAND ${TOOL_WINDEPLOYQT_DEBUG} \"\${CMAKE_INSTALL_PREFIX}/FeedbackApp.exe\" -verbose=2 --no-translations --release --force --qmldir ${QML_DIR}
                WORKING_DIRECTORY ${CMAKE_PREFIX_PATH}/tools/qt5
        )

")
