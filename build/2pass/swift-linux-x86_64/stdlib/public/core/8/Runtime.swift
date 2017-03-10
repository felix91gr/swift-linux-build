// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 1)
//===----------------------------------------------------------*- swift -*-===//
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
///
/// This file contains Swift wrappers for functions defined in the C++ runtime.
///
//===----------------------------------------------------------------------===//

import SwiftShims

//===----------------------------------------------------------------------===//
// Atomics
//===----------------------------------------------------------------------===//

public typealias _PointerToPointer = UnsafeMutablePointer<UnsafeRawPointer?>

@_transparent
public // @testable
func _stdlib_atomicCompareExchangeStrongPtr(
  object target: _PointerToPointer,
  expected: _PointerToPointer,
  desired: UnsafeRawPointer?) -> Bool {

  // We use Builtin.Word here because Builtin.RawPointer can't be nil.
  let (oldValue, won) = Builtin.cmpxchg_seqcst_seqcst_Word(
    target._rawValue,
    UInt(bitPattern: expected.pointee)._builtinWordValue,
    UInt(bitPattern: desired)._builtinWordValue)
  expected.pointee = UnsafeRawPointer(bitPattern: Int(oldValue))
  return Bool(won)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 42)
/// Atomic compare and exchange of `UnsafeMutablePointer<T>` with sequentially
/// consistent memory ordering.  Precise semantics are defined in C++11 or C11.
///
/// - Warning: This operation is extremely tricky to use correctly because of
///   writeback semantics.
///
/// It is best to use it directly on an
/// `UnsafeMutablePointer<UnsafeMutablePointer<T>>` that is known to point
/// directly to the memory where the value is stored.
///
/// In a call like this:
///
///     _stdlib_atomicCompareExchangeStrongPtr(&foo.property1.property2, ...)
///
/// you need to manually make sure that:
///
/// - all properties in the chain are physical (to make sure that no writeback
///   happens; the compare-and-exchange instruction should operate on the
///   shared memory); and
///
/// - the shared memory that you are accessing is located inside a heap
///   allocation (a class instance property, a `_HeapBuffer`, a pointer to
///   an `Array` element etc.)
///
/// If the conditions above are not met, the code will still compile, but the
/// compare-and-exchange instruction will operate on the writeback buffer, and
/// you will get a *race* while doing writeback into shared memory.
@_transparent
public // @testable
func _stdlib_atomicCompareExchangeStrongPtr<T>(
  object target: UnsafeMutablePointer<UnsafeMutablePointer<T>>,
  expected: UnsafeMutablePointer<UnsafeMutablePointer<T>>,
  desired: UnsafeMutablePointer<T>) -> Bool {
  return _stdlib_atomicCompareExchangeStrongPtr(
    object: unsafeBitCast(target, to: _PointerToPointer.self),
    expected: unsafeBitCast(expected, to: _PointerToPointer.self),
    desired: unsafeBitCast(desired, to: Optional<UnsafeRawPointer>.self))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 42)
/// Atomic compare and exchange of `UnsafeMutablePointer<T>` with sequentially
/// consistent memory ordering.  Precise semantics are defined in C++11 or C11.
///
/// - Warning: This operation is extremely tricky to use correctly because of
///   writeback semantics.
///
/// It is best to use it directly on an
/// `UnsafeMutablePointer<UnsafeMutablePointer<T>>` that is known to point
/// directly to the memory where the value is stored.
///
/// In a call like this:
///
///     _stdlib_atomicCompareExchangeStrongPtr(&foo.property1.property2, ...)
///
/// you need to manually make sure that:
///
/// - all properties in the chain are physical (to make sure that no writeback
///   happens; the compare-and-exchange instruction should operate on the
///   shared memory); and
///
/// - the shared memory that you are accessing is located inside a heap
///   allocation (a class instance property, a `_HeapBuffer`, a pointer to
///   an `Array` element etc.)
///
/// If the conditions above are not met, the code will still compile, but the
/// compare-and-exchange instruction will operate on the writeback buffer, and
/// you will get a *race* while doing writeback into shared memory.
@_transparent
public // @testable
func _stdlib_atomicCompareExchangeStrongPtr<T>(
  object target: UnsafeMutablePointer<UnsafeMutablePointer<T>?>,
  expected: UnsafeMutablePointer<UnsafeMutablePointer<T>?>,
  desired: UnsafeMutablePointer<T>?) -> Bool {
  return _stdlib_atomicCompareExchangeStrongPtr(
    object: unsafeBitCast(target, to: _PointerToPointer.self),
    expected: unsafeBitCast(expected, to: _PointerToPointer.self),
    desired: unsafeBitCast(desired, to: Optional<UnsafeRawPointer>.self))
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 81)

@_transparent
@discardableResult
public // @testable
func _stdlib_atomicInitializeARCRef(
  object target: UnsafeMutablePointer<AnyObject?>,
  desired: AnyObject) -> Bool {
  var expected: UnsafeRawPointer?
  let desiredPtr = Unmanaged.passRetained(desired).toOpaque()
  let wonRace = _stdlib_atomicCompareExchangeStrongPtr(
    object: unsafeBitCast(target, to: _PointerToPointer.self),
    expected: &expected,
    desired: desiredPtr)
  if !wonRace {
    // Some other thread initialized the value.  Balance the retain that we
    // performed on 'desired'.
    Unmanaged.passUnretained(desired).release()
  }
  return wonRace
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 103)

@_transparent
public // @testable
func _stdlib_atomicCompareExchangeStrongUInt32(
  object target: UnsafeMutablePointer<UInt32>,
  expected: UnsafeMutablePointer<UInt32>,
  desired: UInt32) -> Bool {

  let (oldValue, won) = Builtin.cmpxchg_seqcst_seqcst_Int32(
    target._rawValue, expected.pointee._value, desired._value)
  expected.pointee._value = oldValue
  return Bool(won)
}

@_transparent
public // @testable
func _stdlib_atomicCompareExchangeStrongInt32(
  object target: UnsafeMutablePointer<Int32>,
  expected: UnsafeMutablePointer<Int32>,
  desired: Int32) -> Bool {

  let (oldValue, won) = Builtin.cmpxchg_seqcst_seqcst_Int32(
    target._rawValue, expected.pointee._value, desired._value)
  expected.pointee._value = oldValue
  return Bool(won)
}

@_transparent
public // @testable
func _swift_stdlib_atomicStoreUInt32(
  object target: UnsafeMutablePointer<UInt32>,
  desired: UInt32) {

  Builtin.atomicstore_seqcst_Int32(target._rawValue, desired._value)
}

func _swift_stdlib_atomicStoreInt32(
  object target: UnsafeMutablePointer<Int32>,
  desired: Int32) {

  Builtin.atomicstore_seqcst_Int32(target._rawValue, desired._value)
}

public // @testable
func _swift_stdlib_atomicLoadUInt32(
  object target: UnsafeMutablePointer<UInt32>) -> UInt32 {

  let value = Builtin.atomicload_seqcst_Int32(target._rawValue)
  return UInt32(value)
}

func _swift_stdlib_atomicLoadInt32(
  object target: UnsafeMutablePointer<Int32>) -> Int32 {

  let value = Builtin.atomicload_seqcst_Int32(target._rawValue)
  return Int32(value)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 162)
// Warning: no overflow checking.
@_transparent
public // @testable
func _swift_stdlib_atomicFetchAddUInt32(
  object target: UnsafeMutablePointer<UInt32>,
  operand: UInt32) -> UInt32 {

  let value = Builtin.atomicrmw_add_seqcst_Int32(
    target._rawValue, operand._value)

  return UInt32(value)
}

// Warning: no overflow checking.
func _swift_stdlib_atomicFetchAddInt32(
  object target: UnsafeMutablePointer<Int32>,
  operand: Int32) -> Int32 {

  let value = Builtin.atomicrmw_add_seqcst_Int32(
    target._rawValue, operand._value)

  return Int32(value)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 162)
// Warning: no overflow checking.
@_transparent
public // @testable
func _swift_stdlib_atomicFetchAndUInt32(
  object target: UnsafeMutablePointer<UInt32>,
  operand: UInt32) -> UInt32 {

  let value = Builtin.atomicrmw_and_seqcst_Int32(
    target._rawValue, operand._value)

  return UInt32(value)
}

// Warning: no overflow checking.
func _swift_stdlib_atomicFetchAndInt32(
  object target: UnsafeMutablePointer<Int32>,
  operand: Int32) -> Int32 {

  let value = Builtin.atomicrmw_and_seqcst_Int32(
    target._rawValue, operand._value)

  return Int32(value)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 162)
// Warning: no overflow checking.
@_transparent
public // @testable
func _swift_stdlib_atomicFetchOrUInt32(
  object target: UnsafeMutablePointer<UInt32>,
  operand: UInt32) -> UInt32 {

  let value = Builtin.atomicrmw_or_seqcst_Int32(
    target._rawValue, operand._value)

  return UInt32(value)
}

// Warning: no overflow checking.
func _swift_stdlib_atomicFetchOrInt32(
  object target: UnsafeMutablePointer<Int32>,
  operand: Int32) -> Int32 {

  let value = Builtin.atomicrmw_or_seqcst_Int32(
    target._rawValue, operand._value)

  return Int32(value)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 162)
// Warning: no overflow checking.
@_transparent
public // @testable
func _swift_stdlib_atomicFetchXorUInt32(
  object target: UnsafeMutablePointer<UInt32>,
  operand: UInt32) -> UInt32 {

  let value = Builtin.atomicrmw_xor_seqcst_Int32(
    target._rawValue, operand._value)

  return UInt32(value)
}

// Warning: no overflow checking.
func _swift_stdlib_atomicFetchXorInt32(
  object target: UnsafeMutablePointer<Int32>,
  operand: Int32) -> Int32 {

  let value = Builtin.atomicrmw_xor_seqcst_Int32(
    target._rawValue, operand._value)

  return Int32(value)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 186)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 103)

@_transparent
public // @testable
func _stdlib_atomicCompareExchangeStrongUInt64(
  object target: UnsafeMutablePointer<UInt64>,
  expected: UnsafeMutablePointer<UInt64>,
  desired: UInt64) -> Bool {

  let (oldValue, won) = Builtin.cmpxchg_seqcst_seqcst_Int64(
    target._rawValue, expected.pointee._value, desired._value)
  expected.pointee._value = oldValue
  return Bool(won)
}

@_transparent
public // @testable
func _stdlib_atomicCompareExchangeStrongInt64(
  object target: UnsafeMutablePointer<Int64>,
  expected: UnsafeMutablePointer<Int64>,
  desired: Int64) -> Bool {

  let (oldValue, won) = Builtin.cmpxchg_seqcst_seqcst_Int64(
    target._rawValue, expected.pointee._value, desired._value)
  expected.pointee._value = oldValue
  return Bool(won)
}

@_transparent
public // @testable
func _swift_stdlib_atomicStoreUInt64(
  object target: UnsafeMutablePointer<UInt64>,
  desired: UInt64) {

  Builtin.atomicstore_seqcst_Int64(target._rawValue, desired._value)
}

func _swift_stdlib_atomicStoreInt64(
  object target: UnsafeMutablePointer<Int64>,
  desired: Int64) {

  Builtin.atomicstore_seqcst_Int64(target._rawValue, desired._value)
}

public // @testable
func _swift_stdlib_atomicLoadUInt64(
  object target: UnsafeMutablePointer<UInt64>) -> UInt64 {

  let value = Builtin.atomicload_seqcst_Int64(target._rawValue)
  return UInt64(value)
}

func _swift_stdlib_atomicLoadInt64(
  object target: UnsafeMutablePointer<Int64>) -> Int64 {

  let value = Builtin.atomicload_seqcst_Int64(target._rawValue)
  return Int64(value)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 162)
// Warning: no overflow checking.
@_transparent
public // @testable
func _swift_stdlib_atomicFetchAddUInt64(
  object target: UnsafeMutablePointer<UInt64>,
  operand: UInt64) -> UInt64 {

  let value = Builtin.atomicrmw_add_seqcst_Int64(
    target._rawValue, operand._value)

  return UInt64(value)
}

// Warning: no overflow checking.
func _swift_stdlib_atomicFetchAddInt64(
  object target: UnsafeMutablePointer<Int64>,
  operand: Int64) -> Int64 {

  let value = Builtin.atomicrmw_add_seqcst_Int64(
    target._rawValue, operand._value)

  return Int64(value)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 162)
// Warning: no overflow checking.
@_transparent
public // @testable
func _swift_stdlib_atomicFetchAndUInt64(
  object target: UnsafeMutablePointer<UInt64>,
  operand: UInt64) -> UInt64 {

  let value = Builtin.atomicrmw_and_seqcst_Int64(
    target._rawValue, operand._value)

  return UInt64(value)
}

// Warning: no overflow checking.
func _swift_stdlib_atomicFetchAndInt64(
  object target: UnsafeMutablePointer<Int64>,
  operand: Int64) -> Int64 {

  let value = Builtin.atomicrmw_and_seqcst_Int64(
    target._rawValue, operand._value)

  return Int64(value)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 162)
// Warning: no overflow checking.
@_transparent
public // @testable
func _swift_stdlib_atomicFetchOrUInt64(
  object target: UnsafeMutablePointer<UInt64>,
  operand: UInt64) -> UInt64 {

  let value = Builtin.atomicrmw_or_seqcst_Int64(
    target._rawValue, operand._value)

  return UInt64(value)
}

// Warning: no overflow checking.
func _swift_stdlib_atomicFetchOrInt64(
  object target: UnsafeMutablePointer<Int64>,
  operand: Int64) -> Int64 {

  let value = Builtin.atomicrmw_or_seqcst_Int64(
    target._rawValue, operand._value)

  return Int64(value)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 162)
// Warning: no overflow checking.
@_transparent
public // @testable
func _swift_stdlib_atomicFetchXorUInt64(
  object target: UnsafeMutablePointer<UInt64>,
  operand: UInt64) -> UInt64 {

  let value = Builtin.atomicrmw_xor_seqcst_Int64(
    target._rawValue, operand._value)

  return UInt64(value)
}

// Warning: no overflow checking.
func _swift_stdlib_atomicFetchXorInt64(
  object target: UnsafeMutablePointer<Int64>,
  operand: Int64) -> Int64 {

  let value = Builtin.atomicrmw_xor_seqcst_Int64(
    target._rawValue, operand._value)

  return Int64(value)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 186)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 188)

func _stdlib_atomicCompareExchangeStrongInt(
  object target: UnsafeMutablePointer<Int>,
  expected: UnsafeMutablePointer<Int>,
  desired: Int) -> Bool {
#if arch(i386) || arch(arm)
  let (oldValue, won) = Builtin.cmpxchg_seqcst_seqcst_Int32(
    target._rawValue, expected.pointee._value, desired._value)
#elseif arch(x86_64) || arch(arm64) || arch(powerpc64) || arch(powerpc64le) || arch(s390x)
  let (oldValue, won) = Builtin.cmpxchg_seqcst_seqcst_Int64(
    target._rawValue, expected.pointee._value, desired._value)
#endif
  expected.pointee._value = oldValue
  return Bool(won)
}

func _swift_stdlib_atomicStoreInt(
  object target: UnsafeMutablePointer<Int>,
  desired: Int) {
#if arch(i386) || arch(arm)
  Builtin.atomicstore_seqcst_Int32(target._rawValue, desired._value)
#elseif arch(x86_64) || arch(arm64) || arch(powerpc64) || arch(powerpc64le) || arch(s390x)
  Builtin.atomicstore_seqcst_Int64(target._rawValue, desired._value)
#endif
}

@_transparent
public func _swift_stdlib_atomicLoadInt(
  object target: UnsafeMutablePointer<Int>) -> Int {
#if arch(i386) || arch(arm)
  let value = Builtin.atomicload_seqcst_Int32(target._rawValue)
  return Int(value)
#elseif arch(x86_64) || arch(arm64) || arch(powerpc64) || arch(powerpc64le) || arch(s390x)
  let value = Builtin.atomicload_seqcst_Int64(target._rawValue)
  return Int(value)
#endif
}

@_transparent
public // @testable
func _swift_stdlib_atomicLoadPtrImpl(
  object target: UnsafeMutablePointer<OpaquePointer>
) -> OpaquePointer? {
  let value = Builtin.atomicload_seqcst_Word(target._rawValue)
  return OpaquePointer(bitPattern: Int(value))
}

@_transparent
public // @testable
func _stdlib_atomicLoadARCRef(
  object target: UnsafeMutablePointer<AnyObject?>
) -> AnyObject? {
  let result = _swift_stdlib_atomicLoadPtrImpl(
    object: unsafeBitCast(target, to: UnsafeMutablePointer<OpaquePointer>.self))
  if let unwrapped = result {
    return Unmanaged<AnyObject>.fromOpaque(
      UnsafePointer(unwrapped)).takeUnretainedValue()
  }
  return nil
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 250)
// Warning: no overflow checking.
public func _swift_stdlib_atomicFetchAddInt(
  object target: UnsafeMutablePointer<Int>,
  operand: Int) -> Int {
#if arch(i386) || arch(arm)
  return Int(Int32(bitPattern:
    _swift_stdlib_atomicFetchAddUInt32(
      object: unsafeBitCast(target, to: UnsafeMutablePointer<UInt32>.self),
      operand: UInt32(bitPattern: Int32(operand)))))
#elseif arch(x86_64) || arch(arm64) || arch(powerpc64) || arch(powerpc64le) || arch(s390x)
  return Int(Int64(bitPattern:
    _swift_stdlib_atomicFetchAddUInt64(
      object: unsafeBitCast(target, to: UnsafeMutablePointer<UInt64>.self),
      operand: UInt64(bitPattern: Int64(operand)))))
#endif
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 250)
// Warning: no overflow checking.
public func _swift_stdlib_atomicFetchAndInt(
  object target: UnsafeMutablePointer<Int>,
  operand: Int) -> Int {
#if arch(i386) || arch(arm)
  return Int(Int32(bitPattern:
    _swift_stdlib_atomicFetchAndUInt32(
      object: unsafeBitCast(target, to: UnsafeMutablePointer<UInt32>.self),
      operand: UInt32(bitPattern: Int32(operand)))))
#elseif arch(x86_64) || arch(arm64) || arch(powerpc64) || arch(powerpc64le) || arch(s390x)
  return Int(Int64(bitPattern:
    _swift_stdlib_atomicFetchAndUInt64(
      object: unsafeBitCast(target, to: UnsafeMutablePointer<UInt64>.self),
      operand: UInt64(bitPattern: Int64(operand)))))
#endif
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 250)
// Warning: no overflow checking.
public func _swift_stdlib_atomicFetchOrInt(
  object target: UnsafeMutablePointer<Int>,
  operand: Int) -> Int {
#if arch(i386) || arch(arm)
  return Int(Int32(bitPattern:
    _swift_stdlib_atomicFetchOrUInt32(
      object: unsafeBitCast(target, to: UnsafeMutablePointer<UInt32>.self),
      operand: UInt32(bitPattern: Int32(operand)))))
#elseif arch(x86_64) || arch(arm64) || arch(powerpc64) || arch(powerpc64le) || arch(s390x)
  return Int(Int64(bitPattern:
    _swift_stdlib_atomicFetchOrUInt64(
      object: unsafeBitCast(target, to: UnsafeMutablePointer<UInt64>.self),
      operand: UInt64(bitPattern: Int64(operand)))))
#endif
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 250)
// Warning: no overflow checking.
public func _swift_stdlib_atomicFetchXorInt(
  object target: UnsafeMutablePointer<Int>,
  operand: Int) -> Int {
#if arch(i386) || arch(arm)
  return Int(Int32(bitPattern:
    _swift_stdlib_atomicFetchXorUInt32(
      object: unsafeBitCast(target, to: UnsafeMutablePointer<UInt32>.self),
      operand: UInt32(bitPattern: Int32(operand)))))
#elseif arch(x86_64) || arch(arm64) || arch(powerpc64) || arch(powerpc64le) || arch(s390x)
  return Int(Int64(bitPattern:
    _swift_stdlib_atomicFetchXorUInt64(
      object: unsafeBitCast(target, to: UnsafeMutablePointer<UInt64>.self),
      operand: UInt64(bitPattern: Int64(operand)))))
#endif
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 267)

public final class _stdlib_AtomicInt {
  var _value: Int

  var _valuePtr: UnsafeMutablePointer<Int> {
    return _getUnsafePointerToStoredProperties(self).assumingMemoryBound(
      to: Int.self)
  }

  public init(_ value: Int = 0) {
    _value = value
  }

  public func store(_ desired: Int) {
    return _swift_stdlib_atomicStoreInt(object: _valuePtr, desired: desired)
  }

  public func load() -> Int {
    return _swift_stdlib_atomicLoadInt(object: _valuePtr)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 289)
  @discardableResult
  public func fetchAndAdd(_ operand: Int) -> Int {
    return _swift_stdlib_atomicFetchAddInt(
      object: _valuePtr,
      operand: operand)
  }

  public func addAndFetch(_ operand: Int) -> Int {
    return fetchAndAdd(operand) + operand
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 289)
  @discardableResult
  public func fetchAndAnd(_ operand: Int) -> Int {
    return _swift_stdlib_atomicFetchAndInt(
      object: _valuePtr,
      operand: operand)
  }

  public func andAndFetch(_ operand: Int) -> Int {
    return fetchAndAnd(operand) & operand
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 289)
  @discardableResult
  public func fetchAndOr(_ operand: Int) -> Int {
    return _swift_stdlib_atomicFetchOrInt(
      object: _valuePtr,
      operand: operand)
  }

  public func orAndFetch(_ operand: Int) -> Int {
    return fetchAndOr(operand) | operand
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 289)
  @discardableResult
  public func fetchAndXor(_ operand: Int) -> Int {
    return _swift_stdlib_atomicFetchXorInt(
      object: _valuePtr,
      operand: operand)
  }

  public func xorAndFetch(_ operand: Int) -> Int {
    return fetchAndXor(operand) ^ operand
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 300)

  public func compareExchange(expected: inout Int, desired: Int) -> Bool {
    var expectedVar = expected
    let result = _stdlib_atomicCompareExchangeStrongInt(
      object: _valuePtr,
      expected: &expectedVar,
      desired: desired)
    expected = expectedVar
    return result
  }
}

//===----------------------------------------------------------------------===//
// Conversion of primitive types to `String`
//===----------------------------------------------------------------------===//

/// A 32 byte buffer.
internal struct _Buffer32 {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 319)
  internal var _x0: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 319)
  internal var _x1: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 319)
  internal var _x2: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 319)
  internal var _x3: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 319)
  internal var _x4: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 319)
  internal var _x5: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 319)
  internal var _x6: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 319)
  internal var _x7: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 319)
  internal var _x8: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 319)
  internal var _x9: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 319)
  internal var _x10: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 319)
  internal var _x11: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 319)
  internal var _x12: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 319)
  internal var _x13: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 319)
  internal var _x14: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 319)
  internal var _x15: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 319)
  internal var _x16: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 319)
  internal var _x17: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 319)
  internal var _x18: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 319)
  internal var _x19: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 319)
  internal var _x20: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 319)
  internal var _x21: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 319)
  internal var _x22: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 319)
  internal var _x23: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 319)
  internal var _x24: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 319)
  internal var _x25: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 319)
  internal var _x26: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 319)
  internal var _x27: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 319)
  internal var _x28: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 319)
  internal var _x29: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 319)
  internal var _x30: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 319)
  internal var _x31: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 321)

  mutating func withBytes<Result>(
    _ body: (UnsafeMutablePointer<UInt8>) throws -> Result
  ) rethrows -> Result
  {
    return try withUnsafeMutablePointer(to: &self) {
      try body(UnsafeMutableRawPointer($0).assumingMemoryBound(to: UInt8.self))
    }
  }
}

/// A 72 byte buffer.
internal struct _Buffer72 {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x0: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x1: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x2: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x3: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x4: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x5: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x6: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x7: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x8: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x9: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x10: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x11: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x12: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x13: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x14: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x15: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x16: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x17: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x18: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x19: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x20: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x21: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x22: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x23: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x24: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x25: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x26: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x27: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x28: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x29: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x30: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x31: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x32: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x33: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x34: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x35: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x36: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x37: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x38: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x39: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x40: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x41: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x42: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x43: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x44: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x45: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x46: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x47: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x48: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x49: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x50: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x51: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x52: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x53: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x54: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x55: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x56: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x57: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x58: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x59: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x60: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x61: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x62: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x63: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x64: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x65: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x66: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x67: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x68: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x69: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x70: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 335)
  internal var _x71: UInt8 = 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 337)

  mutating func withBytes<Result>(
    _ body: (UnsafeMutablePointer<UInt8>) throws -> Result
  ) rethrows -> Result
  {
    return try withUnsafeMutablePointer(to: &self) {
      try body(UnsafeMutableRawPointer($0).assumingMemoryBound(to: UInt8.self))
    }
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 349)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 353)

@_silgen_name("swift_float32ToString")
func _float32ToStringImpl(
  _ buffer: UnsafeMutablePointer<UTF8.CodeUnit>,
  _ bufferLength: UInt, _ value: Float32,
  _ debug: Bool
) -> UInt

func _float32ToString(_ value: Float32, debug: Bool) -> String {

  if !value.isFinite {
    let significand = value.significandBitPattern
    if significand == 0 {
      // Infinity
      return value.sign == .minus ? "-inf" : "inf"
    }
    else {
      // NaN
      if !debug {
        return "nan"
      }
      let isSignaling = (significand & Float32._quietNaNMask) == 0
      let payload = significand & ((Float32._quietNaNMask >> 1) - 1)
      // FIXME(performance): Inefficient String manipulation. We could move
      // this to C function.
      return
        (value.sign == .minus ? "-" : "")
        + (isSignaling ? "snan" : "nan")
        + (payload == 0 ? "" : ("(0x" + String(payload, radix: 16) + ")"))
    }
  }

  _sanityCheck(MemoryLayout<_Buffer32>.size == 32)
  _sanityCheck(MemoryLayout<_Buffer72>.size == 72)

  var buffer = _Buffer32()
  return buffer.withBytes { (bufferPtr) in
    let actualLength = _float32ToStringImpl(bufferPtr, 32, value, debug)
    return String._fromWellFormedCodeUnitSequence(
      UTF8.self,
      input: UnsafeBufferPointer(start: bufferPtr, count: Int(actualLength)))
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 400)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 349)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 353)

@_silgen_name("swift_float64ToString")
func _float64ToStringImpl(
  _ buffer: UnsafeMutablePointer<UTF8.CodeUnit>,
  _ bufferLength: UInt, _ value: Float64,
  _ debug: Bool
) -> UInt

func _float64ToString(_ value: Float64, debug: Bool) -> String {

  if !value.isFinite {
    let significand = value.significandBitPattern
    if significand == 0 {
      // Infinity
      return value.sign == .minus ? "-inf" : "inf"
    }
    else {
      // NaN
      if !debug {
        return "nan"
      }
      let isSignaling = (significand & Float64._quietNaNMask) == 0
      let payload = significand & ((Float64._quietNaNMask >> 1) - 1)
      // FIXME(performance): Inefficient String manipulation. We could move
      // this to C function.
      return
        (value.sign == .minus ? "-" : "")
        + (isSignaling ? "snan" : "nan")
        + (payload == 0 ? "" : ("(0x" + String(payload, radix: 16) + ")"))
    }
  }

  _sanityCheck(MemoryLayout<_Buffer32>.size == 32)
  _sanityCheck(MemoryLayout<_Buffer72>.size == 72)

  var buffer = _Buffer32()
  return buffer.withBytes { (bufferPtr) in
    let actualLength = _float64ToStringImpl(bufferPtr, 32, value, debug)
    return String._fromWellFormedCodeUnitSequence(
      UTF8.self,
      input: UnsafeBufferPointer(start: bufferPtr, count: Int(actualLength)))
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 400)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 349)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 351)
#if (!os(Windows) || CYGWIN) && (arch(i386) || arch(x86_64))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 353)

@_silgen_name("swift_float80ToString")
func _float80ToStringImpl(
  _ buffer: UnsafeMutablePointer<UTF8.CodeUnit>,
  _ bufferLength: UInt, _ value: Float80,
  _ debug: Bool
) -> UInt

func _float80ToString(_ value: Float80, debug: Bool) -> String {

  if !value.isFinite {
    let significand = value.significandBitPattern
    if significand == 0 {
      // Infinity
      return value.sign == .minus ? "-inf" : "inf"
    }
    else {
      // NaN
      if !debug {
        return "nan"
      }
      let isSignaling = (significand & Float80._quietNaNMask) == 0
      let payload = significand & ((Float80._quietNaNMask >> 1) - 1)
      // FIXME(performance): Inefficient String manipulation. We could move
      // this to C function.
      return
        (value.sign == .minus ? "-" : "")
        + (isSignaling ? "snan" : "nan")
        + (payload == 0 ? "" : ("(0x" + String(payload, radix: 16) + ")"))
    }
  }

  _sanityCheck(MemoryLayout<_Buffer32>.size == 32)
  _sanityCheck(MemoryLayout<_Buffer72>.size == 72)

  var buffer = _Buffer32()
  return buffer.withBytes { (bufferPtr) in
    let actualLength = _float80ToStringImpl(bufferPtr, 32, value, debug)
    return String._fromWellFormedCodeUnitSequence(
      UTF8.self,
      input: UnsafeBufferPointer(start: bufferPtr, count: Int(actualLength)))
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 398)
#endif
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 400)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Runtime.swift.gyb", line: 402)

@_silgen_name("swift_int64ToString")
func _int64ToStringImpl(
  _ buffer: UnsafeMutablePointer<UTF8.CodeUnit>,
  _ bufferLength: UInt, _ value: Int64,
  _ radix: Int64, _ uppercase: Bool
) -> UInt

func _int64ToString(
  _ value: Int64, radix: Int64 = 10, uppercase: Bool = false
) -> String {
  if radix >= 10 {
    var buffer = _Buffer32()
    return buffer.withBytes { (bufferPtr) in
      let actualLength
      = _int64ToStringImpl(bufferPtr, 32, value, radix, uppercase)
      return String._fromWellFormedCodeUnitSequence(
        UTF8.self,
        input: UnsafeBufferPointer(start: bufferPtr, count: Int(actualLength)))
    }
  } else {
    var buffer = _Buffer72()
    return buffer.withBytes { (bufferPtr) in
      let actualLength
      = _int64ToStringImpl(bufferPtr, 72, value, radix, uppercase)
      return String._fromWellFormedCodeUnitSequence(
        UTF8.self,
        input: UnsafeBufferPointer(start: bufferPtr, count: Int(actualLength)))
    }
  }
}

@_silgen_name("swift_uint64ToString")
func _uint64ToStringImpl(
  _ buffer: UnsafeMutablePointer<UTF8.CodeUnit>,
  _ bufferLength: UInt, _ value: UInt64, _ radix: Int64, _ uppercase: Bool
) -> UInt

public // @testable
func _uint64ToString(
    _ value: UInt64, radix: Int64 = 10, uppercase: Bool = false
) -> String {
  if radix >= 10 {
    var buffer = _Buffer32()
    return buffer.withBytes { (bufferPtr) in
      let actualLength
      = _uint64ToStringImpl(bufferPtr, 32, value, radix, uppercase)
      return String._fromWellFormedCodeUnitSequence(
        UTF8.self,
        input: UnsafeBufferPointer(start: bufferPtr, count: Int(actualLength)))
    }
  } else {
    var buffer = _Buffer72()
    return buffer.withBytes { (bufferPtr) in
      let actualLength
      = _uint64ToStringImpl(bufferPtr, 72, value, radix, uppercase)
      return String._fromWellFormedCodeUnitSequence(
        UTF8.self,
        input: UnsafeBufferPointer(start: bufferPtr, count: Int(actualLength)))
    }
  }
}

func _rawPointerToString(_ value: Builtin.RawPointer) -> String {
  var result = _uint64ToString(
    UInt64(
      UInt(bitPattern: UnsafeRawPointer(value))),
      radix: 16,
      uppercase: false
    )
  for _ in 0..<(2 * MemoryLayout<UnsafeRawPointer>.size - result.utf16.count) {
    result = "0" + result
  }
  return "0x" + result
}

#if _runtime(_ObjC)
// At runtime, these classes are derived from `_SwiftNativeNSXXXBase`,
// which are derived from `NSXXX`.
//
// The @swift_native_objc_runtime_base attribute
// allows us to subclass an Objective-C class and still use the fast Swift
// memory allocator.

@objc @_swift_native_objc_runtime_base(_SwiftNativeNSArrayBase)
class _SwiftNativeNSArray {}

@objc @_swift_native_objc_runtime_base(_SwiftNativeNSDictionaryBase)
class _SwiftNativeNSDictionary {}

@objc @_swift_native_objc_runtime_base(_SwiftNativeNSSetBase)
class _SwiftNativeNSSet {}

@objc @_swift_native_objc_runtime_base(_SwiftNativeNSEnumeratorBase)
class _SwiftNativeNSEnumerator {}

// FIXME(ABI)#60 : move into the Foundation overlay and remove 'open'
@objc @_swift_native_objc_runtime_base(_SwiftNativeNSDataBase)
open class _SwiftNativeNSData {
  public init() {}
}

// FIXME(ABI)#61 : move into the Foundation overlay and remove 'open'
@objc @_swift_native_objc_runtime_base(_SwiftNativeNSCharacterSetBase)
open class _SwiftNativeNSCharacterSet {
  public init() {}
}

//===----------------------------------------------------------------------===//
// Support for reliable testing of the return-autoreleased optimization
//===----------------------------------------------------------------------===//

@objc internal class _stdlib_ReturnAutoreleasedDummy {
  // Use 'dynamic' to force Objective-C dispatch, which uses the
  // return-autoreleased call sequence.
  @objc dynamic func returnsAutoreleased(_ x: AnyObject) -> AnyObject {
    return x
  }

  // Use 'dynamic' to prevent this call to be duplicated into other modules.
  @objc dynamic func initializeReturnAutoreleased() {
    // On x86_64 it is sufficient to perform one cycle of return-autoreleased
    // call sequence in order to initialize all required PLT entries.
    _ = self.returnsAutoreleased(self)
  }
}

/// This function ensures that the return-autoreleased optimization works.
///
/// On some platforms (for example, x86_64), the first call to
/// `objc_autoreleaseReturnValue` will always autorelease because it would fail
/// to verify the instruction sequence in the caller.  On x86_64 certain PLT
/// entries would be still pointing to the resolver function, and sniffing
/// the call sequence would fail.
///
/// This code should live in the core stdlib dylib because PLT tables are
/// separate for each dylib.
///
/// Call this function in a fresh autorelease pool.
public func _stdlib_initializeReturnAutoreleased() {
//  _stdlib_initializeReturnAutoreleasedImpl()
#if arch(x86_64)
  _stdlib_ReturnAutoreleasedDummy().initializeReturnAutoreleased()
#endif
}
#else

class _SwiftNativeNSArray {}
class _SwiftNativeNSDictionary {}
class _SwiftNativeNSSet {}

#endif
