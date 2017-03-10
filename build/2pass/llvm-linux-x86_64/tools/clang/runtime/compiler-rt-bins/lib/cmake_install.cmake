# Install script for directory: /home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/projects/compiler-rt/lib

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
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/llvm-linux-x86_64/tools/clang/runtime/compiler-rt-bins/lib/sanitizer_common/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/llvm-linux-x86_64/tools/clang/runtime/compiler-rt-bins/lib/builtins/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/llvm-linux-x86_64/tools/clang/runtime/compiler-rt-bins/lib/interception/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/llvm-linux-x86_64/tools/clang/runtime/compiler-rt-bins/lib/stats/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/llvm-linux-x86_64/tools/clang/runtime/compiler-rt-bins/lib/lsan/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/llvm-linux-x86_64/tools/clang/runtime/compiler-rt-bins/lib/ubsan/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/llvm-linux-x86_64/tools/clang/runtime/compiler-rt-bins/lib/asan/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/llvm-linux-x86_64/tools/clang/runtime/compiler-rt-bins/lib/dfsan/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/llvm-linux-x86_64/tools/clang/runtime/compiler-rt-bins/lib/msan/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/llvm-linux-x86_64/tools/clang/runtime/compiler-rt-bins/lib/profile/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/llvm-linux-x86_64/tools/clang/runtime/compiler-rt-bins/lib/tsan/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/llvm-linux-x86_64/tools/clang/runtime/compiler-rt-bins/lib/tsan/dd/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/llvm-linux-x86_64/tools/clang/runtime/compiler-rt-bins/lib/safestack/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/llvm-linux-x86_64/tools/clang/runtime/compiler-rt-bins/lib/cfi/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/llvm-linux-x86_64/tools/clang/runtime/compiler-rt-bins/lib/esan/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/llvm-linux-x86_64/tools/clang/runtime/compiler-rt-bins/lib/scudo/cmake_install.cmake")
  include("/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/llvm-linux-x86_64/tools/clang/runtime/compiler-rt-bins/lib/xray/cmake_install.cmake")

endif()

