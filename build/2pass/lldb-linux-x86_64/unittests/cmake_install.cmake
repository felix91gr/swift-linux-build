# Install script for directory: /home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/lldb/unittests

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
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/lldb-linux-x86_64/unittests/Breakpoint/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/lldb-linux-x86_64/unittests/Core/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/lldb-linux-x86_64/unittests/Editline/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/lldb-linux-x86_64/unittests/Expression/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/lldb-linux-x86_64/unittests/Host/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/lldb-linux-x86_64/unittests/Interpreter/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/lldb-linux-x86_64/unittests/Language/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/lldb-linux-x86_64/unittests/Platform/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/lldb-linux-x86_64/unittests/Process/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/lldb-linux-x86_64/unittests/ScriptInterpreter/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/lldb-linux-x86_64/unittests/Symbol/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/lldb-linux-x86_64/unittests/SymbolFile/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/lldb-linux-x86_64/unittests/UnwindAssembly/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/lldb-linux-x86_64/unittests/Utility/cmake_install.cmake")

endif()

