# Install script for directory: /home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib

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
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/swift-linux-x86_64/lib/AST/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/swift-linux-x86_64/lib/ASTSectionImporter/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/swift-linux-x86_64/lib/Basic/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/swift-linux-x86_64/lib/ClangImporter/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/swift-linux-x86_64/lib/Driver/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/swift-linux-x86_64/lib/Frontend/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/swift-linux-x86_64/lib/FrontendTool/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/swift-linux-x86_64/lib/Index/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/swift-linux-x86_64/lib/IDE/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/swift-linux-x86_64/lib/Immediate/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/swift-linux-x86_64/lib/IRGen/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/swift-linux-x86_64/lib/LLVMPasses/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/swift-linux-x86_64/lib/Markup/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/swift-linux-x86_64/lib/Option/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/swift-linux-x86_64/lib/Parse/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/swift-linux-x86_64/lib/PrintAsObjC/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/swift-linux-x86_64/lib/RemoteAST/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/swift-linux-x86_64/lib/Sema/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/swift-linux-x86_64/lib/Serialization/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/swift-linux-x86_64/lib/SIL/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/swift-linux-x86_64/lib/SILGen/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/swift-linux-x86_64/lib/SILOptimizer/cmake_install.cmake")

endif()

