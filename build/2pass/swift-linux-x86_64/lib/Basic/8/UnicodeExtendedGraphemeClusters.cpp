// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 2)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 4)
//// Automatically Generated From UnicodeExtendedGraphemeClusters.cpp.gyb.
//// Do Not Edit Directly!
//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2017 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 25)

#include "swift/Basic/Unicode.h"

swift::unicode::GraphemeClusterBreakProperty
swift::unicode::getGraphemeClusterBreakProperty(uint32_t C) {
  // FIXME: replace linear search with a trie lookup.

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 13 && C <= 13)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::CR;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 10 && C <= 10)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LF;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 34)
  if (C <= 9)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Control;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 11 && C <= 12)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Control;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 14 && C <= 31)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Control;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 127 && C <= 159)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Control;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 173 && C <= 173)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Control;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 1536 && C <= 1541)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Control;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 1564 && C <= 1564)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Control;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 1757 && C <= 1757)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Control;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 1807 && C <= 1807)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Control;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6158 && C <= 6158)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Control;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 8203 && C <= 8203)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Control;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 8206 && C <= 8207)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Control;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 8232 && C <= 8232)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Control;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 8233 && C <= 8233)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Control;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 8234 && C <= 8238)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Control;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 8288 && C <= 8292)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Control;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 8293 && C <= 8293)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Control;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 8294 && C <= 8303)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Control;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 55296 && C <= 57343)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Control;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 65279 && C <= 65279)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Control;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 65520 && C <= 65528)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Control;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 65529 && C <= 65531)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Control;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 69821 && C <= 69821)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Control;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 113824 && C <= 113827)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Control;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 119155 && C <= 119162)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Control;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 917504 && C <= 917504)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Control;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 917505 && C <= 917505)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Control;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 917506 && C <= 917535)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Control;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 917536 && C <= 917631)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Control;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 917632 && C <= 917759)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Control;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 918000 && C <= 921599)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Control;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 768 && C <= 879)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 1155 && C <= 1159)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 1160 && C <= 1161)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 1425 && C <= 1469)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 1471 && C <= 1471)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 1473 && C <= 1474)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 1476 && C <= 1477)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 1479 && C <= 1479)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 1552 && C <= 1562)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 1611 && C <= 1631)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 1648 && C <= 1648)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 1750 && C <= 1756)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 1759 && C <= 1764)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 1767 && C <= 1768)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 1770 && C <= 1773)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 1809 && C <= 1809)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 1840 && C <= 1866)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 1958 && C <= 1968)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2027 && C <= 2035)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2070 && C <= 2073)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2075 && C <= 2083)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2085 && C <= 2087)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2089 && C <= 2093)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2137 && C <= 2139)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2275 && C <= 2306)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2362 && C <= 2362)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2364 && C <= 2364)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2369 && C <= 2376)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2381 && C <= 2381)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2385 && C <= 2391)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2402 && C <= 2403)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2433 && C <= 2433)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2492 && C <= 2492)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2494 && C <= 2494)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2497 && C <= 2500)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2509 && C <= 2509)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2519 && C <= 2519)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2530 && C <= 2531)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2561 && C <= 2562)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2620 && C <= 2620)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2625 && C <= 2626)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2631 && C <= 2632)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2635 && C <= 2637)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2641 && C <= 2641)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2672 && C <= 2673)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2677 && C <= 2677)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2689 && C <= 2690)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2748 && C <= 2748)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2753 && C <= 2757)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2759 && C <= 2760)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2765 && C <= 2765)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2786 && C <= 2787)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2817 && C <= 2817)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2876 && C <= 2876)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2878 && C <= 2878)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2879 && C <= 2879)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2881 && C <= 2884)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2893 && C <= 2893)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2902 && C <= 2902)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2903 && C <= 2903)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2914 && C <= 2915)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2946 && C <= 2946)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3006 && C <= 3006)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3008 && C <= 3008)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3021 && C <= 3021)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3031 && C <= 3031)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3072 && C <= 3072)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3134 && C <= 3136)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3142 && C <= 3144)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3146 && C <= 3149)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3157 && C <= 3158)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3170 && C <= 3171)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3201 && C <= 3201)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3260 && C <= 3260)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3263 && C <= 3263)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3266 && C <= 3266)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3270 && C <= 3270)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3276 && C <= 3277)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3285 && C <= 3286)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3298 && C <= 3299)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3329 && C <= 3329)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3390 && C <= 3390)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3393 && C <= 3396)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3405 && C <= 3405)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3415 && C <= 3415)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3426 && C <= 3427)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3530 && C <= 3530)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3535 && C <= 3535)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3538 && C <= 3540)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3542 && C <= 3542)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3551 && C <= 3551)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3633 && C <= 3633)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3636 && C <= 3642)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3655 && C <= 3662)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3761 && C <= 3761)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3764 && C <= 3769)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3771 && C <= 3772)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3784 && C <= 3789)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3864 && C <= 3865)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3893 && C <= 3893)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3895 && C <= 3895)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3897 && C <= 3897)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3953 && C <= 3966)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3968 && C <= 3972)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3974 && C <= 3975)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3981 && C <= 3991)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3993 && C <= 4028)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 4038 && C <= 4038)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 4141 && C <= 4144)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 4146 && C <= 4151)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 4153 && C <= 4154)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 4157 && C <= 4158)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 4184 && C <= 4185)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 4190 && C <= 4192)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 4209 && C <= 4212)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 4226 && C <= 4226)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 4229 && C <= 4230)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 4237 && C <= 4237)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 4253 && C <= 4253)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 4957 && C <= 4959)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 5906 && C <= 5908)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 5938 && C <= 5940)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 5970 && C <= 5971)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6002 && C <= 6003)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6068 && C <= 6069)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6071 && C <= 6077)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6086 && C <= 6086)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6089 && C <= 6099)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6109 && C <= 6109)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6155 && C <= 6157)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6313 && C <= 6313)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6432 && C <= 6434)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6439 && C <= 6440)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6450 && C <= 6450)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6457 && C <= 6459)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6679 && C <= 6680)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6683 && C <= 6683)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6742 && C <= 6742)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6744 && C <= 6750)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6752 && C <= 6752)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6754 && C <= 6754)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6757 && C <= 6764)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6771 && C <= 6780)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6783 && C <= 6783)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6832 && C <= 6845)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6846 && C <= 6846)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6912 && C <= 6915)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6964 && C <= 6964)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6966 && C <= 6970)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6972 && C <= 6972)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6978 && C <= 6978)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 7019 && C <= 7027)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 7040 && C <= 7041)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 7074 && C <= 7077)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 7080 && C <= 7081)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 7083 && C <= 7085)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 7142 && C <= 7142)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 7144 && C <= 7145)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 7149 && C <= 7149)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 7151 && C <= 7153)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 7212 && C <= 7219)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 7222 && C <= 7223)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 7376 && C <= 7378)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 7380 && C <= 7392)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 7394 && C <= 7400)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 7405 && C <= 7405)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 7412 && C <= 7412)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 7416 && C <= 7417)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 7616 && C <= 7669)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 7676 && C <= 7679)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 8204 && C <= 8205)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 8400 && C <= 8412)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 8413 && C <= 8416)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 8417 && C <= 8417)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 8418 && C <= 8420)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 8421 && C <= 8432)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 11503 && C <= 11505)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 11647 && C <= 11647)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 11744 && C <= 11775)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 12330 && C <= 12333)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 12334 && C <= 12335)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 12441 && C <= 12442)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 42607 && C <= 42607)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 42608 && C <= 42610)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 42612 && C <= 42621)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 42654 && C <= 42655)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 42736 && C <= 42737)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43010 && C <= 43010)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43014 && C <= 43014)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43019 && C <= 43019)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43045 && C <= 43046)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43204 && C <= 43204)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43232 && C <= 43249)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43302 && C <= 43309)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43335 && C <= 43345)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43392 && C <= 43394)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43443 && C <= 43443)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43446 && C <= 43449)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43452 && C <= 43452)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43493 && C <= 43493)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43561 && C <= 43566)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43569 && C <= 43570)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43573 && C <= 43574)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43587 && C <= 43587)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43596 && C <= 43596)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43644 && C <= 43644)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43696 && C <= 43696)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43698 && C <= 43700)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43703 && C <= 43704)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43710 && C <= 43711)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43713 && C <= 43713)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43756 && C <= 43757)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43766 && C <= 43766)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44005 && C <= 44005)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44008 && C <= 44008)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44013 && C <= 44013)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 64286 && C <= 64286)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 65024 && C <= 65039)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 65056 && C <= 65071)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 65438 && C <= 65439)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 66045 && C <= 66045)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 66272 && C <= 66272)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 66422 && C <= 66426)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 68097 && C <= 68099)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 68101 && C <= 68102)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 68108 && C <= 68111)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 68152 && C <= 68154)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 68159 && C <= 68159)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 68325 && C <= 68326)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 69633 && C <= 69633)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 69688 && C <= 69702)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 69759 && C <= 69761)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 69811 && C <= 69814)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 69817 && C <= 69818)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 69888 && C <= 69890)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 69927 && C <= 69931)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 69933 && C <= 69940)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70003 && C <= 70003)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70016 && C <= 70017)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70070 && C <= 70078)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70090 && C <= 70092)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70191 && C <= 70193)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70196 && C <= 70196)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70198 && C <= 70199)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70367 && C <= 70367)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70371 && C <= 70378)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70400 && C <= 70401)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70460 && C <= 70460)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70462 && C <= 70462)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70464 && C <= 70464)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70487 && C <= 70487)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70502 && C <= 70508)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70512 && C <= 70516)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70832 && C <= 70832)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70835 && C <= 70840)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70842 && C <= 70842)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70845 && C <= 70845)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70847 && C <= 70848)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70850 && C <= 70851)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 71087 && C <= 71087)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 71090 && C <= 71093)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 71100 && C <= 71101)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 71103 && C <= 71104)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 71132 && C <= 71133)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 71219 && C <= 71226)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 71229 && C <= 71229)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 71231 && C <= 71232)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 71339 && C <= 71339)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 71341 && C <= 71341)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 71344 && C <= 71349)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 71351 && C <= 71351)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 71453 && C <= 71455)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 71458 && C <= 71461)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 71463 && C <= 71467)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 92912 && C <= 92916)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 92976 && C <= 92982)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 94095 && C <= 94098)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 113821 && C <= 113822)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 119141 && C <= 119141)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 119143 && C <= 119145)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 119150 && C <= 119154)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 119163 && C <= 119170)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 119173 && C <= 119179)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 119210 && C <= 119213)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 119362 && C <= 119364)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 121344 && C <= 121398)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 121403 && C <= 121452)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 121461 && C <= 121461)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 121476 && C <= 121476)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 121499 && C <= 121503)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 121505 && C <= 121519)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 125136 && C <= 125142)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 917760 && C <= 917999)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Extend;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 127462 && C <= 127487)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::Regional_Indicator;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2307 && C <= 2307)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2363 && C <= 2363)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2366 && C <= 2368)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2377 && C <= 2380)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2382 && C <= 2383)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2434 && C <= 2435)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2495 && C <= 2496)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2503 && C <= 2504)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2507 && C <= 2508)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2563 && C <= 2563)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2622 && C <= 2624)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2691 && C <= 2691)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2750 && C <= 2752)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2761 && C <= 2761)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2763 && C <= 2764)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2818 && C <= 2819)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2880 && C <= 2880)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2887 && C <= 2888)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 2891 && C <= 2892)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3007 && C <= 3007)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3009 && C <= 3010)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3014 && C <= 3016)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3018 && C <= 3020)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3073 && C <= 3075)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3137 && C <= 3140)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3202 && C <= 3203)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3262 && C <= 3262)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3264 && C <= 3265)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3267 && C <= 3268)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3271 && C <= 3272)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3274 && C <= 3275)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3330 && C <= 3331)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3391 && C <= 3392)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3398 && C <= 3400)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3402 && C <= 3404)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3458 && C <= 3459)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3536 && C <= 3537)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3544 && C <= 3550)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3570 && C <= 3571)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3635 && C <= 3635)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3763 && C <= 3763)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3902 && C <= 3903)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 3967 && C <= 3967)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 4145 && C <= 4145)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 4155 && C <= 4156)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 4182 && C <= 4183)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 4228 && C <= 4228)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6070 && C <= 6070)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6078 && C <= 6085)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6087 && C <= 6088)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6435 && C <= 6438)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6441 && C <= 6443)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6448 && C <= 6449)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6451 && C <= 6456)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6681 && C <= 6682)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6741 && C <= 6741)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6743 && C <= 6743)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6765 && C <= 6770)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6916 && C <= 6916)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6965 && C <= 6965)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6971 && C <= 6971)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6973 && C <= 6977)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 6979 && C <= 6980)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 7042 && C <= 7042)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 7073 && C <= 7073)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 7078 && C <= 7079)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 7082 && C <= 7082)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 7143 && C <= 7143)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 7146 && C <= 7148)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 7150 && C <= 7150)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 7154 && C <= 7155)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 7204 && C <= 7211)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 7220 && C <= 7221)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 7393 && C <= 7393)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 7410 && C <= 7411)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43043 && C <= 43044)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43047 && C <= 43047)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43136 && C <= 43137)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43188 && C <= 43203)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43346 && C <= 43347)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43395 && C <= 43395)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43444 && C <= 43445)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43450 && C <= 43451)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43453 && C <= 43456)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43567 && C <= 43568)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43571 && C <= 43572)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43597 && C <= 43597)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43755 && C <= 43755)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43758 && C <= 43759)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43765 && C <= 43765)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44003 && C <= 44004)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44006 && C <= 44007)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44009 && C <= 44010)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44012 && C <= 44012)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 69632 && C <= 69632)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 69634 && C <= 69634)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 69762 && C <= 69762)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 69808 && C <= 69810)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 69815 && C <= 69816)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 69932 && C <= 69932)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70018 && C <= 70018)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70067 && C <= 70069)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70079 && C <= 70080)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70188 && C <= 70190)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70194 && C <= 70195)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70197 && C <= 70197)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70368 && C <= 70370)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70402 && C <= 70403)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70463 && C <= 70463)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70465 && C <= 70468)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70471 && C <= 70472)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70475 && C <= 70477)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70498 && C <= 70499)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70833 && C <= 70834)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70841 && C <= 70841)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70843 && C <= 70844)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70846 && C <= 70846)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 70849 && C <= 70849)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 71088 && C <= 71089)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 71096 && C <= 71099)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 71102 && C <= 71102)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 71216 && C <= 71218)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 71227 && C <= 71228)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 71230 && C <= 71230)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 71340 && C <= 71340)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 71342 && C <= 71343)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 71350 && C <= 71350)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 71456 && C <= 71457)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 71462 && C <= 71462)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 94033 && C <= 94078)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 119142 && C <= 119142)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 119149 && C <= 119149)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::SpacingMark;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 4352 && C <= 4447)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::L;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 43360 && C <= 43388)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::L;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 4448 && C <= 4519)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::V;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 55216 && C <= 55238)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::V;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 4520 && C <= 4607)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::T;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 55243 && C <= 55291)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::T;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44032 && C <= 44032)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44060 && C <= 44060)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44088 && C <= 44088)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44116 && C <= 44116)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44144 && C <= 44144)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44172 && C <= 44172)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44200 && C <= 44200)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44228 && C <= 44228)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44256 && C <= 44256)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44284 && C <= 44284)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44312 && C <= 44312)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44340 && C <= 44340)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44368 && C <= 44368)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44396 && C <= 44396)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44424 && C <= 44424)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44452 && C <= 44452)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44480 && C <= 44480)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44508 && C <= 44508)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44536 && C <= 44536)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44564 && C <= 44564)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44592 && C <= 44592)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44620 && C <= 44620)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44648 && C <= 44648)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44676 && C <= 44676)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44704 && C <= 44704)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44732 && C <= 44732)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44760 && C <= 44760)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44788 && C <= 44788)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44816 && C <= 44816)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44844 && C <= 44844)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44872 && C <= 44872)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44900 && C <= 44900)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44928 && C <= 44928)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44956 && C <= 44956)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44984 && C <= 44984)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45012 && C <= 45012)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45040 && C <= 45040)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45068 && C <= 45068)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45096 && C <= 45096)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45124 && C <= 45124)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45152 && C <= 45152)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45180 && C <= 45180)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45208 && C <= 45208)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45236 && C <= 45236)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45264 && C <= 45264)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45292 && C <= 45292)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45320 && C <= 45320)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45348 && C <= 45348)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45376 && C <= 45376)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45404 && C <= 45404)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45432 && C <= 45432)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45460 && C <= 45460)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45488 && C <= 45488)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45516 && C <= 45516)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45544 && C <= 45544)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45572 && C <= 45572)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45600 && C <= 45600)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45628 && C <= 45628)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45656 && C <= 45656)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45684 && C <= 45684)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45712 && C <= 45712)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45740 && C <= 45740)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45768 && C <= 45768)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45796 && C <= 45796)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45824 && C <= 45824)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45852 && C <= 45852)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45880 && C <= 45880)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45908 && C <= 45908)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45936 && C <= 45936)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45964 && C <= 45964)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45992 && C <= 45992)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46020 && C <= 46020)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46048 && C <= 46048)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46076 && C <= 46076)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46104 && C <= 46104)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46132 && C <= 46132)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46160 && C <= 46160)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46188 && C <= 46188)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46216 && C <= 46216)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46244 && C <= 46244)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46272 && C <= 46272)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46300 && C <= 46300)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46328 && C <= 46328)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46356 && C <= 46356)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46384 && C <= 46384)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46412 && C <= 46412)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46440 && C <= 46440)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46468 && C <= 46468)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46496 && C <= 46496)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46524 && C <= 46524)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46552 && C <= 46552)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46580 && C <= 46580)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46608 && C <= 46608)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46636 && C <= 46636)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46664 && C <= 46664)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46692 && C <= 46692)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46720 && C <= 46720)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46748 && C <= 46748)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46776 && C <= 46776)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46804 && C <= 46804)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46832 && C <= 46832)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46860 && C <= 46860)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46888 && C <= 46888)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46916 && C <= 46916)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46944 && C <= 46944)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46972 && C <= 46972)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47000 && C <= 47000)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47028 && C <= 47028)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47056 && C <= 47056)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47084 && C <= 47084)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47112 && C <= 47112)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47140 && C <= 47140)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47168 && C <= 47168)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47196 && C <= 47196)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47224 && C <= 47224)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47252 && C <= 47252)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47280 && C <= 47280)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47308 && C <= 47308)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47336 && C <= 47336)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47364 && C <= 47364)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47392 && C <= 47392)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47420 && C <= 47420)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47448 && C <= 47448)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47476 && C <= 47476)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47504 && C <= 47504)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47532 && C <= 47532)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47560 && C <= 47560)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47588 && C <= 47588)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47616 && C <= 47616)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47644 && C <= 47644)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47672 && C <= 47672)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47700 && C <= 47700)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47728 && C <= 47728)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47756 && C <= 47756)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47784 && C <= 47784)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47812 && C <= 47812)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47840 && C <= 47840)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47868 && C <= 47868)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47896 && C <= 47896)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47924 && C <= 47924)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47952 && C <= 47952)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47980 && C <= 47980)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48008 && C <= 48008)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48036 && C <= 48036)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48064 && C <= 48064)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48092 && C <= 48092)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48120 && C <= 48120)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48148 && C <= 48148)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48176 && C <= 48176)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48204 && C <= 48204)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48232 && C <= 48232)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48260 && C <= 48260)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48288 && C <= 48288)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48316 && C <= 48316)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48344 && C <= 48344)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48372 && C <= 48372)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48400 && C <= 48400)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48428 && C <= 48428)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48456 && C <= 48456)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48484 && C <= 48484)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48512 && C <= 48512)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48540 && C <= 48540)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48568 && C <= 48568)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48596 && C <= 48596)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48624 && C <= 48624)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48652 && C <= 48652)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48680 && C <= 48680)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48708 && C <= 48708)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48736 && C <= 48736)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48764 && C <= 48764)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48792 && C <= 48792)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48820 && C <= 48820)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48848 && C <= 48848)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48876 && C <= 48876)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48904 && C <= 48904)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48932 && C <= 48932)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48960 && C <= 48960)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48988 && C <= 48988)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49016 && C <= 49016)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49044 && C <= 49044)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49072 && C <= 49072)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49100 && C <= 49100)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49128 && C <= 49128)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49156 && C <= 49156)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49184 && C <= 49184)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49212 && C <= 49212)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49240 && C <= 49240)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49268 && C <= 49268)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49296 && C <= 49296)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49324 && C <= 49324)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49352 && C <= 49352)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49380 && C <= 49380)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49408 && C <= 49408)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49436 && C <= 49436)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49464 && C <= 49464)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49492 && C <= 49492)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49520 && C <= 49520)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49548 && C <= 49548)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49576 && C <= 49576)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49604 && C <= 49604)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49632 && C <= 49632)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49660 && C <= 49660)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49688 && C <= 49688)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49716 && C <= 49716)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49744 && C <= 49744)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49772 && C <= 49772)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49800 && C <= 49800)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49828 && C <= 49828)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49856 && C <= 49856)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49884 && C <= 49884)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49912 && C <= 49912)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49940 && C <= 49940)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49968 && C <= 49968)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49996 && C <= 49996)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50024 && C <= 50024)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50052 && C <= 50052)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50080 && C <= 50080)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50108 && C <= 50108)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50136 && C <= 50136)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50164 && C <= 50164)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50192 && C <= 50192)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50220 && C <= 50220)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50248 && C <= 50248)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50276 && C <= 50276)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50304 && C <= 50304)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50332 && C <= 50332)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50360 && C <= 50360)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50388 && C <= 50388)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50416 && C <= 50416)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50444 && C <= 50444)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50472 && C <= 50472)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50500 && C <= 50500)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50528 && C <= 50528)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50556 && C <= 50556)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50584 && C <= 50584)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50612 && C <= 50612)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50640 && C <= 50640)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50668 && C <= 50668)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50696 && C <= 50696)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50724 && C <= 50724)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50752 && C <= 50752)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50780 && C <= 50780)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50808 && C <= 50808)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50836 && C <= 50836)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50864 && C <= 50864)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50892 && C <= 50892)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50920 && C <= 50920)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50948 && C <= 50948)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50976 && C <= 50976)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51004 && C <= 51004)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51032 && C <= 51032)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51060 && C <= 51060)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51088 && C <= 51088)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51116 && C <= 51116)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51144 && C <= 51144)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51172 && C <= 51172)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51200 && C <= 51200)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51228 && C <= 51228)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51256 && C <= 51256)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51284 && C <= 51284)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51312 && C <= 51312)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51340 && C <= 51340)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51368 && C <= 51368)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51396 && C <= 51396)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51424 && C <= 51424)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51452 && C <= 51452)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51480 && C <= 51480)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51508 && C <= 51508)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51536 && C <= 51536)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51564 && C <= 51564)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51592 && C <= 51592)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51620 && C <= 51620)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51648 && C <= 51648)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51676 && C <= 51676)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51704 && C <= 51704)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51732 && C <= 51732)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51760 && C <= 51760)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51788 && C <= 51788)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51816 && C <= 51816)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51844 && C <= 51844)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51872 && C <= 51872)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51900 && C <= 51900)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51928 && C <= 51928)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51956 && C <= 51956)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51984 && C <= 51984)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52012 && C <= 52012)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52040 && C <= 52040)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52068 && C <= 52068)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52096 && C <= 52096)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52124 && C <= 52124)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52152 && C <= 52152)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52180 && C <= 52180)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52208 && C <= 52208)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52236 && C <= 52236)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52264 && C <= 52264)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52292 && C <= 52292)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52320 && C <= 52320)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52348 && C <= 52348)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52376 && C <= 52376)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52404 && C <= 52404)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52432 && C <= 52432)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52460 && C <= 52460)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52488 && C <= 52488)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52516 && C <= 52516)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52544 && C <= 52544)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52572 && C <= 52572)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52600 && C <= 52600)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52628 && C <= 52628)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52656 && C <= 52656)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52684 && C <= 52684)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52712 && C <= 52712)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52740 && C <= 52740)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52768 && C <= 52768)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52796 && C <= 52796)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52824 && C <= 52824)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52852 && C <= 52852)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52880 && C <= 52880)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52908 && C <= 52908)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52936 && C <= 52936)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52964 && C <= 52964)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52992 && C <= 52992)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53020 && C <= 53020)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53048 && C <= 53048)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53076 && C <= 53076)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53104 && C <= 53104)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53132 && C <= 53132)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53160 && C <= 53160)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53188 && C <= 53188)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53216 && C <= 53216)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53244 && C <= 53244)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53272 && C <= 53272)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53300 && C <= 53300)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53328 && C <= 53328)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53356 && C <= 53356)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53384 && C <= 53384)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53412 && C <= 53412)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53440 && C <= 53440)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53468 && C <= 53468)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53496 && C <= 53496)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53524 && C <= 53524)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53552 && C <= 53552)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53580 && C <= 53580)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53608 && C <= 53608)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53636 && C <= 53636)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53664 && C <= 53664)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53692 && C <= 53692)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53720 && C <= 53720)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53748 && C <= 53748)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53776 && C <= 53776)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53804 && C <= 53804)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53832 && C <= 53832)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53860 && C <= 53860)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53888 && C <= 53888)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53916 && C <= 53916)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53944 && C <= 53944)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53972 && C <= 53972)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54000 && C <= 54000)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54028 && C <= 54028)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54056 && C <= 54056)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54084 && C <= 54084)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54112 && C <= 54112)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54140 && C <= 54140)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54168 && C <= 54168)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54196 && C <= 54196)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54224 && C <= 54224)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54252 && C <= 54252)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54280 && C <= 54280)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54308 && C <= 54308)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54336 && C <= 54336)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54364 && C <= 54364)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54392 && C <= 54392)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54420 && C <= 54420)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54448 && C <= 54448)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54476 && C <= 54476)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54504 && C <= 54504)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54532 && C <= 54532)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54560 && C <= 54560)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54588 && C <= 54588)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54616 && C <= 54616)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54644 && C <= 54644)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54672 && C <= 54672)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54700 && C <= 54700)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54728 && C <= 54728)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54756 && C <= 54756)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54784 && C <= 54784)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54812 && C <= 54812)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54840 && C <= 54840)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54868 && C <= 54868)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54896 && C <= 54896)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54924 && C <= 54924)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54952 && C <= 54952)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54980 && C <= 54980)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 55008 && C <= 55008)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 55036 && C <= 55036)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 55064 && C <= 55064)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 55092 && C <= 55092)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 55120 && C <= 55120)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 55148 && C <= 55148)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 55176 && C <= 55176)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LV;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44033 && C <= 44059)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44061 && C <= 44087)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44089 && C <= 44115)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44117 && C <= 44143)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44145 && C <= 44171)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44173 && C <= 44199)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44201 && C <= 44227)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44229 && C <= 44255)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44257 && C <= 44283)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44285 && C <= 44311)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44313 && C <= 44339)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44341 && C <= 44367)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44369 && C <= 44395)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44397 && C <= 44423)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44425 && C <= 44451)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44453 && C <= 44479)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44481 && C <= 44507)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44509 && C <= 44535)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44537 && C <= 44563)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44565 && C <= 44591)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44593 && C <= 44619)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44621 && C <= 44647)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44649 && C <= 44675)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44677 && C <= 44703)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44705 && C <= 44731)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44733 && C <= 44759)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44761 && C <= 44787)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44789 && C <= 44815)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44817 && C <= 44843)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44845 && C <= 44871)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44873 && C <= 44899)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44901 && C <= 44927)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44929 && C <= 44955)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44957 && C <= 44983)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 44985 && C <= 45011)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45013 && C <= 45039)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45041 && C <= 45067)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45069 && C <= 45095)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45097 && C <= 45123)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45125 && C <= 45151)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45153 && C <= 45179)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45181 && C <= 45207)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45209 && C <= 45235)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45237 && C <= 45263)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45265 && C <= 45291)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45293 && C <= 45319)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45321 && C <= 45347)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45349 && C <= 45375)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45377 && C <= 45403)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45405 && C <= 45431)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45433 && C <= 45459)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45461 && C <= 45487)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45489 && C <= 45515)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45517 && C <= 45543)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45545 && C <= 45571)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45573 && C <= 45599)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45601 && C <= 45627)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45629 && C <= 45655)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45657 && C <= 45683)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45685 && C <= 45711)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45713 && C <= 45739)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45741 && C <= 45767)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45769 && C <= 45795)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45797 && C <= 45823)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45825 && C <= 45851)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45853 && C <= 45879)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45881 && C <= 45907)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45909 && C <= 45935)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45937 && C <= 45963)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45965 && C <= 45991)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 45993 && C <= 46019)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46021 && C <= 46047)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46049 && C <= 46075)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46077 && C <= 46103)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46105 && C <= 46131)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46133 && C <= 46159)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46161 && C <= 46187)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46189 && C <= 46215)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46217 && C <= 46243)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46245 && C <= 46271)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46273 && C <= 46299)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46301 && C <= 46327)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46329 && C <= 46355)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46357 && C <= 46383)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46385 && C <= 46411)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46413 && C <= 46439)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46441 && C <= 46467)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46469 && C <= 46495)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46497 && C <= 46523)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46525 && C <= 46551)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46553 && C <= 46579)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46581 && C <= 46607)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46609 && C <= 46635)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46637 && C <= 46663)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46665 && C <= 46691)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46693 && C <= 46719)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46721 && C <= 46747)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46749 && C <= 46775)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46777 && C <= 46803)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46805 && C <= 46831)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46833 && C <= 46859)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46861 && C <= 46887)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46889 && C <= 46915)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46917 && C <= 46943)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46945 && C <= 46971)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 46973 && C <= 46999)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47001 && C <= 47027)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47029 && C <= 47055)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47057 && C <= 47083)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47085 && C <= 47111)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47113 && C <= 47139)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47141 && C <= 47167)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47169 && C <= 47195)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47197 && C <= 47223)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47225 && C <= 47251)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47253 && C <= 47279)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47281 && C <= 47307)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47309 && C <= 47335)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47337 && C <= 47363)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47365 && C <= 47391)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47393 && C <= 47419)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47421 && C <= 47447)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47449 && C <= 47475)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47477 && C <= 47503)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47505 && C <= 47531)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47533 && C <= 47559)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47561 && C <= 47587)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47589 && C <= 47615)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47617 && C <= 47643)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47645 && C <= 47671)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47673 && C <= 47699)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47701 && C <= 47727)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47729 && C <= 47755)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47757 && C <= 47783)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47785 && C <= 47811)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47813 && C <= 47839)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47841 && C <= 47867)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47869 && C <= 47895)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47897 && C <= 47923)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47925 && C <= 47951)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47953 && C <= 47979)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 47981 && C <= 48007)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48009 && C <= 48035)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48037 && C <= 48063)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48065 && C <= 48091)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48093 && C <= 48119)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48121 && C <= 48147)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48149 && C <= 48175)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48177 && C <= 48203)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48205 && C <= 48231)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48233 && C <= 48259)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48261 && C <= 48287)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48289 && C <= 48315)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48317 && C <= 48343)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48345 && C <= 48371)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48373 && C <= 48399)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48401 && C <= 48427)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48429 && C <= 48455)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48457 && C <= 48483)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48485 && C <= 48511)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48513 && C <= 48539)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48541 && C <= 48567)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48569 && C <= 48595)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48597 && C <= 48623)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48625 && C <= 48651)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48653 && C <= 48679)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48681 && C <= 48707)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48709 && C <= 48735)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48737 && C <= 48763)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48765 && C <= 48791)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48793 && C <= 48819)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48821 && C <= 48847)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48849 && C <= 48875)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48877 && C <= 48903)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48905 && C <= 48931)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48933 && C <= 48959)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48961 && C <= 48987)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 48989 && C <= 49015)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49017 && C <= 49043)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49045 && C <= 49071)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49073 && C <= 49099)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49101 && C <= 49127)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49129 && C <= 49155)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49157 && C <= 49183)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49185 && C <= 49211)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49213 && C <= 49239)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49241 && C <= 49267)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49269 && C <= 49295)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49297 && C <= 49323)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49325 && C <= 49351)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49353 && C <= 49379)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49381 && C <= 49407)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49409 && C <= 49435)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49437 && C <= 49463)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49465 && C <= 49491)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49493 && C <= 49519)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49521 && C <= 49547)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49549 && C <= 49575)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49577 && C <= 49603)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49605 && C <= 49631)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49633 && C <= 49659)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49661 && C <= 49687)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49689 && C <= 49715)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49717 && C <= 49743)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49745 && C <= 49771)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49773 && C <= 49799)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49801 && C <= 49827)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49829 && C <= 49855)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49857 && C <= 49883)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49885 && C <= 49911)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49913 && C <= 49939)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49941 && C <= 49967)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49969 && C <= 49995)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 49997 && C <= 50023)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50025 && C <= 50051)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50053 && C <= 50079)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50081 && C <= 50107)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50109 && C <= 50135)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50137 && C <= 50163)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50165 && C <= 50191)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50193 && C <= 50219)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50221 && C <= 50247)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50249 && C <= 50275)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50277 && C <= 50303)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50305 && C <= 50331)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50333 && C <= 50359)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50361 && C <= 50387)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50389 && C <= 50415)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50417 && C <= 50443)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50445 && C <= 50471)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50473 && C <= 50499)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50501 && C <= 50527)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50529 && C <= 50555)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50557 && C <= 50583)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50585 && C <= 50611)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50613 && C <= 50639)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50641 && C <= 50667)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50669 && C <= 50695)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50697 && C <= 50723)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50725 && C <= 50751)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50753 && C <= 50779)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50781 && C <= 50807)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50809 && C <= 50835)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50837 && C <= 50863)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50865 && C <= 50891)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50893 && C <= 50919)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50921 && C <= 50947)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50949 && C <= 50975)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 50977 && C <= 51003)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51005 && C <= 51031)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51033 && C <= 51059)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51061 && C <= 51087)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51089 && C <= 51115)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51117 && C <= 51143)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51145 && C <= 51171)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51173 && C <= 51199)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51201 && C <= 51227)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51229 && C <= 51255)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51257 && C <= 51283)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51285 && C <= 51311)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51313 && C <= 51339)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51341 && C <= 51367)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51369 && C <= 51395)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51397 && C <= 51423)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51425 && C <= 51451)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51453 && C <= 51479)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51481 && C <= 51507)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51509 && C <= 51535)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51537 && C <= 51563)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51565 && C <= 51591)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51593 && C <= 51619)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51621 && C <= 51647)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51649 && C <= 51675)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51677 && C <= 51703)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51705 && C <= 51731)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51733 && C <= 51759)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51761 && C <= 51787)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51789 && C <= 51815)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51817 && C <= 51843)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51845 && C <= 51871)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51873 && C <= 51899)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51901 && C <= 51927)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51929 && C <= 51955)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51957 && C <= 51983)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 51985 && C <= 52011)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52013 && C <= 52039)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52041 && C <= 52067)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52069 && C <= 52095)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52097 && C <= 52123)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52125 && C <= 52151)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52153 && C <= 52179)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52181 && C <= 52207)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52209 && C <= 52235)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52237 && C <= 52263)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52265 && C <= 52291)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52293 && C <= 52319)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52321 && C <= 52347)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52349 && C <= 52375)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52377 && C <= 52403)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52405 && C <= 52431)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52433 && C <= 52459)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52461 && C <= 52487)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52489 && C <= 52515)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52517 && C <= 52543)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52545 && C <= 52571)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52573 && C <= 52599)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52601 && C <= 52627)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52629 && C <= 52655)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52657 && C <= 52683)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52685 && C <= 52711)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52713 && C <= 52739)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52741 && C <= 52767)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52769 && C <= 52795)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52797 && C <= 52823)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52825 && C <= 52851)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52853 && C <= 52879)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52881 && C <= 52907)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52909 && C <= 52935)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52937 && C <= 52963)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52965 && C <= 52991)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 52993 && C <= 53019)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53021 && C <= 53047)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53049 && C <= 53075)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53077 && C <= 53103)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53105 && C <= 53131)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53133 && C <= 53159)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53161 && C <= 53187)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53189 && C <= 53215)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53217 && C <= 53243)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53245 && C <= 53271)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53273 && C <= 53299)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53301 && C <= 53327)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53329 && C <= 53355)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53357 && C <= 53383)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53385 && C <= 53411)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53413 && C <= 53439)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53441 && C <= 53467)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53469 && C <= 53495)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53497 && C <= 53523)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53525 && C <= 53551)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53553 && C <= 53579)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53581 && C <= 53607)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53609 && C <= 53635)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53637 && C <= 53663)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53665 && C <= 53691)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53693 && C <= 53719)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53721 && C <= 53747)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53749 && C <= 53775)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53777 && C <= 53803)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53805 && C <= 53831)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53833 && C <= 53859)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53861 && C <= 53887)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53889 && C <= 53915)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53917 && C <= 53943)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53945 && C <= 53971)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 53973 && C <= 53999)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54001 && C <= 54027)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54029 && C <= 54055)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54057 && C <= 54083)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54085 && C <= 54111)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54113 && C <= 54139)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54141 && C <= 54167)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54169 && C <= 54195)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54197 && C <= 54223)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54225 && C <= 54251)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54253 && C <= 54279)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54281 && C <= 54307)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54309 && C <= 54335)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54337 && C <= 54363)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54365 && C <= 54391)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54393 && C <= 54419)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54421 && C <= 54447)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54449 && C <= 54475)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54477 && C <= 54503)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54505 && C <= 54531)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54533 && C <= 54559)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54561 && C <= 54587)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54589 && C <= 54615)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54617 && C <= 54643)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54645 && C <= 54671)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54673 && C <= 54699)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54701 && C <= 54727)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54729 && C <= 54755)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54757 && C <= 54783)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54785 && C <= 54811)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54813 && C <= 54839)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54841 && C <= 54867)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54869 && C <= 54895)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54897 && C <= 54923)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54925 && C <= 54951)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54953 && C <= 54979)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 54981 && C <= 55007)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 55009 && C <= 55035)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 55037 && C <= 55063)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 55065 && C <= 55091)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 55093 && C <= 55119)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 55121 && C <= 55147)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 55149 && C <= 55175)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 36)
  if (C >= 55177 && C <= 55203)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 38)
    return GraphemeClusterBreakProperty::LVT;
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 40)

  return GraphemeClusterBreakProperty::Other;
}

const uint16_t swift::unicode::ExtendedGraphemeClusterNoBoundaryRulesMatrix[] = {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 46)
  144,
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 46)
  4,
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 46)
  0,
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 46)
  0,
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 46)
  144,
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 46)
  176,
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 46)
  8177,
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 46)
  144,
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 46)
  7056,
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 46)
  1680,
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 46)
  1168,
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 46)
  1680,
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 46)
  1168,
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/lib/Basic/UnicodeExtendedGraphemeClusters.cpp.gyb", line: 48)
};

