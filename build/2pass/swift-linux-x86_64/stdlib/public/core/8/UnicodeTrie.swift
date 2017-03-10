// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnicodeTrie.swift.gyb", line: 1)
//===--- UnicodeTrie.swift.gyb --------------------------------*- swift -*-===//
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
//
// A custom trie implementation to quickly retrieve Unicode property values.
//
//===----------------------------------------------------------------------===//

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnicodeTrie.swift.gyb", line: 44)

import SwiftShims

// These case names must be kept in sync with the 'GraphemeClusterBreakProperty'
// enum in C++ and with the names in the GYBUnicodeDataUtils script.
public // @testable
enum _GraphemeClusterBreakPropertyValue : Int {
  case Other = 0
  case CR = 1
  case LF = 2
  case Control = 3
  case Extend = 4
  case Regional_Indicator = 5
  case Prepend = 6
  case SpacingMark = 7
  case L = 8
  case V = 9
  case T = 10
  case LV = 11
  case LVT = 12
}

// It is expensive to convert a raw enum value to an enum, so we use this type
// safe wrapper around the raw property value to avoid paying the conversion
// cost in hot code paths.
struct _GraphemeClusterBreakPropertyRawValue {
  init(_ rawValue: UInt8) {
    self.rawValue = rawValue
  }

  var rawValue: UInt8

  // Use with care: this operation is expensive (even with optimization
  // turned on the compiler generates code for a switch).
  var cookedValue: _GraphemeClusterBreakPropertyValue {
    return _GraphemeClusterBreakPropertyValue(rawValue: Int(rawValue))!
  }
}

public // @testable
struct _UnicodeGraphemeClusterBreakPropertyTrie {
  static func _checkParameters() {
    let metadata = _swift_stdlib_GraphemeClusterBreakPropertyTrieMetadata

    _sanityCheck(metadata.BMPFirstLevelIndexBits == 8)
    _sanityCheck(metadata.BMPDataOffsetBits == 8)
    _sanityCheck(metadata.SuppFirstLevelIndexBits == 5)
    _sanityCheck(metadata.SuppSecondLevelIndexBits == 8)
    _sanityCheck(metadata.SuppDataOffsetBits == 8)

    _sanityCheck(metadata.BMPLookupBytesPerEntry == 1)
    _sanityCheck(metadata.BMPDataBytesPerEntry == 1)
    _sanityCheck(metadata.SuppLookup1BytesPerEntry == 1)
    _sanityCheck(metadata.SuppLookup2BytesPerEntry == 1)
    _sanityCheck(metadata.SuppDataBytesPerEntry == 1)

    _sanityCheck(metadata.TrieSize == 18961)

    _sanityCheck(metadata.BMPLookupBytesOffset == 0)
    _sanityCheck(metadata.BMPDataBytesOffset == 256)
    _sanityCheck(metadata.SuppLookup1BytesOffset == 12032)
    _sanityCheck(metadata.SuppLookup2BytesOffset == 12049)
    _sanityCheck(metadata.SuppDataBytesOffset == 12817)
  }

  let _trieData: UnsafePointer<UInt8>

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnicodeTrie.swift.gyb", line: 112)
  @_transparent var _bmpLookup: UnsafePointer<UInt8> {
    return _trieData + 0
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnicodeTrie.swift.gyb", line: 116)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnicodeTrie.swift.gyb", line: 118)
  @_transparent var _bmpData: UnsafePointer<UInt8> {
    return _trieData + 256
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnicodeTrie.swift.gyb", line: 122)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnicodeTrie.swift.gyb", line: 124)
  @_transparent var _suppLookup1: UnsafePointer<UInt8> {
    return _trieData + 12032
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnicodeTrie.swift.gyb", line: 128)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnicodeTrie.swift.gyb", line: 130)
  @_transparent var _suppLookup2: UnsafePointer<UInt8> {
    return _trieData + 12049
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnicodeTrie.swift.gyb", line: 134)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnicodeTrie.swift.gyb", line: 136)
  @_transparent var _suppData: UnsafePointer<UInt8> {
    return _trieData + 12817
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnicodeTrie.swift.gyb", line: 140)

  public // @testable
  init() {
    _UnicodeGraphemeClusterBreakPropertyTrie._checkParameters()
    _trieData = _swift_stdlib_GraphemeClusterBreakPropertyTrie
  }

  @_transparent
  func _getBMPFirstLevelIndex(_ cp: UInt32) -> Int {
    return Int(cp >> 8)
  }

  @_transparent
  func _getBMPDataOffset(_ cp: UInt32) -> Int {
    return Int(cp & ((1 << 8) - 1))
  }

  @_transparent
  func _getSuppFirstLevelIndex(_ cp: UInt32) -> Int {
    return Int(cp >> (8 + 8))
  }

  @_transparent
  func _getSuppSecondLevelIndex(_ cp: UInt32) -> Int {
    return Int((cp >> 8) &
        ((1 << 8) - 1))
  }

  @_transparent
  func _getSuppDataOffset(_ cp: UInt32) -> Int {
    return Int(cp & ((1 << 8) - 1))
  }

  func getPropertyRawValue(
      _ codePoint: UInt32
  ) -> _GraphemeClusterBreakPropertyRawValue {
    // Note: for optimization, the code below uses '&+' instead of '+' to avoid
    // a few branches.  There is no possibility of overflow here.
    //
    // The optimizer could figure this out, but right now it keeps extra checks
    // if '+' is used.

    if _fastPath(codePoint <= 0xffff) {
      let dataBlockIndex = Int(_bmpLookup[_getBMPFirstLevelIndex(codePoint)])
      return _GraphemeClusterBreakPropertyRawValue(
          _bmpData[
              (dataBlockIndex << 8) &+
              _getBMPDataOffset(codePoint)])
    } else {
      _precondition(codePoint <= 0x10ffff)
      let secondLookupIndex = Int(_suppLookup1[_getSuppFirstLevelIndex(codePoint)])
      let dataBlockIndex = Int(_suppLookup2[
          (secondLookupIndex << 8) &+
          _getSuppSecondLevelIndex(codePoint)])
      return _GraphemeClusterBreakPropertyRawValue(
          _suppData[
              (dataBlockIndex << 8) &+
              _getSuppDataOffset(codePoint)])
    }
  }

  public // @testable
  func getPropertyValue(
      _ codePoint: UInt32
  ) -> _GraphemeClusterBreakPropertyValue {
    return getPropertyRawValue(codePoint).cookedValue
  }
}

// FIXME(ABI)#74 : don't mark this type versioned, or any of its APIs inlineable.
// Grapheme cluster segmentation uses a completely different algorithm in
// Unicode 9.0.
internal struct _UnicodeExtendedGraphemeClusterSegmenter {
  let _noBoundaryRulesMatrix: UnsafePointer<UInt16>

  init() {
    _noBoundaryRulesMatrix =
        _swift_stdlib_ExtendedGraphemeClusterNoBoundaryRulesMatrix
  }

  /// Returns `true` if there is always a grapheme cluster break after a code
  /// point with a given `Grapheme_Cluster_Break` property value.
  func isBoundaryAfter(_ gcb: _GraphemeClusterBreakPropertyRawValue) -> Bool {
    let ruleRow = _noBoundaryRulesMatrix[Int(gcb.rawValue)]
    return ruleRow == 0
  }

  /// Returns `true` if there is a grapheme cluster break between code points
  /// with given `Grapheme_Cluster_Break` property values.
  func isBoundary(
      _ gcb1: _GraphemeClusterBreakPropertyRawValue,
      _ gcb2: _GraphemeClusterBreakPropertyRawValue
  ) -> Bool {
    let ruleRow = _noBoundaryRulesMatrix[Int(gcb1.rawValue)]
    return (ruleRow & (1 << UInt16(gcb2.rawValue))) == 0
  }
}

// Local Variables:
// eval: (read-only-mode 1)
// End:
