// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerArithmetic.swift.gyb", line: 1)
//===--- IntegerArithmetic.swift.gyb --------------------------*- swift -*-===//
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
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerArithmetic.swift.gyb", line: 13)

// Automatically Generated From IntegerArithmetic.swift.gyb.  Do Not Edit
// Directly!

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerArithmetic.swift.gyb", line: 26)

/// This protocol is an implementation detail of `IntegerArithmetic`; do
/// not use it directly.
///
/// Its requirements are inherited by `IntegerArithmetic` and thus must
/// be satisfied by types conforming to that protocol.
@_show_in_interface
public protocol _IntegerArithmetic {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerArithmetic.swift.gyb", line: 35)
  /// Adds `lhs` and `rhs`, returning the result and a `Bool` that is
  /// `true` iff the operation caused an arithmetic overflow.
  static func addWithOverflow(_ lhs: Self, _ rhs: Self) -> (Self, overflow: Bool)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerArithmetic.swift.gyb", line: 35)
  /// Subtracts `lhs` and `rhs`, returning the result and a `Bool` that is
  /// `true` iff the operation caused an arithmetic overflow.
  static func subtractWithOverflow(_ lhs: Self, _ rhs: Self) -> (Self, overflow: Bool)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerArithmetic.swift.gyb", line: 35)
  /// Multiplies `lhs` and `rhs`, returning the result and a `Bool` that is
  /// `true` iff the operation caused an arithmetic overflow.
  static func multiplyWithOverflow(_ lhs: Self, _ rhs: Self) -> (Self, overflow: Bool)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerArithmetic.swift.gyb", line: 35)
  /// Divides `lhs` and `rhs`, returning the result and a `Bool` that is
  /// `true` iff the operation caused an arithmetic overflow.
  static func divideWithOverflow(_ lhs: Self, _ rhs: Self) -> (Self, overflow: Bool)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerArithmetic.swift.gyb", line: 35)
  /// Divides `lhs` and `rhs`, returning the remainder and a `Bool` that is
  /// `true` iff the operation caused an arithmetic overflow.
  static func remainderWithOverflow(_ lhs: Self, _ rhs: Self) -> (Self, overflow: Bool)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerArithmetic.swift.gyb", line: 39)
}

/// The common requirements for types that support integer arithmetic.
public protocol IntegerArithmetic : _IntegerArithmetic, Comparable {
  // Checked arithmetic functions.  Specific implementations in
  // FixedPoint.swift.gyb support static checking for integer types.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerArithmetic.swift.gyb", line: 46)
  /// Adds `lhs` and `rhs`, returning the result and trapping in case of
  /// arithmetic overflow (except in -Ounchecked builds).
  static func + (lhs: Self, rhs: Self) -> Self
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerArithmetic.swift.gyb", line: 46)
  /// Subtracts `lhs` and `rhs`, returning the result and trapping in case of
  /// arithmetic overflow (except in -Ounchecked builds).
  static func - (lhs: Self, rhs: Self) -> Self
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerArithmetic.swift.gyb", line: 46)
  /// Multiplies `lhs` and `rhs`, returning the result and trapping in case of
  /// arithmetic overflow (except in -Ounchecked builds).
  static func * (lhs: Self, rhs: Self) -> Self
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerArithmetic.swift.gyb", line: 46)
  /// Divides `lhs` and `rhs`, returning the result and trapping in case of
  /// arithmetic overflow (except in -Ounchecked builds).
  static func / (lhs: Self, rhs: Self) -> Self
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerArithmetic.swift.gyb", line: 46)
  /// Divides `lhs` and `rhs`, returning the remainder and trapping in case of
  /// arithmetic overflow (except in -Ounchecked builds).
  static func % (lhs: Self, rhs: Self) -> Self
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerArithmetic.swift.gyb", line: 50)

  /// Explicitly convert to `IntMax`, trapping on overflow (except in
  /// -Ounchecked builds).
  func toIntMax() -> IntMax
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerArithmetic.swift.gyb", line: 57)
/// Adds `lhs` and `rhs`, returning the result and trapping in case of
/// arithmetic overflow (except in -Ounchecked builds).
@_transparent
public func + <T : _IntegerArithmetic>(lhs: T, rhs: T) -> T {
  return _overflowChecked(T.addWithOverflow(lhs, rhs))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerArithmetic.swift.gyb", line: 65)
/// Adds `lhs` and `rhs`, silently discarding any overflow.
@_transparent
public func &+ <T : _IntegerArithmetic>(lhs: T, rhs: T) -> T {
  return T.addWithOverflow(lhs, rhs).0
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerArithmetic.swift.gyb", line: 71)

/// Adds `lhs` and `rhs` and stores the result in `lhs`, trapping in
/// case of arithmetic overflow (except in -Ounchecked builds).
@_transparent
public func += <T : _IntegerArithmetic>(lhs: inout T, rhs: T) {
  lhs = lhs + rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerArithmetic.swift.gyb", line: 57)
/// Subtracts `lhs` and `rhs`, returning the result and trapping in case of
/// arithmetic overflow (except in -Ounchecked builds).
@_transparent
public func - <T : _IntegerArithmetic>(lhs: T, rhs: T) -> T {
  return _overflowChecked(T.subtractWithOverflow(lhs, rhs))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerArithmetic.swift.gyb", line: 65)
/// Subtracts `lhs` and `rhs`, silently discarding any overflow.
@_transparent
public func &- <T : _IntegerArithmetic>(lhs: T, rhs: T) -> T {
  return T.subtractWithOverflow(lhs, rhs).0
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerArithmetic.swift.gyb", line: 71)

/// Subtracts `lhs` and `rhs` and stores the result in `lhs`, trapping in
/// case of arithmetic overflow (except in -Ounchecked builds).
@_transparent
public func -= <T : _IntegerArithmetic>(lhs: inout T, rhs: T) {
  lhs = lhs - rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerArithmetic.swift.gyb", line: 57)
/// Multiplies `lhs` and `rhs`, returning the result and trapping in case of
/// arithmetic overflow (except in -Ounchecked builds).
@_transparent
public func * <T : _IntegerArithmetic>(lhs: T, rhs: T) -> T {
  return _overflowChecked(T.multiplyWithOverflow(lhs, rhs))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerArithmetic.swift.gyb", line: 65)
/// Multiplies `lhs` and `rhs`, silently discarding any overflow.
@_transparent
public func &* <T : _IntegerArithmetic>(lhs: T, rhs: T) -> T {
  return T.multiplyWithOverflow(lhs, rhs).0
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerArithmetic.swift.gyb", line: 71)

/// Multiplies `lhs` and `rhs` and stores the result in `lhs`, trapping in
/// case of arithmetic overflow (except in -Ounchecked builds).
@_transparent
public func *= <T : _IntegerArithmetic>(lhs: inout T, rhs: T) {
  lhs = lhs * rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerArithmetic.swift.gyb", line: 57)
/// Divides `lhs` and `rhs`, returning the result and trapping in case of
/// arithmetic overflow (except in -Ounchecked builds).
@_transparent
public func / <T : _IntegerArithmetic>(lhs: T, rhs: T) -> T {
  return _overflowChecked(T.divideWithOverflow(lhs, rhs))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerArithmetic.swift.gyb", line: 71)

/// Divides `lhs` and `rhs` and stores the result in `lhs`, trapping in
/// case of arithmetic overflow (except in -Ounchecked builds).
@_transparent
public func /= <T : _IntegerArithmetic>(lhs: inout T, rhs: T) {
  lhs = lhs / rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerArithmetic.swift.gyb", line: 57)
/// Divides `lhs` and `rhs`, returning the remainder and trapping in case of
/// arithmetic overflow (except in -Ounchecked builds).
@_transparent
public func % <T : _IntegerArithmetic>(lhs: T, rhs: T) -> T {
  return _overflowChecked(T.remainderWithOverflow(lhs, rhs))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerArithmetic.swift.gyb", line: 71)

/// Divides `lhs` and `rhs` and stores the remainder in `lhs`, trapping in
/// case of arithmetic overflow (except in -Ounchecked builds).
@_transparent
public func %= <T : _IntegerArithmetic>(lhs: inout T, rhs: T) {
  lhs = lhs % rhs
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/IntegerArithmetic.swift.gyb", line: 79)

//===--- SignedNumber -----------------------------------------------------===//
// A numeric type that supports abs(x), +x and -x
//===----------------------------------------------------------------------===//

// SignedNumber itself contains only operator requirements having
// default implementations on the base protocol.
/// Instances of conforming types can be subtracted, arithmetically
/// negated, and initialized from `0`.
///
/// Axioms:
///
/// - `x - 0 == x`
/// - `-x == 0 - x`
/// - `-(-x) == x`
public protocol SignedNumber : Comparable, ExpressibleByIntegerLiteral {
  /// Returns the result of negating `x`.
  static prefix func - (x: Self) -> Self

  /// Returns the difference between `lhs` and `rhs`.
  static func - (lhs: Self, rhs: Self) -> Self

  // Do not use this operator directly; call abs(x) instead
  static func ~> (_:Self,_:(_Abs, ())) -> Self
}

// Unary negation in terms of subtraction.  This is a default
// implementation; models of SignedNumber can provide their own
// implementations.
@_transparent
public prefix func - <T : SignedNumber>(x: T) -> T {
  return 0 - x
}

// Unary +
@_transparent
public prefix func + <T : SignedNumber>(x: T) -> T {
  return x
}

//===--- abs(x) -----------------------------------------------------------===//
public struct _Abs {}

@_versioned
internal func _abs<Args>(_ args: Args) -> (_Abs, Args) {
  return (_Abs(), args)
}

// Do not use this operator directly; call abs(x) instead
@_transparent
public func ~> <T : SignedNumber>(x:T,_:(_Abs, ())) -> T {
  return x < 0 ? -x : x
}

// FIXME: should this be folded into SignedNumber?
/// A type that supports an "absolute value" function.
public protocol AbsoluteValuable : SignedNumber {
  /// Returns the absolute value of `x`.
  static func abs(_ x: Self) -> Self
}

// Do not use this operator directly; call abs(x) instead
@_transparent
public func ~> <T : AbsoluteValuable>(x:T,_:(_Abs, ())) -> T {
  return T.abs(x)
}

/// Returns the absolute value of `x`.
///
/// Concrete instances of `SignedNumber` can specialize this
/// function by conforming to `AbsoluteValuable`.
@_transparent
public func abs<T : SignedNumber>(_ x: T) -> T {
  return x~>_abs()
}

@available(*, unavailable, renamed: "IntegerArithmetic")
public typealias IntegerArithmeticType = IntegerArithmetic

@available(*, unavailable, renamed: "SignedNumber")
public typealias SignedNumberType = SignedNumber

// Local Variables:
// eval: (read-only-mode 1)
// End:
