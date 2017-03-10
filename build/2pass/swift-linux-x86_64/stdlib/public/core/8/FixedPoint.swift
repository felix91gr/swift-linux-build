// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 1)
//===--- FixedPoint.swift.gyb ---------------------------------*- swift -*-===//
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

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 44)

/// The largest native signed integer type.
public typealias IntMax = Int64
/// The largest native unsigned integer type.
public typealias UIntMax = UInt64

/// This protocol is an implementation detail of `Integer`; do
/// not use it directly.
@_show_in_interface
public protocol _Integer
  : _ExpressibleByBuiltinIntegerLiteral,
    ExpressibleByIntegerLiteral,
    CustomStringConvertible,
    Hashable,
    IntegerArithmetic,
    BitwiseOperations,
    _Incrementable
{
}

/// A set of common requirements for Swift's integer types.
public protocol Integer : _Integer, Strideable {}

/// This protocol is an implementation detail of `SignedInteger`;
/// do not use it directly.
@_show_in_interface
public protocol _SignedInteger : _Integer, SignedNumber {
  /// Represent this number using Swift's widest native signed integer
  /// type.
  func toIntMax() -> IntMax

  /// Convert from Swift's widest signed integer type, trapping on
  /// overflow.
  init(_: IntMax)
}

/// A set of common requirements for Swift's signed integer types.
public protocol SignedInteger : _SignedInteger, Integer {
  /// Represent this number using Swift's widest native signed integer
  /// type.
  func toIntMax() -> IntMax

  /// Convert from Swift's widest signed integer type, trapping on
  /// overflow.
  init(_: IntMax)
}

extension SignedInteger {
  // FIXME(ABI)#29 : using Int as the return value is wrong.
  @_transparent
  public func distance(to other: Self) -> Int {
    return numericCast((numericCast(other) as IntMax) - numericCast(self))
  }

  // FIXME(ABI)#30 : using Int as the argument is wrong.
  @_transparent
  public func advanced(by n: Int) -> Self {
    return numericCast((numericCast(self) as IntMax) + numericCast(n))
  }
}

/// This protocol is an implementation detail of `UnsignedInteger`;
/// do not use it directly.
@_show_in_interface
public protocol _DisallowMixedSignArithmetic : _Integer {
  // Used to create a deliberate ambiguity in cases like UInt(1) +
  // Int(1), which would otherwise compile due to the arithmetic
  // operators defined for Strideable types (unsigned types are
  // Strideable).
  associatedtype _DisallowMixedSignArithmetic : SignedInteger = Int
}

/// A set of common requirements for Swift's unsigned integer types.
public protocol UnsignedInteger : _DisallowMixedSignArithmetic, Integer {
  /// Represent this number using Swift's widest native unsigned
  /// integer type.
  func toUIntMax() -> UIntMax

  /// Convert from Swift's widest unsigned integer type, trapping on
  /// overflow.
  init(_: UIntMax)
}

extension UnsignedInteger {
  // FIXME(ABI)#31 : using Int as the return value is wrong.
  @_transparent
  public func distance(to other: Self) -> Int {
    return numericCast((numericCast(other) as IntMax) - numericCast(self))
  }

  // FIXME(ABI)#32 : using Int as the return value is wrong.
  @_transparent
  public func advanced(by n: Int) -> Self {
    return numericCast((numericCast(self) as IntMax) + numericCast(n))
  }
}

/// Convert `x` to type `U`, trapping on overflow in -Onone and -O
/// builds.
///
/// Typically used to do conversion to any contextually-deduced
/// integer type:
///
///     func f(_ x: Int32) {}
///     func g(_ x: Int64) { f(numericCast(x)) }
public func numericCast<
  T : _SignedInteger, U : _SignedInteger
>(_ x: T) -> U {
  return U(x.toIntMax())
}

/// Convert `x` to type `U`, trapping on overflow in -Onone and -O
/// builds.
///
/// Typically used to do conversion to any contextually-deduced
/// integer type:
///
///     func f(_ x: UInt32) {}
///     func g(_ x: UInt64) { f(numericCast(x)) }
public func numericCast<
  T : UnsignedInteger, U : UnsignedInteger
>(_ x: T) -> U {
  return U(x.toUIntMax())
}

/// Convert `x` to type `U`, trapping on overflow in -Onone and -O
/// builds.
///
/// Typically used to do conversion to any contextually-deduced
/// integer type:
///
///     func f(_ x: UInt32) {}
///     func g(_ x: Int64) { f(numericCast(x)) }
public func numericCast<
  T : _SignedInteger, U : UnsignedInteger
>(_ x: T) -> U {
  return U(UIntMax(x.toIntMax()))
}

/// Convert `x` to type `U`, trapping on overflow in -Onone and -O
/// builds.
///
/// Typically used to do conversion to any contextually-deduced
/// integer type:
///
///     func f(_ x: Int32) {}
///     func g(_ x: UInt64) { f(numericCast(x)) }
public func numericCast<
T : UnsignedInteger, U : _SignedInteger
>(_ x: T) -> U {
  return U(IntMax(x.toUIntMax()))
}

//===--- Loop over all integer types --------------------------------------===//
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 206)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 213)
/// An 8-bit unsigned integer value
/// type.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 216)
@_fixed_layout
public struct UInt8
   : UnsignedInteger,
     Comparable, Equatable {
  public // @testable
  var _value: Builtin.Int8

  // FIXME: this declaration should be inferred.
  // <rdar://problem/18379938> Type checker refuses to use the default for
  // Int.Distance associated type

  /// Create an instance initialized to zero.
  @_transparent public
  init() {
    let maxWidthZero: IntMax = 0
    self._value = Builtin.truncOrBitCast_Int64_Int8(
       maxWidthZero._value)
  }

  @_transparent public
  init(_ _v: Builtin.Int8) {
    self._value = _v
  }

  @_transparent public
  init(_bits: Builtin.Int8) {
    self._value = _bits
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 266)


// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 291)

  @_transparent public
  init(_builtinIntegerLiteral value: Builtin.Int2048) {
    self = UInt8(Builtin.s_to_u_checked_trunc_Int2048_Int8(value).0)
  }

  /// Create an instance initialized to `value`.
  @_transparent public
  init(integerLiteral value: UInt8) {
    self = value
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 323)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 330)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 332)
  @_transparent public
  static var max: UInt8 { return 0xFF }
  @_transparent public
  static var min: UInt8 { return 0 }
  @_transparent
  public static var _sizeInBits: UInt8 { return 8 }
  public static var _sizeInBytes: UInt8 { return 8/8 }
}

extension UInt8 : Hashable {
  /// The hash value.
  ///
  /// **Axiom:** `x == y` implies `x.hashValue == y.hashValue`.
  ///
  /// - Note: The hash value is not guaranteed to be stable across
  ///   different invocations of the same program.  Do not persist the
  ///   hash value across program runs.
  public var hashValue: Int {
    @inline(__always)
    get {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 356)
      // Sign extend the value.
      return Int(Int8(bitPattern: self))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 366)
    }
  }
}

extension UInt8 : CustomStringConvertible {
  /// A textual representation of `self`.
  public var description: String {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 376)
    return _uint64ToString(self.toUIntMax())
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 378)
  }
}

// Operations that return an overflow bit in addition to a partial result,
// helpful for checking for overflow when you want to handle it.
extension UInt8 {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 385)
  /// Add `lhs` and `rhs`, returning a result and a
  /// `Bool` that is `true` iff the operation caused an arithmetic
  /// overflow.
  @_transparent public
  static func addWithOverflow(_ lhs: UInt8, _ rhs: UInt8) -> (UInt8, overflow: Bool) {
    let tmp = Builtin.uadd_with_overflow_Int8(lhs._value, rhs._value, false._value)
    return (UInt8(tmp.0), Bool(tmp.1))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 385)
  /// Subtract `lhs` and `rhs`, returning a result and a
  /// `Bool` that is `true` iff the operation caused an arithmetic
  /// overflow.
  @_transparent public
  static func subtractWithOverflow(_ lhs: UInt8, _ rhs: UInt8) -> (UInt8, overflow: Bool) {
    let tmp = Builtin.usub_with_overflow_Int8(lhs._value, rhs._value, false._value)
    return (UInt8(tmp.0), Bool(tmp.1))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 385)
  /// Multiply `lhs` and `rhs`, returning a result and a
  /// `Bool` that is `true` iff the operation caused an arithmetic
  /// overflow.
  @_transparent public
  static func multiplyWithOverflow(_ lhs: UInt8, _ rhs: UInt8) -> (UInt8, overflow: Bool) {
    let tmp = Builtin.umul_with_overflow_Int8(lhs._value, rhs._value, false._value)
    return (UInt8(tmp.0), Bool(tmp.1))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 394)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 396)
  /// Divide `lhs` and `rhs`, returning
  /// a result and a `Bool`
  /// that is `true` iff the operation caused an arithmetic overflow.
  @_transparent public
  static func divideWithOverflow(_ lhs: UInt8, _ rhs: UInt8) -> (UInt8, overflow: Bool) {
    if rhs == 0 {
      return (0, true)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 409)
    // FIXME: currently doesn't detect overflow -- blocked by:
    // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
    let tmp = Builtin.udiv_Int8(lhs._value, rhs._value)
    return (UInt8(tmp), false)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 396)
  /// Divide `lhs` and `rhs`, returning
  /// the remainder and a `Bool`
  /// that is `true` iff the operation caused an arithmetic overflow.
  @_transparent public
  static func remainderWithOverflow(_ lhs: UInt8, _ rhs: UInt8) -> (UInt8, overflow: Bool) {
    if rhs == 0 {
      return (0, true)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 409)
    // FIXME: currently doesn't detect overflow -- blocked by:
    // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
    let tmp = Builtin.urem_Int8(lhs._value, rhs._value)
    return (UInt8(tmp), false)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 415)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 417)
  /// Represent this number using Swift's widest native unsigned
  /// integer type.
  @_transparent public
  func toUIntMax() -> UIntMax {
    return UIntMax(self)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 424)
  /// Explicitly convert to `IntMax`.
  @_transparent public
  func toIntMax() -> IntMax {
    return IntMax(toUIntMax())
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 430)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 435)


// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 469)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt8 {

  @_transparent
  public init(_ value: UInt8) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = (src, false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting UInt8 to UInt8 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt8) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = (src, false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt8 {

  @_transparent
  public init(_ value: Int8) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.s_to_u_checked_conversion_Int8(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int8) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.s_to_u_checked_conversion_Int8(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt8 {

  @_transparent
  public init(_ value: UInt16) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.u_to_u_checked_trunc_Int16_Int8(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt16) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.u_to_u_checked_trunc_Int16_Int8(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `UInt8` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: UInt16) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int16_Int8(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt8 {

  @_transparent
  public init(_ value: Int16) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.s_to_u_checked_trunc_Int16_Int8(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int16) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.s_to_u_checked_trunc_Int16_Int8(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `UInt8` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: Int16) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int16_Int8(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt8 {

  @_transparent
  public init(_ value: UInt32) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.u_to_u_checked_trunc_Int32_Int8(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt32) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.u_to_u_checked_trunc_Int32_Int8(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `UInt8` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: UInt32) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int32_Int8(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt8 {

  @_transparent
  public init(_ value: Int32) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.s_to_u_checked_trunc_Int32_Int8(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int32) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.s_to_u_checked_trunc_Int32_Int8(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `UInt8` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: Int32) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int32_Int8(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt8 {

  @_transparent
  public init(_ value: UInt64) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.u_to_u_checked_trunc_Int64_Int8(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt64) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.u_to_u_checked_trunc_Int64_Int8(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `UInt8` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: UInt64) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int64_Int8(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt8 {

  @_transparent
  public init(_ value: Int64) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.s_to_u_checked_trunc_Int64_Int8(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int64) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.s_to_u_checked_trunc_Int64_Int8(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `UInt8` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: Int64) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int64_Int8(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt8 {

  @_transparent
  public init(_ value: UInt) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.u_to_u_checked_trunc_Int64_Int8(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.u_to_u_checked_trunc_Int64_Int8(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `UInt8` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: UInt) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int64_Int8(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt8 {

  @_transparent
  public init(_ value: Int) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.s_to_u_checked_trunc_Int64_Int8(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.s_to_u_checked_trunc_Int64_Int8(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `UInt8` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: Int) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int64_Int8(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 524)

extension UInt8 {
// Construction of integers from floating point numbers.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 531)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 535)

  /// Creates a new instance by rounding the given floating-point value toward
  /// zero.
  ///
  /// - Parameter other: A floating-point value. When `other` is rounded toward
  ///   zero, the result must be within the range `UInt8.min...UInt8.max`.
  @_transparent
  public init(_ value: Float) {
    _precondition(value.isFinite,
      "Float value cannot be converted to UInt8 because it is either infinite or NaN")
    _precondition(value > -1.0,
      "Float value cannot be converted to UInt8 because the result would be less than UInt8.min")
    _precondition(value < 256.0,
      "Float value cannot be converted to UInt8 because the result would be greater than UInt8.max")
    self._value = Builtin.fptoui_FPIEEE32_Int8(value._value)
  }

  /// Creates a UInt8 whose value is `value`
  /// if no rounding is necessary, nil otherwise.
  @inline(__always)
  public init?(exactly value: Float) {
    self._value = Builtin.fptoui_FPIEEE32_Int8(value._value)
    if Float(self) != value {
      return nil
    }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 531)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 535)

  /// Creates a new instance by rounding the given floating-point value toward
  /// zero.
  ///
  /// - Parameter other: A floating-point value. When `other` is rounded toward
  ///   zero, the result must be within the range `UInt8.min...UInt8.max`.
  @_transparent
  public init(_ value: Double) {
    _precondition(value.isFinite,
      "Double value cannot be converted to UInt8 because it is either infinite or NaN")
    _precondition(value > -1.0,
      "Double value cannot be converted to UInt8 because the result would be less than UInt8.min")
    _precondition(value < 256.0,
      "Double value cannot be converted to UInt8 because the result would be greater than UInt8.max")
    self._value = Builtin.fptoui_FPIEEE64_Int8(value._value)
  }

  /// Creates a UInt8 whose value is `value`
  /// if no rounding is necessary, nil otherwise.
  @inline(__always)
  public init?(exactly value: Double) {
    self._value = Builtin.fptoui_FPIEEE64_Int8(value._value)
    if Double(self) != value {
      return nil
    }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 531)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 533)
#if !os(Windows) && (arch(i386) || arch(x86_64))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 535)

  /// Creates a new instance by rounding the given floating-point value toward
  /// zero.
  ///
  /// - Parameter other: A floating-point value. When `other` is rounded toward
  ///   zero, the result must be within the range `UInt8.min...UInt8.max`.
  @_transparent
  public init(_ value: Float80) {
    _precondition(value.isFinite,
      "Float80 value cannot be converted to UInt8 because it is either infinite or NaN")
    _precondition(value > -1.0,
      "Float80 value cannot be converted to UInt8 because the result would be less than UInt8.min")
    _precondition(value < 256.0,
      "Float80 value cannot be converted to UInt8 because the result would be greater than UInt8.max")
    self._value = Builtin.fptoui_FPIEEE80_Int8(value._value)
  }

  /// Creates a UInt8 whose value is `value`
  /// if no rounding is necessary, nil otherwise.
  @inline(__always)
  public init?(exactly value: Float80) {
    self._value = Builtin.fptoui_FPIEEE80_Int8(value._value)
    if Float80(self) != value {
      return nil
    }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 562)
#endif
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 565)

  /// Construct a `UInt8` having the same memory representation as
  /// the `Int8` `bitPattern`.  No range or overflow checking
  /// occurs, and the resulting `UInt8` may not have the same numeric
  /// value as `bitPattern`--it is only guaranteed to use the same
  /// pattern of bits.
  @_transparent
  public init(bitPattern: Int8) {
    self._value = bitPattern._value
  }
}

// Operations with potentially-static overflow checking
//
// FIXME: must use condfail in these operators, rather than
// overflowChecked, pending <rdar://problem/16271923> so that we don't
// foil static checking for numeric overflows.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 583)
@_transparent
public func + (lhs: UInt8, rhs: UInt8) -> UInt8 {
  let (result, error) = Builtin.uadd_with_overflow_Int8(
    lhs._value, rhs._value, true._value)
  // return overflowChecked((UInt8(result), Bool(error)))
  Builtin.condfail(error)
  return UInt8(result)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 583)
@_transparent
public func * (lhs: UInt8, rhs: UInt8) -> UInt8 {
  let (result, error) = Builtin.umul_with_overflow_Int8(
    lhs._value, rhs._value, true._value)
  // return overflowChecked((UInt8(result), Bool(error)))
  Builtin.condfail(error)
  return UInt8(result)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 583)
@_transparent
public func - (lhs: UInt8, rhs: UInt8) -> UInt8 {
  let (result, error) = Builtin.usub_with_overflow_Int8(
    lhs._value, rhs._value, true._value)
  // return overflowChecked((UInt8(result), Bool(error)))
  Builtin.condfail(error)
  return UInt8(result)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 592)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 594)
@_transparent
public func /(lhs: UInt8, rhs: UInt8) -> UInt8 {
  Builtin.condfail((rhs == 0)._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 600)
  // FIXME: currently doesn't detect overflow -- blocked by:
  // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
  let tmp = Builtin.udiv_Int8(lhs._value, rhs._value)
  return UInt8(tmp)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 594)
@_transparent
public func %(lhs: UInt8, rhs: UInt8) -> UInt8 {
  Builtin.condfail((rhs == 0)._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 600)
  // FIXME: currently doesn't detect overflow -- blocked by:
  // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
  let tmp = Builtin.urem_Int8(lhs._value, rhs._value)
  return UInt8(tmp)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 606)

// Bitwise negate
/// Returns the inverse of the bits set in the argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public prefix func ~ (rhs: UInt8) -> UInt8 {
  let mask = UInt8.subtractWithOverflow(0, 1).0
  return UInt8(Builtin.xor_Int8(rhs._value, mask._value))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the two arguments have equal values.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func == (lhs: UInt8, rhs: UInt8) -> Bool {
  return Bool(Builtin.cmp_eq_Int8(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the two arguments have unequal values.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func != (lhs: UInt8, rhs: UInt8) -> Bool {
  return Bool(Builtin.cmp_ne_Int8(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is less than the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func < (lhs: UInt8, rhs: UInt8) -> Bool {
  return Bool(Builtin.cmp_ult_Int8(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is less than or equal to the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func <= (lhs: UInt8, rhs: UInt8) -> Bool {
  return Bool(Builtin.cmp_ule_Int8(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is greater than the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func > (lhs: UInt8, rhs: UInt8) -> Bool {
  return Bool(Builtin.cmp_ugt_Int8(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is greater than or equal to the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func >= (lhs: UInt8, rhs: UInt8) -> Bool {
  return Bool(Builtin.cmp_uge_Int8(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 634)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 636)
@_transparent
public func << (lhs: UInt8, rhs: UInt8) -> UInt8 {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 642)
  _precondition(rhs < UInt8._sizeInBits,
      "shift amount is larger than type size in bits")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 645)
  return UInt8(Builtin.shl_Int8(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 636)
@_transparent
public func >> (lhs: UInt8, rhs: UInt8) -> UInt8 {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 642)
  _precondition(rhs < UInt8._sizeInBits,
      "shift amount is larger than type size in bits")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 645)
  return UInt8(Builtin.lshr_Int8(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 648)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 654)
/// Returns the intersection of bits set in the two arguments.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func & (lhs: UInt8, rhs: UInt8) -> UInt8 {
  return UInt8(Builtin.and_Int8(lhs._value, rhs._value))
}

/// Calculates the intersection of bits set in the two arguments
/// and stores the result in the first argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func &=(lhs: inout UInt8, rhs: UInt8) {
  lhs = lhs & rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 654)
/// Returns the bits that are set in exactly one of the two arguments.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func ^ (lhs: UInt8, rhs: UInt8) -> UInt8 {
  return UInt8(Builtin.xor_Int8(lhs._value, rhs._value))
}

/// Calculates the bits that are set in exactly one of the two arguments
/// and stores the result in the first argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func ^=(lhs: inout UInt8, rhs: UInt8) {
  lhs = lhs ^ rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 654)
/// Returns the union of bits set in the two arguments.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func | (lhs: UInt8, rhs: UInt8) -> UInt8 {
  return UInt8(Builtin.or_Int8(lhs._value, rhs._value))
}

/// Calculates the union of bits set in the two arguments
/// and stores the result in the first argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func |=(lhs: inout UInt8, rhs: UInt8) {
  lhs = lhs | rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 671)

// Bitwise operations
extension UInt8 : BitwiseOperations {
  /// The empty bitset of type `UInt8`.
  @_transparent
  public static var allZeros: UInt8 { return 0 }
}

// Compound assignments
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func +=(lhs: inout UInt8, rhs: UInt8) {
  lhs = lhs + rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func -=(lhs: inout UInt8, rhs: UInt8) {
  lhs = lhs - rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func *=(lhs: inout UInt8, rhs: UInt8) {
  lhs = lhs * rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func <<=(lhs: inout UInt8, rhs: UInt8) {
  lhs = lhs << rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func >>=(lhs: inout UInt8, rhs: UInt8) {
  lhs = lhs >> rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 686)

// Create an ambiguity when indexing or slicing
// Range[OfStrideable]<UInt8> outside a generic context.  See
// Range.swift for details.
extension UInt8 {
  public typealias _DisabledRangeIndex = UInt8
}

// Prefix and postfix increment and decrement.

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public prefix func ++ (x: inout UInt8) -> UInt8 {
  x = x + 1
  return x
}

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public postfix func ++ (x: inout UInt8) -> UInt8 {
  let ret = x
  x = x + 1
  return ret
}

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public prefix func -- (x: inout UInt8) -> UInt8 {
  x = x - 1
  return x
}

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public postfix func -- (x: inout UInt8) -> UInt8 {
  let ret = x
  x = x - 1
  return ret
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 740)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 206)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 213)
/// An 8-bit signed integer value
/// type.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 216)
@_fixed_layout
public struct Int8
   : SignedInteger,
     Comparable, Equatable {
  public // @testable
  var _value: Builtin.Int8

  // FIXME: this declaration should be inferred.
  // <rdar://problem/18379938> Type checker refuses to use the default for
  // Int.Distance associated type

  /// Create an instance initialized to zero.
  @_transparent public
  init() {
    let maxWidthZero: IntMax = 0
    self._value = Builtin.truncOrBitCast_Int64_Int8(
       maxWidthZero._value)
  }

  @_transparent public
  init(_ _v: Builtin.Int8) {
    self._value = _v
  }

  @_transparent public
  init(_bits: Builtin.Int8) {
    self._value = _bits
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 266)


// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 291)

  @_transparent public
  init(_builtinIntegerLiteral value: Builtin.Int2048) {
    self = Int8(Builtin.s_to_s_checked_trunc_Int2048_Int8(value).0)
  }

  /// Create an instance initialized to `value`.
  @_transparent public
  init(integerLiteral value: Int8) {
    self = value
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 323)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 330)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 332)
  @_transparent public
  static var max: Int8 { return 0x7F }
  @_transparent public
  static var min: Int8 { return -0x7F-1 }
  @_transparent
  public static var _sizeInBits: Int8 { return 8 }
  public static var _sizeInBytes: Int8 { return 8/8 }
}

extension Int8 : Hashable {
  /// The hash value.
  ///
  /// **Axiom:** `x == y` implies `x.hashValue == y.hashValue`.
  ///
  /// - Note: The hash value is not guaranteed to be stable across
  ///   different invocations of the same program.  Do not persist the
  ///   hash value across program runs.
  public var hashValue: Int {
    @inline(__always)
    get {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 353)
      // Sign extend the value.
      return Int(self)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 366)
    }
  }
}

extension Int8 : CustomStringConvertible {
  /// A textual representation of `self`.
  public var description: String {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 374)
    return _int64ToString(self.toIntMax())
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 378)
  }
}

// Operations that return an overflow bit in addition to a partial result,
// helpful for checking for overflow when you want to handle it.
extension Int8 {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 385)
  /// Add `lhs` and `rhs`, returning a result and a
  /// `Bool` that is `true` iff the operation caused an arithmetic
  /// overflow.
  @_transparent public
  static func addWithOverflow(_ lhs: Int8, _ rhs: Int8) -> (Int8, overflow: Bool) {
    let tmp = Builtin.sadd_with_overflow_Int8(lhs._value, rhs._value, false._value)
    return (Int8(tmp.0), Bool(tmp.1))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 385)
  /// Subtract `lhs` and `rhs`, returning a result and a
  /// `Bool` that is `true` iff the operation caused an arithmetic
  /// overflow.
  @_transparent public
  static func subtractWithOverflow(_ lhs: Int8, _ rhs: Int8) -> (Int8, overflow: Bool) {
    let tmp = Builtin.ssub_with_overflow_Int8(lhs._value, rhs._value, false._value)
    return (Int8(tmp.0), Bool(tmp.1))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 385)
  /// Multiply `lhs` and `rhs`, returning a result and a
  /// `Bool` that is `true` iff the operation caused an arithmetic
  /// overflow.
  @_transparent public
  static func multiplyWithOverflow(_ lhs: Int8, _ rhs: Int8) -> (Int8, overflow: Bool) {
    let tmp = Builtin.smul_with_overflow_Int8(lhs._value, rhs._value, false._value)
    return (Int8(tmp.0), Bool(tmp.1))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 394)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 396)
  /// Divide `lhs` and `rhs`, returning
  /// a result and a `Bool`
  /// that is `true` iff the operation caused an arithmetic overflow.
  @_transparent public
  static func divideWithOverflow(_ lhs: Int8, _ rhs: Int8) -> (Int8, overflow: Bool) {
    if rhs == 0 {
      return (0, true)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 405)
    if lhs == Int8.min && rhs == -1 {
      return (0, true)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 409)
    // FIXME: currently doesn't detect overflow -- blocked by:
    // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
    let tmp = Builtin.sdiv_Int8(lhs._value, rhs._value)
    return (Int8(tmp), false)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 396)
  /// Divide `lhs` and `rhs`, returning
  /// the remainder and a `Bool`
  /// that is `true` iff the operation caused an arithmetic overflow.
  @_transparent public
  static func remainderWithOverflow(_ lhs: Int8, _ rhs: Int8) -> (Int8, overflow: Bool) {
    if rhs == 0 {
      return (0, true)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 405)
    if lhs == Int8.min && rhs == -1 {
      return (0, true)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 409)
    // FIXME: currently doesn't detect overflow -- blocked by:
    // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
    let tmp = Builtin.srem_Int8(lhs._value, rhs._value)
    return (Int8(tmp), false)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 415)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 417)
  /// Represent this number using Swift's widest native signed
  /// integer type.
  @_transparent public
  func toIntMax() -> IntMax {
    return IntMax(self)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 430)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 433)
extension Int8 : SignedNumber {}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 435)


// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 469)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int8 {

  @_transparent
  public init(_ value: UInt8) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.u_to_s_checked_conversion_Int8(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt8) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.u_to_s_checked_conversion_Int8(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int8 {

  @_transparent
  public init(_ value: Int8) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = (src, false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting Int8 to Int8 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int8) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = (src, false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int8 {

  @_transparent
  public init(_ value: UInt16) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.u_to_s_checked_trunc_Int16_Int8(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt16) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.u_to_s_checked_trunc_Int16_Int8(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `Int8` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: UInt16) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int16_Int8(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int8 {

  @_transparent
  public init(_ value: Int16) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.s_to_s_checked_trunc_Int16_Int8(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int16) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.s_to_s_checked_trunc_Int16_Int8(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `Int8` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: Int16) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int16_Int8(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int8 {

  @_transparent
  public init(_ value: UInt32) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.u_to_s_checked_trunc_Int32_Int8(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt32) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.u_to_s_checked_trunc_Int32_Int8(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `Int8` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: UInt32) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int32_Int8(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int8 {

  @_transparent
  public init(_ value: Int32) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.s_to_s_checked_trunc_Int32_Int8(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int32) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.s_to_s_checked_trunc_Int32_Int8(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `Int8` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: Int32) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int32_Int8(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int8 {

  @_transparent
  public init(_ value: UInt64) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.u_to_s_checked_trunc_Int64_Int8(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt64) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.u_to_s_checked_trunc_Int64_Int8(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `Int8` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: UInt64) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int64_Int8(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int8 {

  @_transparent
  public init(_ value: Int64) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.s_to_s_checked_trunc_Int64_Int8(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int64) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.s_to_s_checked_trunc_Int64_Int8(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `Int8` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: Int64) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int64_Int8(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int8 {

  @_transparent
  public init(_ value: UInt) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.u_to_s_checked_trunc_Int64_Int8(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.u_to_s_checked_trunc_Int64_Int8(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `Int8` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: UInt) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int64_Int8(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int8 {

  @_transparent
  public init(_ value: Int) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.s_to_s_checked_trunc_Int64_Int8(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int) {
    
  let src = value._value
  let result: (value: Builtin.Int8, error: Builtin.Int1)
  result = Builtin.s_to_s_checked_trunc_Int64_Int8(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `Int8` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: Int) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int64_Int8(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 524)

extension Int8 {
// Construction of integers from floating point numbers.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 531)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 535)

  /// Creates a new instance by rounding the given floating-point value toward
  /// zero.
  ///
  /// - Parameter other: A floating-point value. When `other` is rounded toward
  ///   zero, the result must be within the range `Int8.min...Int8.max`.
  @_transparent
  public init(_ value: Float) {
    _precondition(value.isFinite,
      "Float value cannot be converted to Int8 because it is either infinite or NaN")
    _precondition(value > -129.0,
      "Float value cannot be converted to Int8 because the result would be less than Int8.min")
    _precondition(value < 128.0,
      "Float value cannot be converted to Int8 because the result would be greater than Int8.max")
    self._value = Builtin.fptosi_FPIEEE32_Int8(value._value)
  }

  /// Creates a Int8 whose value is `value`
  /// if no rounding is necessary, nil otherwise.
  @inline(__always)
  public init?(exactly value: Float) {
    self._value = Builtin.fptosi_FPIEEE32_Int8(value._value)
    if Float(self) != value {
      return nil
    }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 531)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 535)

  /// Creates a new instance by rounding the given floating-point value toward
  /// zero.
  ///
  /// - Parameter other: A floating-point value. When `other` is rounded toward
  ///   zero, the result must be within the range `Int8.min...Int8.max`.
  @_transparent
  public init(_ value: Double) {
    _precondition(value.isFinite,
      "Double value cannot be converted to Int8 because it is either infinite or NaN")
    _precondition(value > -129.0,
      "Double value cannot be converted to Int8 because the result would be less than Int8.min")
    _precondition(value < 128.0,
      "Double value cannot be converted to Int8 because the result would be greater than Int8.max")
    self._value = Builtin.fptosi_FPIEEE64_Int8(value._value)
  }

  /// Creates a Int8 whose value is `value`
  /// if no rounding is necessary, nil otherwise.
  @inline(__always)
  public init?(exactly value: Double) {
    self._value = Builtin.fptosi_FPIEEE64_Int8(value._value)
    if Double(self) != value {
      return nil
    }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 531)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 533)
#if !os(Windows) && (arch(i386) || arch(x86_64))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 535)

  /// Creates a new instance by rounding the given floating-point value toward
  /// zero.
  ///
  /// - Parameter other: A floating-point value. When `other` is rounded toward
  ///   zero, the result must be within the range `Int8.min...Int8.max`.
  @_transparent
  public init(_ value: Float80) {
    _precondition(value.isFinite,
      "Float80 value cannot be converted to Int8 because it is either infinite or NaN")
    _precondition(value > -129.0,
      "Float80 value cannot be converted to Int8 because the result would be less than Int8.min")
    _precondition(value < 128.0,
      "Float80 value cannot be converted to Int8 because the result would be greater than Int8.max")
    self._value = Builtin.fptosi_FPIEEE80_Int8(value._value)
  }

  /// Creates a Int8 whose value is `value`
  /// if no rounding is necessary, nil otherwise.
  @inline(__always)
  public init?(exactly value: Float80) {
    self._value = Builtin.fptosi_FPIEEE80_Int8(value._value)
    if Float80(self) != value {
      return nil
    }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 562)
#endif
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 565)

  /// Construct a `Int8` having the same memory representation as
  /// the `UInt8` `bitPattern`.  No range or overflow checking
  /// occurs, and the resulting `Int8` may not have the same numeric
  /// value as `bitPattern`--it is only guaranteed to use the same
  /// pattern of bits.
  @_transparent
  public init(bitPattern: UInt8) {
    self._value = bitPattern._value
  }
}

// Operations with potentially-static overflow checking
//
// FIXME: must use condfail in these operators, rather than
// overflowChecked, pending <rdar://problem/16271923> so that we don't
// foil static checking for numeric overflows.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 583)
@_transparent
public func + (lhs: Int8, rhs: Int8) -> Int8 {
  let (result, error) = Builtin.sadd_with_overflow_Int8(
    lhs._value, rhs._value, true._value)
  // return overflowChecked((Int8(result), Bool(error)))
  Builtin.condfail(error)
  return Int8(result)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 583)
@_transparent
public func * (lhs: Int8, rhs: Int8) -> Int8 {
  let (result, error) = Builtin.smul_with_overflow_Int8(
    lhs._value, rhs._value, true._value)
  // return overflowChecked((Int8(result), Bool(error)))
  Builtin.condfail(error)
  return Int8(result)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 583)
@_transparent
public func - (lhs: Int8, rhs: Int8) -> Int8 {
  let (result, error) = Builtin.ssub_with_overflow_Int8(
    lhs._value, rhs._value, true._value)
  // return overflowChecked((Int8(result), Bool(error)))
  Builtin.condfail(error)
  return Int8(result)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 592)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 594)
@_transparent
public func /(lhs: Int8, rhs: Int8) -> Int8 {
  Builtin.condfail((rhs == 0)._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 598)
  Builtin.condfail(((lhs == Int8.min) && (rhs == -1))._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 600)
  // FIXME: currently doesn't detect overflow -- blocked by:
  // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
  let tmp = Builtin.sdiv_Int8(lhs._value, rhs._value)
  return Int8(tmp)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 594)
@_transparent
public func %(lhs: Int8, rhs: Int8) -> Int8 {
  Builtin.condfail((rhs == 0)._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 598)
  Builtin.condfail(((lhs == Int8.min) && (rhs == -1))._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 600)
  // FIXME: currently doesn't detect overflow -- blocked by:
  // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
  let tmp = Builtin.srem_Int8(lhs._value, rhs._value)
  return Int8(tmp)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 606)

// Bitwise negate
/// Returns the inverse of the bits set in the argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public prefix func ~ (rhs: Int8) -> Int8 {
  let mask = Int8.subtractWithOverflow(0, 1).0
  return Int8(Builtin.xor_Int8(rhs._value, mask._value))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the two arguments have equal values.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func == (lhs: Int8, rhs: Int8) -> Bool {
  return Bool(Builtin.cmp_eq_Int8(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the two arguments have unequal values.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func != (lhs: Int8, rhs: Int8) -> Bool {
  return Bool(Builtin.cmp_ne_Int8(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is less than the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func < (lhs: Int8, rhs: Int8) -> Bool {
  return Bool(Builtin.cmp_slt_Int8(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is less than or equal to the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func <= (lhs: Int8, rhs: Int8) -> Bool {
  return Bool(Builtin.cmp_sle_Int8(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is greater than the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func > (lhs: Int8, rhs: Int8) -> Bool {
  return Bool(Builtin.cmp_sgt_Int8(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is greater than or equal to the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func >= (lhs: Int8, rhs: Int8) -> Bool {
  return Bool(Builtin.cmp_sge_Int8(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 634)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 636)
@_transparent
public func << (lhs: Int8, rhs: Int8) -> Int8 {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 639)
  _precondition(UInt8(rhs) < UInt8._sizeInBits,
      "shift amount is larger than type size in bits")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 645)
  return Int8(Builtin.shl_Int8(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 636)
@_transparent
public func >> (lhs: Int8, rhs: Int8) -> Int8 {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 639)
  _precondition(UInt8(rhs) < UInt8._sizeInBits,
      "shift amount is larger than type size in bits")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 645)
  return Int8(Builtin.ashr_Int8(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 648)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 654)
/// Returns the intersection of bits set in the two arguments.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func & (lhs: Int8, rhs: Int8) -> Int8 {
  return Int8(Builtin.and_Int8(lhs._value, rhs._value))
}

/// Calculates the intersection of bits set in the two arguments
/// and stores the result in the first argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func &=(lhs: inout Int8, rhs: Int8) {
  lhs = lhs & rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 654)
/// Returns the bits that are set in exactly one of the two arguments.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func ^ (lhs: Int8, rhs: Int8) -> Int8 {
  return Int8(Builtin.xor_Int8(lhs._value, rhs._value))
}

/// Calculates the bits that are set in exactly one of the two arguments
/// and stores the result in the first argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func ^=(lhs: inout Int8, rhs: Int8) {
  lhs = lhs ^ rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 654)
/// Returns the union of bits set in the two arguments.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func | (lhs: Int8, rhs: Int8) -> Int8 {
  return Int8(Builtin.or_Int8(lhs._value, rhs._value))
}

/// Calculates the union of bits set in the two arguments
/// and stores the result in the first argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func |=(lhs: inout Int8, rhs: Int8) {
  lhs = lhs | rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 671)

// Bitwise operations
extension Int8 : BitwiseOperations {
  /// The empty bitset of type `Int8`.
  @_transparent
  public static var allZeros: Int8 { return 0 }
}

// Compound assignments
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func +=(lhs: inout Int8, rhs: Int8) {
  lhs = lhs + rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func -=(lhs: inout Int8, rhs: Int8) {
  lhs = lhs - rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func *=(lhs: inout Int8, rhs: Int8) {
  lhs = lhs * rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func <<=(lhs: inout Int8, rhs: Int8) {
  lhs = lhs << rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func >>=(lhs: inout Int8, rhs: Int8) {
  lhs = lhs >> rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 686)

// Create an ambiguity when indexing or slicing
// Range[OfStrideable]<Int8> outside a generic context.  See
// Range.swift for details.
extension Int8 {
  public typealias _DisabledRangeIndex = Int8
}

// Prefix and postfix increment and decrement.

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public prefix func ++ (x: inout Int8) -> Int8 {
  x = x + 1
  return x
}

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public postfix func ++ (x: inout Int8) -> Int8 {
  let ret = x
  x = x + 1
  return ret
}

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public prefix func -- (x: inout Int8) -> Int8 {
  x = x - 1
  return x
}

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public postfix func -- (x: inout Int8) -> Int8 {
  let ret = x
  x = x - 1
  return ret
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 731)
// TODO: Consider removing the underscore.
/// Returns the argument and specifies that the value is not negative.
/// It has only an effect if the argument is a load or call.
@_transparent
public func _assumeNonNegative(_ x: Int8) -> Int8 {
  _sanityCheck(x >= 0)
  return Int8(Builtin.assumeNonNegative_Int8(x._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 740)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 206)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 213)
/// A 16-bit unsigned integer value
/// type.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 216)
@_fixed_layout
public struct UInt16
   : UnsignedInteger,
     Comparable, Equatable {
  public // @testable
  var _value: Builtin.Int16

  // FIXME: this declaration should be inferred.
  // <rdar://problem/18379938> Type checker refuses to use the default for
  // Int.Distance associated type

  /// Create an instance initialized to zero.
  @_transparent public
  init() {
    let maxWidthZero: IntMax = 0
    self._value = Builtin.truncOrBitCast_Int64_Int16(
       maxWidthZero._value)
  }

  @_transparent public
  init(_ _v: Builtin.Int16) {
    self._value = _v
  }

  @_transparent public
  init(_bits: Builtin.Int16) {
    self._value = _bits
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 266)


// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 269)
  /// Creates an integer from its big-endian representation, changing the
  /// byte order if necessary.
  @_transparent public
  init(bigEndian value: UInt16) {
#if _endian(big)
    self = value
#else
    self = UInt16(Builtin.int_bswap_Int16(value._value))
#endif
  }

  /// Creates an integer from its little-endian representation, changing the
  /// byte order if necessary.
  @_transparent public
  init(littleEndian value: UInt16) {
#if _endian(little)
    self = value
#else
    self = UInt16(Builtin.int_bswap_Int16(value._value))
#endif
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 291)

  @_transparent public
  init(_builtinIntegerLiteral value: Builtin.Int2048) {
    self = UInt16(Builtin.s_to_u_checked_trunc_Int2048_Int16(value).0)
  }

  /// Create an instance initialized to `value`.
  @_transparent public
  init(integerLiteral value: UInt16) {
    self = value
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 304)
  /// Returns the big-endian representation of the integer, changing the
  /// byte order if necessary.
  public var bigEndian: UInt16 {
#if _endian(big)
    return self
#else
    return UInt16(Builtin.int_bswap_Int16(_value))
#endif
  }
  /// Returns the little-endian representation of the integer, changing the
  /// byte order if necessary.
  public var littleEndian: UInt16 {
#if _endian(little)
    return self
#else
    return UInt16(Builtin.int_bswap_Int16(_value))
#endif
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 323)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 325)
  /// Returns the current integer with the byte order swapped.
  public var byteSwapped: UInt16 {
    return UInt16(Builtin.int_bswap_Int16(_value))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 330)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 332)
  @_transparent public
  static var max: UInt16 { return 0xFFFF }
  @_transparent public
  static var min: UInt16 { return 0 }
  @_transparent
  public static var _sizeInBits: UInt16 { return 16 }
  public static var _sizeInBytes: UInt16 { return 16/8 }
}

extension UInt16 : Hashable {
  /// The hash value.
  ///
  /// **Axiom:** `x == y` implies `x.hashValue == y.hashValue`.
  ///
  /// - Note: The hash value is not guaranteed to be stable across
  ///   different invocations of the same program.  Do not persist the
  ///   hash value across program runs.
  public var hashValue: Int {
    @inline(__always)
    get {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 356)
      // Sign extend the value.
      return Int(Int16(bitPattern: self))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 366)
    }
  }
}

extension UInt16 : CustomStringConvertible {
  /// A textual representation of `self`.
  public var description: String {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 376)
    return _uint64ToString(self.toUIntMax())
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 378)
  }
}

// Operations that return an overflow bit in addition to a partial result,
// helpful for checking for overflow when you want to handle it.
extension UInt16 {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 385)
  /// Add `lhs` and `rhs`, returning a result and a
  /// `Bool` that is `true` iff the operation caused an arithmetic
  /// overflow.
  @_transparent public
  static func addWithOverflow(_ lhs: UInt16, _ rhs: UInt16) -> (UInt16, overflow: Bool) {
    let tmp = Builtin.uadd_with_overflow_Int16(lhs._value, rhs._value, false._value)
    return (UInt16(tmp.0), Bool(tmp.1))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 385)
  /// Subtract `lhs` and `rhs`, returning a result and a
  /// `Bool` that is `true` iff the operation caused an arithmetic
  /// overflow.
  @_transparent public
  static func subtractWithOverflow(_ lhs: UInt16, _ rhs: UInt16) -> (UInt16, overflow: Bool) {
    let tmp = Builtin.usub_with_overflow_Int16(lhs._value, rhs._value, false._value)
    return (UInt16(tmp.0), Bool(tmp.1))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 385)
  /// Multiply `lhs` and `rhs`, returning a result and a
  /// `Bool` that is `true` iff the operation caused an arithmetic
  /// overflow.
  @_transparent public
  static func multiplyWithOverflow(_ lhs: UInt16, _ rhs: UInt16) -> (UInt16, overflow: Bool) {
    let tmp = Builtin.umul_with_overflow_Int16(lhs._value, rhs._value, false._value)
    return (UInt16(tmp.0), Bool(tmp.1))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 394)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 396)
  /// Divide `lhs` and `rhs`, returning
  /// a result and a `Bool`
  /// that is `true` iff the operation caused an arithmetic overflow.
  @_transparent public
  static func divideWithOverflow(_ lhs: UInt16, _ rhs: UInt16) -> (UInt16, overflow: Bool) {
    if rhs == 0 {
      return (0, true)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 409)
    // FIXME: currently doesn't detect overflow -- blocked by:
    // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
    let tmp = Builtin.udiv_Int16(lhs._value, rhs._value)
    return (UInt16(tmp), false)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 396)
  /// Divide `lhs` and `rhs`, returning
  /// the remainder and a `Bool`
  /// that is `true` iff the operation caused an arithmetic overflow.
  @_transparent public
  static func remainderWithOverflow(_ lhs: UInt16, _ rhs: UInt16) -> (UInt16, overflow: Bool) {
    if rhs == 0 {
      return (0, true)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 409)
    // FIXME: currently doesn't detect overflow -- blocked by:
    // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
    let tmp = Builtin.urem_Int16(lhs._value, rhs._value)
    return (UInt16(tmp), false)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 415)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 417)
  /// Represent this number using Swift's widest native unsigned
  /// integer type.
  @_transparent public
  func toUIntMax() -> UIntMax {
    return UIntMax(self)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 424)
  /// Explicitly convert to `IntMax`.
  @_transparent public
  func toIntMax() -> IntMax {
    return IntMax(toUIntMax())
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 430)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 435)


// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 469)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt16 {

  @_transparent
  public init(_ value: UInt8) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = (Builtin.zext_Int8_Int16(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting UInt8 to UInt16 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt8) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = (Builtin.zext_Int8_Int16(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt16 {

  @_transparent
  public init(_ value: Int8) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  let (tmp, signError) = Builtin.s_to_u_checked_conversion_Int8(src)
  result = (Builtin.sext_Int8_Int16(tmp), signError)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int8) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  let (tmp, signError) = Builtin.s_to_u_checked_conversion_Int8(src)
  result = (Builtin.sext_Int8_Int16(tmp), signError)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt16 {

  @_transparent
  public init(_ value: UInt16) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = (src, false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting UInt16 to UInt16 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt16) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = (src, false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt16 {

  @_transparent
  public init(_ value: Int16) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = Builtin.s_to_u_checked_conversion_Int16(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int16) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = Builtin.s_to_u_checked_conversion_Int16(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt16 {

  @_transparent
  public init(_ value: UInt32) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = Builtin.u_to_u_checked_trunc_Int32_Int16(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt32) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = Builtin.u_to_u_checked_trunc_Int32_Int16(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `UInt16` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: UInt32) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int32_Int16(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt16 {

  @_transparent
  public init(_ value: Int32) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = Builtin.s_to_u_checked_trunc_Int32_Int16(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int32) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = Builtin.s_to_u_checked_trunc_Int32_Int16(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `UInt16` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: Int32) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int32_Int16(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt16 {

  @_transparent
  public init(_ value: UInt64) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = Builtin.u_to_u_checked_trunc_Int64_Int16(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt64) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = Builtin.u_to_u_checked_trunc_Int64_Int16(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `UInt16` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: UInt64) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int64_Int16(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt16 {

  @_transparent
  public init(_ value: Int64) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = Builtin.s_to_u_checked_trunc_Int64_Int16(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int64) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = Builtin.s_to_u_checked_trunc_Int64_Int16(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `UInt16` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: Int64) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int64_Int16(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt16 {

  @_transparent
  public init(_ value: UInt) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = Builtin.u_to_u_checked_trunc_Int64_Int16(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = Builtin.u_to_u_checked_trunc_Int64_Int16(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `UInt16` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: UInt) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int64_Int16(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt16 {

  @_transparent
  public init(_ value: Int) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = Builtin.s_to_u_checked_trunc_Int64_Int16(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = Builtin.s_to_u_checked_trunc_Int64_Int16(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `UInt16` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: Int) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int64_Int16(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 524)

extension UInt16 {
// Construction of integers from floating point numbers.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 531)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 535)

  /// Creates a new instance by rounding the given floating-point value toward
  /// zero.
  ///
  /// - Parameter other: A floating-point value. When `other` is rounded toward
  ///   zero, the result must be within the range `UInt16.min...UInt16.max`.
  @_transparent
  public init(_ value: Float) {
    _precondition(value.isFinite,
      "Float value cannot be converted to UInt16 because it is either infinite or NaN")
    _precondition(value > -1.0,
      "Float value cannot be converted to UInt16 because the result would be less than UInt16.min")
    _precondition(value < 65536.0,
      "Float value cannot be converted to UInt16 because the result would be greater than UInt16.max")
    self._value = Builtin.fptoui_FPIEEE32_Int16(value._value)
  }

  /// Creates a UInt16 whose value is `value`
  /// if no rounding is necessary, nil otherwise.
  @inline(__always)
  public init?(exactly value: Float) {
    self._value = Builtin.fptoui_FPIEEE32_Int16(value._value)
    if Float(self) != value {
      return nil
    }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 531)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 535)

  /// Creates a new instance by rounding the given floating-point value toward
  /// zero.
  ///
  /// - Parameter other: A floating-point value. When `other` is rounded toward
  ///   zero, the result must be within the range `UInt16.min...UInt16.max`.
  @_transparent
  public init(_ value: Double) {
    _precondition(value.isFinite,
      "Double value cannot be converted to UInt16 because it is either infinite or NaN")
    _precondition(value > -1.0,
      "Double value cannot be converted to UInt16 because the result would be less than UInt16.min")
    _precondition(value < 65536.0,
      "Double value cannot be converted to UInt16 because the result would be greater than UInt16.max")
    self._value = Builtin.fptoui_FPIEEE64_Int16(value._value)
  }

  /// Creates a UInt16 whose value is `value`
  /// if no rounding is necessary, nil otherwise.
  @inline(__always)
  public init?(exactly value: Double) {
    self._value = Builtin.fptoui_FPIEEE64_Int16(value._value)
    if Double(self) != value {
      return nil
    }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 531)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 533)
#if !os(Windows) && (arch(i386) || arch(x86_64))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 535)

  /// Creates a new instance by rounding the given floating-point value toward
  /// zero.
  ///
  /// - Parameter other: A floating-point value. When `other` is rounded toward
  ///   zero, the result must be within the range `UInt16.min...UInt16.max`.
  @_transparent
  public init(_ value: Float80) {
    _precondition(value.isFinite,
      "Float80 value cannot be converted to UInt16 because it is either infinite or NaN")
    _precondition(value > -1.0,
      "Float80 value cannot be converted to UInt16 because the result would be less than UInt16.min")
    _precondition(value < 65536.0,
      "Float80 value cannot be converted to UInt16 because the result would be greater than UInt16.max")
    self._value = Builtin.fptoui_FPIEEE80_Int16(value._value)
  }

  /// Creates a UInt16 whose value is `value`
  /// if no rounding is necessary, nil otherwise.
  @inline(__always)
  public init?(exactly value: Float80) {
    self._value = Builtin.fptoui_FPIEEE80_Int16(value._value)
    if Float80(self) != value {
      return nil
    }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 562)
#endif
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 565)

  /// Construct a `UInt16` having the same memory representation as
  /// the `Int16` `bitPattern`.  No range or overflow checking
  /// occurs, and the resulting `UInt16` may not have the same numeric
  /// value as `bitPattern`--it is only guaranteed to use the same
  /// pattern of bits.
  @_transparent
  public init(bitPattern: Int16) {
    self._value = bitPattern._value
  }
}

// Operations with potentially-static overflow checking
//
// FIXME: must use condfail in these operators, rather than
// overflowChecked, pending <rdar://problem/16271923> so that we don't
// foil static checking for numeric overflows.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 583)
@_transparent
public func + (lhs: UInt16, rhs: UInt16) -> UInt16 {
  let (result, error) = Builtin.uadd_with_overflow_Int16(
    lhs._value, rhs._value, true._value)
  // return overflowChecked((UInt16(result), Bool(error)))
  Builtin.condfail(error)
  return UInt16(result)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 583)
@_transparent
public func * (lhs: UInt16, rhs: UInt16) -> UInt16 {
  let (result, error) = Builtin.umul_with_overflow_Int16(
    lhs._value, rhs._value, true._value)
  // return overflowChecked((UInt16(result), Bool(error)))
  Builtin.condfail(error)
  return UInt16(result)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 583)
@_transparent
public func - (lhs: UInt16, rhs: UInt16) -> UInt16 {
  let (result, error) = Builtin.usub_with_overflow_Int16(
    lhs._value, rhs._value, true._value)
  // return overflowChecked((UInt16(result), Bool(error)))
  Builtin.condfail(error)
  return UInt16(result)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 592)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 594)
@_transparent
public func /(lhs: UInt16, rhs: UInt16) -> UInt16 {
  Builtin.condfail((rhs == 0)._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 600)
  // FIXME: currently doesn't detect overflow -- blocked by:
  // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
  let tmp = Builtin.udiv_Int16(lhs._value, rhs._value)
  return UInt16(tmp)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 594)
@_transparent
public func %(lhs: UInt16, rhs: UInt16) -> UInt16 {
  Builtin.condfail((rhs == 0)._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 600)
  // FIXME: currently doesn't detect overflow -- blocked by:
  // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
  let tmp = Builtin.urem_Int16(lhs._value, rhs._value)
  return UInt16(tmp)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 606)

// Bitwise negate
/// Returns the inverse of the bits set in the argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public prefix func ~ (rhs: UInt16) -> UInt16 {
  let mask = UInt16.subtractWithOverflow(0, 1).0
  return UInt16(Builtin.xor_Int16(rhs._value, mask._value))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the two arguments have equal values.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func == (lhs: UInt16, rhs: UInt16) -> Bool {
  return Bool(Builtin.cmp_eq_Int16(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the two arguments have unequal values.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func != (lhs: UInt16, rhs: UInt16) -> Bool {
  return Bool(Builtin.cmp_ne_Int16(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is less than the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func < (lhs: UInt16, rhs: UInt16) -> Bool {
  return Bool(Builtin.cmp_ult_Int16(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is less than or equal to the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func <= (lhs: UInt16, rhs: UInt16) -> Bool {
  return Bool(Builtin.cmp_ule_Int16(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is greater than the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func > (lhs: UInt16, rhs: UInt16) -> Bool {
  return Bool(Builtin.cmp_ugt_Int16(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is greater than or equal to the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func >= (lhs: UInt16, rhs: UInt16) -> Bool {
  return Bool(Builtin.cmp_uge_Int16(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 634)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 636)
@_transparent
public func << (lhs: UInt16, rhs: UInt16) -> UInt16 {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 642)
  _precondition(rhs < UInt16._sizeInBits,
      "shift amount is larger than type size in bits")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 645)
  return UInt16(Builtin.shl_Int16(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 636)
@_transparent
public func >> (lhs: UInt16, rhs: UInt16) -> UInt16 {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 642)
  _precondition(rhs < UInt16._sizeInBits,
      "shift amount is larger than type size in bits")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 645)
  return UInt16(Builtin.lshr_Int16(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 648)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 654)
/// Returns the intersection of bits set in the two arguments.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func & (lhs: UInt16, rhs: UInt16) -> UInt16 {
  return UInt16(Builtin.and_Int16(lhs._value, rhs._value))
}

/// Calculates the intersection of bits set in the two arguments
/// and stores the result in the first argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func &=(lhs: inout UInt16, rhs: UInt16) {
  lhs = lhs & rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 654)
/// Returns the bits that are set in exactly one of the two arguments.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func ^ (lhs: UInt16, rhs: UInt16) -> UInt16 {
  return UInt16(Builtin.xor_Int16(lhs._value, rhs._value))
}

/// Calculates the bits that are set in exactly one of the two arguments
/// and stores the result in the first argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func ^=(lhs: inout UInt16, rhs: UInt16) {
  lhs = lhs ^ rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 654)
/// Returns the union of bits set in the two arguments.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func | (lhs: UInt16, rhs: UInt16) -> UInt16 {
  return UInt16(Builtin.or_Int16(lhs._value, rhs._value))
}

/// Calculates the union of bits set in the two arguments
/// and stores the result in the first argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func |=(lhs: inout UInt16, rhs: UInt16) {
  lhs = lhs | rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 671)

// Bitwise operations
extension UInt16 : BitwiseOperations {
  /// The empty bitset of type `UInt16`.
  @_transparent
  public static var allZeros: UInt16 { return 0 }
}

// Compound assignments
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func +=(lhs: inout UInt16, rhs: UInt16) {
  lhs = lhs + rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func -=(lhs: inout UInt16, rhs: UInt16) {
  lhs = lhs - rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func *=(lhs: inout UInt16, rhs: UInt16) {
  lhs = lhs * rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func <<=(lhs: inout UInt16, rhs: UInt16) {
  lhs = lhs << rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func >>=(lhs: inout UInt16, rhs: UInt16) {
  lhs = lhs >> rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 686)

// Create an ambiguity when indexing or slicing
// Range[OfStrideable]<UInt16> outside a generic context.  See
// Range.swift for details.
extension UInt16 {
  public typealias _DisabledRangeIndex = UInt16
}

// Prefix and postfix increment and decrement.

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public prefix func ++ (x: inout UInt16) -> UInt16 {
  x = x + 1
  return x
}

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public postfix func ++ (x: inout UInt16) -> UInt16 {
  let ret = x
  x = x + 1
  return ret
}

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public prefix func -- (x: inout UInt16) -> UInt16 {
  x = x - 1
  return x
}

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public postfix func -- (x: inout UInt16) -> UInt16 {
  let ret = x
  x = x - 1
  return ret
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 740)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 206)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 213)
/// A 16-bit signed integer value
/// type.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 216)
@_fixed_layout
public struct Int16
   : SignedInteger,
     Comparable, Equatable {
  public // @testable
  var _value: Builtin.Int16

  // FIXME: this declaration should be inferred.
  // <rdar://problem/18379938> Type checker refuses to use the default for
  // Int.Distance associated type

  /// Create an instance initialized to zero.
  @_transparent public
  init() {
    let maxWidthZero: IntMax = 0
    self._value = Builtin.truncOrBitCast_Int64_Int16(
       maxWidthZero._value)
  }

  @_transparent public
  init(_ _v: Builtin.Int16) {
    self._value = _v
  }

  @_transparent public
  init(_bits: Builtin.Int16) {
    self._value = _bits
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 266)


// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 269)
  /// Creates an integer from its big-endian representation, changing the
  /// byte order if necessary.
  @_transparent public
  init(bigEndian value: Int16) {
#if _endian(big)
    self = value
#else
    self = Int16(Builtin.int_bswap_Int16(value._value))
#endif
  }

  /// Creates an integer from its little-endian representation, changing the
  /// byte order if necessary.
  @_transparent public
  init(littleEndian value: Int16) {
#if _endian(little)
    self = value
#else
    self = Int16(Builtin.int_bswap_Int16(value._value))
#endif
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 291)

  @_transparent public
  init(_builtinIntegerLiteral value: Builtin.Int2048) {
    self = Int16(Builtin.s_to_s_checked_trunc_Int2048_Int16(value).0)
  }

  /// Create an instance initialized to `value`.
  @_transparent public
  init(integerLiteral value: Int16) {
    self = value
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 304)
  /// Returns the big-endian representation of the integer, changing the
  /// byte order if necessary.
  public var bigEndian: Int16 {
#if _endian(big)
    return self
#else
    return Int16(Builtin.int_bswap_Int16(_value))
#endif
  }
  /// Returns the little-endian representation of the integer, changing the
  /// byte order if necessary.
  public var littleEndian: Int16 {
#if _endian(little)
    return self
#else
    return Int16(Builtin.int_bswap_Int16(_value))
#endif
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 323)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 325)
  /// Returns the current integer with the byte order swapped.
  public var byteSwapped: Int16 {
    return Int16(Builtin.int_bswap_Int16(_value))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 330)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 332)
  @_transparent public
  static var max: Int16 { return 0x7FFF }
  @_transparent public
  static var min: Int16 { return -0x7FFF-1 }
  @_transparent
  public static var _sizeInBits: Int16 { return 16 }
  public static var _sizeInBytes: Int16 { return 16/8 }
}

extension Int16 : Hashable {
  /// The hash value.
  ///
  /// **Axiom:** `x == y` implies `x.hashValue == y.hashValue`.
  ///
  /// - Note: The hash value is not guaranteed to be stable across
  ///   different invocations of the same program.  Do not persist the
  ///   hash value across program runs.
  public var hashValue: Int {
    @inline(__always)
    get {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 353)
      // Sign extend the value.
      return Int(self)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 366)
    }
  }
}

extension Int16 : CustomStringConvertible {
  /// A textual representation of `self`.
  public var description: String {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 374)
    return _int64ToString(self.toIntMax())
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 378)
  }
}

// Operations that return an overflow bit in addition to a partial result,
// helpful for checking for overflow when you want to handle it.
extension Int16 {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 385)
  /// Add `lhs` and `rhs`, returning a result and a
  /// `Bool` that is `true` iff the operation caused an arithmetic
  /// overflow.
  @_transparent public
  static func addWithOverflow(_ lhs: Int16, _ rhs: Int16) -> (Int16, overflow: Bool) {
    let tmp = Builtin.sadd_with_overflow_Int16(lhs._value, rhs._value, false._value)
    return (Int16(tmp.0), Bool(tmp.1))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 385)
  /// Subtract `lhs` and `rhs`, returning a result and a
  /// `Bool` that is `true` iff the operation caused an arithmetic
  /// overflow.
  @_transparent public
  static func subtractWithOverflow(_ lhs: Int16, _ rhs: Int16) -> (Int16, overflow: Bool) {
    let tmp = Builtin.ssub_with_overflow_Int16(lhs._value, rhs._value, false._value)
    return (Int16(tmp.0), Bool(tmp.1))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 385)
  /// Multiply `lhs` and `rhs`, returning a result and a
  /// `Bool` that is `true` iff the operation caused an arithmetic
  /// overflow.
  @_transparent public
  static func multiplyWithOverflow(_ lhs: Int16, _ rhs: Int16) -> (Int16, overflow: Bool) {
    let tmp = Builtin.smul_with_overflow_Int16(lhs._value, rhs._value, false._value)
    return (Int16(tmp.0), Bool(tmp.1))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 394)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 396)
  /// Divide `lhs` and `rhs`, returning
  /// a result and a `Bool`
  /// that is `true` iff the operation caused an arithmetic overflow.
  @_transparent public
  static func divideWithOverflow(_ lhs: Int16, _ rhs: Int16) -> (Int16, overflow: Bool) {
    if rhs == 0 {
      return (0, true)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 405)
    if lhs == Int16.min && rhs == -1 {
      return (0, true)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 409)
    // FIXME: currently doesn't detect overflow -- blocked by:
    // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
    let tmp = Builtin.sdiv_Int16(lhs._value, rhs._value)
    return (Int16(tmp), false)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 396)
  /// Divide `lhs` and `rhs`, returning
  /// the remainder and a `Bool`
  /// that is `true` iff the operation caused an arithmetic overflow.
  @_transparent public
  static func remainderWithOverflow(_ lhs: Int16, _ rhs: Int16) -> (Int16, overflow: Bool) {
    if rhs == 0 {
      return (0, true)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 405)
    if lhs == Int16.min && rhs == -1 {
      return (0, true)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 409)
    // FIXME: currently doesn't detect overflow -- blocked by:
    // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
    let tmp = Builtin.srem_Int16(lhs._value, rhs._value)
    return (Int16(tmp), false)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 415)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 417)
  /// Represent this number using Swift's widest native signed
  /// integer type.
  @_transparent public
  func toIntMax() -> IntMax {
    return IntMax(self)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 430)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 433)
extension Int16 : SignedNumber {}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 435)


// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 469)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int16 {

  @_transparent
  public init(_ value: UInt8) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = (Builtin.zext_Int8_Int16(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting UInt8 to Int16 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt8) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = (Builtin.zext_Int8_Int16(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int16 {

  @_transparent
  public init(_ value: Int8) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = (Builtin.sext_Int8_Int16(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting Int8 to Int16 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int8) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = (Builtin.sext_Int8_Int16(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int16 {

  @_transparent
  public init(_ value: UInt16) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = Builtin.u_to_s_checked_conversion_Int16(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt16) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = Builtin.u_to_s_checked_conversion_Int16(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int16 {

  @_transparent
  public init(_ value: Int16) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = (src, false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting Int16 to Int16 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int16) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = (src, false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int16 {

  @_transparent
  public init(_ value: UInt32) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = Builtin.u_to_s_checked_trunc_Int32_Int16(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt32) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = Builtin.u_to_s_checked_trunc_Int32_Int16(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `Int16` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: UInt32) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int32_Int16(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int16 {

  @_transparent
  public init(_ value: Int32) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = Builtin.s_to_s_checked_trunc_Int32_Int16(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int32) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = Builtin.s_to_s_checked_trunc_Int32_Int16(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `Int16` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: Int32) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int32_Int16(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int16 {

  @_transparent
  public init(_ value: UInt64) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = Builtin.u_to_s_checked_trunc_Int64_Int16(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt64) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = Builtin.u_to_s_checked_trunc_Int64_Int16(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `Int16` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: UInt64) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int64_Int16(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int16 {

  @_transparent
  public init(_ value: Int64) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = Builtin.s_to_s_checked_trunc_Int64_Int16(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int64) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = Builtin.s_to_s_checked_trunc_Int64_Int16(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `Int16` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: Int64) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int64_Int16(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int16 {

  @_transparent
  public init(_ value: UInt) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = Builtin.u_to_s_checked_trunc_Int64_Int16(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = Builtin.u_to_s_checked_trunc_Int64_Int16(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `Int16` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: UInt) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int64_Int16(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int16 {

  @_transparent
  public init(_ value: Int) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = Builtin.s_to_s_checked_trunc_Int64_Int16(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int) {
    
  let src = value._value
  let result: (value: Builtin.Int16, error: Builtin.Int1)
  result = Builtin.s_to_s_checked_trunc_Int64_Int16(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `Int16` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: Int) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int64_Int16(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 524)

extension Int16 {
// Construction of integers from floating point numbers.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 531)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 535)

  /// Creates a new instance by rounding the given floating-point value toward
  /// zero.
  ///
  /// - Parameter other: A floating-point value. When `other` is rounded toward
  ///   zero, the result must be within the range `Int16.min...Int16.max`.
  @_transparent
  public init(_ value: Float) {
    _precondition(value.isFinite,
      "Float value cannot be converted to Int16 because it is either infinite or NaN")
    _precondition(value > -32769.0,
      "Float value cannot be converted to Int16 because the result would be less than Int16.min")
    _precondition(value < 32768.0,
      "Float value cannot be converted to Int16 because the result would be greater than Int16.max")
    self._value = Builtin.fptosi_FPIEEE32_Int16(value._value)
  }

  /// Creates a Int16 whose value is `value`
  /// if no rounding is necessary, nil otherwise.
  @inline(__always)
  public init?(exactly value: Float) {
    self._value = Builtin.fptosi_FPIEEE32_Int16(value._value)
    if Float(self) != value {
      return nil
    }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 531)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 535)

  /// Creates a new instance by rounding the given floating-point value toward
  /// zero.
  ///
  /// - Parameter other: A floating-point value. When `other` is rounded toward
  ///   zero, the result must be within the range `Int16.min...Int16.max`.
  @_transparent
  public init(_ value: Double) {
    _precondition(value.isFinite,
      "Double value cannot be converted to Int16 because it is either infinite or NaN")
    _precondition(value > -32769.0,
      "Double value cannot be converted to Int16 because the result would be less than Int16.min")
    _precondition(value < 32768.0,
      "Double value cannot be converted to Int16 because the result would be greater than Int16.max")
    self._value = Builtin.fptosi_FPIEEE64_Int16(value._value)
  }

  /// Creates a Int16 whose value is `value`
  /// if no rounding is necessary, nil otherwise.
  @inline(__always)
  public init?(exactly value: Double) {
    self._value = Builtin.fptosi_FPIEEE64_Int16(value._value)
    if Double(self) != value {
      return nil
    }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 531)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 533)
#if !os(Windows) && (arch(i386) || arch(x86_64))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 535)

  /// Creates a new instance by rounding the given floating-point value toward
  /// zero.
  ///
  /// - Parameter other: A floating-point value. When `other` is rounded toward
  ///   zero, the result must be within the range `Int16.min...Int16.max`.
  @_transparent
  public init(_ value: Float80) {
    _precondition(value.isFinite,
      "Float80 value cannot be converted to Int16 because it is either infinite or NaN")
    _precondition(value > -32769.0,
      "Float80 value cannot be converted to Int16 because the result would be less than Int16.min")
    _precondition(value < 32768.0,
      "Float80 value cannot be converted to Int16 because the result would be greater than Int16.max")
    self._value = Builtin.fptosi_FPIEEE80_Int16(value._value)
  }

  /// Creates a Int16 whose value is `value`
  /// if no rounding is necessary, nil otherwise.
  @inline(__always)
  public init?(exactly value: Float80) {
    self._value = Builtin.fptosi_FPIEEE80_Int16(value._value)
    if Float80(self) != value {
      return nil
    }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 562)
#endif
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 565)

  /// Construct a `Int16` having the same memory representation as
  /// the `UInt16` `bitPattern`.  No range or overflow checking
  /// occurs, and the resulting `Int16` may not have the same numeric
  /// value as `bitPattern`--it is only guaranteed to use the same
  /// pattern of bits.
  @_transparent
  public init(bitPattern: UInt16) {
    self._value = bitPattern._value
  }
}

// Operations with potentially-static overflow checking
//
// FIXME: must use condfail in these operators, rather than
// overflowChecked, pending <rdar://problem/16271923> so that we don't
// foil static checking for numeric overflows.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 583)
@_transparent
public func + (lhs: Int16, rhs: Int16) -> Int16 {
  let (result, error) = Builtin.sadd_with_overflow_Int16(
    lhs._value, rhs._value, true._value)
  // return overflowChecked((Int16(result), Bool(error)))
  Builtin.condfail(error)
  return Int16(result)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 583)
@_transparent
public func * (lhs: Int16, rhs: Int16) -> Int16 {
  let (result, error) = Builtin.smul_with_overflow_Int16(
    lhs._value, rhs._value, true._value)
  // return overflowChecked((Int16(result), Bool(error)))
  Builtin.condfail(error)
  return Int16(result)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 583)
@_transparent
public func - (lhs: Int16, rhs: Int16) -> Int16 {
  let (result, error) = Builtin.ssub_with_overflow_Int16(
    lhs._value, rhs._value, true._value)
  // return overflowChecked((Int16(result), Bool(error)))
  Builtin.condfail(error)
  return Int16(result)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 592)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 594)
@_transparent
public func /(lhs: Int16, rhs: Int16) -> Int16 {
  Builtin.condfail((rhs == 0)._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 598)
  Builtin.condfail(((lhs == Int16.min) && (rhs == -1))._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 600)
  // FIXME: currently doesn't detect overflow -- blocked by:
  // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
  let tmp = Builtin.sdiv_Int16(lhs._value, rhs._value)
  return Int16(tmp)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 594)
@_transparent
public func %(lhs: Int16, rhs: Int16) -> Int16 {
  Builtin.condfail((rhs == 0)._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 598)
  Builtin.condfail(((lhs == Int16.min) && (rhs == -1))._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 600)
  // FIXME: currently doesn't detect overflow -- blocked by:
  // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
  let tmp = Builtin.srem_Int16(lhs._value, rhs._value)
  return Int16(tmp)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 606)

// Bitwise negate
/// Returns the inverse of the bits set in the argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public prefix func ~ (rhs: Int16) -> Int16 {
  let mask = Int16.subtractWithOverflow(0, 1).0
  return Int16(Builtin.xor_Int16(rhs._value, mask._value))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the two arguments have equal values.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func == (lhs: Int16, rhs: Int16) -> Bool {
  return Bool(Builtin.cmp_eq_Int16(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the two arguments have unequal values.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func != (lhs: Int16, rhs: Int16) -> Bool {
  return Bool(Builtin.cmp_ne_Int16(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is less than the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func < (lhs: Int16, rhs: Int16) -> Bool {
  return Bool(Builtin.cmp_slt_Int16(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is less than or equal to the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func <= (lhs: Int16, rhs: Int16) -> Bool {
  return Bool(Builtin.cmp_sle_Int16(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is greater than the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func > (lhs: Int16, rhs: Int16) -> Bool {
  return Bool(Builtin.cmp_sgt_Int16(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is greater than or equal to the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func >= (lhs: Int16, rhs: Int16) -> Bool {
  return Bool(Builtin.cmp_sge_Int16(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 634)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 636)
@_transparent
public func << (lhs: Int16, rhs: Int16) -> Int16 {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 639)
  _precondition(UInt16(rhs) < UInt16._sizeInBits,
      "shift amount is larger than type size in bits")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 645)
  return Int16(Builtin.shl_Int16(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 636)
@_transparent
public func >> (lhs: Int16, rhs: Int16) -> Int16 {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 639)
  _precondition(UInt16(rhs) < UInt16._sizeInBits,
      "shift amount is larger than type size in bits")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 645)
  return Int16(Builtin.ashr_Int16(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 648)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 654)
/// Returns the intersection of bits set in the two arguments.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func & (lhs: Int16, rhs: Int16) -> Int16 {
  return Int16(Builtin.and_Int16(lhs._value, rhs._value))
}

/// Calculates the intersection of bits set in the two arguments
/// and stores the result in the first argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func &=(lhs: inout Int16, rhs: Int16) {
  lhs = lhs & rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 654)
/// Returns the bits that are set in exactly one of the two arguments.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func ^ (lhs: Int16, rhs: Int16) -> Int16 {
  return Int16(Builtin.xor_Int16(lhs._value, rhs._value))
}

/// Calculates the bits that are set in exactly one of the two arguments
/// and stores the result in the first argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func ^=(lhs: inout Int16, rhs: Int16) {
  lhs = lhs ^ rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 654)
/// Returns the union of bits set in the two arguments.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func | (lhs: Int16, rhs: Int16) -> Int16 {
  return Int16(Builtin.or_Int16(lhs._value, rhs._value))
}

/// Calculates the union of bits set in the two arguments
/// and stores the result in the first argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func |=(lhs: inout Int16, rhs: Int16) {
  lhs = lhs | rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 671)

// Bitwise operations
extension Int16 : BitwiseOperations {
  /// The empty bitset of type `Int16`.
  @_transparent
  public static var allZeros: Int16 { return 0 }
}

// Compound assignments
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func +=(lhs: inout Int16, rhs: Int16) {
  lhs = lhs + rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func -=(lhs: inout Int16, rhs: Int16) {
  lhs = lhs - rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func *=(lhs: inout Int16, rhs: Int16) {
  lhs = lhs * rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func <<=(lhs: inout Int16, rhs: Int16) {
  lhs = lhs << rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func >>=(lhs: inout Int16, rhs: Int16) {
  lhs = lhs >> rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 686)

// Create an ambiguity when indexing or slicing
// Range[OfStrideable]<Int16> outside a generic context.  See
// Range.swift for details.
extension Int16 {
  public typealias _DisabledRangeIndex = Int16
}

// Prefix and postfix increment and decrement.

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public prefix func ++ (x: inout Int16) -> Int16 {
  x = x + 1
  return x
}

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public postfix func ++ (x: inout Int16) -> Int16 {
  let ret = x
  x = x + 1
  return ret
}

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public prefix func -- (x: inout Int16) -> Int16 {
  x = x - 1
  return x
}

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public postfix func -- (x: inout Int16) -> Int16 {
  let ret = x
  x = x - 1
  return ret
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 731)
// TODO: Consider removing the underscore.
/// Returns the argument and specifies that the value is not negative.
/// It has only an effect if the argument is a load or call.
@_transparent
public func _assumeNonNegative(_ x: Int16) -> Int16 {
  _sanityCheck(x >= 0)
  return Int16(Builtin.assumeNonNegative_Int16(x._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 740)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 206)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 213)
/// A 32-bit unsigned integer value
/// type.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 216)
@_fixed_layout
public struct UInt32
   : UnsignedInteger,
     Comparable, Equatable {
  public // @testable
  var _value: Builtin.Int32

  // FIXME: this declaration should be inferred.
  // <rdar://problem/18379938> Type checker refuses to use the default for
  // Int.Distance associated type

  /// Create an instance initialized to zero.
  @_transparent public
  init() {
    let maxWidthZero: IntMax = 0
    self._value = Builtin.truncOrBitCast_Int64_Int32(
       maxWidthZero._value)
  }

  @_transparent public
  init(_ _v: Builtin.Int32) {
    self._value = _v
  }

  @_transparent public
  init(_bits: Builtin.Int32) {
    self._value = _bits
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 266)


// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 269)
  /// Creates an integer from its big-endian representation, changing the
  /// byte order if necessary.
  @_transparent public
  init(bigEndian value: UInt32) {
#if _endian(big)
    self = value
#else
    self = UInt32(Builtin.int_bswap_Int32(value._value))
#endif
  }

  /// Creates an integer from its little-endian representation, changing the
  /// byte order if necessary.
  @_transparent public
  init(littleEndian value: UInt32) {
#if _endian(little)
    self = value
#else
    self = UInt32(Builtin.int_bswap_Int32(value._value))
#endif
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 291)

  @_transparent public
  init(_builtinIntegerLiteral value: Builtin.Int2048) {
    self = UInt32(Builtin.s_to_u_checked_trunc_Int2048_Int32(value).0)
  }

  /// Create an instance initialized to `value`.
  @_transparent public
  init(integerLiteral value: UInt32) {
    self = value
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 304)
  /// Returns the big-endian representation of the integer, changing the
  /// byte order if necessary.
  public var bigEndian: UInt32 {
#if _endian(big)
    return self
#else
    return UInt32(Builtin.int_bswap_Int32(_value))
#endif
  }
  /// Returns the little-endian representation of the integer, changing the
  /// byte order if necessary.
  public var littleEndian: UInt32 {
#if _endian(little)
    return self
#else
    return UInt32(Builtin.int_bswap_Int32(_value))
#endif
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 323)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 325)
  /// Returns the current integer with the byte order swapped.
  public var byteSwapped: UInt32 {
    return UInt32(Builtin.int_bswap_Int32(_value))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 330)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 332)
  @_transparent public
  static var max: UInt32 { return 0xFFFF_FFFF }
  @_transparent public
  static var min: UInt32 { return 0 }
  @_transparent
  public static var _sizeInBits: UInt32 { return 32 }
  public static var _sizeInBytes: UInt32 { return 32/8 }
}

extension UInt32 : Hashable {
  /// The hash value.
  ///
  /// **Axiom:** `x == y` implies `x.hashValue == y.hashValue`.
  ///
  /// - Note: The hash value is not guaranteed to be stable across
  ///   different invocations of the same program.  Do not persist the
  ///   hash value across program runs.
  public var hashValue: Int {
    @inline(__always)
    get {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 356)
      // Sign extend the value.
      return Int(Int32(bitPattern: self))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 366)
    }
  }
}

extension UInt32 : CustomStringConvertible {
  /// A textual representation of `self`.
  public var description: String {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 376)
    return _uint64ToString(self.toUIntMax())
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 378)
  }
}

// Operations that return an overflow bit in addition to a partial result,
// helpful for checking for overflow when you want to handle it.
extension UInt32 {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 385)
  /// Add `lhs` and `rhs`, returning a result and a
  /// `Bool` that is `true` iff the operation caused an arithmetic
  /// overflow.
  @_transparent public
  static func addWithOverflow(_ lhs: UInt32, _ rhs: UInt32) -> (UInt32, overflow: Bool) {
    let tmp = Builtin.uadd_with_overflow_Int32(lhs._value, rhs._value, false._value)
    return (UInt32(tmp.0), Bool(tmp.1))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 385)
  /// Subtract `lhs` and `rhs`, returning a result and a
  /// `Bool` that is `true` iff the operation caused an arithmetic
  /// overflow.
  @_transparent public
  static func subtractWithOverflow(_ lhs: UInt32, _ rhs: UInt32) -> (UInt32, overflow: Bool) {
    let tmp = Builtin.usub_with_overflow_Int32(lhs._value, rhs._value, false._value)
    return (UInt32(tmp.0), Bool(tmp.1))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 385)
  /// Multiply `lhs` and `rhs`, returning a result and a
  /// `Bool` that is `true` iff the operation caused an arithmetic
  /// overflow.
  @_transparent public
  static func multiplyWithOverflow(_ lhs: UInt32, _ rhs: UInt32) -> (UInt32, overflow: Bool) {
    let tmp = Builtin.umul_with_overflow_Int32(lhs._value, rhs._value, false._value)
    return (UInt32(tmp.0), Bool(tmp.1))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 394)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 396)
  /// Divide `lhs` and `rhs`, returning
  /// a result and a `Bool`
  /// that is `true` iff the operation caused an arithmetic overflow.
  @_transparent public
  static func divideWithOverflow(_ lhs: UInt32, _ rhs: UInt32) -> (UInt32, overflow: Bool) {
    if rhs == 0 {
      return (0, true)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 409)
    // FIXME: currently doesn't detect overflow -- blocked by:
    // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
    let tmp = Builtin.udiv_Int32(lhs._value, rhs._value)
    return (UInt32(tmp), false)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 396)
  /// Divide `lhs` and `rhs`, returning
  /// the remainder and a `Bool`
  /// that is `true` iff the operation caused an arithmetic overflow.
  @_transparent public
  static func remainderWithOverflow(_ lhs: UInt32, _ rhs: UInt32) -> (UInt32, overflow: Bool) {
    if rhs == 0 {
      return (0, true)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 409)
    // FIXME: currently doesn't detect overflow -- blocked by:
    // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
    let tmp = Builtin.urem_Int32(lhs._value, rhs._value)
    return (UInt32(tmp), false)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 415)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 417)
  /// Represent this number using Swift's widest native unsigned
  /// integer type.
  @_transparent public
  func toUIntMax() -> UIntMax {
    return UIntMax(self)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 424)
  /// Explicitly convert to `IntMax`.
  @_transparent public
  func toIntMax() -> IntMax {
    return IntMax(toUIntMax())
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 430)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 435)


// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 469)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt32 {

  @_transparent
  public init(_ value: UInt8) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = (Builtin.zext_Int8_Int32(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting UInt8 to UInt32 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt8) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = (Builtin.zext_Int8_Int32(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt32 {

  @_transparent
  public init(_ value: Int8) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  let (tmp, signError) = Builtin.s_to_u_checked_conversion_Int8(src)
  result = (Builtin.sext_Int8_Int32(tmp), signError)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int8) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  let (tmp, signError) = Builtin.s_to_u_checked_conversion_Int8(src)
  result = (Builtin.sext_Int8_Int32(tmp), signError)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt32 {

  @_transparent
  public init(_ value: UInt16) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = (Builtin.zext_Int16_Int32(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting UInt16 to UInt32 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt16) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = (Builtin.zext_Int16_Int32(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt32 {

  @_transparent
  public init(_ value: Int16) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  let (tmp, signError) = Builtin.s_to_u_checked_conversion_Int16(src)
  result = (Builtin.sext_Int16_Int32(tmp), signError)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int16) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  let (tmp, signError) = Builtin.s_to_u_checked_conversion_Int16(src)
  result = (Builtin.sext_Int16_Int32(tmp), signError)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt32 {

  @_transparent
  public init(_ value: UInt32) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = (src, false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting UInt32 to UInt32 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt32) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = (src, false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt32 {

  @_transparent
  public init(_ value: Int32) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = Builtin.s_to_u_checked_conversion_Int32(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int32) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = Builtin.s_to_u_checked_conversion_Int32(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt32 {

  @_transparent
  public init(_ value: UInt64) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = Builtin.u_to_u_checked_trunc_Int64_Int32(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt64) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = Builtin.u_to_u_checked_trunc_Int64_Int32(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `UInt32` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: UInt64) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int64_Int32(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt32 {

  @_transparent
  public init(_ value: Int64) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = Builtin.s_to_u_checked_trunc_Int64_Int32(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int64) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = Builtin.s_to_u_checked_trunc_Int64_Int32(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `UInt32` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: Int64) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int64_Int32(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt32 {

  @_transparent
  public init(_ value: UInt) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = Builtin.u_to_u_checked_trunc_Int64_Int32(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = Builtin.u_to_u_checked_trunc_Int64_Int32(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `UInt32` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: UInt) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int64_Int32(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt32 {

  @_transparent
  public init(_ value: Int) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = Builtin.s_to_u_checked_trunc_Int64_Int32(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = Builtin.s_to_u_checked_trunc_Int64_Int32(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `UInt32` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: Int) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int64_Int32(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 524)

extension UInt32 {
// Construction of integers from floating point numbers.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 531)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 535)

  /// Creates a new instance by rounding the given floating-point value toward
  /// zero.
  ///
  /// - Parameter other: A floating-point value. When `other` is rounded toward
  ///   zero, the result must be within the range `UInt32.min...UInt32.max`.
  @_transparent
  public init(_ value: Float) {
    _precondition(value.isFinite,
      "Float value cannot be converted to UInt32 because it is either infinite or NaN")
    _precondition(value > -1.0,
      "Float value cannot be converted to UInt32 because the result would be less than UInt32.min")
    _precondition(value < 4294967296.0,
      "Float value cannot be converted to UInt32 because the result would be greater than UInt32.max")
    self._value = Builtin.fptoui_FPIEEE32_Int32(value._value)
  }

  /// Creates a UInt32 whose value is `value`
  /// if no rounding is necessary, nil otherwise.
  @inline(__always)
  public init?(exactly value: Float) {
    self._value = Builtin.fptoui_FPIEEE32_Int32(value._value)
    if Float(self) != value {
      return nil
    }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 531)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 535)

  /// Creates a new instance by rounding the given floating-point value toward
  /// zero.
  ///
  /// - Parameter other: A floating-point value. When `other` is rounded toward
  ///   zero, the result must be within the range `UInt32.min...UInt32.max`.
  @_transparent
  public init(_ value: Double) {
    _precondition(value.isFinite,
      "Double value cannot be converted to UInt32 because it is either infinite or NaN")
    _precondition(value > -1.0,
      "Double value cannot be converted to UInt32 because the result would be less than UInt32.min")
    _precondition(value < 4294967296.0,
      "Double value cannot be converted to UInt32 because the result would be greater than UInt32.max")
    self._value = Builtin.fptoui_FPIEEE64_Int32(value._value)
  }

  /// Creates a UInt32 whose value is `value`
  /// if no rounding is necessary, nil otherwise.
  @inline(__always)
  public init?(exactly value: Double) {
    self._value = Builtin.fptoui_FPIEEE64_Int32(value._value)
    if Double(self) != value {
      return nil
    }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 531)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 533)
#if !os(Windows) && (arch(i386) || arch(x86_64))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 535)

  /// Creates a new instance by rounding the given floating-point value toward
  /// zero.
  ///
  /// - Parameter other: A floating-point value. When `other` is rounded toward
  ///   zero, the result must be within the range `UInt32.min...UInt32.max`.
  @_transparent
  public init(_ value: Float80) {
    _precondition(value.isFinite,
      "Float80 value cannot be converted to UInt32 because it is either infinite or NaN")
    _precondition(value > -1.0,
      "Float80 value cannot be converted to UInt32 because the result would be less than UInt32.min")
    _precondition(value < 4294967296.0,
      "Float80 value cannot be converted to UInt32 because the result would be greater than UInt32.max")
    self._value = Builtin.fptoui_FPIEEE80_Int32(value._value)
  }

  /// Creates a UInt32 whose value is `value`
  /// if no rounding is necessary, nil otherwise.
  @inline(__always)
  public init?(exactly value: Float80) {
    self._value = Builtin.fptoui_FPIEEE80_Int32(value._value)
    if Float80(self) != value {
      return nil
    }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 562)
#endif
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 565)

  /// Construct a `UInt32` having the same memory representation as
  /// the `Int32` `bitPattern`.  No range or overflow checking
  /// occurs, and the resulting `UInt32` may not have the same numeric
  /// value as `bitPattern`--it is only guaranteed to use the same
  /// pattern of bits.
  @_transparent
  public init(bitPattern: Int32) {
    self._value = bitPattern._value
  }
}

// Operations with potentially-static overflow checking
//
// FIXME: must use condfail in these operators, rather than
// overflowChecked, pending <rdar://problem/16271923> so that we don't
// foil static checking for numeric overflows.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 583)
@_transparent
public func + (lhs: UInt32, rhs: UInt32) -> UInt32 {
  let (result, error) = Builtin.uadd_with_overflow_Int32(
    lhs._value, rhs._value, true._value)
  // return overflowChecked((UInt32(result), Bool(error)))
  Builtin.condfail(error)
  return UInt32(result)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 583)
@_transparent
public func * (lhs: UInt32, rhs: UInt32) -> UInt32 {
  let (result, error) = Builtin.umul_with_overflow_Int32(
    lhs._value, rhs._value, true._value)
  // return overflowChecked((UInt32(result), Bool(error)))
  Builtin.condfail(error)
  return UInt32(result)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 583)
@_transparent
public func - (lhs: UInt32, rhs: UInt32) -> UInt32 {
  let (result, error) = Builtin.usub_with_overflow_Int32(
    lhs._value, rhs._value, true._value)
  // return overflowChecked((UInt32(result), Bool(error)))
  Builtin.condfail(error)
  return UInt32(result)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 592)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 594)
@_transparent
public func /(lhs: UInt32, rhs: UInt32) -> UInt32 {
  Builtin.condfail((rhs == 0)._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 600)
  // FIXME: currently doesn't detect overflow -- blocked by:
  // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
  let tmp = Builtin.udiv_Int32(lhs._value, rhs._value)
  return UInt32(tmp)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 594)
@_transparent
public func %(lhs: UInt32, rhs: UInt32) -> UInt32 {
  Builtin.condfail((rhs == 0)._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 600)
  // FIXME: currently doesn't detect overflow -- blocked by:
  // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
  let tmp = Builtin.urem_Int32(lhs._value, rhs._value)
  return UInt32(tmp)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 606)

// Bitwise negate
/// Returns the inverse of the bits set in the argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public prefix func ~ (rhs: UInt32) -> UInt32 {
  let mask = UInt32.subtractWithOverflow(0, 1).0
  return UInt32(Builtin.xor_Int32(rhs._value, mask._value))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the two arguments have equal values.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func == (lhs: UInt32, rhs: UInt32) -> Bool {
  return Bool(Builtin.cmp_eq_Int32(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the two arguments have unequal values.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func != (lhs: UInt32, rhs: UInt32) -> Bool {
  return Bool(Builtin.cmp_ne_Int32(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is less than the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func < (lhs: UInt32, rhs: UInt32) -> Bool {
  return Bool(Builtin.cmp_ult_Int32(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is less than or equal to the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func <= (lhs: UInt32, rhs: UInt32) -> Bool {
  return Bool(Builtin.cmp_ule_Int32(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is greater than the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func > (lhs: UInt32, rhs: UInt32) -> Bool {
  return Bool(Builtin.cmp_ugt_Int32(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is greater than or equal to the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func >= (lhs: UInt32, rhs: UInt32) -> Bool {
  return Bool(Builtin.cmp_uge_Int32(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 634)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 636)
@_transparent
public func << (lhs: UInt32, rhs: UInt32) -> UInt32 {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 642)
  _precondition(rhs < UInt32._sizeInBits,
      "shift amount is larger than type size in bits")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 645)
  return UInt32(Builtin.shl_Int32(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 636)
@_transparent
public func >> (lhs: UInt32, rhs: UInt32) -> UInt32 {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 642)
  _precondition(rhs < UInt32._sizeInBits,
      "shift amount is larger than type size in bits")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 645)
  return UInt32(Builtin.lshr_Int32(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 648)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 654)
/// Returns the intersection of bits set in the two arguments.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func & (lhs: UInt32, rhs: UInt32) -> UInt32 {
  return UInt32(Builtin.and_Int32(lhs._value, rhs._value))
}

/// Calculates the intersection of bits set in the two arguments
/// and stores the result in the first argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func &=(lhs: inout UInt32, rhs: UInt32) {
  lhs = lhs & rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 654)
/// Returns the bits that are set in exactly one of the two arguments.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func ^ (lhs: UInt32, rhs: UInt32) -> UInt32 {
  return UInt32(Builtin.xor_Int32(lhs._value, rhs._value))
}

/// Calculates the bits that are set in exactly one of the two arguments
/// and stores the result in the first argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func ^=(lhs: inout UInt32, rhs: UInt32) {
  lhs = lhs ^ rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 654)
/// Returns the union of bits set in the two arguments.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func | (lhs: UInt32, rhs: UInt32) -> UInt32 {
  return UInt32(Builtin.or_Int32(lhs._value, rhs._value))
}

/// Calculates the union of bits set in the two arguments
/// and stores the result in the first argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func |=(lhs: inout UInt32, rhs: UInt32) {
  lhs = lhs | rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 671)

// Bitwise operations
extension UInt32 : BitwiseOperations {
  /// The empty bitset of type `UInt32`.
  @_transparent
  public static var allZeros: UInt32 { return 0 }
}

// Compound assignments
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func +=(lhs: inout UInt32, rhs: UInt32) {
  lhs = lhs + rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func -=(lhs: inout UInt32, rhs: UInt32) {
  lhs = lhs - rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func *=(lhs: inout UInt32, rhs: UInt32) {
  lhs = lhs * rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func <<=(lhs: inout UInt32, rhs: UInt32) {
  lhs = lhs << rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func >>=(lhs: inout UInt32, rhs: UInt32) {
  lhs = lhs >> rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 686)

// Create an ambiguity when indexing or slicing
// Range[OfStrideable]<UInt32> outside a generic context.  See
// Range.swift for details.
extension UInt32 {
  public typealias _DisabledRangeIndex = UInt32
}

// Prefix and postfix increment and decrement.

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public prefix func ++ (x: inout UInt32) -> UInt32 {
  x = x + 1
  return x
}

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public postfix func ++ (x: inout UInt32) -> UInt32 {
  let ret = x
  x = x + 1
  return ret
}

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public prefix func -- (x: inout UInt32) -> UInt32 {
  x = x - 1
  return x
}

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public postfix func -- (x: inout UInt32) -> UInt32 {
  let ret = x
  x = x - 1
  return ret
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 740)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 206)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 213)
/// A 32-bit signed integer value
/// type.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 216)
@_fixed_layout
public struct Int32
   : SignedInteger,
     Comparable, Equatable {
  public // @testable
  var _value: Builtin.Int32

  // FIXME: this declaration should be inferred.
  // <rdar://problem/18379938> Type checker refuses to use the default for
  // Int.Distance associated type

  /// Create an instance initialized to zero.
  @_transparent public
  init() {
    let maxWidthZero: IntMax = 0
    self._value = Builtin.truncOrBitCast_Int64_Int32(
       maxWidthZero._value)
  }

  @_transparent public
  init(_ _v: Builtin.Int32) {
    self._value = _v
  }

  @_transparent public
  init(_bits: Builtin.Int32) {
    self._value = _bits
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 266)


// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 269)
  /// Creates an integer from its big-endian representation, changing the
  /// byte order if necessary.
  @_transparent public
  init(bigEndian value: Int32) {
#if _endian(big)
    self = value
#else
    self = Int32(Builtin.int_bswap_Int32(value._value))
#endif
  }

  /// Creates an integer from its little-endian representation, changing the
  /// byte order if necessary.
  @_transparent public
  init(littleEndian value: Int32) {
#if _endian(little)
    self = value
#else
    self = Int32(Builtin.int_bswap_Int32(value._value))
#endif
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 291)

  @_transparent public
  init(_builtinIntegerLiteral value: Builtin.Int2048) {
    self = Int32(Builtin.s_to_s_checked_trunc_Int2048_Int32(value).0)
  }

  /// Create an instance initialized to `value`.
  @_transparent public
  init(integerLiteral value: Int32) {
    self = value
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 304)
  /// Returns the big-endian representation of the integer, changing the
  /// byte order if necessary.
  public var bigEndian: Int32 {
#if _endian(big)
    return self
#else
    return Int32(Builtin.int_bswap_Int32(_value))
#endif
  }
  /// Returns the little-endian representation of the integer, changing the
  /// byte order if necessary.
  public var littleEndian: Int32 {
#if _endian(little)
    return self
#else
    return Int32(Builtin.int_bswap_Int32(_value))
#endif
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 323)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 325)
  /// Returns the current integer with the byte order swapped.
  public var byteSwapped: Int32 {
    return Int32(Builtin.int_bswap_Int32(_value))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 330)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 332)
  @_transparent public
  static var max: Int32 { return 0x7FFF_FFFF }
  @_transparent public
  static var min: Int32 { return -0x7FFF_FFFF-1 }
  @_transparent
  public static var _sizeInBits: Int32 { return 32 }
  public static var _sizeInBytes: Int32 { return 32/8 }
}

extension Int32 : Hashable {
  /// The hash value.
  ///
  /// **Axiom:** `x == y` implies `x.hashValue == y.hashValue`.
  ///
  /// - Note: The hash value is not guaranteed to be stable across
  ///   different invocations of the same program.  Do not persist the
  ///   hash value across program runs.
  public var hashValue: Int {
    @inline(__always)
    get {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 353)
      // Sign extend the value.
      return Int(self)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 366)
    }
  }
}

extension Int32 : CustomStringConvertible {
  /// A textual representation of `self`.
  public var description: String {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 374)
    return _int64ToString(self.toIntMax())
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 378)
  }
}

// Operations that return an overflow bit in addition to a partial result,
// helpful for checking for overflow when you want to handle it.
extension Int32 {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 385)
  /// Add `lhs` and `rhs`, returning a result and a
  /// `Bool` that is `true` iff the operation caused an arithmetic
  /// overflow.
  @_transparent public
  static func addWithOverflow(_ lhs: Int32, _ rhs: Int32) -> (Int32, overflow: Bool) {
    let tmp = Builtin.sadd_with_overflow_Int32(lhs._value, rhs._value, false._value)
    return (Int32(tmp.0), Bool(tmp.1))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 385)
  /// Subtract `lhs` and `rhs`, returning a result and a
  /// `Bool` that is `true` iff the operation caused an arithmetic
  /// overflow.
  @_transparent public
  static func subtractWithOverflow(_ lhs: Int32, _ rhs: Int32) -> (Int32, overflow: Bool) {
    let tmp = Builtin.ssub_with_overflow_Int32(lhs._value, rhs._value, false._value)
    return (Int32(tmp.0), Bool(tmp.1))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 385)
  /// Multiply `lhs` and `rhs`, returning a result and a
  /// `Bool` that is `true` iff the operation caused an arithmetic
  /// overflow.
  @_transparent public
  static func multiplyWithOverflow(_ lhs: Int32, _ rhs: Int32) -> (Int32, overflow: Bool) {
    let tmp = Builtin.smul_with_overflow_Int32(lhs._value, rhs._value, false._value)
    return (Int32(tmp.0), Bool(tmp.1))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 394)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 396)
  /// Divide `lhs` and `rhs`, returning
  /// a result and a `Bool`
  /// that is `true` iff the operation caused an arithmetic overflow.
  @_transparent public
  static func divideWithOverflow(_ lhs: Int32, _ rhs: Int32) -> (Int32, overflow: Bool) {
    if rhs == 0 {
      return (0, true)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 405)
    if lhs == Int32.min && rhs == -1 {
      return (0, true)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 409)
    // FIXME: currently doesn't detect overflow -- blocked by:
    // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
    let tmp = Builtin.sdiv_Int32(lhs._value, rhs._value)
    return (Int32(tmp), false)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 396)
  /// Divide `lhs` and `rhs`, returning
  /// the remainder and a `Bool`
  /// that is `true` iff the operation caused an arithmetic overflow.
  @_transparent public
  static func remainderWithOverflow(_ lhs: Int32, _ rhs: Int32) -> (Int32, overflow: Bool) {
    if rhs == 0 {
      return (0, true)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 405)
    if lhs == Int32.min && rhs == -1 {
      return (0, true)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 409)
    // FIXME: currently doesn't detect overflow -- blocked by:
    // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
    let tmp = Builtin.srem_Int32(lhs._value, rhs._value)
    return (Int32(tmp), false)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 415)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 417)
  /// Represent this number using Swift's widest native signed
  /// integer type.
  @_transparent public
  func toIntMax() -> IntMax {
    return IntMax(self)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 430)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 433)
extension Int32 : SignedNumber {}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 435)


// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 469)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int32 {

  @_transparent
  public init(_ value: UInt8) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = (Builtin.zext_Int8_Int32(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting UInt8 to Int32 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt8) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = (Builtin.zext_Int8_Int32(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int32 {

  @_transparent
  public init(_ value: Int8) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = (Builtin.sext_Int8_Int32(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting Int8 to Int32 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int8) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = (Builtin.sext_Int8_Int32(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int32 {

  @_transparent
  public init(_ value: UInt16) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = (Builtin.zext_Int16_Int32(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting UInt16 to Int32 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt16) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = (Builtin.zext_Int16_Int32(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int32 {

  @_transparent
  public init(_ value: Int16) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = (Builtin.sext_Int16_Int32(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting Int16 to Int32 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int16) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = (Builtin.sext_Int16_Int32(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int32 {

  @_transparent
  public init(_ value: UInt32) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = Builtin.u_to_s_checked_conversion_Int32(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt32) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = Builtin.u_to_s_checked_conversion_Int32(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int32 {

  @_transparent
  public init(_ value: Int32) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = (src, false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting Int32 to Int32 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int32) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = (src, false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int32 {

  @_transparent
  public init(_ value: UInt64) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = Builtin.u_to_s_checked_trunc_Int64_Int32(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt64) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = Builtin.u_to_s_checked_trunc_Int64_Int32(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `Int32` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: UInt64) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int64_Int32(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int32 {

  @_transparent
  public init(_ value: Int64) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = Builtin.s_to_s_checked_trunc_Int64_Int32(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int64) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = Builtin.s_to_s_checked_trunc_Int64_Int32(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `Int32` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: Int64) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int64_Int32(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int32 {

  @_transparent
  public init(_ value: UInt) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = Builtin.u_to_s_checked_trunc_Int64_Int32(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = Builtin.u_to_s_checked_trunc_Int64_Int32(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `Int32` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: UInt) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int64_Int32(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int32 {

  @_transparent
  public init(_ value: Int) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = Builtin.s_to_s_checked_trunc_Int64_Int32(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int) {
    
  let src = value._value
  let result: (value: Builtin.Int32, error: Builtin.Int1)
  result = Builtin.s_to_s_checked_trunc_Int64_Int32(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `Int32` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: Int) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 515)
    let dstNotWord = Builtin.trunc_Int64_Int32(src)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 524)

extension Int32 {
// Construction of integers from floating point numbers.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 531)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 535)

  /// Creates a new instance by rounding the given floating-point value toward
  /// zero.
  ///
  /// - Parameter other: A floating-point value. When `other` is rounded toward
  ///   zero, the result must be within the range `Int32.min...Int32.max`.
  @_transparent
  public init(_ value: Float) {
    _precondition(value.isFinite,
      "Float value cannot be converted to Int32 because it is either infinite or NaN")
    _precondition(value > -2147483904.0,
      "Float value cannot be converted to Int32 because the result would be less than Int32.min")
    _precondition(value < 2147483648.0,
      "Float value cannot be converted to Int32 because the result would be greater than Int32.max")
    self._value = Builtin.fptosi_FPIEEE32_Int32(value._value)
  }

  /// Creates a Int32 whose value is `value`
  /// if no rounding is necessary, nil otherwise.
  @inline(__always)
  public init?(exactly value: Float) {
    self._value = Builtin.fptosi_FPIEEE32_Int32(value._value)
    if Float(self) != value {
      return nil
    }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 531)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 535)

  /// Creates a new instance by rounding the given floating-point value toward
  /// zero.
  ///
  /// - Parameter other: A floating-point value. When `other` is rounded toward
  ///   zero, the result must be within the range `Int32.min...Int32.max`.
  @_transparent
  public init(_ value: Double) {
    _precondition(value.isFinite,
      "Double value cannot be converted to Int32 because it is either infinite or NaN")
    _precondition(value > -2147483649.0,
      "Double value cannot be converted to Int32 because the result would be less than Int32.min")
    _precondition(value < 2147483648.0,
      "Double value cannot be converted to Int32 because the result would be greater than Int32.max")
    self._value = Builtin.fptosi_FPIEEE64_Int32(value._value)
  }

  /// Creates a Int32 whose value is `value`
  /// if no rounding is necessary, nil otherwise.
  @inline(__always)
  public init?(exactly value: Double) {
    self._value = Builtin.fptosi_FPIEEE64_Int32(value._value)
    if Double(self) != value {
      return nil
    }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 531)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 533)
#if !os(Windows) && (arch(i386) || arch(x86_64))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 535)

  /// Creates a new instance by rounding the given floating-point value toward
  /// zero.
  ///
  /// - Parameter other: A floating-point value. When `other` is rounded toward
  ///   zero, the result must be within the range `Int32.min...Int32.max`.
  @_transparent
  public init(_ value: Float80) {
    _precondition(value.isFinite,
      "Float80 value cannot be converted to Int32 because it is either infinite or NaN")
    _precondition(value > -2147483649.0,
      "Float80 value cannot be converted to Int32 because the result would be less than Int32.min")
    _precondition(value < 2147483648.0,
      "Float80 value cannot be converted to Int32 because the result would be greater than Int32.max")
    self._value = Builtin.fptosi_FPIEEE80_Int32(value._value)
  }

  /// Creates a Int32 whose value is `value`
  /// if no rounding is necessary, nil otherwise.
  @inline(__always)
  public init?(exactly value: Float80) {
    self._value = Builtin.fptosi_FPIEEE80_Int32(value._value)
    if Float80(self) != value {
      return nil
    }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 562)
#endif
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 565)

  /// Construct a `Int32` having the same memory representation as
  /// the `UInt32` `bitPattern`.  No range or overflow checking
  /// occurs, and the resulting `Int32` may not have the same numeric
  /// value as `bitPattern`--it is only guaranteed to use the same
  /// pattern of bits.
  @_transparent
  public init(bitPattern: UInt32) {
    self._value = bitPattern._value
  }
}

// Operations with potentially-static overflow checking
//
// FIXME: must use condfail in these operators, rather than
// overflowChecked, pending <rdar://problem/16271923> so that we don't
// foil static checking for numeric overflows.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 583)
@_transparent
public func + (lhs: Int32, rhs: Int32) -> Int32 {
  let (result, error) = Builtin.sadd_with_overflow_Int32(
    lhs._value, rhs._value, true._value)
  // return overflowChecked((Int32(result), Bool(error)))
  Builtin.condfail(error)
  return Int32(result)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 583)
@_transparent
public func * (lhs: Int32, rhs: Int32) -> Int32 {
  let (result, error) = Builtin.smul_with_overflow_Int32(
    lhs._value, rhs._value, true._value)
  // return overflowChecked((Int32(result), Bool(error)))
  Builtin.condfail(error)
  return Int32(result)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 583)
@_transparent
public func - (lhs: Int32, rhs: Int32) -> Int32 {
  let (result, error) = Builtin.ssub_with_overflow_Int32(
    lhs._value, rhs._value, true._value)
  // return overflowChecked((Int32(result), Bool(error)))
  Builtin.condfail(error)
  return Int32(result)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 592)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 594)
@_transparent
public func /(lhs: Int32, rhs: Int32) -> Int32 {
  Builtin.condfail((rhs == 0)._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 598)
  Builtin.condfail(((lhs == Int32.min) && (rhs == -1))._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 600)
  // FIXME: currently doesn't detect overflow -- blocked by:
  // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
  let tmp = Builtin.sdiv_Int32(lhs._value, rhs._value)
  return Int32(tmp)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 594)
@_transparent
public func %(lhs: Int32, rhs: Int32) -> Int32 {
  Builtin.condfail((rhs == 0)._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 598)
  Builtin.condfail(((lhs == Int32.min) && (rhs == -1))._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 600)
  // FIXME: currently doesn't detect overflow -- blocked by:
  // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
  let tmp = Builtin.srem_Int32(lhs._value, rhs._value)
  return Int32(tmp)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 606)

// Bitwise negate
/// Returns the inverse of the bits set in the argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public prefix func ~ (rhs: Int32) -> Int32 {
  let mask = Int32.subtractWithOverflow(0, 1).0
  return Int32(Builtin.xor_Int32(rhs._value, mask._value))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the two arguments have equal values.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func == (lhs: Int32, rhs: Int32) -> Bool {
  return Bool(Builtin.cmp_eq_Int32(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the two arguments have unequal values.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func != (lhs: Int32, rhs: Int32) -> Bool {
  return Bool(Builtin.cmp_ne_Int32(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is less than the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func < (lhs: Int32, rhs: Int32) -> Bool {
  return Bool(Builtin.cmp_slt_Int32(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is less than or equal to the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func <= (lhs: Int32, rhs: Int32) -> Bool {
  return Bool(Builtin.cmp_sle_Int32(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is greater than the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func > (lhs: Int32, rhs: Int32) -> Bool {
  return Bool(Builtin.cmp_sgt_Int32(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is greater than or equal to the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func >= (lhs: Int32, rhs: Int32) -> Bool {
  return Bool(Builtin.cmp_sge_Int32(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 634)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 636)
@_transparent
public func << (lhs: Int32, rhs: Int32) -> Int32 {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 639)
  _precondition(UInt32(rhs) < UInt32._sizeInBits,
      "shift amount is larger than type size in bits")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 645)
  return Int32(Builtin.shl_Int32(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 636)
@_transparent
public func >> (lhs: Int32, rhs: Int32) -> Int32 {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 639)
  _precondition(UInt32(rhs) < UInt32._sizeInBits,
      "shift amount is larger than type size in bits")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 645)
  return Int32(Builtin.ashr_Int32(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 648)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 654)
/// Returns the intersection of bits set in the two arguments.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func & (lhs: Int32, rhs: Int32) -> Int32 {
  return Int32(Builtin.and_Int32(lhs._value, rhs._value))
}

/// Calculates the intersection of bits set in the two arguments
/// and stores the result in the first argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func &=(lhs: inout Int32, rhs: Int32) {
  lhs = lhs & rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 654)
/// Returns the bits that are set in exactly one of the two arguments.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func ^ (lhs: Int32, rhs: Int32) -> Int32 {
  return Int32(Builtin.xor_Int32(lhs._value, rhs._value))
}

/// Calculates the bits that are set in exactly one of the two arguments
/// and stores the result in the first argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func ^=(lhs: inout Int32, rhs: Int32) {
  lhs = lhs ^ rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 654)
/// Returns the union of bits set in the two arguments.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func | (lhs: Int32, rhs: Int32) -> Int32 {
  return Int32(Builtin.or_Int32(lhs._value, rhs._value))
}

/// Calculates the union of bits set in the two arguments
/// and stores the result in the first argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func |=(lhs: inout Int32, rhs: Int32) {
  lhs = lhs | rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 671)

// Bitwise operations
extension Int32 : BitwiseOperations {
  /// The empty bitset of type `Int32`.
  @_transparent
  public static var allZeros: Int32 { return 0 }
}

// Compound assignments
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func +=(lhs: inout Int32, rhs: Int32) {
  lhs = lhs + rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func -=(lhs: inout Int32, rhs: Int32) {
  lhs = lhs - rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func *=(lhs: inout Int32, rhs: Int32) {
  lhs = lhs * rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func <<=(lhs: inout Int32, rhs: Int32) {
  lhs = lhs << rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func >>=(lhs: inout Int32, rhs: Int32) {
  lhs = lhs >> rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 686)

// Create an ambiguity when indexing or slicing
// Range[OfStrideable]<Int32> outside a generic context.  See
// Range.swift for details.
extension Int32 {
  public typealias _DisabledRangeIndex = Int32
}

// Prefix and postfix increment and decrement.

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public prefix func ++ (x: inout Int32) -> Int32 {
  x = x + 1
  return x
}

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public postfix func ++ (x: inout Int32) -> Int32 {
  let ret = x
  x = x + 1
  return ret
}

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public prefix func -- (x: inout Int32) -> Int32 {
  x = x - 1
  return x
}

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public postfix func -- (x: inout Int32) -> Int32 {
  let ret = x
  x = x - 1
  return ret
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 731)
// TODO: Consider removing the underscore.
/// Returns the argument and specifies that the value is not negative.
/// It has only an effect if the argument is a load or call.
@_transparent
public func _assumeNonNegative(_ x: Int32) -> Int32 {
  _sanityCheck(x >= 0)
  return Int32(Builtin.assumeNonNegative_Int32(x._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 740)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 206)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 213)
/// A 64-bit unsigned integer value
/// type.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 216)
@_fixed_layout
public struct UInt64
   : UnsignedInteger,
     Comparable, Equatable {
  public // @testable
  var _value: Builtin.Int64

  // FIXME: this declaration should be inferred.
  // <rdar://problem/18379938> Type checker refuses to use the default for
  // Int.Distance associated type

  /// Create an instance initialized to zero.
  @_transparent public
  init() {
    let maxWidthZero: IntMax = 0
    self._value = Builtin.truncOrBitCast_Int64_Int64(
       maxWidthZero._value)
  }

  @_transparent public
  init(_ _v: Builtin.Int64) {
    self._value = _v
  }

  @_transparent public
  init(_bits: Builtin.Int64) {
    self._value = _bits
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 266)


// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 269)
  /// Creates an integer from its big-endian representation, changing the
  /// byte order if necessary.
  @_transparent public
  init(bigEndian value: UInt64) {
#if _endian(big)
    self = value
#else
    self = UInt64(Builtin.int_bswap_Int64(value._value))
#endif
  }

  /// Creates an integer from its little-endian representation, changing the
  /// byte order if necessary.
  @_transparent public
  init(littleEndian value: UInt64) {
#if _endian(little)
    self = value
#else
    self = UInt64(Builtin.int_bswap_Int64(value._value))
#endif
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 291)

  @_transparent public
  init(_builtinIntegerLiteral value: Builtin.Int2048) {
    self = UInt64(Builtin.s_to_u_checked_trunc_Int2048_Int64(value).0)
  }

  /// Create an instance initialized to `value`.
  @_transparent public
  init(integerLiteral value: UInt64) {
    self = value
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 304)
  /// Returns the big-endian representation of the integer, changing the
  /// byte order if necessary.
  public var bigEndian: UInt64 {
#if _endian(big)
    return self
#else
    return UInt64(Builtin.int_bswap_Int64(_value))
#endif
  }
  /// Returns the little-endian representation of the integer, changing the
  /// byte order if necessary.
  public var littleEndian: UInt64 {
#if _endian(little)
    return self
#else
    return UInt64(Builtin.int_bswap_Int64(_value))
#endif
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 323)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 325)
  /// Returns the current integer with the byte order swapped.
  public var byteSwapped: UInt64 {
    return UInt64(Builtin.int_bswap_Int64(_value))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 330)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 332)
  @_transparent public
  static var max: UInt64 { return 0xFFFF_FFFF_FFFF_FFFF }
  @_transparent public
  static var min: UInt64 { return 0 }
  @_transparent
  public static var _sizeInBits: UInt64 { return 64 }
  public static var _sizeInBytes: UInt64 { return 64/8 }
}

extension UInt64 : Hashable {
  /// The hash value.
  ///
  /// **Axiom:** `x == y` implies `x.hashValue == y.hashValue`.
  ///
  /// - Note: The hash value is not guaranteed to be stable across
  ///   different invocations of the same program.  Do not persist the
  ///   hash value across program runs.
  public var hashValue: Int {
    @inline(__always)
    get {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 356)
      // Sign extend the value.
      return Int(Int64(bitPattern: self))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 366)
    }
  }
}

extension UInt64 : CustomStringConvertible {
  /// A textual representation of `self`.
  public var description: String {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 376)
    return _uint64ToString(self.toUIntMax())
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 378)
  }
}

// Operations that return an overflow bit in addition to a partial result,
// helpful for checking for overflow when you want to handle it.
extension UInt64 {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 385)
  /// Add `lhs` and `rhs`, returning a result and a
  /// `Bool` that is `true` iff the operation caused an arithmetic
  /// overflow.
  @_transparent public
  static func addWithOverflow(_ lhs: UInt64, _ rhs: UInt64) -> (UInt64, overflow: Bool) {
    let tmp = Builtin.uadd_with_overflow_Int64(lhs._value, rhs._value, false._value)
    return (UInt64(tmp.0), Bool(tmp.1))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 385)
  /// Subtract `lhs` and `rhs`, returning a result and a
  /// `Bool` that is `true` iff the operation caused an arithmetic
  /// overflow.
  @_transparent public
  static func subtractWithOverflow(_ lhs: UInt64, _ rhs: UInt64) -> (UInt64, overflow: Bool) {
    let tmp = Builtin.usub_with_overflow_Int64(lhs._value, rhs._value, false._value)
    return (UInt64(tmp.0), Bool(tmp.1))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 385)
  /// Multiply `lhs` and `rhs`, returning a result and a
  /// `Bool` that is `true` iff the operation caused an arithmetic
  /// overflow.
  @_transparent public
  static func multiplyWithOverflow(_ lhs: UInt64, _ rhs: UInt64) -> (UInt64, overflow: Bool) {
    let tmp = Builtin.umul_with_overflow_Int64(lhs._value, rhs._value, false._value)
    return (UInt64(tmp.0), Bool(tmp.1))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 394)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 396)
  /// Divide `lhs` and `rhs`, returning
  /// a result and a `Bool`
  /// that is `true` iff the operation caused an arithmetic overflow.
  @_transparent public
  static func divideWithOverflow(_ lhs: UInt64, _ rhs: UInt64) -> (UInt64, overflow: Bool) {
    if rhs == 0 {
      return (0, true)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 409)
    // FIXME: currently doesn't detect overflow -- blocked by:
    // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
    let tmp = Builtin.udiv_Int64(lhs._value, rhs._value)
    return (UInt64(tmp), false)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 396)
  /// Divide `lhs` and `rhs`, returning
  /// the remainder and a `Bool`
  /// that is `true` iff the operation caused an arithmetic overflow.
  @_transparent public
  static func remainderWithOverflow(_ lhs: UInt64, _ rhs: UInt64) -> (UInt64, overflow: Bool) {
    if rhs == 0 {
      return (0, true)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 409)
    // FIXME: currently doesn't detect overflow -- blocked by:
    // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
    let tmp = Builtin.urem_Int64(lhs._value, rhs._value)
    return (UInt64(tmp), false)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 415)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 417)
  /// Represent this number using Swift's widest native unsigned
  /// integer type.
  @_transparent public
  func toUIntMax() -> UIntMax {
    return self
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 424)
  /// Explicitly convert to `IntMax`, trapping on overflow (except in -Ounchecked builds).
  @_transparent public
  func toIntMax() -> IntMax {
    return IntMax(toUIntMax())
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 430)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 435)


// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 469)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt64 {

  @_transparent
  public init(_ value: UInt8) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.zext_Int8_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting UInt8 to UInt64 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt8) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.zext_Int8_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt64 {

  @_transparent
  public init(_ value: Int8) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  let (tmp, signError) = Builtin.s_to_u_checked_conversion_Int8(src)
  result = (Builtin.sext_Int8_Int64(tmp), signError)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int8) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  let (tmp, signError) = Builtin.s_to_u_checked_conversion_Int8(src)
  result = (Builtin.sext_Int8_Int64(tmp), signError)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt64 {

  @_transparent
  public init(_ value: UInt16) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.zext_Int16_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting UInt16 to UInt64 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt16) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.zext_Int16_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt64 {

  @_transparent
  public init(_ value: Int16) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  let (tmp, signError) = Builtin.s_to_u_checked_conversion_Int16(src)
  result = (Builtin.sext_Int16_Int64(tmp), signError)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int16) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  let (tmp, signError) = Builtin.s_to_u_checked_conversion_Int16(src)
  result = (Builtin.sext_Int16_Int64(tmp), signError)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt64 {

  @_transparent
  public init(_ value: UInt32) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.zext_Int32_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting UInt32 to UInt64 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt32) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.zext_Int32_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt64 {

  @_transparent
  public init(_ value: Int32) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  let (tmp, signError) = Builtin.s_to_u_checked_conversion_Int32(src)
  result = (Builtin.sext_Int32_Int64(tmp), signError)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int32) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  let (tmp, signError) = Builtin.s_to_u_checked_conversion_Int32(src)
  result = (Builtin.sext_Int32_Int64(tmp), signError)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt64 {

  @_transparent
  public init(_ value: UInt64) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (src, false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting UInt64 to UInt64 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt64) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (src, false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt64 {

  @_transparent
  public init(_ value: Int64) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = Builtin.s_to_u_checked_conversion_Int64(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int64) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = Builtin.s_to_u_checked_conversion_Int64(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt64 {

  @_transparent
  public init(_ value: UInt) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (src, false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting UInt to UInt64 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (src, false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt64 {

  @_transparent
  public init(_ value: Int) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = Builtin.s_to_u_checked_conversion_Int64(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = Builtin.s_to_u_checked_conversion_Int64(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 524)

extension UInt64 {
// Construction of integers from floating point numbers.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 531)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 535)

  /// Creates a new instance by rounding the given floating-point value toward
  /// zero.
  ///
  /// - Parameter other: A floating-point value. When `other` is rounded toward
  ///   zero, the result must be within the range `UInt64.min...UInt64.max`.
  @_transparent
  public init(_ value: Float) {
    _precondition(value.isFinite,
      "Float value cannot be converted to UInt64 because it is either infinite or NaN")
    _precondition(value > -1.0,
      "Float value cannot be converted to UInt64 because the result would be less than UInt64.min")
    _precondition(value < 18446744073709551616.0,
      "Float value cannot be converted to UInt64 because the result would be greater than UInt64.max")
    self._value = Builtin.fptoui_FPIEEE32_Int64(value._value)
  }

  /// Creates a UInt64 whose value is `value`
  /// if no rounding is necessary, nil otherwise.
  @inline(__always)
  public init?(exactly value: Float) {
    self._value = Builtin.fptoui_FPIEEE32_Int64(value._value)
    if Float(self) != value {
      return nil
    }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 531)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 535)

  /// Creates a new instance by rounding the given floating-point value toward
  /// zero.
  ///
  /// - Parameter other: A floating-point value. When `other` is rounded toward
  ///   zero, the result must be within the range `UInt64.min...UInt64.max`.
  @_transparent
  public init(_ value: Double) {
    _precondition(value.isFinite,
      "Double value cannot be converted to UInt64 because it is either infinite or NaN")
    _precondition(value > -1.0,
      "Double value cannot be converted to UInt64 because the result would be less than UInt64.min")
    _precondition(value < 18446744073709551616.0,
      "Double value cannot be converted to UInt64 because the result would be greater than UInt64.max")
    self._value = Builtin.fptoui_FPIEEE64_Int64(value._value)
  }

  /// Creates a UInt64 whose value is `value`
  /// if no rounding is necessary, nil otherwise.
  @inline(__always)
  public init?(exactly value: Double) {
    self._value = Builtin.fptoui_FPIEEE64_Int64(value._value)
    if Double(self) != value {
      return nil
    }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 531)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 533)
#if !os(Windows) && (arch(i386) || arch(x86_64))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 535)

  /// Creates a new instance by rounding the given floating-point value toward
  /// zero.
  ///
  /// - Parameter other: A floating-point value. When `other` is rounded toward
  ///   zero, the result must be within the range `UInt64.min...UInt64.max`.
  @_transparent
  public init(_ value: Float80) {
    _precondition(value.isFinite,
      "Float80 value cannot be converted to UInt64 because it is either infinite or NaN")
    _precondition(value > -1.0,
      "Float80 value cannot be converted to UInt64 because the result would be less than UInt64.min")
    _precondition(value < 18446744073709551616.0,
      "Float80 value cannot be converted to UInt64 because the result would be greater than UInt64.max")
    self._value = Builtin.fptoui_FPIEEE80_Int64(value._value)
  }

  /// Creates a UInt64 whose value is `value`
  /// if no rounding is necessary, nil otherwise.
  @inline(__always)
  public init?(exactly value: Float80) {
    self._value = Builtin.fptoui_FPIEEE80_Int64(value._value)
    if Float80(self) != value {
      return nil
    }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 562)
#endif
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 565)

  /// Construct a `UInt64` having the same memory representation as
  /// the `Int64` `bitPattern`.  No range or overflow checking
  /// occurs, and the resulting `UInt64` may not have the same numeric
  /// value as `bitPattern`--it is only guaranteed to use the same
  /// pattern of bits.
  @_transparent
  public init(bitPattern: Int64) {
    self._value = bitPattern._value
  }
}

// Operations with potentially-static overflow checking
//
// FIXME: must use condfail in these operators, rather than
// overflowChecked, pending <rdar://problem/16271923> so that we don't
// foil static checking for numeric overflows.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 583)
@_transparent
public func + (lhs: UInt64, rhs: UInt64) -> UInt64 {
  let (result, error) = Builtin.uadd_with_overflow_Int64(
    lhs._value, rhs._value, true._value)
  // return overflowChecked((UInt64(result), Bool(error)))
  Builtin.condfail(error)
  return UInt64(result)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 583)
@_transparent
public func * (lhs: UInt64, rhs: UInt64) -> UInt64 {
  let (result, error) = Builtin.umul_with_overflow_Int64(
    lhs._value, rhs._value, true._value)
  // return overflowChecked((UInt64(result), Bool(error)))
  Builtin.condfail(error)
  return UInt64(result)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 583)
@_transparent
public func - (lhs: UInt64, rhs: UInt64) -> UInt64 {
  let (result, error) = Builtin.usub_with_overflow_Int64(
    lhs._value, rhs._value, true._value)
  // return overflowChecked((UInt64(result), Bool(error)))
  Builtin.condfail(error)
  return UInt64(result)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 592)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 594)
@_transparent
public func /(lhs: UInt64, rhs: UInt64) -> UInt64 {
  Builtin.condfail((rhs == 0)._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 600)
  // FIXME: currently doesn't detect overflow -- blocked by:
  // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
  let tmp = Builtin.udiv_Int64(lhs._value, rhs._value)
  return UInt64(tmp)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 594)
@_transparent
public func %(lhs: UInt64, rhs: UInt64) -> UInt64 {
  Builtin.condfail((rhs == 0)._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 600)
  // FIXME: currently doesn't detect overflow -- blocked by:
  // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
  let tmp = Builtin.urem_Int64(lhs._value, rhs._value)
  return UInt64(tmp)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 606)

// Bitwise negate
/// Returns the inverse of the bits set in the argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public prefix func ~ (rhs: UInt64) -> UInt64 {
  let mask = UInt64.subtractWithOverflow(0, 1).0
  return UInt64(Builtin.xor_Int64(rhs._value, mask._value))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the two arguments have equal values.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func == (lhs: UInt64, rhs: UInt64) -> Bool {
  return Bool(Builtin.cmp_eq_Int64(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the two arguments have unequal values.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func != (lhs: UInt64, rhs: UInt64) -> Bool {
  return Bool(Builtin.cmp_ne_Int64(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is less than the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func < (lhs: UInt64, rhs: UInt64) -> Bool {
  return Bool(Builtin.cmp_ult_Int64(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is less than or equal to the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func <= (lhs: UInt64, rhs: UInt64) -> Bool {
  return Bool(Builtin.cmp_ule_Int64(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is greater than the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func > (lhs: UInt64, rhs: UInt64) -> Bool {
  return Bool(Builtin.cmp_ugt_Int64(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is greater than or equal to the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func >= (lhs: UInt64, rhs: UInt64) -> Bool {
  return Bool(Builtin.cmp_uge_Int64(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 634)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 636)
@_transparent
public func << (lhs: UInt64, rhs: UInt64) -> UInt64 {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 642)
  _precondition(rhs < UInt64._sizeInBits,
      "shift amount is larger than type size in bits")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 645)
  return UInt64(Builtin.shl_Int64(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 636)
@_transparent
public func >> (lhs: UInt64, rhs: UInt64) -> UInt64 {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 642)
  _precondition(rhs < UInt64._sizeInBits,
      "shift amount is larger than type size in bits")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 645)
  return UInt64(Builtin.lshr_Int64(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 648)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 654)
/// Returns the intersection of bits set in the two arguments.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func & (lhs: UInt64, rhs: UInt64) -> UInt64 {
  return UInt64(Builtin.and_Int64(lhs._value, rhs._value))
}

/// Calculates the intersection of bits set in the two arguments
/// and stores the result in the first argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func &=(lhs: inout UInt64, rhs: UInt64) {
  lhs = lhs & rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 654)
/// Returns the bits that are set in exactly one of the two arguments.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func ^ (lhs: UInt64, rhs: UInt64) -> UInt64 {
  return UInt64(Builtin.xor_Int64(lhs._value, rhs._value))
}

/// Calculates the bits that are set in exactly one of the two arguments
/// and stores the result in the first argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func ^=(lhs: inout UInt64, rhs: UInt64) {
  lhs = lhs ^ rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 654)
/// Returns the union of bits set in the two arguments.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func | (lhs: UInt64, rhs: UInt64) -> UInt64 {
  return UInt64(Builtin.or_Int64(lhs._value, rhs._value))
}

/// Calculates the union of bits set in the two arguments
/// and stores the result in the first argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func |=(lhs: inout UInt64, rhs: UInt64) {
  lhs = lhs | rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 671)

// Bitwise operations
extension UInt64 : BitwiseOperations {
  /// The empty bitset of type `UInt64`.
  @_transparent
  public static var allZeros: UInt64 { return 0 }
}

// Compound assignments
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func +=(lhs: inout UInt64, rhs: UInt64) {
  lhs = lhs + rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func -=(lhs: inout UInt64, rhs: UInt64) {
  lhs = lhs - rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func *=(lhs: inout UInt64, rhs: UInt64) {
  lhs = lhs * rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func <<=(lhs: inout UInt64, rhs: UInt64) {
  lhs = lhs << rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func >>=(lhs: inout UInt64, rhs: UInt64) {
  lhs = lhs >> rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 686)

// Create an ambiguity when indexing or slicing
// Range[OfStrideable]<UInt64> outside a generic context.  See
// Range.swift for details.
extension UInt64 {
  public typealias _DisabledRangeIndex = UInt64
}

// Prefix and postfix increment and decrement.

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public prefix func ++ (x: inout UInt64) -> UInt64 {
  x = x + 1
  return x
}

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public postfix func ++ (x: inout UInt64) -> UInt64 {
  let ret = x
  x = x + 1
  return ret
}

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public prefix func -- (x: inout UInt64) -> UInt64 {
  x = x - 1
  return x
}

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public postfix func -- (x: inout UInt64) -> UInt64 {
  let ret = x
  x = x - 1
  return ret
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 740)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 206)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 213)
/// A 64-bit signed integer value
/// type.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 216)
@_fixed_layout
public struct Int64
   : SignedInteger,
     Comparable, Equatable {
  public // @testable
  var _value: Builtin.Int64

  // FIXME: this declaration should be inferred.
  // <rdar://problem/18379938> Type checker refuses to use the default for
  // Int.Distance associated type

  /// Create an instance initialized to zero.
  @_transparent public
  init() {
    let maxWidthZero: IntMax = 0
    self._value = Builtin.truncOrBitCast_Int64_Int64(
       maxWidthZero._value)
  }

  @_transparent public
  init(_ _v: Builtin.Int64) {
    self._value = _v
  }

  @_transparent public
  init(_bits: Builtin.Int64) {
    self._value = _bits
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 266)


// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 269)
  /// Creates an integer from its big-endian representation, changing the
  /// byte order if necessary.
  @_transparent public
  init(bigEndian value: Int64) {
#if _endian(big)
    self = value
#else
    self = Int64(Builtin.int_bswap_Int64(value._value))
#endif
  }

  /// Creates an integer from its little-endian representation, changing the
  /// byte order if necessary.
  @_transparent public
  init(littleEndian value: Int64) {
#if _endian(little)
    self = value
#else
    self = Int64(Builtin.int_bswap_Int64(value._value))
#endif
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 291)

  @_transparent public
  init(_builtinIntegerLiteral value: Builtin.Int2048) {
    self = Int64(Builtin.s_to_s_checked_trunc_Int2048_Int64(value).0)
  }

  /// Create an instance initialized to `value`.
  @_transparent public
  init(integerLiteral value: Int64) {
    self = value
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 304)
  /// Returns the big-endian representation of the integer, changing the
  /// byte order if necessary.
  public var bigEndian: Int64 {
#if _endian(big)
    return self
#else
    return Int64(Builtin.int_bswap_Int64(_value))
#endif
  }
  /// Returns the little-endian representation of the integer, changing the
  /// byte order if necessary.
  public var littleEndian: Int64 {
#if _endian(little)
    return self
#else
    return Int64(Builtin.int_bswap_Int64(_value))
#endif
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 323)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 325)
  /// Returns the current integer with the byte order swapped.
  public var byteSwapped: Int64 {
    return Int64(Builtin.int_bswap_Int64(_value))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 330)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 332)
  @_transparent public
  static var max: Int64 { return 0x7FFF_FFFF_FFFF_FFFF }
  @_transparent public
  static var min: Int64 { return -0x7FFF_FFFF_FFFF_FFFF-1 }
  @_transparent
  public static var _sizeInBits: Int64 { return 64 }
  public static var _sizeInBytes: Int64 { return 64/8 }
}

extension Int64 : Hashable {
  /// The hash value.
  ///
  /// **Axiom:** `x == y` implies `x.hashValue == y.hashValue`.
  ///
  /// - Note: The hash value is not guaranteed to be stable across
  ///   different invocations of the same program.  Do not persist the
  ///   hash value across program runs.
  public var hashValue: Int {
    @inline(__always)
    get {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 353)
      // Sign extend the value.
      return Int(self)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 366)
    }
  }
}

extension Int64 : CustomStringConvertible {
  /// A textual representation of `self`.
  public var description: String {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 374)
    return _int64ToString(self.toIntMax())
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 378)
  }
}

// Operations that return an overflow bit in addition to a partial result,
// helpful for checking for overflow when you want to handle it.
extension Int64 {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 385)
  /// Add `lhs` and `rhs`, returning a result and a
  /// `Bool` that is `true` iff the operation caused an arithmetic
  /// overflow.
  @_transparent public
  static func addWithOverflow(_ lhs: Int64, _ rhs: Int64) -> (Int64, overflow: Bool) {
    let tmp = Builtin.sadd_with_overflow_Int64(lhs._value, rhs._value, false._value)
    return (Int64(tmp.0), Bool(tmp.1))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 385)
  /// Subtract `lhs` and `rhs`, returning a result and a
  /// `Bool` that is `true` iff the operation caused an arithmetic
  /// overflow.
  @_transparent public
  static func subtractWithOverflow(_ lhs: Int64, _ rhs: Int64) -> (Int64, overflow: Bool) {
    let tmp = Builtin.ssub_with_overflow_Int64(lhs._value, rhs._value, false._value)
    return (Int64(tmp.0), Bool(tmp.1))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 385)
  /// Multiply `lhs` and `rhs`, returning a result and a
  /// `Bool` that is `true` iff the operation caused an arithmetic
  /// overflow.
  @_transparent public
  static func multiplyWithOverflow(_ lhs: Int64, _ rhs: Int64) -> (Int64, overflow: Bool) {
    let tmp = Builtin.smul_with_overflow_Int64(lhs._value, rhs._value, false._value)
    return (Int64(tmp.0), Bool(tmp.1))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 394)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 396)
  /// Divide `lhs` and `rhs`, returning
  /// a result and a `Bool`
  /// that is `true` iff the operation caused an arithmetic overflow.
  @_transparent public
  static func divideWithOverflow(_ lhs: Int64, _ rhs: Int64) -> (Int64, overflow: Bool) {
    if rhs == 0 {
      return (0, true)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 405)
    if lhs == Int64.min && rhs == -1 {
      return (0, true)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 409)
    // FIXME: currently doesn't detect overflow -- blocked by:
    // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
    let tmp = Builtin.sdiv_Int64(lhs._value, rhs._value)
    return (Int64(tmp), false)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 396)
  /// Divide `lhs` and `rhs`, returning
  /// the remainder and a `Bool`
  /// that is `true` iff the operation caused an arithmetic overflow.
  @_transparent public
  static func remainderWithOverflow(_ lhs: Int64, _ rhs: Int64) -> (Int64, overflow: Bool) {
    if rhs == 0 {
      return (0, true)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 405)
    if lhs == Int64.min && rhs == -1 {
      return (0, true)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 409)
    // FIXME: currently doesn't detect overflow -- blocked by:
    // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
    let tmp = Builtin.srem_Int64(lhs._value, rhs._value)
    return (Int64(tmp), false)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 415)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 417)
  /// Represent this number using Swift's widest native signed
  /// integer type.
  @_transparent public
  func toIntMax() -> IntMax {
    return self
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 430)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 433)
extension Int64 : SignedNumber {}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 435)


// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 469)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int64 {

  @_transparent
  public init(_ value: UInt8) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.zext_Int8_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting UInt8 to Int64 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt8) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.zext_Int8_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int64 {

  @_transparent
  public init(_ value: Int8) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.sext_Int8_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting Int8 to Int64 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int8) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.sext_Int8_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int64 {

  @_transparent
  public init(_ value: UInt16) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.zext_Int16_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting UInt16 to Int64 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt16) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.zext_Int16_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int64 {

  @_transparent
  public init(_ value: Int16) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.sext_Int16_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting Int16 to Int64 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int16) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.sext_Int16_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int64 {

  @_transparent
  public init(_ value: UInt32) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.zext_Int32_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting UInt32 to Int64 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt32) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.zext_Int32_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int64 {

  @_transparent
  public init(_ value: Int32) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.sext_Int32_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting Int32 to Int64 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int32) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.sext_Int32_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int64 {

  @_transparent
  public init(_ value: UInt64) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = Builtin.u_to_s_checked_conversion_Int64(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt64) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = Builtin.u_to_s_checked_conversion_Int64(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int64 {

  @_transparent
  public init(_ value: Int64) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (src, false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting Int64 to Int64 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int64) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (src, false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int64 {

  @_transparent
  public init(_ value: UInt) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = Builtin.u_to_s_checked_conversion_Int64(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = Builtin.u_to_s_checked_conversion_Int64(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int64 {

  @_transparent
  public init(_ value: Int) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (src, false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting Int to Int64 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (src, false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 524)

extension Int64 {
// Construction of integers from floating point numbers.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 531)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 535)

  /// Creates a new instance by rounding the given floating-point value toward
  /// zero.
  ///
  /// - Parameter other: A floating-point value. When `other` is rounded toward
  ///   zero, the result must be within the range `Int64.min...Int64.max`.
  @_transparent
  public init(_ value: Float) {
    _precondition(value.isFinite,
      "Float value cannot be converted to Int64 because it is either infinite or NaN")
    _precondition(value > -9223373136366403584.0,
      "Float value cannot be converted to Int64 because the result would be less than Int64.min")
    _precondition(value < 9223372036854775808.0,
      "Float value cannot be converted to Int64 because the result would be greater than Int64.max")
    self._value = Builtin.fptosi_FPIEEE32_Int64(value._value)
  }

  /// Creates a Int64 whose value is `value`
  /// if no rounding is necessary, nil otherwise.
  @inline(__always)
  public init?(exactly value: Float) {
    self._value = Builtin.fptosi_FPIEEE32_Int64(value._value)
    if Float(self) != value {
      return nil
    }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 531)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 535)

  /// Creates a new instance by rounding the given floating-point value toward
  /// zero.
  ///
  /// - Parameter other: A floating-point value. When `other` is rounded toward
  ///   zero, the result must be within the range `Int64.min...Int64.max`.
  @_transparent
  public init(_ value: Double) {
    _precondition(value.isFinite,
      "Double value cannot be converted to Int64 because it is either infinite or NaN")
    _precondition(value > -9223372036854777856.0,
      "Double value cannot be converted to Int64 because the result would be less than Int64.min")
    _precondition(value < 9223372036854775808.0,
      "Double value cannot be converted to Int64 because the result would be greater than Int64.max")
    self._value = Builtin.fptosi_FPIEEE64_Int64(value._value)
  }

  /// Creates a Int64 whose value is `value`
  /// if no rounding is necessary, nil otherwise.
  @inline(__always)
  public init?(exactly value: Double) {
    self._value = Builtin.fptosi_FPIEEE64_Int64(value._value)
    if Double(self) != value {
      return nil
    }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 531)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 533)
#if !os(Windows) && (arch(i386) || arch(x86_64))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 535)

  /// Creates a new instance by rounding the given floating-point value toward
  /// zero.
  ///
  /// - Parameter other: A floating-point value. When `other` is rounded toward
  ///   zero, the result must be within the range `Int64.min...Int64.max`.
  @_transparent
  public init(_ value: Float80) {
    _precondition(value.isFinite,
      "Float80 value cannot be converted to Int64 because it is either infinite or NaN")
    _precondition(value > -9223372036854775809.0,
      "Float80 value cannot be converted to Int64 because the result would be less than Int64.min")
    _precondition(value < 9223372036854775808.0,
      "Float80 value cannot be converted to Int64 because the result would be greater than Int64.max")
    self._value = Builtin.fptosi_FPIEEE80_Int64(value._value)
  }

  /// Creates a Int64 whose value is `value`
  /// if no rounding is necessary, nil otherwise.
  @inline(__always)
  public init?(exactly value: Float80) {
    self._value = Builtin.fptosi_FPIEEE80_Int64(value._value)
    if Float80(self) != value {
      return nil
    }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 562)
#endif
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 565)

  /// Construct a `Int64` having the same memory representation as
  /// the `UInt64` `bitPattern`.  No range or overflow checking
  /// occurs, and the resulting `Int64` may not have the same numeric
  /// value as `bitPattern`--it is only guaranteed to use the same
  /// pattern of bits.
  @_transparent
  public init(bitPattern: UInt64) {
    self._value = bitPattern._value
  }
}

// Operations with potentially-static overflow checking
//
// FIXME: must use condfail in these operators, rather than
// overflowChecked, pending <rdar://problem/16271923> so that we don't
// foil static checking for numeric overflows.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 583)
@_transparent
public func + (lhs: Int64, rhs: Int64) -> Int64 {
  let (result, error) = Builtin.sadd_with_overflow_Int64(
    lhs._value, rhs._value, true._value)
  // return overflowChecked((Int64(result), Bool(error)))
  Builtin.condfail(error)
  return Int64(result)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 583)
@_transparent
public func * (lhs: Int64, rhs: Int64) -> Int64 {
  let (result, error) = Builtin.smul_with_overflow_Int64(
    lhs._value, rhs._value, true._value)
  // return overflowChecked((Int64(result), Bool(error)))
  Builtin.condfail(error)
  return Int64(result)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 583)
@_transparent
public func - (lhs: Int64, rhs: Int64) -> Int64 {
  let (result, error) = Builtin.ssub_with_overflow_Int64(
    lhs._value, rhs._value, true._value)
  // return overflowChecked((Int64(result), Bool(error)))
  Builtin.condfail(error)
  return Int64(result)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 592)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 594)
@_transparent
public func /(lhs: Int64, rhs: Int64) -> Int64 {
  Builtin.condfail((rhs == 0)._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 598)
  Builtin.condfail(((lhs == Int64.min) && (rhs == -1))._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 600)
  // FIXME: currently doesn't detect overflow -- blocked by:
  // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
  let tmp = Builtin.sdiv_Int64(lhs._value, rhs._value)
  return Int64(tmp)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 594)
@_transparent
public func %(lhs: Int64, rhs: Int64) -> Int64 {
  Builtin.condfail((rhs == 0)._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 598)
  Builtin.condfail(((lhs == Int64.min) && (rhs == -1))._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 600)
  // FIXME: currently doesn't detect overflow -- blocked by:
  // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
  let tmp = Builtin.srem_Int64(lhs._value, rhs._value)
  return Int64(tmp)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 606)

// Bitwise negate
/// Returns the inverse of the bits set in the argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public prefix func ~ (rhs: Int64) -> Int64 {
  let mask = Int64.subtractWithOverflow(0, 1).0
  return Int64(Builtin.xor_Int64(rhs._value, mask._value))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the two arguments have equal values.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func == (lhs: Int64, rhs: Int64) -> Bool {
  return Bool(Builtin.cmp_eq_Int64(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the two arguments have unequal values.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func != (lhs: Int64, rhs: Int64) -> Bool {
  return Bool(Builtin.cmp_ne_Int64(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is less than the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func < (lhs: Int64, rhs: Int64) -> Bool {
  return Bool(Builtin.cmp_slt_Int64(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is less than or equal to the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func <= (lhs: Int64, rhs: Int64) -> Bool {
  return Bool(Builtin.cmp_sle_Int64(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is greater than the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func > (lhs: Int64, rhs: Int64) -> Bool {
  return Bool(Builtin.cmp_sgt_Int64(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is greater than or equal to the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func >= (lhs: Int64, rhs: Int64) -> Bool {
  return Bool(Builtin.cmp_sge_Int64(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 634)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 636)
@_transparent
public func << (lhs: Int64, rhs: Int64) -> Int64 {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 639)
  _precondition(UInt64(rhs) < UInt64._sizeInBits,
      "shift amount is larger than type size in bits")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 645)
  return Int64(Builtin.shl_Int64(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 636)
@_transparent
public func >> (lhs: Int64, rhs: Int64) -> Int64 {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 639)
  _precondition(UInt64(rhs) < UInt64._sizeInBits,
      "shift amount is larger than type size in bits")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 645)
  return Int64(Builtin.ashr_Int64(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 648)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 654)
/// Returns the intersection of bits set in the two arguments.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func & (lhs: Int64, rhs: Int64) -> Int64 {
  return Int64(Builtin.and_Int64(lhs._value, rhs._value))
}

/// Calculates the intersection of bits set in the two arguments
/// and stores the result in the first argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func &=(lhs: inout Int64, rhs: Int64) {
  lhs = lhs & rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 654)
/// Returns the bits that are set in exactly one of the two arguments.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func ^ (lhs: Int64, rhs: Int64) -> Int64 {
  return Int64(Builtin.xor_Int64(lhs._value, rhs._value))
}

/// Calculates the bits that are set in exactly one of the two arguments
/// and stores the result in the first argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func ^=(lhs: inout Int64, rhs: Int64) {
  lhs = lhs ^ rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 654)
/// Returns the union of bits set in the two arguments.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func | (lhs: Int64, rhs: Int64) -> Int64 {
  return Int64(Builtin.or_Int64(lhs._value, rhs._value))
}

/// Calculates the union of bits set in the two arguments
/// and stores the result in the first argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func |=(lhs: inout Int64, rhs: Int64) {
  lhs = lhs | rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 671)

// Bitwise operations
extension Int64 : BitwiseOperations {
  /// The empty bitset of type `Int64`.
  @_transparent
  public static var allZeros: Int64 { return 0 }
}

// Compound assignments
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func +=(lhs: inout Int64, rhs: Int64) {
  lhs = lhs + rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func -=(lhs: inout Int64, rhs: Int64) {
  lhs = lhs - rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func *=(lhs: inout Int64, rhs: Int64) {
  lhs = lhs * rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func <<=(lhs: inout Int64, rhs: Int64) {
  lhs = lhs << rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func >>=(lhs: inout Int64, rhs: Int64) {
  lhs = lhs >> rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 686)

// Create an ambiguity when indexing or slicing
// Range[OfStrideable]<Int64> outside a generic context.  See
// Range.swift for details.
extension Int64 {
  public typealias _DisabledRangeIndex = Int64
}

// Prefix and postfix increment and decrement.

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public prefix func ++ (x: inout Int64) -> Int64 {
  x = x + 1
  return x
}

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public postfix func ++ (x: inout Int64) -> Int64 {
  let ret = x
  x = x + 1
  return ret
}

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public prefix func -- (x: inout Int64) -> Int64 {
  x = x - 1
  return x
}

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public postfix func -- (x: inout Int64) -> Int64 {
  let ret = x
  x = x - 1
  return ret
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 731)
// TODO: Consider removing the underscore.
/// Returns the argument and specifies that the value is not negative.
/// It has only an effect if the argument is a load or call.
@_transparent
public func _assumeNonNegative(_ x: Int64) -> Int64 {
  _sanityCheck(x >= 0)
  return Int64(Builtin.assumeNonNegative_Int64(x._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 740)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 206)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 208)
/// An unsigned integer value type.
///
/// On 32-bit platforms, `UInt` is the same size as `UInt32`, and
/// on 64-bit platforms, `UInt` is the same size as `UInt64`.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 216)
@_fixed_layout
public struct UInt
   : UnsignedInteger,
     Comparable, Equatable {
  public // @testable
  var _value: Builtin.Int64

  // FIXME: this declaration should be inferred.
  // <rdar://problem/18379938> Type checker refuses to use the default for
  // Int.Distance associated type

  /// Create an instance initialized to zero.
  @_transparent public
  init() {
    let maxWidthZero: IntMax = 0
    self._value = Builtin.truncOrBitCast_Int64_Int64(
       maxWidthZero._value)
  }

  @_transparent public
  init(_ _v: Builtin.Int64) {
    self._value = _v
  }

  @_transparent public
  init(_bits: Builtin.Int64) {
    self._value = _bits
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 246)
  @_transparent
  public // @testable
  init(_ _v: Builtin.Word) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 252)
    self._value = Builtin.zextOrBitCast_Word_Int64(_v)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 254)
  }

  @_transparent
  public // @testable
  var _builtinWordValue: Builtin.Word {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 262)
    return Builtin.truncOrBitCast_Int64_Word(_value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 264)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 266)


// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 269)
  /// Creates an integer from its big-endian representation, changing the
  /// byte order if necessary.
  @_transparent public
  init(bigEndian value: UInt) {
#if _endian(big)
    self = value
#else
    self = UInt(Builtin.int_bswap_Int64(value._value))
#endif
  }

  /// Creates an integer from its little-endian representation, changing the
  /// byte order if necessary.
  @_transparent public
  init(littleEndian value: UInt) {
#if _endian(little)
    self = value
#else
    self = UInt(Builtin.int_bswap_Int64(value._value))
#endif
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 291)

  @_transparent public
  init(_builtinIntegerLiteral value: Builtin.Int2048) {
    self = UInt(Builtin.s_to_u_checked_trunc_Int2048_Int64(value).0)
  }

  /// Create an instance initialized to `value`.
  @_transparent public
  init(integerLiteral value: UInt) {
    self = value
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 304)
  /// Returns the big-endian representation of the integer, changing the
  /// byte order if necessary.
  public var bigEndian: UInt {
#if _endian(big)
    return self
#else
    return UInt(Builtin.int_bswap_Int64(_value))
#endif
  }
  /// Returns the little-endian representation of the integer, changing the
  /// byte order if necessary.
  public var littleEndian: UInt {
#if _endian(little)
    return self
#else
    return UInt(Builtin.int_bswap_Int64(_value))
#endif
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 323)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 325)
  /// Returns the current integer with the byte order swapped.
  public var byteSwapped: UInt {
    return UInt(Builtin.int_bswap_Int64(_value))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 330)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 332)
  @_transparent public
  static var max: UInt { return 0xFFFF_FFFF_FFFF_FFFF }
  @_transparent public
  static var min: UInt { return 0 }
  @_transparent
  public static var _sizeInBits: UInt { return 64 }
  public static var _sizeInBytes: UInt { return 64/8 }
}

extension UInt : Hashable {
  /// The hash value.
  ///
  /// **Axiom:** `x == y` implies `x.hashValue == y.hashValue`.
  ///
  /// - Note: The hash value is not guaranteed to be stable across
  ///   different invocations of the same program.  Do not persist the
  ///   hash value across program runs.
  public var hashValue: Int {
    @inline(__always)
    get {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 356)
      // Sign extend the value.
      return Int(Int(bitPattern: self))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 366)
    }
  }
}

extension UInt : CustomStringConvertible {
  /// A textual representation of `self`.
  public var description: String {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 376)
    return _uint64ToString(self.toUIntMax())
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 378)
  }
}

// Operations that return an overflow bit in addition to a partial result,
// helpful for checking for overflow when you want to handle it.
extension UInt {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 385)
  /// Add `lhs` and `rhs`, returning a result and a
  /// `Bool` that is `true` iff the operation caused an arithmetic
  /// overflow.
  @_transparent public
  static func addWithOverflow(_ lhs: UInt, _ rhs: UInt) -> (UInt, overflow: Bool) {
    let tmp = Builtin.uadd_with_overflow_Int64(lhs._value, rhs._value, false._value)
    return (UInt(tmp.0), Bool(tmp.1))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 385)
  /// Subtract `lhs` and `rhs`, returning a result and a
  /// `Bool` that is `true` iff the operation caused an arithmetic
  /// overflow.
  @_transparent public
  static func subtractWithOverflow(_ lhs: UInt, _ rhs: UInt) -> (UInt, overflow: Bool) {
    let tmp = Builtin.usub_with_overflow_Int64(lhs._value, rhs._value, false._value)
    return (UInt(tmp.0), Bool(tmp.1))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 385)
  /// Multiply `lhs` and `rhs`, returning a result and a
  /// `Bool` that is `true` iff the operation caused an arithmetic
  /// overflow.
  @_transparent public
  static func multiplyWithOverflow(_ lhs: UInt, _ rhs: UInt) -> (UInt, overflow: Bool) {
    let tmp = Builtin.umul_with_overflow_Int64(lhs._value, rhs._value, false._value)
    return (UInt(tmp.0), Bool(tmp.1))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 394)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 396)
  /// Divide `lhs` and `rhs`, returning
  /// a result and a `Bool`
  /// that is `true` iff the operation caused an arithmetic overflow.
  @_transparent public
  static func divideWithOverflow(_ lhs: UInt, _ rhs: UInt) -> (UInt, overflow: Bool) {
    if rhs == 0 {
      return (0, true)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 409)
    // FIXME: currently doesn't detect overflow -- blocked by:
    // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
    let tmp = Builtin.udiv_Int64(lhs._value, rhs._value)
    return (UInt(tmp), false)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 396)
  /// Divide `lhs` and `rhs`, returning
  /// the remainder and a `Bool`
  /// that is `true` iff the operation caused an arithmetic overflow.
  @_transparent public
  static func remainderWithOverflow(_ lhs: UInt, _ rhs: UInt) -> (UInt, overflow: Bool) {
    if rhs == 0 {
      return (0, true)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 409)
    // FIXME: currently doesn't detect overflow -- blocked by:
    // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
    let tmp = Builtin.urem_Int64(lhs._value, rhs._value)
    return (UInt(tmp), false)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 415)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 417)
  /// Represent this number using Swift's widest native unsigned
  /// integer type.
  @_transparent public
  func toUIntMax() -> UIntMax {
    return UIntMax(self)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 424)
  /// Explicitly convert to `IntMax`, trapping on overflow (except in -Ounchecked builds).
  @_transparent public
  func toIntMax() -> IntMax {
    return IntMax(toUIntMax())
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 430)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 435)


// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 469)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt {

  @_transparent
  public init(_ value: UInt8) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.zext_Int8_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting UInt8 to UInt will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt8) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.zext_Int8_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt {

  @_transparent
  public init(_ value: Int8) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  let (tmp, signError) = Builtin.s_to_u_checked_conversion_Int8(src)
  result = (Builtin.sext_Int8_Int64(tmp), signError)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int8) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  let (tmp, signError) = Builtin.s_to_u_checked_conversion_Int8(src)
  result = (Builtin.sext_Int8_Int64(tmp), signError)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt {

  @_transparent
  public init(_ value: UInt16) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.zext_Int16_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting UInt16 to UInt will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt16) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.zext_Int16_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt {

  @_transparent
  public init(_ value: Int16) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  let (tmp, signError) = Builtin.s_to_u_checked_conversion_Int16(src)
  result = (Builtin.sext_Int16_Int64(tmp), signError)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int16) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  let (tmp, signError) = Builtin.s_to_u_checked_conversion_Int16(src)
  result = (Builtin.sext_Int16_Int64(tmp), signError)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt {

  @_transparent
  public init(_ value: UInt32) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.zext_Int32_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting UInt32 to UInt will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt32) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.zext_Int32_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt {

  @_transparent
  public init(_ value: Int32) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  let (tmp, signError) = Builtin.s_to_u_checked_conversion_Int32(src)
  result = (Builtin.sext_Int32_Int64(tmp), signError)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int32) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  let (tmp, signError) = Builtin.s_to_u_checked_conversion_Int32(src)
  result = (Builtin.sext_Int32_Int64(tmp), signError)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt {

  @_transparent
  public init(_ value: UInt64) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (src, false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting UInt64 to UInt will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt64) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (src, false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `UInt` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: UInt64) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 513)
    let dstNotWord = src
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt {

  @_transparent
  public init(_ value: Int64) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = Builtin.s_to_u_checked_conversion_Int64(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int64) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = Builtin.s_to_u_checked_conversion_Int64(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `UInt` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: Int64) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 513)
    let dstNotWord = src
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt {

  @_transparent
  public init(_ value: UInt) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (src, false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting UInt to UInt will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (src, false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension UInt {

  @_transparent
  public init(_ value: Int) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = Builtin.s_to_u_checked_conversion_Int64(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = Builtin.s_to_u_checked_conversion_Int64(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 524)

extension UInt {
// Construction of integers from floating point numbers.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 531)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 535)

  /// Creates a new instance by rounding the given floating-point value toward
  /// zero.
  ///
  /// - Parameter other: A floating-point value. When `other` is rounded toward
  ///   zero, the result must be within the range `UInt.min...UInt.max`.
  @_transparent
  public init(_ value: Float) {
    _precondition(value.isFinite,
      "Float value cannot be converted to UInt because it is either infinite or NaN")
    _precondition(value > -1.0,
      "Float value cannot be converted to UInt because the result would be less than UInt.min")
    _precondition(value < 18446744073709551616.0,
      "Float value cannot be converted to UInt because the result would be greater than UInt.max")
    self._value = Builtin.fptoui_FPIEEE32_Int64(value._value)
  }

  /// Creates a UInt whose value is `value`
  /// if no rounding is necessary, nil otherwise.
  @inline(__always)
  public init?(exactly value: Float) {
    self._value = Builtin.fptoui_FPIEEE32_Int64(value._value)
    if Float(self) != value {
      return nil
    }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 531)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 535)

  /// Creates a new instance by rounding the given floating-point value toward
  /// zero.
  ///
  /// - Parameter other: A floating-point value. When `other` is rounded toward
  ///   zero, the result must be within the range `UInt.min...UInt.max`.
  @_transparent
  public init(_ value: Double) {
    _precondition(value.isFinite,
      "Double value cannot be converted to UInt because it is either infinite or NaN")
    _precondition(value > -1.0,
      "Double value cannot be converted to UInt because the result would be less than UInt.min")
    _precondition(value < 18446744073709551616.0,
      "Double value cannot be converted to UInt because the result would be greater than UInt.max")
    self._value = Builtin.fptoui_FPIEEE64_Int64(value._value)
  }

  /// Creates a UInt whose value is `value`
  /// if no rounding is necessary, nil otherwise.
  @inline(__always)
  public init?(exactly value: Double) {
    self._value = Builtin.fptoui_FPIEEE64_Int64(value._value)
    if Double(self) != value {
      return nil
    }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 531)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 533)
#if !os(Windows) && (arch(i386) || arch(x86_64))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 535)

  /// Creates a new instance by rounding the given floating-point value toward
  /// zero.
  ///
  /// - Parameter other: A floating-point value. When `other` is rounded toward
  ///   zero, the result must be within the range `UInt.min...UInt.max`.
  @_transparent
  public init(_ value: Float80) {
    _precondition(value.isFinite,
      "Float80 value cannot be converted to UInt because it is either infinite or NaN")
    _precondition(value > -1.0,
      "Float80 value cannot be converted to UInt because the result would be less than UInt.min")
    _precondition(value < 18446744073709551616.0,
      "Float80 value cannot be converted to UInt because the result would be greater than UInt.max")
    self._value = Builtin.fptoui_FPIEEE80_Int64(value._value)
  }

  /// Creates a UInt whose value is `value`
  /// if no rounding is necessary, nil otherwise.
  @inline(__always)
  public init?(exactly value: Float80) {
    self._value = Builtin.fptoui_FPIEEE80_Int64(value._value)
    if Float80(self) != value {
      return nil
    }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 562)
#endif
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 565)

  /// Construct a `UInt` having the same memory representation as
  /// the `Int` `bitPattern`.  No range or overflow checking
  /// occurs, and the resulting `UInt` may not have the same numeric
  /// value as `bitPattern`--it is only guaranteed to use the same
  /// pattern of bits.
  @_transparent
  public init(bitPattern: Int) {
    self._value = bitPattern._value
  }
}

// Operations with potentially-static overflow checking
//
// FIXME: must use condfail in these operators, rather than
// overflowChecked, pending <rdar://problem/16271923> so that we don't
// foil static checking for numeric overflows.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 583)
@_transparent
public func + (lhs: UInt, rhs: UInt) -> UInt {
  let (result, error) = Builtin.uadd_with_overflow_Int64(
    lhs._value, rhs._value, true._value)
  // return overflowChecked((UInt(result), Bool(error)))
  Builtin.condfail(error)
  return UInt(result)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 583)
@_transparent
public func * (lhs: UInt, rhs: UInt) -> UInt {
  let (result, error) = Builtin.umul_with_overflow_Int64(
    lhs._value, rhs._value, true._value)
  // return overflowChecked((UInt(result), Bool(error)))
  Builtin.condfail(error)
  return UInt(result)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 583)
@_transparent
public func - (lhs: UInt, rhs: UInt) -> UInt {
  let (result, error) = Builtin.usub_with_overflow_Int64(
    lhs._value, rhs._value, true._value)
  // return overflowChecked((UInt(result), Bool(error)))
  Builtin.condfail(error)
  return UInt(result)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 592)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 594)
@_transparent
public func /(lhs: UInt, rhs: UInt) -> UInt {
  Builtin.condfail((rhs == 0)._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 600)
  // FIXME: currently doesn't detect overflow -- blocked by:
  // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
  let tmp = Builtin.udiv_Int64(lhs._value, rhs._value)
  return UInt(tmp)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 594)
@_transparent
public func %(lhs: UInt, rhs: UInt) -> UInt {
  Builtin.condfail((rhs == 0)._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 600)
  // FIXME: currently doesn't detect overflow -- blocked by:
  // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
  let tmp = Builtin.urem_Int64(lhs._value, rhs._value)
  return UInt(tmp)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 606)

// Bitwise negate
/// Returns the inverse of the bits set in the argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public prefix func ~ (rhs: UInt) -> UInt {
  let mask = UInt.subtractWithOverflow(0, 1).0
  return UInt(Builtin.xor_Int64(rhs._value, mask._value))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the two arguments have equal values.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func == (lhs: UInt, rhs: UInt) -> Bool {
  return Bool(Builtin.cmp_eq_Int64(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the two arguments have unequal values.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func != (lhs: UInt, rhs: UInt) -> Bool {
  return Bool(Builtin.cmp_ne_Int64(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is less than the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func < (lhs: UInt, rhs: UInt) -> Bool {
  return Bool(Builtin.cmp_ult_Int64(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is less than or equal to the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func <= (lhs: UInt, rhs: UInt) -> Bool {
  return Bool(Builtin.cmp_ule_Int64(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is greater than the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func > (lhs: UInt, rhs: UInt) -> Bool {
  return Bool(Builtin.cmp_ugt_Int64(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is greater than or equal to the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func >= (lhs: UInt, rhs: UInt) -> Bool {
  return Bool(Builtin.cmp_uge_Int64(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 634)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 636)
@_transparent
public func << (lhs: UInt, rhs: UInt) -> UInt {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 642)
  _precondition(rhs < UInt._sizeInBits,
      "shift amount is larger than type size in bits")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 645)
  return UInt(Builtin.shl_Int64(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 636)
@_transparent
public func >> (lhs: UInt, rhs: UInt) -> UInt {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 642)
  _precondition(rhs < UInt._sizeInBits,
      "shift amount is larger than type size in bits")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 645)
  return UInt(Builtin.lshr_Int64(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 648)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 654)
/// Returns the intersection of bits set in the two arguments.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func & (lhs: UInt, rhs: UInt) -> UInt {
  return UInt(Builtin.and_Int64(lhs._value, rhs._value))
}

/// Calculates the intersection of bits set in the two arguments
/// and stores the result in the first argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func &=(lhs: inout UInt, rhs: UInt) {
  lhs = lhs & rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 654)
/// Returns the bits that are set in exactly one of the two arguments.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func ^ (lhs: UInt, rhs: UInt) -> UInt {
  return UInt(Builtin.xor_Int64(lhs._value, rhs._value))
}

/// Calculates the bits that are set in exactly one of the two arguments
/// and stores the result in the first argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func ^=(lhs: inout UInt, rhs: UInt) {
  lhs = lhs ^ rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 654)
/// Returns the union of bits set in the two arguments.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func | (lhs: UInt, rhs: UInt) -> UInt {
  return UInt(Builtin.or_Int64(lhs._value, rhs._value))
}

/// Calculates the union of bits set in the two arguments
/// and stores the result in the first argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func |=(lhs: inout UInt, rhs: UInt) {
  lhs = lhs | rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 671)

// Bitwise operations
extension UInt : BitwiseOperations {
  /// The empty bitset of type `UInt`.
  @_transparent
  public static var allZeros: UInt { return 0 }
}

// Compound assignments
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func +=(lhs: inout UInt, rhs: UInt) {
  lhs = lhs + rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func -=(lhs: inout UInt, rhs: UInt) {
  lhs = lhs - rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func *=(lhs: inout UInt, rhs: UInt) {
  lhs = lhs * rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func <<=(lhs: inout UInt, rhs: UInt) {
  lhs = lhs << rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func >>=(lhs: inout UInt, rhs: UInt) {
  lhs = lhs >> rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 686)

// Create an ambiguity when indexing or slicing
// Range[OfStrideable]<UInt> outside a generic context.  See
// Range.swift for details.
extension UInt {
  public typealias _DisabledRangeIndex = UInt
}

// Prefix and postfix increment and decrement.

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public prefix func ++ (x: inout UInt) -> UInt {
  x = x + 1
  return x
}

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public postfix func ++ (x: inout UInt) -> UInt {
  let ret = x
  x = x + 1
  return ret
}

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public prefix func -- (x: inout UInt) -> UInt {
  x = x - 1
  return x
}

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public postfix func -- (x: inout UInt) -> UInt {
  let ret = x
  x = x - 1
  return ret
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 740)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 206)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 208)
/// A signed integer value type.
///
/// On 32-bit platforms, `Int` is the same size as `Int32`, and
/// on 64-bit platforms, `Int` is the same size as `Int64`.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 216)
@_fixed_layout
public struct Int
   : SignedInteger,
     Comparable, Equatable {
  public // @testable
  var _value: Builtin.Int64

  // FIXME: this declaration should be inferred.
  // <rdar://problem/18379938> Type checker refuses to use the default for
  // Int.Distance associated type

  /// Create an instance initialized to zero.
  @_transparent public
  init() {
    let maxWidthZero: IntMax = 0
    self._value = Builtin.truncOrBitCast_Int64_Int64(
       maxWidthZero._value)
  }

  @_transparent public
  init(_ _v: Builtin.Int64) {
    self._value = _v
  }

  @_transparent public
  init(_bits: Builtin.Int64) {
    self._value = _bits
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 246)
  @_transparent
  public // @testable
  init(_ _v: Builtin.Word) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 252)
    self._value = Builtin.zextOrBitCast_Word_Int64(_v)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 254)
  }

  @_transparent
  public // @testable
  var _builtinWordValue: Builtin.Word {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 262)
    return Builtin.truncOrBitCast_Int64_Word(_value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 264)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 266)


// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 269)
  /// Creates an integer from its big-endian representation, changing the
  /// byte order if necessary.
  @_transparent public
  init(bigEndian value: Int) {
#if _endian(big)
    self = value
#else
    self = Int(Builtin.int_bswap_Int64(value._value))
#endif
  }

  /// Creates an integer from its little-endian representation, changing the
  /// byte order if necessary.
  @_transparent public
  init(littleEndian value: Int) {
#if _endian(little)
    self = value
#else
    self = Int(Builtin.int_bswap_Int64(value._value))
#endif
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 291)

  @_transparent public
  init(_builtinIntegerLiteral value: Builtin.Int2048) {
    self = Int(Builtin.s_to_s_checked_trunc_Int2048_Int64(value).0)
  }

  /// Create an instance initialized to `value`.
  @_transparent public
  init(integerLiteral value: Int) {
    self = value
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 304)
  /// Returns the big-endian representation of the integer, changing the
  /// byte order if necessary.
  public var bigEndian: Int {
#if _endian(big)
    return self
#else
    return Int(Builtin.int_bswap_Int64(_value))
#endif
  }
  /// Returns the little-endian representation of the integer, changing the
  /// byte order if necessary.
  public var littleEndian: Int {
#if _endian(little)
    return self
#else
    return Int(Builtin.int_bswap_Int64(_value))
#endif
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 323)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 325)
  /// Returns the current integer with the byte order swapped.
  public var byteSwapped: Int {
    return Int(Builtin.int_bswap_Int64(_value))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 330)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 332)
  @_transparent public
  static var max: Int { return 0x7FFF_FFFF_FFFF_FFFF }
  @_transparent public
  static var min: Int { return -0x7FFF_FFFF_FFFF_FFFF-1 }
  @_transparent
  public static var _sizeInBits: Int { return 64 }
  public static var _sizeInBytes: Int { return 64/8 }
}

extension Int : Hashable {
  /// The hash value.
  ///
  /// **Axiom:** `x == y` implies `x.hashValue == y.hashValue`.
  ///
  /// - Note: The hash value is not guaranteed to be stable across
  ///   different invocations of the same program.  Do not persist the
  ///   hash value across program runs.
  public var hashValue: Int {
    @inline(__always)
    get {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 353)
      // Sign extend the value.
      return Int(self)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 366)
    }
  }
}

extension Int : CustomStringConvertible {
  /// A textual representation of `self`.
  public var description: String {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 374)
    return _int64ToString(self.toIntMax())
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 378)
  }
}

// Operations that return an overflow bit in addition to a partial result,
// helpful for checking for overflow when you want to handle it.
extension Int {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 385)
  /// Add `lhs` and `rhs`, returning a result and a
  /// `Bool` that is `true` iff the operation caused an arithmetic
  /// overflow.
  @_transparent public
  static func addWithOverflow(_ lhs: Int, _ rhs: Int) -> (Int, overflow: Bool) {
    let tmp = Builtin.sadd_with_overflow_Int64(lhs._value, rhs._value, false._value)
    return (Int(tmp.0), Bool(tmp.1))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 385)
  /// Subtract `lhs` and `rhs`, returning a result and a
  /// `Bool` that is `true` iff the operation caused an arithmetic
  /// overflow.
  @_transparent public
  static func subtractWithOverflow(_ lhs: Int, _ rhs: Int) -> (Int, overflow: Bool) {
    let tmp = Builtin.ssub_with_overflow_Int64(lhs._value, rhs._value, false._value)
    return (Int(tmp.0), Bool(tmp.1))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 385)
  /// Multiply `lhs` and `rhs`, returning a result and a
  /// `Bool` that is `true` iff the operation caused an arithmetic
  /// overflow.
  @_transparent public
  static func multiplyWithOverflow(_ lhs: Int, _ rhs: Int) -> (Int, overflow: Bool) {
    let tmp = Builtin.smul_with_overflow_Int64(lhs._value, rhs._value, false._value)
    return (Int(tmp.0), Bool(tmp.1))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 394)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 396)
  /// Divide `lhs` and `rhs`, returning
  /// a result and a `Bool`
  /// that is `true` iff the operation caused an arithmetic overflow.
  @_transparent public
  static func divideWithOverflow(_ lhs: Int, _ rhs: Int) -> (Int, overflow: Bool) {
    if rhs == 0 {
      return (0, true)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 405)
    if lhs == Int.min && rhs == -1 {
      return (0, true)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 409)
    // FIXME: currently doesn't detect overflow -- blocked by:
    // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
    let tmp = Builtin.sdiv_Int64(lhs._value, rhs._value)
    return (Int(tmp), false)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 396)
  /// Divide `lhs` and `rhs`, returning
  /// the remainder and a `Bool`
  /// that is `true` iff the operation caused an arithmetic overflow.
  @_transparent public
  static func remainderWithOverflow(_ lhs: Int, _ rhs: Int) -> (Int, overflow: Bool) {
    if rhs == 0 {
      return (0, true)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 405)
    if lhs == Int.min && rhs == -1 {
      return (0, true)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 409)
    // FIXME: currently doesn't detect overflow -- blocked by:
    // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
    let tmp = Builtin.srem_Int64(lhs._value, rhs._value)
    return (Int(tmp), false)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 415)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 417)
  /// Represent this number using Swift's widest native signed
  /// integer type.
  @_transparent public
  func toIntMax() -> IntMax {
    return IntMax(self)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 430)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 433)
extension Int : SignedNumber {}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 435)


// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 469)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int {

  @_transparent
  public init(_ value: UInt8) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.zext_Int8_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting UInt8 to Int will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt8) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.zext_Int8_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int {

  @_transparent
  public init(_ value: Int8) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.sext_Int8_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting Int8 to Int will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int8) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.sext_Int8_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int {

  @_transparent
  public init(_ value: UInt16) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.zext_Int16_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting UInt16 to Int will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt16) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.zext_Int16_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int {

  @_transparent
  public init(_ value: Int16) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.sext_Int16_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting Int16 to Int will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int16) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.sext_Int16_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int {

  @_transparent
  public init(_ value: UInt32) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.zext_Int32_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting UInt32 to Int will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt32) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.zext_Int32_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int {

  @_transparent
  public init(_ value: Int32) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.sext_Int32_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting Int32 to Int will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int32) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (Builtin.sext_Int32_Int64(src), false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int {

  @_transparent
  public init(_ value: UInt64) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = Builtin.u_to_s_checked_conversion_Int64(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt64) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = Builtin.u_to_s_checked_conversion_Int64(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `Int` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: UInt64) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 513)
    let dstNotWord = src
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int {

  @_transparent
  public init(_ value: Int64) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (src, false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting Int64 to Int will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int64) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (src, false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 503)
  /// Construct a `Int` having the same bitwise representation as
  /// the least significant bits of the provided bit pattern.
  ///
  /// No range or overflow checking occurs.
  @_transparent
  public init(truncatingBitPattern: Int64) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 510)
    let src = truncatingBitPattern._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 513)
    let dstNotWord = src
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 518)
    self._value = dstNotWord
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int {

  @_transparent
  public init(_ value: UInt) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = Builtin.u_to_s_checked_conversion_Int64(src)
  Builtin.condfail(result.error)
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 486)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: UInt) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = Builtin.u_to_s_checked_conversion_Int64(src)
  if Bool(result.error) == true { return nil }
  self._value = result.value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 499)

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 476)

extension Int {

  @_transparent
  public init(_ value: Int) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (src, false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 490)
  @available(*, message: "Converting Int to Int will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 492)
  @_transparent
  public init?(exactly value: Int) {
    
  let src = value._value
  let result: (value: Builtin.Int64, error: Builtin.Int1)
  result = (src, false._value)
  self._value = result.value

  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 522)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 524)

extension Int {
// Construction of integers from floating point numbers.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 531)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 535)

  /// Creates a new instance by rounding the given floating-point value toward
  /// zero.
  ///
  /// - Parameter other: A floating-point value. When `other` is rounded toward
  ///   zero, the result must be within the range `Int.min...Int.max`.
  @_transparent
  public init(_ value: Float) {
    _precondition(value.isFinite,
      "Float value cannot be converted to Int because it is either infinite or NaN")
    _precondition(value > -9223373136366403584.0,
      "Float value cannot be converted to Int because the result would be less than Int.min")
    _precondition(value < 9223372036854775808.0,
      "Float value cannot be converted to Int because the result would be greater than Int.max")
    self._value = Builtin.fptosi_FPIEEE32_Int64(value._value)
  }

  /// Creates a Int whose value is `value`
  /// if no rounding is necessary, nil otherwise.
  @inline(__always)
  public init?(exactly value: Float) {
    self._value = Builtin.fptosi_FPIEEE32_Int64(value._value)
    if Float(self) != value {
      return nil
    }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 531)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 535)

  /// Creates a new instance by rounding the given floating-point value toward
  /// zero.
  ///
  /// - Parameter other: A floating-point value. When `other` is rounded toward
  ///   zero, the result must be within the range `Int.min...Int.max`.
  @_transparent
  public init(_ value: Double) {
    _precondition(value.isFinite,
      "Double value cannot be converted to Int because it is either infinite or NaN")
    _precondition(value > -9223372036854777856.0,
      "Double value cannot be converted to Int because the result would be less than Int.min")
    _precondition(value < 9223372036854775808.0,
      "Double value cannot be converted to Int because the result would be greater than Int.max")
    self._value = Builtin.fptosi_FPIEEE64_Int64(value._value)
  }

  /// Creates a Int whose value is `value`
  /// if no rounding is necessary, nil otherwise.
  @inline(__always)
  public init?(exactly value: Double) {
    self._value = Builtin.fptosi_FPIEEE64_Int64(value._value)
    if Double(self) != value {
      return nil
    }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 531)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 533)
#if !os(Windows) && (arch(i386) || arch(x86_64))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 535)

  /// Creates a new instance by rounding the given floating-point value toward
  /// zero.
  ///
  /// - Parameter other: A floating-point value. When `other` is rounded toward
  ///   zero, the result must be within the range `Int.min...Int.max`.
  @_transparent
  public init(_ value: Float80) {
    _precondition(value.isFinite,
      "Float80 value cannot be converted to Int because it is either infinite or NaN")
    _precondition(value > -9223372036854775809.0,
      "Float80 value cannot be converted to Int because the result would be less than Int.min")
    _precondition(value < 9223372036854775808.0,
      "Float80 value cannot be converted to Int because the result would be greater than Int.max")
    self._value = Builtin.fptosi_FPIEEE80_Int64(value._value)
  }

  /// Creates a Int whose value is `value`
  /// if no rounding is necessary, nil otherwise.
  @inline(__always)
  public init?(exactly value: Float80) {
    self._value = Builtin.fptosi_FPIEEE80_Int64(value._value)
    if Float80(self) != value {
      return nil
    }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 562)
#endif
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 565)

  /// Construct a `Int` having the same memory representation as
  /// the `UInt` `bitPattern`.  No range or overflow checking
  /// occurs, and the resulting `Int` may not have the same numeric
  /// value as `bitPattern`--it is only guaranteed to use the same
  /// pattern of bits.
  @_transparent
  public init(bitPattern: UInt) {
    self._value = bitPattern._value
  }
}

// Operations with potentially-static overflow checking
//
// FIXME: must use condfail in these operators, rather than
// overflowChecked, pending <rdar://problem/16271923> so that we don't
// foil static checking for numeric overflows.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 583)
@_transparent
public func + (lhs: Int, rhs: Int) -> Int {
  let (result, error) = Builtin.sadd_with_overflow_Int64(
    lhs._value, rhs._value, true._value)
  // return overflowChecked((Int(result), Bool(error)))
  Builtin.condfail(error)
  return Int(result)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 583)
@_transparent
public func * (lhs: Int, rhs: Int) -> Int {
  let (result, error) = Builtin.smul_with_overflow_Int64(
    lhs._value, rhs._value, true._value)
  // return overflowChecked((Int(result), Bool(error)))
  Builtin.condfail(error)
  return Int(result)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 583)
@_transparent
public func - (lhs: Int, rhs: Int) -> Int {
  let (result, error) = Builtin.ssub_with_overflow_Int64(
    lhs._value, rhs._value, true._value)
  // return overflowChecked((Int(result), Bool(error)))
  Builtin.condfail(error)
  return Int(result)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 592)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 594)
@_transparent
public func /(lhs: Int, rhs: Int) -> Int {
  Builtin.condfail((rhs == 0)._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 598)
  Builtin.condfail(((lhs == Int.min) && (rhs == -1))._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 600)
  // FIXME: currently doesn't detect overflow -- blocked by:
  // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
  let tmp = Builtin.sdiv_Int64(lhs._value, rhs._value)
  return Int(tmp)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 594)
@_transparent
public func %(lhs: Int, rhs: Int) -> Int {
  Builtin.condfail((rhs == 0)._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 598)
  Builtin.condfail(((lhs == Int.min) && (rhs == -1))._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 600)
  // FIXME: currently doesn't detect overflow -- blocked by:
  // <rdar://15735295> Need [su]{div,rem}_with_overflow IR
  let tmp = Builtin.srem_Int64(lhs._value, rhs._value)
  return Int(tmp)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 606)

// Bitwise negate
/// Returns the inverse of the bits set in the argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public prefix func ~ (rhs: Int) -> Int {
  let mask = Int.subtractWithOverflow(0, 1).0
  return Int(Builtin.xor_Int64(rhs._value, mask._value))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the two arguments have equal values.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func == (lhs: Int, rhs: Int) -> Bool {
  return Bool(Builtin.cmp_eq_Int64(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the two arguments have unequal values.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func != (lhs: Int, rhs: Int) -> Bool {
  return Bool(Builtin.cmp_ne_Int64(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is less than the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func < (lhs: Int, rhs: Int) -> Bool {
  return Bool(Builtin.cmp_slt_Int64(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is less than or equal to the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func <= (lhs: Int, rhs: Int) -> Bool {
  return Bool(Builtin.cmp_sle_Int64(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is greater than the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func > (lhs: Int, rhs: Int) -> Bool {
  return Bool(Builtin.cmp_sgt_Int64(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 625)
/// Returns a Boolean value that indicates whether
/// the first argument is greater than or equal to the second argument.
///
/// - SeeAlso: `Equatable`, `Comparable`
@_transparent
public func >= (lhs: Int, rhs: Int) -> Bool {
  return Bool(Builtin.cmp_sge_Int64(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 634)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 636)
@_transparent
public func << (lhs: Int, rhs: Int) -> Int {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 639)
  _precondition(UInt(rhs) < UInt._sizeInBits,
      "shift amount is larger than type size in bits")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 645)
  return Int(Builtin.shl_Int64(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 636)
@_transparent
public func >> (lhs: Int, rhs: Int) -> Int {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 639)
  _precondition(UInt(rhs) < UInt._sizeInBits,
      "shift amount is larger than type size in bits")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 645)
  return Int(Builtin.ashr_Int64(lhs._value, rhs._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 648)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 654)
/// Returns the intersection of bits set in the two arguments.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func & (lhs: Int, rhs: Int) -> Int {
  return Int(Builtin.and_Int64(lhs._value, rhs._value))
}

/// Calculates the intersection of bits set in the two arguments
/// and stores the result in the first argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func &=(lhs: inout Int, rhs: Int) {
  lhs = lhs & rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 654)
/// Returns the bits that are set in exactly one of the two arguments.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func ^ (lhs: Int, rhs: Int) -> Int {
  return Int(Builtin.xor_Int64(lhs._value, rhs._value))
}

/// Calculates the bits that are set in exactly one of the two arguments
/// and stores the result in the first argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func ^=(lhs: inout Int, rhs: Int) {
  lhs = lhs ^ rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 654)
/// Returns the union of bits set in the two arguments.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func | (lhs: Int, rhs: Int) -> Int {
  return Int(Builtin.or_Int64(lhs._value, rhs._value))
}

/// Calculates the union of bits set in the two arguments
/// and stores the result in the first argument.
///
/// - SeeAlso: `BitwiseOperations`
@_transparent
public func |=(lhs: inout Int, rhs: Int) {
  lhs = lhs | rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 671)

// Bitwise operations
extension Int : BitwiseOperations {
  /// The empty bitset of type `Int`.
  @_transparent
  public static var allZeros: Int { return 0 }
}

// Compound assignments
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func +=(lhs: inout Int, rhs: Int) {
  lhs = lhs + rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func -=(lhs: inout Int, rhs: Int) {
  lhs = lhs - rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func *=(lhs: inout Int, rhs: Int) {
  lhs = lhs * rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func <<=(lhs: inout Int, rhs: Int) {
  lhs = lhs << rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 681)
@_transparent
public func >>=(lhs: inout Int, rhs: Int) {
  lhs = lhs >> rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 686)

// Create an ambiguity when indexing or slicing
// Range[OfStrideable]<Int> outside a generic context.  See
// Range.swift for details.
extension Int {
  public typealias _DisabledRangeIndex = Int
}

// Prefix and postfix increment and decrement.

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public prefix func ++ (x: inout Int) -> Int {
  x = x + 1
  return x
}

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public postfix func ++ (x: inout Int) -> Int {
  let ret = x
  x = x + 1
  return ret
}

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public prefix func -- (x: inout Int) -> Int {
  x = x - 1
  return x
}

@_transparent
@available(*, unavailable, message: "it has been removed in Swift 3")
@discardableResult
public postfix func -- (x: inout Int) -> Int {
  let ret = x
  x = x - 1
  return ret
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 731)
// TODO: Consider removing the underscore.
/// Returns the argument and specifies that the value is not negative.
/// It has only an effect if the argument is a load or call.
@_transparent
public func _assumeNonNegative(_ x: Int) -> Int {
  _sanityCheck(x >= 0)
  return Int(Builtin.assumeNonNegative_Int64(x._value))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 740)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 742)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 745)
@_transparent
public func _leadingZeros(_ x: Builtin.Int8) -> Builtin.Int8 {
  return Builtin.int_ctlz_Int8(x, true._value)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 745)
@_transparent
public func _leadingZeros(_ x: Builtin.Int16) -> Builtin.Int16 {
  return Builtin.int_ctlz_Int16(x, true._value)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 745)
@_transparent
public func _leadingZeros(_ x: Builtin.Int32) -> Builtin.Int32 {
  return Builtin.int_ctlz_Int32(x, true._value)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 745)
@_transparent
public func _leadingZeros(_ x: Builtin.Int64) -> Builtin.Int64 {
  return Builtin.int_ctlz_Int64(x, true._value)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 745)
@_transparent
public func _leadingZeros(_ x: Builtin.Int128) -> Builtin.Int128 {
  return Builtin.int_ctlz_Int128(x, true._value)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FixedPoint.swift.gyb", line: 750)

//===--- End loop over all integer types ----------------------------------===//

internal func _unsafePlus(_ lhs: Int, _ rhs: Int) -> Int {
#if INTERNAL_CHECKS_ENABLED
  return lhs + rhs
#else
  return lhs &+ rhs
#endif
}

internal func _unsafeMinus(_ lhs: Int, _ rhs: Int) -> Int {
#if INTERNAL_CHECKS_ENABLED
  return lhs - rhs
#else
  return lhs &- rhs
#endif
}

internal func _unsafeMultiply(_ lhs: Int, _ rhs: Int) -> Int {
#if INTERNAL_CHECKS_ENABLED
  return lhs * rhs
#else
  return lhs &* rhs
#endif
}

@available(*, unavailable, renamed: "Integer")
public typealias IntegerType = Integer

@available(*, unavailable, renamed: "SignedInteger")
public typealias SignedIntegerType = SignedInteger

@available(*, unavailable, renamed: "UnsignedInteger")
public typealias UnsignedIntegerType = UnsignedInteger

// Local Variables:
// eval: (read-only-mode 1)
// End:
