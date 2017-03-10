# Install script for directory: /home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/SwiftShims

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/swift/shims" TYPE FILE FILES
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/SwiftShims/AssertionReporting.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/SwiftShims/CoreFoundationShims.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/SwiftShims/FoundationShims.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/SwiftShims/GlobalObjects.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/SwiftShims/HeapObject.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/SwiftShims/LibcShims.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/SwiftShims/RefCount.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/SwiftShims/RuntimeShims.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/SwiftShims/RuntimeStubs.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/SwiftShims/SwiftStdbool.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/SwiftShims/SwiftStddef.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/SwiftShims/SwiftStdint.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/SwiftShims/UnicodeShims.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/SwiftShims/Visibility.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/SwiftShims/DispatchOverlayShims.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/SwiftShims/ObjectiveCOverlayShims.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/SwiftShims/OSOverlayShims.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/SwiftShims/SafariServicesOverlayShims.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/SwiftShims/XCTestOverlayShims.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/SwiftShims/XPCOverlayShims.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/SwiftShims/module.modulemap"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/swift/clang" TYPE DIRECTORY FILES "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/llvm-linux-x86_64/./lib/clang/4.0.0/" REGEX "/[^/]*\\.h$")
endif()

