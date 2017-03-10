# Install script for directory: /home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers

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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "clang-headers")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/clang/4.0.0/include" TYPE FILE PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ FILES
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/adxintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/altivec.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/ammintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/arm_acle.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/armintr.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/avx2intrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/avx512bwintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/avx512cdintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/avx512dqintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/avx512erintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/avx512fintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/avx512ifmaintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/avx512ifmavlintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/avx512pfintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/avx512vbmiintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/avx512vbmivlintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/avx512vlbwintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/avx512vlcdintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/avx512vldqintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/avx512vlintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/avxintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/bmi2intrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/bmiintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/__clang_cuda_cmath.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/__clang_cuda_intrinsics.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/__clang_cuda_math_forward_declares.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/__clang_cuda_runtime_wrapper.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/cpuid.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/cuda_builtin_vars.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/clflushoptintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/emmintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/f16cintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/float.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/fma4intrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/fmaintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/fxsrintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/htmintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/htmxlintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/ia32intrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/immintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/intrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/inttypes.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/iso646.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/limits.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/lzcntintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/mm3dnow.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/mmintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/mm_malloc.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/module.modulemap"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/mwaitxintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/nmmintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/opencl-c.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/pkuintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/pmmintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/popcntintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/prfchwintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/rdseedintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/rtmintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/s390intrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/shaintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/smmintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/stdalign.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/stdarg.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/stdatomic.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/stdbool.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/stddef.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/__stddef_max_align_t.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/stdint.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/stdnoreturn.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/tbmintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/tgmath.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/tmmintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/unwind.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/vadefs.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/varargs.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/vecintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/wmmintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/__wmmintrin_aes.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/__wmmintrin_pclmul.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/x86intrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/xmmintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/xopintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/xsavecintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/xsaveintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/xsaveoptintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/xsavesintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/llvm/tools/clang/lib/Headers/xtestintrin.h"
    "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/llvm-linux-x86_64/tools/clang/lib/Headers/arm_neon.h"
    )
endif()

