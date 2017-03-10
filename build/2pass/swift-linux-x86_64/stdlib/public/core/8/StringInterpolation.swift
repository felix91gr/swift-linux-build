// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/StringInterpolation.swift.gyb", line: 1)
//===--- StringInterpolation.swift.gyb - String Interpolation -*- swift -*-===//
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

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/StringInterpolation.swift.gyb", line: 36)

extension String : _ExpressibleByStringInterpolation {
  /// Creates a new string by concatenating the given interpolations.
  ///
  /// Do not call this initializer directly. It is used by the compiler when
  /// you create a string using string interpolation. Instead, use string
  /// interpolation to create a new string by including values, literals,
  /// variables, or expressions enclosed in parentheses, prefixed by a
  /// backslash (`\(`...`)`).
  ///
  ///     let price = 2
  ///     let number = 3
  ///     let message = "If one cookie costs \(price) dollars, " +
  ///                   "\(number) cookies cost \(price * number) dollars."
  ///     print(message)
  ///     // Prints "If one cookie costs 2 dollars, 3 cookies cost 6 dollars."
  @effects(readonly)
  public init(stringInterpolation strings: String...) {
    self.init()
    for str in strings {
      self += str
    }
  }

  /// Creates a string containing the given expression's textual
  /// representation.
  ///
  /// Do not call this initializer directly. It is used by the compiler when
  /// interpreting string interpolations.
  ///
  /// - SeeAlso: `ExpressibleByStringInterpolation`
  public init<T>(stringInterpolationSegment expr: T) {
    self = String(describing: expr)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/StringInterpolation.swift.gyb", line: 72)
  /// Creates a string containing the given value's textual representation.
  ///
  /// Do not call this initializer directly. It is used by the compiler when
  /// interpreting string interpolations.
  ///
  /// - SeeAlso: `ExpressibleByStringInterpolation`
  public init(stringInterpolationSegment expr: String) {
    self = _toStringReadOnlyStreamable(expr)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/StringInterpolation.swift.gyb", line: 72)
  /// Creates a string containing the given value's textual representation.
  ///
  /// Do not call this initializer directly. It is used by the compiler when
  /// interpreting string interpolations.
  ///
  /// - SeeAlso: `ExpressibleByStringInterpolation`
  public init(stringInterpolationSegment expr: Character) {
    self = _toStringReadOnlyStreamable(expr)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/StringInterpolation.swift.gyb", line: 72)
  /// Creates a string containing the given value's textual representation.
  ///
  /// Do not call this initializer directly. It is used by the compiler when
  /// interpreting string interpolations.
  ///
  /// - SeeAlso: `ExpressibleByStringInterpolation`
  public init(stringInterpolationSegment expr: UnicodeScalar) {
    self = _toStringReadOnlyStreamable(expr)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/StringInterpolation.swift.gyb", line: 82)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/StringInterpolation.swift.gyb", line: 84)
  /// Creates a string containing the given value's textual representation.
  ///
  /// Do not call this initializer directly. It is used by the compiler when
  /// interpreting string interpolations.
  ///
  /// - SeeAlso: `ExpressibleByStringInterpolation`
  public init(stringInterpolationSegment expr: Bool) {
    self = _toStringReadOnlyPrintable(expr)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/StringInterpolation.swift.gyb", line: 84)
  /// Creates a string containing the given value's textual representation.
  ///
  /// Do not call this initializer directly. It is used by the compiler when
  /// interpreting string interpolations.
  ///
  /// - SeeAlso: `ExpressibleByStringInterpolation`
  public init(stringInterpolationSegment expr: Float32) {
    self = _toStringReadOnlyPrintable(expr)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/StringInterpolation.swift.gyb", line: 84)
  /// Creates a string containing the given value's textual representation.
  ///
  /// Do not call this initializer directly. It is used by the compiler when
  /// interpreting string interpolations.
  ///
  /// - SeeAlso: `ExpressibleByStringInterpolation`
  public init(stringInterpolationSegment expr: Float64) {
    self = _toStringReadOnlyPrintable(expr)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/StringInterpolation.swift.gyb", line: 84)
  /// Creates a string containing the given value's textual representation.
  ///
  /// Do not call this initializer directly. It is used by the compiler when
  /// interpreting string interpolations.
  ///
  /// - SeeAlso: `ExpressibleByStringInterpolation`
  public init(stringInterpolationSegment expr: UInt8) {
    self = _toStringReadOnlyPrintable(expr)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/StringInterpolation.swift.gyb", line: 84)
  /// Creates a string containing the given value's textual representation.
  ///
  /// Do not call this initializer directly. It is used by the compiler when
  /// interpreting string interpolations.
  ///
  /// - SeeAlso: `ExpressibleByStringInterpolation`
  public init(stringInterpolationSegment expr: Int8) {
    self = _toStringReadOnlyPrintable(expr)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/StringInterpolation.swift.gyb", line: 84)
  /// Creates a string containing the given value's textual representation.
  ///
  /// Do not call this initializer directly. It is used by the compiler when
  /// interpreting string interpolations.
  ///
  /// - SeeAlso: `ExpressibleByStringInterpolation`
  public init(stringInterpolationSegment expr: UInt16) {
    self = _toStringReadOnlyPrintable(expr)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/StringInterpolation.swift.gyb", line: 84)
  /// Creates a string containing the given value's textual representation.
  ///
  /// Do not call this initializer directly. It is used by the compiler when
  /// interpreting string interpolations.
  ///
  /// - SeeAlso: `ExpressibleByStringInterpolation`
  public init(stringInterpolationSegment expr: Int16) {
    self = _toStringReadOnlyPrintable(expr)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/StringInterpolation.swift.gyb", line: 84)
  /// Creates a string containing the given value's textual representation.
  ///
  /// Do not call this initializer directly. It is used by the compiler when
  /// interpreting string interpolations.
  ///
  /// - SeeAlso: `ExpressibleByStringInterpolation`
  public init(stringInterpolationSegment expr: UInt32) {
    self = _toStringReadOnlyPrintable(expr)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/StringInterpolation.swift.gyb", line: 84)
  /// Creates a string containing the given value's textual representation.
  ///
  /// Do not call this initializer directly. It is used by the compiler when
  /// interpreting string interpolations.
  ///
  /// - SeeAlso: `ExpressibleByStringInterpolation`
  public init(stringInterpolationSegment expr: Int32) {
    self = _toStringReadOnlyPrintable(expr)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/StringInterpolation.swift.gyb", line: 84)
  /// Creates a string containing the given value's textual representation.
  ///
  /// Do not call this initializer directly. It is used by the compiler when
  /// interpreting string interpolations.
  ///
  /// - SeeAlso: `ExpressibleByStringInterpolation`
  public init(stringInterpolationSegment expr: UInt64) {
    self = _toStringReadOnlyPrintable(expr)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/StringInterpolation.swift.gyb", line: 84)
  /// Creates a string containing the given value's textual representation.
  ///
  /// Do not call this initializer directly. It is used by the compiler when
  /// interpreting string interpolations.
  ///
  /// - SeeAlso: `ExpressibleByStringInterpolation`
  public init(stringInterpolationSegment expr: Int64) {
    self = _toStringReadOnlyPrintable(expr)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/StringInterpolation.swift.gyb", line: 84)
  /// Creates a string containing the given value's textual representation.
  ///
  /// Do not call this initializer directly. It is used by the compiler when
  /// interpreting string interpolations.
  ///
  /// - SeeAlso: `ExpressibleByStringInterpolation`
  public init(stringInterpolationSegment expr: UInt) {
    self = _toStringReadOnlyPrintable(expr)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/StringInterpolation.swift.gyb", line: 84)
  /// Creates a string containing the given value's textual representation.
  ///
  /// Do not call this initializer directly. It is used by the compiler when
  /// interpreting string interpolations.
  ///
  /// - SeeAlso: `ExpressibleByStringInterpolation`
  public init(stringInterpolationSegment expr: Int) {
    self = _toStringReadOnlyPrintable(expr)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/StringInterpolation.swift.gyb", line: 94)
}

// Local Variables:
// eval: (read-only-mode 1)
// End:
