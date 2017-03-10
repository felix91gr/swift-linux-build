# CMake generated Testfile for 
# Source directory: /home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/cmark/test
# Build directory: /home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/cmark-linux-x86_64/testdir
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(api_test "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/cmark-linux-x86_64/api_test/api_test")
add_test(html_normalization "/usr/bin/python3" "-m" "doctest" "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/cmark/test/normalize.py")
add_test(spectest_library "/usr/bin/python3" "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/cmark/test/spec_tests.py" "--no-normalize" "--spec" "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/cmark/test/spec.txt" "--library-dir" "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/cmark-linux-x86_64/testdir/../src")
add_test(pathological_tests_library "/usr/bin/python3" "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/cmark/test/pathological_tests.py" "--library-dir" "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/cmark-linux-x86_64/testdir/../src")
add_test(spectest_executable "/usr/bin/python3" "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/cmark/test/spec_tests.py" "--no-normalize" "--spec" "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/cmark/test/spec.txt" "--program" "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/cmark-linux-x86_64/testdir/../src/cmark")
add_test(smartpuncttest_executable "/usr/bin/python3" "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/cmark/test/spec_tests.py" "--no-normalize" "--spec" "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/cmark/test/smart_punct.txt" "--program" "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/build/2pass/cmark-linux-x86_64/testdir/../src/cmark --smart")
