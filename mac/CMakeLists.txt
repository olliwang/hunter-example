# Copyright 2017 Olli Wang

cmake_minimum_required(VERSION 3.4.1)

include("../cmake/HunterGate.cmake")
HunterGate(URL "https://github.com/ruslo/hunter/archive/v0.19.188.tar.gz"
           SHA1 "67ab3a0206d8cdb9372ce22dc28eafc1d6bcc557")

project(HunterExample)

set(RESOURCES
    "English.lproj/Credits.rtf"
    "English.lproj/InfoPlist.strings"
    "English.lproj/MainMenu.xib")

add_executable(HunterExample
    MACOSX_BUNDLE
    "HEAppDelegate.mm"
    "main.m"
    ${RESOURCES})

set_target_properties(HunterExample
    PROPERTIES
    CXX_STANDARD 11
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO
    MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_SOURCE_DIR}/Info.plist"
    XCODE_ATTRIBUTE_PRODUCT_BUNDLE_IDENTIFIER "com.example.hunter"
    RESOURCE "${RESOURCES}")

target_link_libraries(HunterExample PRIVATE "-framework AppKit")

hunter_add_package(yaml-cpp)
find_package(yaml-cpp CONFIG REQUIRED)
target_link_libraries(HunterExample PUBLIC yaml-cpp::yaml-cpp)
