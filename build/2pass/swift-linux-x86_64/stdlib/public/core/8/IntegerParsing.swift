// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerParsing.swift.gyb", line: 1)
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

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerParsing.swift.gyb", line: 24)

//===--- Parsing helpers --------------------------------------------------===//

/// If text is an ASCII representation in the given `radix` of a
/// non-negative number <= `maximum`, return that number.  Otherwise,
/// return `nil`.
///
/// - Note: If `text` begins with `"+"` or `"-"`, even if the rest of
///   the characters are `"0"`, the result is `nil`.
internal func _parseUnsignedAsciiAsUIntMax(
  _ u16: String.UTF16View, _ radix: Int, _ maximum: UIntMax
) -> UIntMax? {
  if u16.isEmpty { return nil }

  let digit = _ascii16("0")..._ascii16("9")
  let lower = _ascii16("a")..._ascii16("z")
  let upper = _ascii16("A")..._ascii16("Z")

  _precondition(radix > 1, "Radix must be greater than 1")
  _precondition(
    radix <= numericCast(10 + lower.count),
    "Radix exceeds what can be expressed using the English alphabet")

  let uRadix = UIntMax(bitPattern: IntMax(radix))
  var result: UIntMax = 0
  for c in u16 {
    let n: UIntMax
    switch c {
    case digit: n = UIntMax(c - digit.lowerBound)
    case lower: n = UIntMax(c - lower.lowerBound) + 10
    case upper: n = UIntMax(c - upper.lowerBound) + 10
    default: return nil
    }
    if n >= uRadix { return nil }
    let (result1, overflow1) = UIntMax.multiplyWithOverflow(result, uRadix)
    let (result2, overflow2) = UIntMax.addWithOverflow(result1, n)
    result = result2
    if overflow1 || overflow2 || result > maximum { return nil }
  }
  return result
}

/// If text is an ASCII representation in the given `radix` of a
/// non-negative number <= `maximum`, return that number.  Otherwise,
/// return `nil`.
///
/// - Note: For text matching the regular expression "-0+", the result
///   is `0`, not `nil`.
internal func _parseAsciiAsUIntMax(
  _ utf16: String.UTF16View, _ radix: Int, _ maximum: UIntMax
) -> UIntMax? {
  if utf16.isEmpty { return nil }
  // Parse (optional) sign.
  let (digitsUTF16, hasMinus) = _parseOptionalAsciiSign(utf16)
  // Parse digits.
  guard let result = _parseUnsignedAsciiAsUIntMax(digitsUTF16, radix, maximum)
    else { return nil }
  // Disallow < 0.
  if hasMinus && result != 0 { return nil }

  return result
}

/// If text is an ASCII representation in the given `radix` of a
/// number >= -`maximum` - 1 and <= `maximum`, return that number.
/// Otherwise, return `nil`.
///
/// - Note: For text matching the regular expression "-0+", the result
///   is `0`, not `nil`.
internal func _parseAsciiAsIntMax(
  _ utf16: String.UTF16View, _ radix: Int, _ maximum: IntMax
) -> IntMax? {
  _sanityCheck(maximum >= 0, "maximum should be non-negative")
  if utf16.isEmpty { return nil }
  // Parse (optional) sign.
  let (digitsUTF16, hasMinus) = _parseOptionalAsciiSign(utf16)
  // Parse digits. +1 for negatives because e.g. Int8's range is -128...127.
  let absValueMax = UIntMax(bitPattern: maximum) + (hasMinus ? 1 : 0)
  guard let absValue =
    _parseUnsignedAsciiAsUIntMax(digitsUTF16, radix, absValueMax)
    else { return nil }
  // Convert to signed.
  return IntMax(bitPattern: hasMinus ? 0 &- absValue : absValue)
}

/// Strip an optional single leading ASCII plus/minus sign from `utf16`.
private func _parseOptionalAsciiSign(
  _ utf16: String.UTF16View
) -> (digitsUTF16: String.UTF16View, isMinus: Bool) {
  switch utf16.first {
  case _ascii16("-")?: return (utf16.dropFirst(), true)
  case _ascii16("+")?: return (utf16.dropFirst(), false)
  default: return (utf16, false)
  }
}

//===--- Loop over all integer types --------------------------------------===//
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerParsing.swift.gyb", line: 124)

extension UInt8 {
  /// Construct from an ASCII representation in the given `radix`.
  ///
  /// If `text` does not match the regular expression
  /// "[+-]?[0-9a-zA-Z]+", or the value it denotes in the given `radix`
  /// is not representable, the result is `nil`.
  public init?(_ text: String, radix: Int = 10) {
    if let value = _parseAsciiAsUIntMax(
      text.utf16, radix, UIntMax(UInt8.max)) {
      self.init(
        truncatingBitPattern: value)
    }
    else {
      return nil
    }
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerParsing.swift.gyb", line: 124)

extension Int8 {
  /// Construct from an ASCII representation in the given `radix`.
  ///
  /// If `text` does not match the regular expression
  /// "[+-]?[0-9a-zA-Z]+", or the value it denotes in the given `radix`
  /// is not representable, the result is `nil`.
  public init?(_ text: String, radix: Int = 10) {
    if let value = _parseAsciiAsIntMax(
      text.utf16, radix, IntMax(Int8.max)) {
      self.init(
        truncatingBitPattern: value)
    }
    else {
      return nil
    }
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerParsing.swift.gyb", line: 124)

extension UInt16 {
  /// Construct from an ASCII representation in the given `radix`.
  ///
  /// If `text` does not match the regular expression
  /// "[+-]?[0-9a-zA-Z]+", or the value it denotes in the given `radix`
  /// is not representable, the result is `nil`.
  public init?(_ text: String, radix: Int = 10) {
    if let value = _parseAsciiAsUIntMax(
      text.utf16, radix, UIntMax(UInt16.max)) {
      self.init(
        truncatingBitPattern: value)
    }
    else {
      return nil
    }
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerParsing.swift.gyb", line: 124)

extension Int16 {
  /// Construct from an ASCII representation in the given `radix`.
  ///
  /// If `text` does not match the regular expression
  /// "[+-]?[0-9a-zA-Z]+", or the value it denotes in the given `radix`
  /// is not representable, the result is `nil`.
  public init?(_ text: String, radix: Int = 10) {
    if let value = _parseAsciiAsIntMax(
      text.utf16, radix, IntMax(Int16.max)) {
      self.init(
        truncatingBitPattern: value)
    }
    else {
      return nil
    }
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerParsing.swift.gyb", line: 124)

extension UInt32 {
  /// Construct from an ASCII representation in the given `radix`.
  ///
  /// If `text` does not match the regular expression
  /// "[+-]?[0-9a-zA-Z]+", or the value it denotes in the given `radix`
  /// is not representable, the result is `nil`.
  public init?(_ text: String, radix: Int = 10) {
    if let value = _parseAsciiAsUIntMax(
      text.utf16, radix, UIntMax(UInt32.max)) {
      self.init(
        truncatingBitPattern: value)
    }
    else {
      return nil
    }
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerParsing.swift.gyb", line: 124)

extension Int32 {
  /// Construct from an ASCII representation in the given `radix`.
  ///
  /// If `text` does not match the regular expression
  /// "[+-]?[0-9a-zA-Z]+", or the value it denotes in the given `radix`
  /// is not representable, the result is `nil`.
  public init?(_ text: String, radix: Int = 10) {
    if let value = _parseAsciiAsIntMax(
      text.utf16, radix, IntMax(Int32.max)) {
      self.init(
        truncatingBitPattern: value)
    }
    else {
      return nil
    }
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerParsing.swift.gyb", line: 124)

extension UInt64 {
  /// Construct from an ASCII representation in the given `radix`.
  ///
  /// If `text` does not match the regular expression
  /// "[+-]?[0-9a-zA-Z]+", or the value it denotes in the given `radix`
  /// is not representable, the result is `nil`.
  public init?(_ text: String, radix: Int = 10) {
    if let value = _parseAsciiAsUIntMax(
      text.utf16, radix, UIntMax(UInt64.max)) {
      self.init(
         value)
    }
    else {
      return nil
    }
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerParsing.swift.gyb", line: 124)

extension Int64 {
  /// Construct from an ASCII representation in the given `radix`.
  ///
  /// If `text` does not match the regular expression
  /// "[+-]?[0-9a-zA-Z]+", or the value it denotes in the given `radix`
  /// is not representable, the result is `nil`.
  public init?(_ text: String, radix: Int = 10) {
    if let value = _parseAsciiAsIntMax(
      text.utf16, radix, IntMax(Int64.max)) {
      self.init(
         value)
    }
    else {
      return nil
    }
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerParsing.swift.gyb", line: 124)

extension UInt {
  /// Construct from an ASCII representation in the given `radix`.
  ///
  /// If `text` does not match the regular expression
  /// "[+-]?[0-9a-zA-Z]+", or the value it denotes in the given `radix`
  /// is not representable, the result is `nil`.
  public init?(_ text: String, radix: Int = 10) {
    if let value = _parseAsciiAsUIntMax(
      text.utf16, radix, UIntMax(UInt.max)) {
      self.init(
        truncatingBitPattern: value)
    }
    else {
      return nil
    }
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerParsing.swift.gyb", line: 124)

extension Int {
  /// Construct from an ASCII representation in the given `radix`.
  ///
  /// If `text` does not match the regular expression
  /// "[+-]?[0-9a-zA-Z]+", or the value it denotes in the given `radix`
  /// is not representable, the result is `nil`.
  public init?(_ text: String, radix: Int = 10) {
    if let value = _parseAsciiAsIntMax(
      text.utf16, radix, IntMax(Int.max)) {
      self.init(
        truncatingBitPattern: value)
    }
    else {
      return nil
    }
  }
}

