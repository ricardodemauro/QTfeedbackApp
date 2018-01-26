cmake_minimum_required(VERSION 2.8.12)

project(FeedbackApp LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt5 COMPONENTS Core Quick REQUIRED)

file(GLOB SOURCES
    src/*.h
    src/*.cpp
    src/messages/*.h
    src/messages/*.cpp
    src/services/*.h
    src/services/*.cpp
    src/interfaces/*.h
    src/interfaces/*.cpp
    src/models/*.h
    src/models/*.cpp
    src/thirdpart/*.h
)


add_executable(${PROJECT_NAME} ${SOURCES} "main.cpp" "qml.qrc")

target_link_libraries(${PROJECT_NAME} Qt5::Core Qt5::Quick)
