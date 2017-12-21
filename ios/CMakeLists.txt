# Copyright 2017 Olli Wang

cmake_minimum_required(VERSION 3.4.1)

set(IOS_BUNDLE_IDENTIFIER "com.example.hunter")

set(ENV{POLLY_IOS_BUNDLE_IDENTIFIER} ${IOS_BUNDLE_IDENTIFIER})

include("../cmake/HunterGate.cmake")
HunterGate(URL "https://github.com/ruslo/hunter/archive/v0.19.208.tar.gz"
           SHA1 "4128ac8c79c21b250bf825e8119ce0bff05e5132")

project(HunterExample)

set(RESOURCES "LaunchScreen.storyboard")

add_executable(HunterExample
    MACOSX_BUNDLE
    "HEAppDelegate.mm"
    "main.m"
    ${RESOURCES})

set_target_properties(HunterExample
    PROPERTIES
    MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_SOURCE_DIR}/Info.plist"
    XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_ARC "YES"
    XCODE_ATTRIBUTE_PRODUCT_BUNDLE_IDENTIFIER "${IOS_BUNDLE_IDENTIFIER}"
    XCODE_ATTRIBUTE_SKIP_INSTALL "NO"
    XCODE_ATTRIBUTE_TARGETED_DEVICE_FAMILY "1,2"
    RESOURCE "${RESOURCES}")

find_package(uikit REQUIRED)
target_link_libraries(HunterExample PRIVATE uikit::uikit)

# Adds dependencies.
hunter_add_package(Boost COMPONENTS filesystem system)
find_package(Boost CONFIG REQUIRED filesystem system)
target_link_libraries(HunterExample PUBLIC Boost::filesystem Boost::system)
