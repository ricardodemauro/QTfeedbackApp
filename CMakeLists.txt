cmake_minimum_required(VERSION 2.8.12)

project(FeedbackApp LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt5 COMPONENTS Core Quick REQUIRED)

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

install(TARGETS ${PROJECT_NAME} DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/bin)
