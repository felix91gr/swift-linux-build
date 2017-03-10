# Install script for directory: /home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/lldb/source/Plugins/ABI

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

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/lldb-linux-x86_64/source/Plugins/ABI/SysV-arm/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/lldb-linux-x86_64/source/Plugins/ABI/SysV-arm64/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/lldb-linux-x86_64/source/Plugins/ABI/SysV-hexagon/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/lldb-linux-x86_64/source/Plugins/ABI/SysV-ppc/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/lldb-linux-x86_64/source/Plugins/ABI/SysV-ppc64/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/lldb-linux-x86_64/source/Plugins/ABI/SysV-mips/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/lldb-linux-x86_64/source/Plugins/ABI/SysV-mips64/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/lldb-linux-x86_64/source/Plugins/ABI/SysV-s390x/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/lldb-linux-x86_64/source/Plugins/ABI/SysV-i386/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/lldb-linux-x86_64/source/Plugins/ABI/SysV-x86_64/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/lldb-linux-x86_64/source/Plugins/ABI/MacOSX-i386/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/lldb-linux-x86_64/source/Plugins/ABI/MacOSX-arm/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/lldb-linux-x86_64/source/Plugins/ABI/MacOSX-arm64/cmake_install.cmake")

endif()

