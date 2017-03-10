// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 1)
//===--- FloatingPointTypes.swift.gyb -------------------------*- swift -*-===//
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

import SwiftShims

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 29)

//  TODO: remove once integer proposal is available ----------------------------
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 32)
extension UInt32 {
  var signBitIndex: Int {
    return 31 - Int(Int32(Builtin.int_ctlz_Int32(self._value, false._value)))
  }
  var countTrailingZeros: Int {
    return Int(Int32(Builtin.int_cttz_Int32(self._value, false._value)))
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 32)
extension UInt64 {
  var signBitIndex: Int {
    return 63 - Int(Int64(Builtin.int_ctlz_Int64(self._value, false._value)))
  }
  var countTrailingZeros: Int {
    return Int(Int64(Builtin.int_cttz_Int64(self._value, false._value)))
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 41)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 67)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 71)

/// A single-precision, floating-point value type.
@_fixed_layout
public struct Float {
  public // @testable
  var _value: Builtin.FPIEEE32

  /// Creates a value initialized to zero.
  @_transparent public
  init() {
    let zero: Int64 = 0
    self._value = Builtin.sitofp_Int64_FPIEEE32(zero._value)
  }

  @_transparent
  public // @testable
  init(_bits v: Builtin.FPIEEE32) {
    self._value = v
  }
}

extension Float : CustomStringConvertible {
  /// A textual representation of the value.
  public var description: String {
    return _float32ToString(self, debug: false)
  }
}

extension Float : CustomDebugStringConvertible {
  /// A textual representation of the value, suitable for debugging.
  public var debugDescription: String {
    return _float32ToString(self, debug: true)
  }
}

extension Float: BinaryFloatingPoint {

  public typealias Exponent = Int
  public typealias RawSignificand = UInt32

  public static var exponentBitCount: Int {
    return 8
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 123)
  public static var significandBitCount: Int {
    return 23
  }

  //  Implementation details.
  @_versioned
  static var _infinityExponent: UInt {
    @inline(__always) get { return 1 << UInt(exponentBitCount) - 1 }
  }

  static var _exponentBias: UInt {
    @inline(__always) get { return _infinityExponent >> 1 }
  }

  static var _significandMask: UInt32 {
    @inline(__always) get {
      return 1 << UInt32(significandBitCount) - 1
    }
  }

  @_versioned
  static var _quietNaNMask: UInt32 {
    @inline(__always) get {
      return 1 << UInt32(significandBitCount - 1)
    }
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 151)
  //  Conversions to/from integer encoding.  These are not part of the
  //  BinaryFloatingPoint prototype because there's no guarantee that an
  //  integer type of the same size actually exists (e.g. Float80).
  //
  //  If we want them in a protocol at some future point, that protocol should
  //  be "InterchangeFloatingPoint" or "PortableFloatingPoint" or similar, and
  //  apply to IEEE 754 "interchange types".
  /// The bit pattern of the value's encoding.
  ///
  /// The bit pattern matches the binary interchange format defined by the
  /// [IEEE 754 specification][spec].
  ///
  /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
  ///
  /// - SeeAlso: `init(bitPattern:)`
  public var bitPattern: UInt32 {
    return UInt32(Builtin.bitcast_FPIEEE32_Int32(_value))
  }

  /// Creates a new value with the given bit pattern.
  ///
  /// The value passed as `bitPattern` is interpreted in the binary interchange
  /// format defined by the [IEEE 754 specification][spec].
  ///
  /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
  ///
  /// - Parameter bitPattern: The integer encoding of a `Float` instance.
  ///
  /// - SeeAlso: `bitPattern`
  public init(bitPattern: UInt32) {
    self.init(_bits: Builtin.bitcast_Int32_FPIEEE32(bitPattern._value))
  }

  public var sign: FloatingPointSign {
    let shift = Float.significandBitCount + Float.exponentBitCount
    return FloatingPointSign(rawValue: Int(bitPattern >> UInt32(shift)))!
  }

  @available(*, unavailable, renamed: "sign")
  public var isSignMinus: Bool { Builtin.unreachable() }

  public var exponentBitPattern: UInt {
    return UInt(bitPattern >> UInt32(Float.significandBitCount)) &
      Float._infinityExponent
  }

  public var significandBitPattern: UInt32 {
    return UInt32(bitPattern) & Float._significandMask
  }

  public init(sign: FloatingPointSign,
              exponentBitPattern: UInt,
              significandBitPattern: UInt32) {
    let signShift = Float.significandBitCount + Float.exponentBitCount
    let sign = UInt32(sign == .minus ? 1 : 0)
    let exponent = UInt32(
      exponentBitPattern & Float._infinityExponent)
    let significand = UInt32(
      significandBitPattern & Float._significandMask)
    self.init(bitPattern:
      sign << UInt32(signShift) |
      exponent << UInt32(Float.significandBitCount) |
      significand)
  }

  public var isCanonical: Bool {
    return true
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 306)

  public static var infinity: Float {
    return Float(sign: .plus,
      exponentBitPattern: _infinityExponent,
      significandBitPattern: 0)
  }

  public static var nan: Float {
    return Float(nan: 0, signaling: false)
  }

  public static var signalingNaN: Float {
    return Float(nan: 0, signaling: true)
  }

  @available(*, unavailable, renamed: "nan")
  public static var quietNaN: Float { Builtin.unreachable()}

  public static var greatestFiniteMagnitude: Float {
    return Float(sign: .plus,
      exponentBitPattern: _infinityExponent - 1,
      significandBitPattern: _significandMask)
  }

  public static var pi: Float {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 332)
    // Note: this is not the correctly rounded (to nearest) value of pi,
    // because pi would round *up* in Float precision, which can result
    // in angles in the wrong quadrant if users aren't careful.  This is
    // not a problem for Double or Float80, as pi rounds down in both of
    // those formats.
    return Float(0x1.921fb4p1)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 343)
  }

  public var ulp: Float {
    if !isFinite { return Float.nan }
    if exponentBitPattern > UInt(Float.significandBitCount) {
      // self is large enough that self.ulp is normal, so we just compute its
      // exponent and construct it with a significand of zero.
      let ulpExponent = exponentBitPattern - UInt(Float.significandBitCount)
      return Float(sign: .plus,
        exponentBitPattern: ulpExponent,
        significandBitPattern: 0)
    }
    if exponentBitPattern >= 1 {
      // self is normal but ulp is subnormal.
      let ulpShift = UInt32(exponentBitPattern - 1)
      return Float(sign: .plus,
        exponentBitPattern: 0,
        significandBitPattern: 1 << ulpShift)
    }
    return Float(sign: .plus,
      exponentBitPattern: 0,
      significandBitPattern: 1)
  }

  public static var leastNormalMagnitude: Float {
    return Float(sign: .plus,
      exponentBitPattern: 1,
      significandBitPattern: 0)
  }

  public static var leastNonzeroMagnitude: Float {
#if arch(arm)
    return leastNormalMagnitude
#else
    return Float(sign: .plus,
      exponentBitPattern: 0,
      significandBitPattern: 1)
#endif
  }

  public var exponent: Int {
    if !isFinite { return .max }
    if isZero { return .min }
    let provisional = Int(exponentBitPattern) - Int(Float._exponentBias)
    if isNormal { return provisional }
    let shift = Float.significandBitCount - significandBitPattern.signBitIndex
    return provisional + 1 - Int(shift)
  }

  public var significand: Float {
    if isNaN { return self }
    if isNormal {
      return Float(sign: .plus,
        exponentBitPattern: Float._exponentBias,
        significandBitPattern: significandBitPattern)
    }
    if isSubnormal {
      let shift = Float.significandBitCount - significandBitPattern.signBitIndex
      return Float(sign: .plus,
        exponentBitPattern: Float._exponentBias,
        significandBitPattern: significandBitPattern << UInt32(shift))
    }
    // zero or infinity.
    return Float(sign: .plus,
      exponentBitPattern: exponentBitPattern,
      significandBitPattern: 0)
  }

  public init(sign: FloatingPointSign, exponent: Int, significand: Float) {
    var result = significand
    if sign == .minus { result = -result }
    if significand.isFinite && !significand.isZero {
      var clamped = exponent
      let leastNormalExponent = 1 - Int(Float._exponentBias)
      let greatestFiniteExponent = Int(Float._exponentBias)
      if clamped < leastNormalExponent {
        clamped = max(clamped, 3*leastNormalExponent)
        while clamped < leastNormalExponent {
          result  *= Float.leastNormalMagnitude
          clamped -= leastNormalExponent
        }
      }
      else if clamped > greatestFiniteExponent {
        clamped = min(clamped, 3*greatestFiniteExponent)
        let step = Float(sign: .plus,
          exponentBitPattern: Float._infinityExponent - 1,
          significandBitPattern: 0)
        while clamped > greatestFiniteExponent {
          result  *= step
          clamped -= greatestFiniteExponent
        }
      }
      let scale = Float(sign: .plus,
        exponentBitPattern: UInt(Int(Float._exponentBias) + clamped),
        significandBitPattern: 0)
      result = result * scale
    }
    self = result
  }

  /// Creates a NaN ("not a number") value with the specified payload.
  ///
  /// NaN values compare not equal to every value, including themselves. Most
  /// operations with a NaN operand produce a NaN result. Don't use the
  /// equal-to operator (`==`) to test whether a value is NaN. Instead, use
  /// the value's `isNaN` property.
  ///
  ///     let x = Float(nan: 0, signaling: false)
  ///     print(x == .nan)
  ///     // Prints "false"
  ///     print(x.isNaN)
  ///     // Prints "true"
  ///
  /// - Parameters:
  ///   - payload: The payload to use for the new NaN value.
  ///   - signaling: Pass `true` to create a signaling NaN or `false` to create
  ///     a quiet NaN.
  public init(nan payload: RawSignificand, signaling: Bool) {
    // We use significandBitCount - 2 bits for NaN payload.
    _precondition(payload < (Float._quietNaNMask >> 1),
      "NaN payload is not encodable.")
    var significand = payload
    significand |= Float._quietNaNMask >> (signaling ? 1 : 0)
    self.init(sign: .plus,
              exponentBitPattern: Float._infinityExponent,
              significandBitPattern: significand)
  }

  public var nextUp: Float {
    if isNaN { return self }
    if sign == .minus {
#if arch(arm)
      // On arm, subnormals are flushed to zero.
      if (exponentBitPattern == 1 && significandBitPattern == 0) ||
         (exponentBitPattern == 0 && significandBitPattern != 0) {
        return Float(sign: .minus,
          exponentBitPattern: 0,
          significandBitPattern: 0)
      }
#endif
      if significandBitPattern == 0 {
        if exponentBitPattern == 0 {
          return .leastNonzeroMagnitude
        }
        return Float(sign: .minus,
          exponentBitPattern: exponentBitPattern - 1,
          significandBitPattern: Float._significandMask)
      }
      return Float(sign: .minus,
        exponentBitPattern: exponentBitPattern,
        significandBitPattern: significandBitPattern - 1)
    }
    if isInfinite { return self }
    if significandBitPattern == Float._significandMask {
      return Float(sign: .plus,
        exponentBitPattern: exponentBitPattern + 1,
        significandBitPattern: 0)
    }
#if arch(arm)
    // On arm, subnormals are skipped.
    if exponentBitPattern == 0 {
      return .leastNonzeroMagnitude
    }
#endif
    return Float(sign: .plus,
      exponentBitPattern: exponentBitPattern,
      significandBitPattern: significandBitPattern + 1)
  }

  @_transparent
  public mutating func round(_ rule: FloatingPointRoundingRule) {
    switch rule {
    case .toNearestOrAwayFromZero:
      _value = Builtin.int_round_FPIEEE32(_value)
    case .toNearestOrEven:
      _value = Builtin.int_rint_FPIEEE32(_value)
    case .towardZero:
      _value = Builtin.int_trunc_FPIEEE32(_value)
    case .awayFromZero:
      if sign == .minus {
        _value = Builtin.int_floor_FPIEEE32(_value)
      }
      else {
        _value = Builtin.int_ceil_FPIEEE32(_value)
      }
    case .up:
      _value = Builtin.int_ceil_FPIEEE32(_value)
    case .down:
      _value = Builtin.int_floor_FPIEEE32(_value)
    }
  }

  @_transparent
  public mutating func negate() {
    _value = Builtin.fneg_FPIEEE32(self._value)
  }

  @_transparent
  public mutating func add(_ other: Float) {
    _value = Builtin.fadd_FPIEEE32(self._value, other._value)
  }

  @_transparent
  public mutating func subtract(_ other: Float) {
    _value = Builtin.fsub_FPIEEE32(self._value, other._value)
  }

  @_transparent
  public mutating func multiply(by other: Float) {
    _value = Builtin.fmul_FPIEEE32(self._value, other._value)
  }

  @_transparent
  public mutating func divide(by other: Float) {
    _value = Builtin.fdiv_FPIEEE32(self._value, other._value)
  }

  @_transparent
  public mutating func formRemainder(dividingBy other: Float) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 566)
    self = _swift_stdlib_remainderf(self, other)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 568)
  }

  @_transparent
  public mutating func formTruncatingRemainder(dividingBy other: Float) {
    _value = Builtin.frem_FPIEEE32(self._value, other._value)
  }

  @_transparent
  public mutating func formSquareRoot( ) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 580)
    self = _swift_stdlib_squareRootf(self)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 582)
  }

  @_transparent
  public mutating func addProduct(_ lhs: Float, _ rhs: Float) {
    _value = Builtin.int_fma_FPIEEE32(lhs._value, rhs._value, _value)
  }

  @_transparent
  public func isEqual(to other: Float) -> Bool {
    return Bool(Builtin.fcmp_oeq_FPIEEE32(self._value, other._value))
  }

  @_transparent
  public func isLess(than other: Float) -> Bool {
    return Bool(Builtin.fcmp_olt_FPIEEE32(self._value, other._value))
  }

  @_transparent
  public func isLessThanOrEqualTo(_ other: Float) -> Bool {
    return Bool(Builtin.fcmp_ole_FPIEEE32(self._value, other._value))
  }

  @_transparent
  public var isNormal: Bool {
    return exponentBitPattern > 0 && isFinite
  }

  @_transparent
  public var isFinite: Bool {
    return exponentBitPattern < Float._infinityExponent
  }

  @_transparent
  public var isZero: Bool {
    return exponentBitPattern == 0 && significandBitPattern == 0
  }

  @_transparent
  public var isSubnormal:  Bool {
    return exponentBitPattern == 0 && significandBitPattern != 0
  }

  @_transparent
  public var isInfinite:  Bool {
    return !isFinite && significandBitPattern == 0
  }

  @_transparent
  public var isNaN:  Bool {
    return !isFinite && significandBitPattern != 0
  }

  @_transparent
  public var isSignalingNaN: Bool {
    return isNaN && (significandBitPattern & Float._quietNaNMask) == 0
  }

  public var binade: Float {
    if !isFinite { return .nan }
    if exponentBitPattern != 0 {
      return Float(sign: sign, exponentBitPattern: exponentBitPattern,
        significandBitPattern: 0)
    }
    if significandBitPattern == 0 { return self }
    // For subnormals, we isolate the leading significand bit.
    let index = significandBitPattern.signBitIndex
    return Float(sign: sign, exponentBitPattern: 0,
      significandBitPattern: 1 << RawSignificand(index))
  }

  public var significandWidth: Int {
    let trailingZeros = significandBitPattern.countTrailingZeros
    if isNormal {
      guard significandBitPattern != 0 else { return 0 }
      return Float.significandBitCount - trailingZeros
    }
    if isSubnormal {
      return significandBitPattern.signBitIndex - trailingZeros
    }
    return -1
  }

  /// Creates a new value from the given floating-point literal.
  ///
  /// Do not call this initializer directly. It is used by the compiler when
  /// you create a new `Float` instance by using a floating-point literal.
  /// Instead, create a new value by using a literal.
  ///
  /// In this example, the assignment to the `x` constant calls this
  /// initializer behind the scenes.
  ///
  ///     let x: Float = 21.25
  ///     // x == 21.25
  ///
  /// - Parameter value: The new floating-point value.
  @_transparent
  public init(floatLiteral value: Float) {
    self = value
  }
}

extension Float : _ExpressibleByBuiltinIntegerLiteral, ExpressibleByIntegerLiteral {
  @_transparent
  public
  init(_builtinIntegerLiteral value: Builtin.Int2048){
    self = Float(_bits: Builtin.itofp_with_overflow_Int2048_FPIEEE32(value))
  }

  /// Creates a new value from the given integer literal.
  ///
  /// Do not call this initializer directly. It is used by the compiler when
  /// you create a new `Float` instance by using an integer literal.
  /// Instead, create a new value by using a literal.
  ///
  /// In this example, the assignment to the `x` constant calls this
  /// initializer behind the scenes.
  ///
  ///     let x: Float = 100
  ///     // x == 100.0
  ///
  /// - Parameter value: The new value.
  @_transparent
  public init(integerLiteral value: Int64) {
    self = Float(_bits: Builtin.sitofp_Int64_FPIEEE32(value._value))
  }
}

#if (!os(Windows) || CYGWIN) && (arch(i386) || arch(x86_64))

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 712)
extension Float : _ExpressibleByBuiltinFloatLiteral {
  @_transparent
  public
  init(_builtinFloatLiteral value: Builtin.FPIEEE80) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 719)
    self = Float(_bits: Builtin.fptrunc_FPIEEE80_FPIEEE32(value))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 724)
  }
}

#else

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 730)
extension Float : _ExpressibleByBuiltinFloatLiteral {
  @_transparent
  public
  init(_builtinFloatLiteral value: Builtin.FPIEEE64) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 737)
    self = Float(_bits: Builtin.fptrunc_FPIEEE64_FPIEEE32(value))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 742)
  }
}

#endif

extension Float : Hashable {
  /// The number's hash value.
  ///
  /// Hash values are not guaranteed to be equal across different executions of
  /// your program. Do not save hash values to use during a future execution.
  public var hashValue: Int {
    if isZero {
      // To satisfy the axiom that equality implies hash equality, we need to
      // finesse the hash value of -0.0 to match +0.0.
      return 0
    } else {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 759)
      return Int(bitPattern: UInt(bitPattern))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 771)
    }
  }
}

extension Float {
  /// The magnitude of this value.
  ///
  /// For any value `x`, `x.magnitude.sign` is `.plus`. If `x` is not NaN,
  /// `x.magnitude` is the absolute value of `x`.
  ///
  /// The global `abs(_:)` function provides more familiar syntax when you need
  /// to find an absolute value. In addition, because `abs(_:)` always returns
  /// a value of the same type, even in a generic context, using the function
  /// instead of the `magnitude` property is encouraged.
  ///
  ///     let targetDistance: Float = 5.25
  ///     let throwDistance: Float = 5.5
  ///
  ///     let margin = targetDistance - throwDistance
  ///     // margin == -0.25
  ///     // margin.magnitude == 0.25
  ///
  ///     // Use 'abs(_:)' instead of 'magnitude'
  ///     print("Missed the target by \(abs(margin)) meters.")
  ///     // Prints "Missed the target by 0.25 meters."
  ///
  /// - SeeAlso: `abs(_:)`
  @_transparent
  public var magnitude: Float {
    return Float(_bits: Builtin.int_fabs_FPIEEE32(_value))
  }
}

@_transparent
public prefix func + (x: Float) -> Float {
  return x
}

@_transparent
public prefix func - (x: Float) -> Float {
  return Float(_bits: Builtin.fneg_FPIEEE32(x._value))
}

//===----------------------------------------------------------------------===//
// Explicit conversions between types.
//===----------------------------------------------------------------------===//

// Construction from integers.
extension Float {

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 826)
  @_transparent
  public init(_ v: UInt8) {
    _value = Builtin.uitofp_Int8_FPIEEE32(v._value)
  }
  
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 832)
  @available(*, message: "Converting UInt8 to Float will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 834)
  @inline(__always)
  public init?(exactly value: UInt8) {
    _value = Builtin.uitofp_Int8_FPIEEE32(value._value)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 839)
    if UInt8(self) != value {
      return nil
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 843)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 826)
  @_transparent
  public init(_ v: Int8) {
    _value = Builtin.sitofp_Int8_FPIEEE32(v._value)
  }
  
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 832)
  @available(*, message: "Converting Int8 to Float will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 834)
  @inline(__always)
  public init?(exactly value: Int8) {
    _value = Builtin.sitofp_Int8_FPIEEE32(value._value)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 839)
    if Int8(self) != value {
      return nil
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 843)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 826)
  @_transparent
  public init(_ v: UInt16) {
    _value = Builtin.uitofp_Int16_FPIEEE32(v._value)
  }
  
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 832)
  @available(*, message: "Converting UInt16 to Float will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 834)
  @inline(__always)
  public init?(exactly value: UInt16) {
    _value = Builtin.uitofp_Int16_FPIEEE32(value._value)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 839)
    if UInt16(self) != value {
      return nil
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 843)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 826)
  @_transparent
  public init(_ v: Int16) {
    _value = Builtin.sitofp_Int16_FPIEEE32(v._value)
  }
  
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 832)
  @available(*, message: "Converting Int16 to Float will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 834)
  @inline(__always)
  public init?(exactly value: Int16) {
    _value = Builtin.sitofp_Int16_FPIEEE32(value._value)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 839)
    if Int16(self) != value {
      return nil
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 843)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 826)
  @_transparent
  public init(_ v: UInt32) {
    _value = Builtin.uitofp_Int32_FPIEEE32(v._value)
  }
  
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 834)
  @inline(__always)
  public init?(exactly value: UInt32) {
    _value = Builtin.uitofp_Int32_FPIEEE32(value._value)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 843)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 826)
  @_transparent
  public init(_ v: Int32) {
    _value = Builtin.sitofp_Int32_FPIEEE32(v._value)
  }
  
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 834)
  @inline(__always)
  public init?(exactly value: Int32) {
    _value = Builtin.sitofp_Int32_FPIEEE32(value._value)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 843)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 826)
  @_transparent
  public init(_ v: UInt64) {
    _value = Builtin.uitofp_Int64_FPIEEE32(v._value)
  }
  
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 834)
  @inline(__always)
  public init?(exactly value: UInt64) {
    _value = Builtin.uitofp_Int64_FPIEEE32(value._value)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 843)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 826)
  @_transparent
  public init(_ v: Int64) {
    _value = Builtin.sitofp_Int64_FPIEEE32(v._value)
  }
  
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 834)
  @inline(__always)
  public init?(exactly value: Int64) {
    _value = Builtin.sitofp_Int64_FPIEEE32(value._value)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 843)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 826)
  @_transparent
  public init(_ v: UInt) {
    _value = Builtin.uitofp_Int64_FPIEEE32(v._value)
  }
  
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 834)
  @inline(__always)
  public init?(exactly value: UInt) {
    _value = Builtin.uitofp_Int64_FPIEEE32(value._value)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 843)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 826)
  @_transparent
  public init(_ v: Int) {
    _value = Builtin.sitofp_Int64_FPIEEE32(v._value)
  }
  
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 834)
  @inline(__always)
  public init?(exactly value: Int) {
    _value = Builtin.sitofp_Int64_FPIEEE32(value._value)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 843)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 845)
}

// Construction from other floating point numbers.
extension Float {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 852)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 856)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 858)
  /// Creates a new instance initialized to the given value.
  ///
  /// The value of `other` is represented exactly by the new instance. A NaN
  /// passed as `other` results in another NaN, with a signaling NaN value
  /// converted to quiet NaN.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 870)
  ///
  ///     let x: Float = 21.25
  ///     let y = Float(x)
  ///     // y == 21.25
  ///
  ///     let z = Float(Float.nan)
  ///     // z.isNaN == true
  ///
  /// - Parameter other: The value to use for the new instance.
  @_transparent
  public init(_ other: Float) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 886)
    _value = other._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 888)
  }

  /// Creates a new instance initialized to the given value, if it can be
  /// represented without rounding.
  ///
  /// If `other` can't be represented as an instance of `Float` without
  /// rounding, the result of this initializer is `nil`. In particular,
  /// passing NaN as `other` always results in `nil`.
  ///
  ///     let x: Float = 21.25
  ///     let y = Float(exactly: x)
  ///     // y == Optional.some(21.25)
  ///
  ///     let z = Float(exactly: Float.nan)
  ///     // z == nil
  ///
  /// - Parameter other: The value to use for the new instance.
  @inline(__always)
  public init?(exactly other: Float) {
    self.init(other)
    // Converting the infinity value is considered value preserving.
    // In other cases, check that we can round-trip and get the same value.
    // NaN always fails.
    if Float(self) != other {
      return nil
    }
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 852)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 856)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 864)
  /// Creates a new instance that approximates the given value.
  ///
  /// The value of `other` is rounded to a representable value, if necessary.
  /// A NaN passed as `other` results in another NaN, with a signaling NaN
  /// value converted to quiet NaN.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 870)
  ///
  ///     let x: Double = 21.25
  ///     let y = Float(x)
  ///     // y == 21.25
  ///
  ///     let z = Float(Double.nan)
  ///     // z.isNaN == true
  ///
  /// - Parameter other: The value to use for the new instance.
  @_transparent
  public init(_ other: Double) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 882)
    _value = Builtin.fptrunc_FPIEEE64_FPIEEE32(other._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 888)
  }

  /// Creates a new instance initialized to the given value, if it can be
  /// represented without rounding.
  ///
  /// If `other` can't be represented as an instance of `Float` without
  /// rounding, the result of this initializer is `nil`. In particular,
  /// passing NaN as `other` always results in `nil`.
  ///
  ///     let x: Double = 21.25
  ///     let y = Float(exactly: x)
  ///     // y == Optional.some(21.25)
  ///
  ///     let z = Float(exactly: Double.nan)
  ///     // z == nil
  ///
  /// - Parameter other: The value to use for the new instance.
  @inline(__always)
  public init?(exactly other: Double) {
    self.init(other)
    // Converting the infinity value is considered value preserving.
    // In other cases, check that we can round-trip and get the same value.
    // NaN always fails.
    if Double(self) != other {
      return nil
    }
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 852)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 854)
#if (!os(Windows) || CYGWIN) && (arch(i386) || arch(x86_64))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 856)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 864)
  /// Creates a new instance that approximates the given value.
  ///
  /// The value of `other` is rounded to a representable value, if necessary.
  /// A NaN passed as `other` results in another NaN, with a signaling NaN
  /// value converted to quiet NaN.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 870)
  ///
  ///     let x: Float80 = 21.25
  ///     let y = Float(x)
  ///     // y == 21.25
  ///
  ///     let z = Float(Float80.nan)
  ///     // z.isNaN == true
  ///
  /// - Parameter other: The value to use for the new instance.
  @_transparent
  public init(_ other: Float80) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 882)
    _value = Builtin.fptrunc_FPIEEE80_FPIEEE32(other._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 888)
  }

  /// Creates a new instance initialized to the given value, if it can be
  /// represented without rounding.
  ///
  /// If `other` can't be represented as an instance of `Float` without
  /// rounding, the result of this initializer is `nil`. In particular,
  /// passing NaN as `other` always results in `nil`.
  ///
  ///     let x: Float80 = 21.25
  ///     let y = Float(exactly: x)
  ///     // y == Optional.some(21.25)
  ///
  ///     let z = Float(exactly: Float80.nan)
  ///     // z == nil
  ///
  /// - Parameter other: The value to use for the new instance.
  @inline(__always)
  public init?(exactly other: Float80) {
    self.init(other)
    // Converting the infinity value is considered value preserving.
    // In other cases, check that we can round-trip and get the same value.
    // NaN always fails.
    if Float80(self) != other {
      return nil
    }
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 917)
#endif
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 920)
}

//===----------------------------------------------------------------------===//
// Standard Operator Table
//===----------------------------------------------------------------------===//

//  TODO: These should not be necessary, since they're already provided by
//  <T: FloatingPoint>, but in practice they are currently needed to
//  disambiguate overloads.  We should find a way to remove them, either by
//  tweaking the overload resolution rules, or by removing the other
//  definitions in the standard lib, or both.

@_transparent
public func + (lhs: Float, rhs: Float) -> Float {
  return lhs.adding(rhs)
}

@_transparent
public func - (lhs: Float, rhs: Float) -> Float {
  return lhs.subtracting(rhs)
}

@_transparent
public func * (lhs: Float, rhs: Float) -> Float {
  return lhs.multiplied(by: rhs)
}

@_transparent
public func / (lhs: Float, rhs: Float) -> Float {
  return lhs.divided(by: rhs)
}

@_transparent
public func += (lhs: inout Float, rhs: Float) {
  lhs.add(rhs)
}

@_transparent
public func -= (lhs: inout Float, rhs: Float) {
  lhs.subtract(rhs)
}

@_transparent
public func *= (lhs: inout Float, rhs: Float) {
  lhs.multiply(by: rhs)
}

@_transparent
public func /= (lhs: inout Float, rhs: Float) {
  lhs.divide(by: rhs)
}

//===----------------------------------------------------------------------===//
// Strideable Conformance
//===----------------------------------------------------------------------===//

extension Float : Strideable {
  /// Returns the distance from this value to the specified value.
  ///
  /// For two values `x` and `y`, the result of `x.distance(to: y)` is equal to
  /// `y - x`---a distance `d` such that `x.advanced(by: d)` approximates `y`.
  /// For example:
  ///
  ///     let x = 21.5
  ///     let d = x.distance(to: 15.0)
  ///     // d == -6.5
  ///
  ///     print(x.advanced(by: d))
  ///     // Prints "15.0"
  ///
  /// - Parameter other: A value to calculate the distance to.
  /// - Returns: The distance between this value and `other`.
  @_transparent
  public func distance(to other: Float) -> Float {
    return other - self
  }

  /// Returns a new value advanced by the given distance.
  ///
  /// For two values `x` and `d`, the result of a `x.advanced(by: d)` is equal
  /// to `x + d`---a new value `y` such that `x.distance(to: y)` approximates
  /// `d`. For example:
  ///
  ///     let x = 21.5
  ///     let y = x.advanced(by: -6.5)
  ///     // y == 15.0
  ///
  ///     print(x.distance(to: y))
  ///     // Prints "-6.5"
  ///
  /// - Parameter amount: The distance to advance this value.
  /// - Returns: A new value that is `amount` added to this value.
  @_transparent
  public func advanced(by amount: Float) -> Float {
    return self + amount
  }
}

//===----------------------------------------------------------------------===//
// Deprecated operators
//===----------------------------------------------------------------------===//

@_transparent
@available(*, unavailable, message: "Use truncatingRemainder instead")
public func % (lhs: Float, rhs: Float) -> Float {
  fatalError("% is not available.")
}

@_transparent
@available(*, unavailable, message: "Use formTruncatingRemainder instead")
public func %= (lhs: inout Float, rhs: Float) {
  fatalError("%= is not available.")
}

@_transparent
@available(*, unavailable, message: "use += 1")
@discardableResult
public prefix func ++ (rhs: inout Float) -> Float {
  fatalError("++ is not available")
}
@_transparent
@available(*, unavailable, message: "use -= 1")
@discardableResult
public prefix func -- (rhs: inout Float) -> Float {
  fatalError("-- is not available")
}
@_transparent
@available(*, unavailable, message: "use += 1")
@discardableResult
public postfix func ++ (lhs: inout Float) -> Float {
  fatalError("++ is not available")
}
@_transparent
@available(*, unavailable, message: "use -= 1")
@discardableResult
public postfix func -- (lhs: inout Float) -> Float {
  fatalError("-- is not available")
}

extension Float {
  @available(swift, deprecated: 3.1, obsoleted: 4.0, message: "Please use the `abs(_:)` free function")
  @_transparent
  public static func abs(_ x: Float) -> Float {
    return x.magnitude
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 67)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 71)

/// A double-precision, floating-point value type.
@_fixed_layout
public struct Double {
  public // @testable
  var _value: Builtin.FPIEEE64

  /// Creates a value initialized to zero.
  @_transparent public
  init() {
    let zero: Int64 = 0
    self._value = Builtin.sitofp_Int64_FPIEEE64(zero._value)
  }

  @_transparent
  public // @testable
  init(_bits v: Builtin.FPIEEE64) {
    self._value = v
  }
}

extension Double : CustomStringConvertible {
  /// A textual representation of the value.
  public var description: String {
    return _float64ToString(self, debug: false)
  }
}

extension Double : CustomDebugStringConvertible {
  /// A textual representation of the value, suitable for debugging.
  public var debugDescription: String {
    return _float64ToString(self, debug: true)
  }
}

extension Double: BinaryFloatingPoint {

  public typealias Exponent = Int
  public typealias RawSignificand = UInt64

  public static var exponentBitCount: Int {
    return 11
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 123)
  public static var significandBitCount: Int {
    return 52
  }

  //  Implementation details.
  @_versioned
  static var _infinityExponent: UInt {
    @inline(__always) get { return 1 << UInt(exponentBitCount) - 1 }
  }

  static var _exponentBias: UInt {
    @inline(__always) get { return _infinityExponent >> 1 }
  }

  static var _significandMask: UInt64 {
    @inline(__always) get {
      return 1 << UInt64(significandBitCount) - 1
    }
  }

  @_versioned
  static var _quietNaNMask: UInt64 {
    @inline(__always) get {
      return 1 << UInt64(significandBitCount - 1)
    }
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 151)
  //  Conversions to/from integer encoding.  These are not part of the
  //  BinaryFloatingPoint prototype because there's no guarantee that an
  //  integer type of the same size actually exists (e.g. Float80).
  //
  //  If we want them in a protocol at some future point, that protocol should
  //  be "InterchangeFloatingPoint" or "PortableFloatingPoint" or similar, and
  //  apply to IEEE 754 "interchange types".
  /// The bit pattern of the value's encoding.
  ///
  /// The bit pattern matches the binary interchange format defined by the
  /// [IEEE 754 specification][spec].
  ///
  /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
  ///
  /// - SeeAlso: `init(bitPattern:)`
  public var bitPattern: UInt64 {
    return UInt64(Builtin.bitcast_FPIEEE64_Int64(_value))
  }

  /// Creates a new value with the given bit pattern.
  ///
  /// The value passed as `bitPattern` is interpreted in the binary interchange
  /// format defined by the [IEEE 754 specification][spec].
  ///
  /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
  ///
  /// - Parameter bitPattern: The integer encoding of a `Double` instance.
  ///
  /// - SeeAlso: `bitPattern`
  public init(bitPattern: UInt64) {
    self.init(_bits: Builtin.bitcast_Int64_FPIEEE64(bitPattern._value))
  }

  public var sign: FloatingPointSign {
    let shift = Double.significandBitCount + Double.exponentBitCount
    return FloatingPointSign(rawValue: Int(bitPattern >> UInt64(shift)))!
  }

  @available(*, unavailable, renamed: "sign")
  public var isSignMinus: Bool { Builtin.unreachable() }

  public var exponentBitPattern: UInt {
    return UInt(bitPattern >> UInt64(Double.significandBitCount)) &
      Double._infinityExponent
  }

  public var significandBitPattern: UInt64 {
    return UInt64(bitPattern) & Double._significandMask
  }

  public init(sign: FloatingPointSign,
              exponentBitPattern: UInt,
              significandBitPattern: UInt64) {
    let signShift = Double.significandBitCount + Double.exponentBitCount
    let sign = UInt64(sign == .minus ? 1 : 0)
    let exponent = UInt64(
      exponentBitPattern & Double._infinityExponent)
    let significand = UInt64(
      significandBitPattern & Double._significandMask)
    self.init(bitPattern:
      sign << UInt64(signShift) |
      exponent << UInt64(Double.significandBitCount) |
      significand)
  }

  public var isCanonical: Bool {
    return true
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 306)

  public static var infinity: Double {
    return Double(sign: .plus,
      exponentBitPattern: _infinityExponent,
      significandBitPattern: 0)
  }

  public static var nan: Double {
    return Double(nan: 0, signaling: false)
  }

  public static var signalingNaN: Double {
    return Double(nan: 0, signaling: true)
  }

  @available(*, unavailable, renamed: "nan")
  public static var quietNaN: Double { Builtin.unreachable()}

  public static var greatestFiniteMagnitude: Double {
    return Double(sign: .plus,
      exponentBitPattern: _infinityExponent - 1,
      significandBitPattern: _significandMask)
  }

  public static var pi: Double {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 339)
    return Double(0x1.921fb54442d18p1)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 343)
  }

  public var ulp: Double {
    if !isFinite { return Double.nan }
    if exponentBitPattern > UInt(Double.significandBitCount) {
      // self is large enough that self.ulp is normal, so we just compute its
      // exponent and construct it with a significand of zero.
      let ulpExponent = exponentBitPattern - UInt(Double.significandBitCount)
      return Double(sign: .plus,
        exponentBitPattern: ulpExponent,
        significandBitPattern: 0)
    }
    if exponentBitPattern >= 1 {
      // self is normal but ulp is subnormal.
      let ulpShift = UInt64(exponentBitPattern - 1)
      return Double(sign: .plus,
        exponentBitPattern: 0,
        significandBitPattern: 1 << ulpShift)
    }
    return Double(sign: .plus,
      exponentBitPattern: 0,
      significandBitPattern: 1)
  }

  public static var leastNormalMagnitude: Double {
    return Double(sign: .plus,
      exponentBitPattern: 1,
      significandBitPattern: 0)
  }

  public static var leastNonzeroMagnitude: Double {
#if arch(arm)
    return leastNormalMagnitude
#else
    return Double(sign: .plus,
      exponentBitPattern: 0,
      significandBitPattern: 1)
#endif
  }

  public var exponent: Int {
    if !isFinite { return .max }
    if isZero { return .min }
    let provisional = Int(exponentBitPattern) - Int(Double._exponentBias)
    if isNormal { return provisional }
    let shift = Double.significandBitCount - significandBitPattern.signBitIndex
    return provisional + 1 - Int(shift)
  }

  public var significand: Double {
    if isNaN { return self }
    if isNormal {
      return Double(sign: .plus,
        exponentBitPattern: Double._exponentBias,
        significandBitPattern: significandBitPattern)
    }
    if isSubnormal {
      let shift = Double.significandBitCount - significandBitPattern.signBitIndex
      return Double(sign: .plus,
        exponentBitPattern: Double._exponentBias,
        significandBitPattern: significandBitPattern << UInt64(shift))
    }
    // zero or infinity.
    return Double(sign: .plus,
      exponentBitPattern: exponentBitPattern,
      significandBitPattern: 0)
  }

  public init(sign: FloatingPointSign, exponent: Int, significand: Double) {
    var result = significand
    if sign == .minus { result = -result }
    if significand.isFinite && !significand.isZero {
      var clamped = exponent
      let leastNormalExponent = 1 - Int(Double._exponentBias)
      let greatestFiniteExponent = Int(Double._exponentBias)
      if clamped < leastNormalExponent {
        clamped = max(clamped, 3*leastNormalExponent)
        while clamped < leastNormalExponent {
          result  *= Double.leastNormalMagnitude
          clamped -= leastNormalExponent
        }
      }
      else if clamped > greatestFiniteExponent {
        clamped = min(clamped, 3*greatestFiniteExponent)
        let step = Double(sign: .plus,
          exponentBitPattern: Double._infinityExponent - 1,
          significandBitPattern: 0)
        while clamped > greatestFiniteExponent {
          result  *= step
          clamped -= greatestFiniteExponent
        }
      }
      let scale = Double(sign: .plus,
        exponentBitPattern: UInt(Int(Double._exponentBias) + clamped),
        significandBitPattern: 0)
      result = result * scale
    }
    self = result
  }

  /// Creates a NaN ("not a number") value with the specified payload.
  ///
  /// NaN values compare not equal to every value, including themselves. Most
  /// operations with a NaN operand produce a NaN result. Don't use the
  /// equal-to operator (`==`) to test whether a value is NaN. Instead, use
  /// the value's `isNaN` property.
  ///
  ///     let x = Double(nan: 0, signaling: false)
  ///     print(x == .nan)
  ///     // Prints "false"
  ///     print(x.isNaN)
  ///     // Prints "true"
  ///
  /// - Parameters:
  ///   - payload: The payload to use for the new NaN value.
  ///   - signaling: Pass `true` to create a signaling NaN or `false` to create
  ///     a quiet NaN.
  public init(nan payload: RawSignificand, signaling: Bool) {
    // We use significandBitCount - 2 bits for NaN payload.
    _precondition(payload < (Double._quietNaNMask >> 1),
      "NaN payload is not encodable.")
    var significand = payload
    significand |= Double._quietNaNMask >> (signaling ? 1 : 0)
    self.init(sign: .plus,
              exponentBitPattern: Double._infinityExponent,
              significandBitPattern: significand)
  }

  public var nextUp: Double {
    if isNaN { return self }
    if sign == .minus {
#if arch(arm)
      // On arm, subnormals are flushed to zero.
      if (exponentBitPattern == 1 && significandBitPattern == 0) ||
         (exponentBitPattern == 0 && significandBitPattern != 0) {
        return Double(sign: .minus,
          exponentBitPattern: 0,
          significandBitPattern: 0)
      }
#endif
      if significandBitPattern == 0 {
        if exponentBitPattern == 0 {
          return .leastNonzeroMagnitude
        }
        return Double(sign: .minus,
          exponentBitPattern: exponentBitPattern - 1,
          significandBitPattern: Double._significandMask)
      }
      return Double(sign: .minus,
        exponentBitPattern: exponentBitPattern,
        significandBitPattern: significandBitPattern - 1)
    }
    if isInfinite { return self }
    if significandBitPattern == Double._significandMask {
      return Double(sign: .plus,
        exponentBitPattern: exponentBitPattern + 1,
        significandBitPattern: 0)
    }
#if arch(arm)
    // On arm, subnormals are skipped.
    if exponentBitPattern == 0 {
      return .leastNonzeroMagnitude
    }
#endif
    return Double(sign: .plus,
      exponentBitPattern: exponentBitPattern,
      significandBitPattern: significandBitPattern + 1)
  }

  @_transparent
  public mutating func round(_ rule: FloatingPointRoundingRule) {
    switch rule {
    case .toNearestOrAwayFromZero:
      _value = Builtin.int_round_FPIEEE64(_value)
    case .toNearestOrEven:
      _value = Builtin.int_rint_FPIEEE64(_value)
    case .towardZero:
      _value = Builtin.int_trunc_FPIEEE64(_value)
    case .awayFromZero:
      if sign == .minus {
        _value = Builtin.int_floor_FPIEEE64(_value)
      }
      else {
        _value = Builtin.int_ceil_FPIEEE64(_value)
      }
    case .up:
      _value = Builtin.int_ceil_FPIEEE64(_value)
    case .down:
      _value = Builtin.int_floor_FPIEEE64(_value)
    }
  }

  @_transparent
  public mutating func negate() {
    _value = Builtin.fneg_FPIEEE64(self._value)
  }

  @_transparent
  public mutating func add(_ other: Double) {
    _value = Builtin.fadd_FPIEEE64(self._value, other._value)
  }

  @_transparent
  public mutating func subtract(_ other: Double) {
    _value = Builtin.fsub_FPIEEE64(self._value, other._value)
  }

  @_transparent
  public mutating func multiply(by other: Double) {
    _value = Builtin.fmul_FPIEEE64(self._value, other._value)
  }

  @_transparent
  public mutating func divide(by other: Double) {
    _value = Builtin.fdiv_FPIEEE64(self._value, other._value)
  }

  @_transparent
  public mutating func formRemainder(dividingBy other: Double) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 566)
    self = _swift_stdlib_remainder(self, other)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 568)
  }

  @_transparent
  public mutating func formTruncatingRemainder(dividingBy other: Double) {
    _value = Builtin.frem_FPIEEE64(self._value, other._value)
  }

  @_transparent
  public mutating func formSquareRoot( ) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 580)
    self = _swift_stdlib_squareRoot(self)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 582)
  }

  @_transparent
  public mutating func addProduct(_ lhs: Double, _ rhs: Double) {
    _value = Builtin.int_fma_FPIEEE64(lhs._value, rhs._value, _value)
  }

  @_transparent
  public func isEqual(to other: Double) -> Bool {
    return Bool(Builtin.fcmp_oeq_FPIEEE64(self._value, other._value))
  }

  @_transparent
  public func isLess(than other: Double) -> Bool {
    return Bool(Builtin.fcmp_olt_FPIEEE64(self._value, other._value))
  }

  @_transparent
  public func isLessThanOrEqualTo(_ other: Double) -> Bool {
    return Bool(Builtin.fcmp_ole_FPIEEE64(self._value, other._value))
  }

  @_transparent
  public var isNormal: Bool {
    return exponentBitPattern > 0 && isFinite
  }

  @_transparent
  public var isFinite: Bool {
    return exponentBitPattern < Double._infinityExponent
  }

  @_transparent
  public var isZero: Bool {
    return exponentBitPattern == 0 && significandBitPattern == 0
  }

  @_transparent
  public var isSubnormal:  Bool {
    return exponentBitPattern == 0 && significandBitPattern != 0
  }

  @_transparent
  public var isInfinite:  Bool {
    return !isFinite && significandBitPattern == 0
  }

  @_transparent
  public var isNaN:  Bool {
    return !isFinite && significandBitPattern != 0
  }

  @_transparent
  public var isSignalingNaN: Bool {
    return isNaN && (significandBitPattern & Double._quietNaNMask) == 0
  }

  public var binade: Double {
    if !isFinite { return .nan }
    if exponentBitPattern != 0 {
      return Double(sign: sign, exponentBitPattern: exponentBitPattern,
        significandBitPattern: 0)
    }
    if significandBitPattern == 0 { return self }
    // For subnormals, we isolate the leading significand bit.
    let index = significandBitPattern.signBitIndex
    return Double(sign: sign, exponentBitPattern: 0,
      significandBitPattern: 1 << RawSignificand(index))
  }

  public var significandWidth: Int {
    let trailingZeros = significandBitPattern.countTrailingZeros
    if isNormal {
      guard significandBitPattern != 0 else { return 0 }
      return Double.significandBitCount - trailingZeros
    }
    if isSubnormal {
      return significandBitPattern.signBitIndex - trailingZeros
    }
    return -1
  }

  /// Creates a new value from the given floating-point literal.
  ///
  /// Do not call this initializer directly. It is used by the compiler when
  /// you create a new `Double` instance by using a floating-point literal.
  /// Instead, create a new value by using a literal.
  ///
  /// In this example, the assignment to the `x` constant calls this
  /// initializer behind the scenes.
  ///
  ///     let x: Double = 21.25
  ///     // x == 21.25
  ///
  /// - Parameter value: The new floating-point value.
  @_transparent
  public init(floatLiteral value: Double) {
    self = value
  }
}

extension Double : _ExpressibleByBuiltinIntegerLiteral, ExpressibleByIntegerLiteral {
  @_transparent
  public
  init(_builtinIntegerLiteral value: Builtin.Int2048){
    self = Double(_bits: Builtin.itofp_with_overflow_Int2048_FPIEEE64(value))
  }

  /// Creates a new value from the given integer literal.
  ///
  /// Do not call this initializer directly. It is used by the compiler when
  /// you create a new `Double` instance by using an integer literal.
  /// Instead, create a new value by using a literal.
  ///
  /// In this example, the assignment to the `x` constant calls this
  /// initializer behind the scenes.
  ///
  ///     let x: Double = 100
  ///     // x == 100.0
  ///
  /// - Parameter value: The new value.
  @_transparent
  public init(integerLiteral value: Int64) {
    self = Double(_bits: Builtin.sitofp_Int64_FPIEEE64(value._value))
  }
}

#if (!os(Windows) || CYGWIN) && (arch(i386) || arch(x86_64))

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 712)
extension Double : _ExpressibleByBuiltinFloatLiteral {
  @_transparent
  public
  init(_builtinFloatLiteral value: Builtin.FPIEEE80) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 719)
    self = Double(_bits: Builtin.fptrunc_FPIEEE80_FPIEEE64(value))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 724)
  }
}

#else

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 730)
extension Double : _ExpressibleByBuiltinFloatLiteral {
  @_transparent
  public
  init(_builtinFloatLiteral value: Builtin.FPIEEE64) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 735)
    self = Double(_bits: value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 742)
  }
}

#endif

extension Double : Hashable {
  /// The number's hash value.
  ///
  /// Hash values are not guaranteed to be equal across different executions of
  /// your program. Do not save hash values to use during a future execution.
  public var hashValue: Int {
    if isZero {
      // To satisfy the axiom that equality implies hash equality, we need to
      // finesse the hash value of -0.0 to match +0.0.
      return 0
    } else {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 759)
      return Int(bitPattern: UInt(bitPattern))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 771)
    }
  }
}

extension Double {
  /// The magnitude of this value.
  ///
  /// For any value `x`, `x.magnitude.sign` is `.plus`. If `x` is not NaN,
  /// `x.magnitude` is the absolute value of `x`.
  ///
  /// The global `abs(_:)` function provides more familiar syntax when you need
  /// to find an absolute value. In addition, because `abs(_:)` always returns
  /// a value of the same type, even in a generic context, using the function
  /// instead of the `magnitude` property is encouraged.
  ///
  ///     let targetDistance: Double = 5.25
  ///     let throwDistance: Double = 5.5
  ///
  ///     let margin = targetDistance - throwDistance
  ///     // margin == -0.25
  ///     // margin.magnitude == 0.25
  ///
  ///     // Use 'abs(_:)' instead of 'magnitude'
  ///     print("Missed the target by \(abs(margin)) meters.")
  ///     // Prints "Missed the target by 0.25 meters."
  ///
  /// - SeeAlso: `abs(_:)`
  @_transparent
  public var magnitude: Double {
    return Double(_bits: Builtin.int_fabs_FPIEEE64(_value))
  }
}

@_transparent
public prefix func + (x: Double) -> Double {
  return x
}

@_transparent
public prefix func - (x: Double) -> Double {
  return Double(_bits: Builtin.fneg_FPIEEE64(x._value))
}

//===----------------------------------------------------------------------===//
// Explicit conversions between types.
//===----------------------------------------------------------------------===//

// Construction from integers.
extension Double {

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 826)
  @_transparent
  public init(_ v: UInt8) {
    _value = Builtin.uitofp_Int8_FPIEEE64(v._value)
  }
  
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 832)
  @available(*, message: "Converting UInt8 to Double will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 834)
  @inline(__always)
  public init?(exactly value: UInt8) {
    _value = Builtin.uitofp_Int8_FPIEEE64(value._value)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 839)
    if UInt8(self) != value {
      return nil
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 843)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 826)
  @_transparent
  public init(_ v: Int8) {
    _value = Builtin.sitofp_Int8_FPIEEE64(v._value)
  }
  
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 832)
  @available(*, message: "Converting Int8 to Double will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 834)
  @inline(__always)
  public init?(exactly value: Int8) {
    _value = Builtin.sitofp_Int8_FPIEEE64(value._value)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 839)
    if Int8(self) != value {
      return nil
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 843)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 826)
  @_transparent
  public init(_ v: UInt16) {
    _value = Builtin.uitofp_Int16_FPIEEE64(v._value)
  }
  
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 832)
  @available(*, message: "Converting UInt16 to Double will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 834)
  @inline(__always)
  public init?(exactly value: UInt16) {
    _value = Builtin.uitofp_Int16_FPIEEE64(value._value)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 839)
    if UInt16(self) != value {
      return nil
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 843)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 826)
  @_transparent
  public init(_ v: Int16) {
    _value = Builtin.sitofp_Int16_FPIEEE64(v._value)
  }
  
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 832)
  @available(*, message: "Converting Int16 to Double will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 834)
  @inline(__always)
  public init?(exactly value: Int16) {
    _value = Builtin.sitofp_Int16_FPIEEE64(value._value)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 839)
    if Int16(self) != value {
      return nil
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 843)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 826)
  @_transparent
  public init(_ v: UInt32) {
    _value = Builtin.uitofp_Int32_FPIEEE64(v._value)
  }
  
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 832)
  @available(*, message: "Converting UInt32 to Double will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 834)
  @inline(__always)
  public init?(exactly value: UInt32) {
    _value = Builtin.uitofp_Int32_FPIEEE64(value._value)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 839)
    if UInt32(self) != value {
      return nil
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 843)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 826)
  @_transparent
  public init(_ v: Int32) {
    _value = Builtin.sitofp_Int32_FPIEEE64(v._value)
  }
  
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 832)
  @available(*, message: "Converting Int32 to Double will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 834)
  @inline(__always)
  public init?(exactly value: Int32) {
    _value = Builtin.sitofp_Int32_FPIEEE64(value._value)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 839)
    if Int32(self) != value {
      return nil
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 843)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 826)
  @_transparent
  public init(_ v: UInt64) {
    _value = Builtin.uitofp_Int64_FPIEEE64(v._value)
  }
  
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 834)
  @inline(__always)
  public init?(exactly value: UInt64) {
    _value = Builtin.uitofp_Int64_FPIEEE64(value._value)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 843)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 826)
  @_transparent
  public init(_ v: Int64) {
    _value = Builtin.sitofp_Int64_FPIEEE64(v._value)
  }
  
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 834)
  @inline(__always)
  public init?(exactly value: Int64) {
    _value = Builtin.sitofp_Int64_FPIEEE64(value._value)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 843)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 826)
  @_transparent
  public init(_ v: UInt) {
    _value = Builtin.uitofp_Int64_FPIEEE64(v._value)
  }
  
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 834)
  @inline(__always)
  public init?(exactly value: UInt) {
    _value = Builtin.uitofp_Int64_FPIEEE64(value._value)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 843)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 826)
  @_transparent
  public init(_ v: Int) {
    _value = Builtin.sitofp_Int64_FPIEEE64(v._value)
  }
  
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 834)
  @inline(__always)
  public init?(exactly value: Int) {
    _value = Builtin.sitofp_Int64_FPIEEE64(value._value)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 843)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 845)
}

// Construction from other floating point numbers.
extension Double {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 852)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 856)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 864)
  /// Creates a new instance that approximates the given value.
  ///
  /// The value of `other` is rounded to a representable value, if necessary.
  /// A NaN passed as `other` results in another NaN, with a signaling NaN
  /// value converted to quiet NaN.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 870)
  ///
  ///     let x: Float = 21.25
  ///     let y = Double(x)
  ///     // y == 21.25
  ///
  ///     let z = Double(Float.nan)
  ///     // z.isNaN == true
  ///
  /// - Parameter other: The value to use for the new instance.
  @_transparent
  public init(_ other: Float) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 884)
    _value = Builtin.fpext_FPIEEE32_FPIEEE64(other._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 888)
  }

  /// Creates a new instance initialized to the given value, if it can be
  /// represented without rounding.
  ///
  /// If `other` can't be represented as an instance of `Double` without
  /// rounding, the result of this initializer is `nil`. In particular,
  /// passing NaN as `other` always results in `nil`.
  ///
  ///     let x: Float = 21.25
  ///     let y = Double(exactly: x)
  ///     // y == Optional.some(21.25)
  ///
  ///     let z = Double(exactly: Float.nan)
  ///     // z == nil
  ///
  /// - Parameter other: The value to use for the new instance.
  @inline(__always)
  public init?(exactly other: Float) {
    self.init(other)
    // Converting the infinity value is considered value preserving.
    // In other cases, check that we can round-trip and get the same value.
    // NaN always fails.
    if Float(self) != other {
      return nil
    }
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 852)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 856)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 858)
  /// Creates a new instance initialized to the given value.
  ///
  /// The value of `other` is represented exactly by the new instance. A NaN
  /// passed as `other` results in another NaN, with a signaling NaN value
  /// converted to quiet NaN.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 870)
  ///
  ///     let x: Double = 21.25
  ///     let y = Double(x)
  ///     // y == 21.25
  ///
  ///     let z = Double(Double.nan)
  ///     // z.isNaN == true
  ///
  /// - Parameter other: The value to use for the new instance.
  @_transparent
  public init(_ other: Double) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 886)
    _value = other._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 888)
  }

  /// Creates a new instance initialized to the given value, if it can be
  /// represented without rounding.
  ///
  /// If `other` can't be represented as an instance of `Double` without
  /// rounding, the result of this initializer is `nil`. In particular,
  /// passing NaN as `other` always results in `nil`.
  ///
  ///     let x: Double = 21.25
  ///     let y = Double(exactly: x)
  ///     // y == Optional.some(21.25)
  ///
  ///     let z = Double(exactly: Double.nan)
  ///     // z == nil
  ///
  /// - Parameter other: The value to use for the new instance.
  @inline(__always)
  public init?(exactly other: Double) {
    self.init(other)
    // Converting the infinity value is considered value preserving.
    // In other cases, check that we can round-trip and get the same value.
    // NaN always fails.
    if Double(self) != other {
      return nil
    }
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 852)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 854)
#if (!os(Windows) || CYGWIN) && (arch(i386) || arch(x86_64))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 856)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 864)
  /// Creates a new instance that approximates the given value.
  ///
  /// The value of `other` is rounded to a representable value, if necessary.
  /// A NaN passed as `other` results in another NaN, with a signaling NaN
  /// value converted to quiet NaN.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 870)
  ///
  ///     let x: Float80 = 21.25
  ///     let y = Double(x)
  ///     // y == 21.25
  ///
  ///     let z = Double(Float80.nan)
  ///     // z.isNaN == true
  ///
  /// - Parameter other: The value to use for the new instance.
  @_transparent
  public init(_ other: Float80) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 882)
    _value = Builtin.fptrunc_FPIEEE80_FPIEEE64(other._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 888)
  }

  /// Creates a new instance initialized to the given value, if it can be
  /// represented without rounding.
  ///
  /// If `other` can't be represented as an instance of `Double` without
  /// rounding, the result of this initializer is `nil`. In particular,
  /// passing NaN as `other` always results in `nil`.
  ///
  ///     let x: Float80 = 21.25
  ///     let y = Double(exactly: x)
  ///     // y == Optional.some(21.25)
  ///
  ///     let z = Double(exactly: Float80.nan)
  ///     // z == nil
  ///
  /// - Parameter other: The value to use for the new instance.
  @inline(__always)
  public init?(exactly other: Float80) {
    self.init(other)
    // Converting the infinity value is considered value preserving.
    // In other cases, check that we can round-trip and get the same value.
    // NaN always fails.
    if Float80(self) != other {
      return nil
    }
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 917)
#endif
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 920)
}

//===----------------------------------------------------------------------===//
// Standard Operator Table
//===----------------------------------------------------------------------===//

//  TODO: These should not be necessary, since they're already provided by
//  <T: FloatingPoint>, but in practice they are currently needed to
//  disambiguate overloads.  We should find a way to remove them, either by
//  tweaking the overload resolution rules, or by removing the other
//  definitions in the standard lib, or both.

@_transparent
public func + (lhs: Double, rhs: Double) -> Double {
  return lhs.adding(rhs)
}

@_transparent
public func - (lhs: Double, rhs: Double) -> Double {
  return lhs.subtracting(rhs)
}

@_transparent
public func * (lhs: Double, rhs: Double) -> Double {
  return lhs.multiplied(by: rhs)
}

@_transparent
public func / (lhs: Double, rhs: Double) -> Double {
  return lhs.divided(by: rhs)
}

@_transparent
public func += (lhs: inout Double, rhs: Double) {
  lhs.add(rhs)
}

@_transparent
public func -= (lhs: inout Double, rhs: Double) {
  lhs.subtract(rhs)
}

@_transparent
public func *= (lhs: inout Double, rhs: Double) {
  lhs.multiply(by: rhs)
}

@_transparent
public func /= (lhs: inout Double, rhs: Double) {
  lhs.divide(by: rhs)
}

//===----------------------------------------------------------------------===//
// Strideable Conformance
//===----------------------------------------------------------------------===//

extension Double : Strideable {
  /// Returns the distance from this value to the specified value.
  ///
  /// For two values `x` and `y`, the result of `x.distance(to: y)` is equal to
  /// `y - x`---a distance `d` such that `x.advanced(by: d)` approximates `y`.
  /// For example:
  ///
  ///     let x = 21.5
  ///     let d = x.distance(to: 15.0)
  ///     // d == -6.5
  ///
  ///     print(x.advanced(by: d))
  ///     // Prints "15.0"
  ///
  /// - Parameter other: A value to calculate the distance to.
  /// - Returns: The distance between this value and `other`.
  @_transparent
  public func distance(to other: Double) -> Double {
    return other - self
  }

  /// Returns a new value advanced by the given distance.
  ///
  /// For two values `x` and `d`, the result of a `x.advanced(by: d)` is equal
  /// to `x + d`---a new value `y` such that `x.distance(to: y)` approximates
  /// `d`. For example:
  ///
  ///     let x = 21.5
  ///     let y = x.advanced(by: -6.5)
  ///     // y == 15.0
  ///
  ///     print(x.distance(to: y))
  ///     // Prints "-6.5"
  ///
  /// - Parameter amount: The distance to advance this value.
  /// - Returns: A new value that is `amount` added to this value.
  @_transparent
  public func advanced(by amount: Double) -> Double {
    return self + amount
  }
}

//===----------------------------------------------------------------------===//
// Deprecated operators
//===----------------------------------------------------------------------===//

@_transparent
@available(*, unavailable, message: "Use truncatingRemainder instead")
public func % (lhs: Double, rhs: Double) -> Double {
  fatalError("% is not available.")
}

@_transparent
@available(*, unavailable, message: "Use formTruncatingRemainder instead")
public func %= (lhs: inout Double, rhs: Double) {
  fatalError("%= is not available.")
}

@_transparent
@available(*, unavailable, message: "use += 1")
@discardableResult
public prefix func ++ (rhs: inout Double) -> Double {
  fatalError("++ is not available")
}
@_transparent
@available(*, unavailable, message: "use -= 1")
@discardableResult
public prefix func -- (rhs: inout Double) -> Double {
  fatalError("-- is not available")
}
@_transparent
@available(*, unavailable, message: "use += 1")
@discardableResult
public postfix func ++ (lhs: inout Double) -> Double {
  fatalError("++ is not available")
}
@_transparent
@available(*, unavailable, message: "use -= 1")
@discardableResult
public postfix func -- (lhs: inout Double) -> Double {
  fatalError("-- is not available")
}

extension Double {
  @available(swift, deprecated: 3.1, obsoleted: 4.0, message: "Please use the `abs(_:)` free function")
  @_transparent
  public static func abs(_ x: Double) -> Double {
    return x.magnitude
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 67)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 69)
#if (!os(Windows) || CYGWIN) && (arch(i386) || arch(x86_64))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 71)

/// An extended-precision, floating-point value type.
@_fixed_layout
public struct Float80 {
  public // @testable
  var _value: Builtin.FPIEEE80

  /// Creates a value initialized to zero.
  @_transparent public
  init() {
    let zero: Int64 = 0
    self._value = Builtin.sitofp_Int64_FPIEEE80(zero._value)
  }

  @_transparent
  public // @testable
  init(_bits v: Builtin.FPIEEE80) {
    self._value = v
  }
}

extension Float80 : CustomStringConvertible {
  /// A textual representation of the value.
  public var description: String {
    return _float80ToString(self, debug: false)
  }
}

extension Float80 : CustomDebugStringConvertible {
  /// A textual representation of the value, suitable for debugging.
  public var debugDescription: String {
    return _float80ToString(self, debug: true)
  }
}

extension Float80: BinaryFloatingPoint {

  public typealias Exponent = Int
  public typealias RawSignificand = UInt64

  public static var exponentBitCount: Int {
    return 15
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 116)
  /// The available number of fractional significand bits.
  ///
  /// `Float80.significandBitCount` is 63, even though 64 bits are used to
  /// store the significand in the memory representation of a `Float80`
  /// instance. Unlike other floating-point types, the `Float80` type
  /// explicitly stores the leading integral significand bit.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 123)
  public static var significandBitCount: Int {
    return 63
  }

  //  Implementation details.
  @_versioned
  static var _infinityExponent: UInt {
    @inline(__always) get { return 1 << UInt(exponentBitCount) - 1 }
  }

  static var _exponentBias: UInt {
    @inline(__always) get { return _infinityExponent >> 1 }
  }

  static var _significandMask: UInt64 {
    @inline(__always) get {
      return 1 << UInt64(significandBitCount) - 1
    }
  }

  @_versioned
  static var _quietNaNMask: UInt64 {
    @inline(__always) get {
      return 1 << UInt64(significandBitCount - 1)
    }
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 220)
  // Internal implementation details of x86 Float80
  struct _Float80Representation {
    var explicitSignificand: UInt64
    var signAndExponent: UInt16
    var _padding: (UInt16, UInt16, UInt16) = (0, 0, 0)
    var sign: FloatingPointSign {
      return FloatingPointSign(rawValue: Int(signAndExponent >> 15))!
    }
    var exponentBitPattern: UInt { return UInt(signAndExponent) & 0x7fff }
    init(explicitSignificand: UInt64, signAndExponent: UInt16) {
      self.explicitSignificand = explicitSignificand
      self.signAndExponent = signAndExponent
    }
  }

  var _representation: _Float80Representation {
    return unsafeBitCast(self, to: _Float80Representation.self)
  }

  public var sign: FloatingPointSign {
    return _representation.sign
  }

  static var _explicitBitMask: UInt64 {
    @inline(__always) get { return 1 << 63 }
  }

  public var exponentBitPattern: UInt {
    let provisional = _representation.exponentBitPattern
    if provisional == 0 {
      if _representation.explicitSignificand >= Float80._explicitBitMask {
        //  Pseudo-denormals have an exponent of 0 but the leading bit of the
        //  significand field is set.  These are noncanonical encodings of the
        //  same significand with an exponent of 1.
        return 1
      }
      //  Exponent is zero, leading bit of significand is clear, so this is
      //  a canonical zero or subnormal number.
      return 0
    }
    if _representation.explicitSignificand < Float80._explicitBitMask {
      //  If the exponent is not-zero but the leading bit of the significand
      //  is clear, then we have an invalid operand (unnormal, pseudo-inf, or
      //  pseudo-NaN).  All of these are noncanonical encodings of NaN.
      return Float80._infinityExponent
    }
    //  We have a canonical number, so the provisional exponent is correct.
    return provisional
  }

  public var significandBitPattern: UInt64 {
    if _representation.exponentBitPattern > 0 &&
      _representation.explicitSignificand < Float80._explicitBitMask {
        //  If the exponent is nonzero and the leading bit of the significand
        //  is clear, then we have an invalid operand (unnormal, pseudo-inf, or
        //  pseudo-NaN).  All of these are noncanonical encodings of qNaN.
        return _representation.explicitSignificand | Float80._quietNaNMask
    }
    //  Otherwise we always get the "right" significand by simply clearing the
    //  integral bit.
    return _representation.explicitSignificand & Float80._significandMask
  }

  public init(sign: FloatingPointSign,
              exponentBitPattern: UInt,
              significandBitPattern: UInt64) {
    let signBit = UInt16(sign == .minus ? 0x8000 : 0)
    let exponent = UInt16(exponentBitPattern)
    var significand = significandBitPattern
    if exponent != 0 { significand |= Float80._explicitBitMask }
    let rep = _Float80Representation(explicitSignificand: significand,
      signAndExponent: signBit|exponent)
    self = unsafeBitCast(rep, to: Float80.self)
  }

  public var isCanonical: Bool {
    if exponentBitPattern == 0 {
      // If exponent field is zero, canonical numbers have the explicit
      // significand bit clear.
      return _representation.explicitSignificand < Float80._explicitBitMask
    }
    // If exponent is nonzero, canonical values have the explicit significand
    // bit set.
    return _representation.explicitSignificand >= Float80._explicitBitMask
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 306)

  public static var infinity: Float80 {
    return Float80(sign: .plus,
      exponentBitPattern: _infinityExponent,
      significandBitPattern: 0)
  }

  public static var nan: Float80 {
    return Float80(nan: 0, signaling: false)
  }

  public static var signalingNaN: Float80 {
    return Float80(nan: 0, signaling: true)
  }

  @available(*, unavailable, renamed: "nan")
  public static var quietNaN: Float80 { Builtin.unreachable()}

  public static var greatestFiniteMagnitude: Float80 {
    return Float80(sign: .plus,
      exponentBitPattern: _infinityExponent - 1,
      significandBitPattern: _significandMask)
  }

  public static var pi: Float80 {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 341)
    return Float80(0x1.921fb54442d1846ap1)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 343)
  }

  public var ulp: Float80 {
    if !isFinite { return Float80.nan }
    if exponentBitPattern > UInt(Float80.significandBitCount) {
      // self is large enough that self.ulp is normal, so we just compute its
      // exponent and construct it with a significand of zero.
      let ulpExponent = exponentBitPattern - UInt(Float80.significandBitCount)
      return Float80(sign: .plus,
        exponentBitPattern: ulpExponent,
        significandBitPattern: 0)
    }
    if exponentBitPattern >= 1 {
      // self is normal but ulp is subnormal.
      let ulpShift = UInt64(exponentBitPattern - 1)
      return Float80(sign: .plus,
        exponentBitPattern: 0,
        significandBitPattern: 1 << ulpShift)
    }
    return Float80(sign: .plus,
      exponentBitPattern: 0,
      significandBitPattern: 1)
  }

  public static var leastNormalMagnitude: Float80 {
    return Float80(sign: .plus,
      exponentBitPattern: 1,
      significandBitPattern: 0)
  }

  public static var leastNonzeroMagnitude: Float80 {
#if arch(arm)
    return leastNormalMagnitude
#else
    return Float80(sign: .plus,
      exponentBitPattern: 0,
      significandBitPattern: 1)
#endif
  }

  public var exponent: Int {
    if !isFinite { return .max }
    if isZero { return .min }
    let provisional = Int(exponentBitPattern) - Int(Float80._exponentBias)
    if isNormal { return provisional }
    let shift = Float80.significandBitCount - significandBitPattern.signBitIndex
    return provisional + 1 - Int(shift)
  }

  public var significand: Float80 {
    if isNaN { return self }
    if isNormal {
      return Float80(sign: .plus,
        exponentBitPattern: Float80._exponentBias,
        significandBitPattern: significandBitPattern)
    }
    if isSubnormal {
      let shift = Float80.significandBitCount - significandBitPattern.signBitIndex
      return Float80(sign: .plus,
        exponentBitPattern: Float80._exponentBias,
        significandBitPattern: significandBitPattern << UInt64(shift))
    }
    // zero or infinity.
    return Float80(sign: .plus,
      exponentBitPattern: exponentBitPattern,
      significandBitPattern: 0)
  }

  public init(sign: FloatingPointSign, exponent: Int, significand: Float80) {
    var result = significand
    if sign == .minus { result = -result }
    if significand.isFinite && !significand.isZero {
      var clamped = exponent
      let leastNormalExponent = 1 - Int(Float80._exponentBias)
      let greatestFiniteExponent = Int(Float80._exponentBias)
      if clamped < leastNormalExponent {
        clamped = max(clamped, 3*leastNormalExponent)
        while clamped < leastNormalExponent {
          result  *= Float80.leastNormalMagnitude
          clamped -= leastNormalExponent
        }
      }
      else if clamped > greatestFiniteExponent {
        clamped = min(clamped, 3*greatestFiniteExponent)
        let step = Float80(sign: .plus,
          exponentBitPattern: Float80._infinityExponent - 1,
          significandBitPattern: 0)
        while clamped > greatestFiniteExponent {
          result  *= step
          clamped -= greatestFiniteExponent
        }
      }
      let scale = Float80(sign: .plus,
        exponentBitPattern: UInt(Int(Float80._exponentBias) + clamped),
        significandBitPattern: 0)
      result = result * scale
    }
    self = result
  }

  /// Creates a NaN ("not a number") value with the specified payload.
  ///
  /// NaN values compare not equal to every value, including themselves. Most
  /// operations with a NaN operand produce a NaN result. Don't use the
  /// equal-to operator (`==`) to test whether a value is NaN. Instead, use
  /// the value's `isNaN` property.
  ///
  ///     let x = Float80(nan: 0, signaling: false)
  ///     print(x == .nan)
  ///     // Prints "false"
  ///     print(x.isNaN)
  ///     // Prints "true"
  ///
  /// - Parameters:
  ///   - payload: The payload to use for the new NaN value.
  ///   - signaling: Pass `true` to create a signaling NaN or `false` to create
  ///     a quiet NaN.
  public init(nan payload: RawSignificand, signaling: Bool) {
    // We use significandBitCount - 2 bits for NaN payload.
    _precondition(payload < (Float80._quietNaNMask >> 1),
      "NaN payload is not encodable.")
    var significand = payload
    significand |= Float80._quietNaNMask >> (signaling ? 1 : 0)
    self.init(sign: .plus,
              exponentBitPattern: Float80._infinityExponent,
              significandBitPattern: significand)
  }

  public var nextUp: Float80 {
    if isNaN { return self }
    if sign == .minus {
#if arch(arm)
      // On arm, subnormals are flushed to zero.
      if (exponentBitPattern == 1 && significandBitPattern == 0) ||
         (exponentBitPattern == 0 && significandBitPattern != 0) {
        return Float80(sign: .minus,
          exponentBitPattern: 0,
          significandBitPattern: 0)
      }
#endif
      if significandBitPattern == 0 {
        if exponentBitPattern == 0 {
          return .leastNonzeroMagnitude
        }
        return Float80(sign: .minus,
          exponentBitPattern: exponentBitPattern - 1,
          significandBitPattern: Float80._significandMask)
      }
      return Float80(sign: .minus,
        exponentBitPattern: exponentBitPattern,
        significandBitPattern: significandBitPattern - 1)
    }
    if isInfinite { return self }
    if significandBitPattern == Float80._significandMask {
      return Float80(sign: .plus,
        exponentBitPattern: exponentBitPattern + 1,
        significandBitPattern: 0)
    }
#if arch(arm)
    // On arm, subnormals are skipped.
    if exponentBitPattern == 0 {
      return .leastNonzeroMagnitude
    }
#endif
    return Float80(sign: .plus,
      exponentBitPattern: exponentBitPattern,
      significandBitPattern: significandBitPattern + 1)
  }

  @_transparent
  public mutating func round(_ rule: FloatingPointRoundingRule) {
    switch rule {
    case .toNearestOrAwayFromZero:
      _value = Builtin.int_round_FPIEEE80(_value)
    case .toNearestOrEven:
      _value = Builtin.int_rint_FPIEEE80(_value)
    case .towardZero:
      _value = Builtin.int_trunc_FPIEEE80(_value)
    case .awayFromZero:
      if sign == .minus {
        _value = Builtin.int_floor_FPIEEE80(_value)
      }
      else {
        _value = Builtin.int_ceil_FPIEEE80(_value)
      }
    case .up:
      _value = Builtin.int_ceil_FPIEEE80(_value)
    case .down:
      _value = Builtin.int_floor_FPIEEE80(_value)
    }
  }

  @_transparent
  public mutating func negate() {
    _value = Builtin.fneg_FPIEEE80(self._value)
  }

  @_transparent
  public mutating func add(_ other: Float80) {
    _value = Builtin.fadd_FPIEEE80(self._value, other._value)
  }

  @_transparent
  public mutating func subtract(_ other: Float80) {
    _value = Builtin.fsub_FPIEEE80(self._value, other._value)
  }

  @_transparent
  public mutating func multiply(by other: Float80) {
    _value = Builtin.fmul_FPIEEE80(self._value, other._value)
  }

  @_transparent
  public mutating func divide(by other: Float80) {
    _value = Builtin.fdiv_FPIEEE80(self._value, other._value)
  }

  @_transparent
  public mutating func formRemainder(dividingBy other: Float80) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 563)
    var other = other
    _swift_stdlib_remainderl(&self, &other)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 568)
  }

  @_transparent
  public mutating func formTruncatingRemainder(dividingBy other: Float80) {
    _value = Builtin.frem_FPIEEE80(self._value, other._value)
  }

  @_transparent
  public mutating func formSquareRoot( ) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 578)
    _swift_stdlib_squareRootl(&self)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 582)
  }

  @_transparent
  public mutating func addProduct(_ lhs: Float80, _ rhs: Float80) {
    _value = Builtin.int_fma_FPIEEE80(lhs._value, rhs._value, _value)
  }

  @_transparent
  public func isEqual(to other: Float80) -> Bool {
    return Bool(Builtin.fcmp_oeq_FPIEEE80(self._value, other._value))
  }

  @_transparent
  public func isLess(than other: Float80) -> Bool {
    return Bool(Builtin.fcmp_olt_FPIEEE80(self._value, other._value))
  }

  @_transparent
  public func isLessThanOrEqualTo(_ other: Float80) -> Bool {
    return Bool(Builtin.fcmp_ole_FPIEEE80(self._value, other._value))
  }

  @_transparent
  public var isNormal: Bool {
    return exponentBitPattern > 0 && isFinite
  }

  @_transparent
  public var isFinite: Bool {
    return exponentBitPattern < Float80._infinityExponent
  }

  @_transparent
  public var isZero: Bool {
    return exponentBitPattern == 0 && significandBitPattern == 0
  }

  @_transparent
  public var isSubnormal:  Bool {
    return exponentBitPattern == 0 && significandBitPattern != 0
  }

  @_transparent
  public var isInfinite:  Bool {
    return !isFinite && significandBitPattern == 0
  }

  @_transparent
  public var isNaN:  Bool {
    return !isFinite && significandBitPattern != 0
  }

  @_transparent
  public var isSignalingNaN: Bool {
    return isNaN && (significandBitPattern & Float80._quietNaNMask) == 0
  }

  public var binade: Float80 {
    if !isFinite { return .nan }
    if exponentBitPattern != 0 {
      return Float80(sign: sign, exponentBitPattern: exponentBitPattern,
        significandBitPattern: 0)
    }
    if significandBitPattern == 0 { return self }
    // For subnormals, we isolate the leading significand bit.
    let index = significandBitPattern.signBitIndex
    return Float80(sign: sign, exponentBitPattern: 0,
      significandBitPattern: 1 << RawSignificand(index))
  }

  public var significandWidth: Int {
    let trailingZeros = significandBitPattern.countTrailingZeros
    if isNormal {
      guard significandBitPattern != 0 else { return 0 }
      return Float80.significandBitCount - trailingZeros
    }
    if isSubnormal {
      return significandBitPattern.signBitIndex - trailingZeros
    }
    return -1
  }

  /// Creates a new value from the given floating-point literal.
  ///
  /// Do not call this initializer directly. It is used by the compiler when
  /// you create a new `Float80` instance by using a floating-point literal.
  /// Instead, create a new value by using a literal.
  ///
  /// In this example, the assignment to the `x` constant calls this
  /// initializer behind the scenes.
  ///
  ///     let x: Float80 = 21.25
  ///     // x == 21.25
  ///
  /// - Parameter value: The new floating-point value.
  @_transparent
  public init(floatLiteral value: Float80) {
    self = value
  }
}

extension Float80 : _ExpressibleByBuiltinIntegerLiteral, ExpressibleByIntegerLiteral {
  @_transparent
  public
  init(_builtinIntegerLiteral value: Builtin.Int2048){
    self = Float80(_bits: Builtin.itofp_with_overflow_Int2048_FPIEEE80(value))
  }

  /// Creates a new value from the given integer literal.
  ///
  /// Do not call this initializer directly. It is used by the compiler when
  /// you create a new `Float80` instance by using an integer literal.
  /// Instead, create a new value by using a literal.
  ///
  /// In this example, the assignment to the `x` constant calls this
  /// initializer behind the scenes.
  ///
  ///     let x: Float80 = 100
  ///     // x == 100.0
  ///
  /// - Parameter value: The new value.
  @_transparent
  public init(integerLiteral value: Int64) {
    self = Float80(_bits: Builtin.sitofp_Int64_FPIEEE80(value._value))
  }
}

#if (!os(Windows) || CYGWIN) && (arch(i386) || arch(x86_64))

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 712)
extension Float80 : _ExpressibleByBuiltinFloatLiteral {
  @_transparent
  public
  init(_builtinFloatLiteral value: Builtin.FPIEEE80) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 717)
    self = Float80(_bits: value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 724)
  }
}

#else

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 730)
extension Float80 : _ExpressibleByBuiltinFloatLiteral {
  @_transparent
  public
  init(_builtinFloatLiteral value: Builtin.FPIEEE64) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 739)
    // FIXME: This is actually losing precision <rdar://problem/14073102>.
    self = Float80(Builtin.fpext_FPIEEE64_FPIEEE80(value))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 742)
  }
}

#endif

extension Float80 : Hashable {
  /// The number's hash value.
  ///
  /// Hash values are not guaranteed to be equal across different executions of
  /// your program. Do not save hash values to use during a future execution.
  public var hashValue: Int {
    if isZero {
      // To satisfy the axiom that equality implies hash equality, we need to
      // finesse the hash value of -0.0 to match +0.0.
      return 0
    } else {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 768)
      return Int(bitPattern: UInt(significandBitPattern)) ^
             Int(_representation.signAndExponent)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 771)
    }
  }
}

extension Float80 {
  /// The magnitude of this value.
  ///
  /// For any value `x`, `x.magnitude.sign` is `.plus`. If `x` is not NaN,
  /// `x.magnitude` is the absolute value of `x`.
  ///
  /// The global `abs(_:)` function provides more familiar syntax when you need
  /// to find an absolute value. In addition, because `abs(_:)` always returns
  /// a value of the same type, even in a generic context, using the function
  /// instead of the `magnitude` property is encouraged.
  ///
  ///     let targetDistance: Float80 = 5.25
  ///     let throwDistance: Float80 = 5.5
  ///
  ///     let margin = targetDistance - throwDistance
  ///     // margin == -0.25
  ///     // margin.magnitude == 0.25
  ///
  ///     // Use 'abs(_:)' instead of 'magnitude'
  ///     print("Missed the target by \(abs(margin)) meters.")
  ///     // Prints "Missed the target by 0.25 meters."
  ///
  /// - SeeAlso: `abs(_:)`
  @_transparent
  public var magnitude: Float80 {
    return Float80(_bits: Builtin.int_fabs_FPIEEE80(_value))
  }
}

@_transparent
public prefix func + (x: Float80) -> Float80 {
  return x
}

@_transparent
public prefix func - (x: Float80) -> Float80 {
  return Float80(_bits: Builtin.fneg_FPIEEE80(x._value))
}

//===----------------------------------------------------------------------===//
// Explicit conversions between types.
//===----------------------------------------------------------------------===//

// Construction from integers.
extension Float80 {

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 826)
  @_transparent
  public init(_ v: UInt8) {
    _value = Builtin.uitofp_Int8_FPIEEE80(v._value)
  }
  
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 832)
  @available(*, message: "Converting UInt8 to Float80 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 834)
  @inline(__always)
  public init?(exactly value: UInt8) {
    _value = Builtin.uitofp_Int8_FPIEEE80(value._value)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 839)
    if UInt8(self) != value {
      return nil
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 843)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 826)
  @_transparent
  public init(_ v: Int8) {
    _value = Builtin.sitofp_Int8_FPIEEE80(v._value)
  }
  
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 832)
  @available(*, message: "Converting Int8 to Float80 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 834)
  @inline(__always)
  public init?(exactly value: Int8) {
    _value = Builtin.sitofp_Int8_FPIEEE80(value._value)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 839)
    if Int8(self) != value {
      return nil
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 843)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 826)
  @_transparent
  public init(_ v: UInt16) {
    _value = Builtin.uitofp_Int16_FPIEEE80(v._value)
  }
  
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 832)
  @available(*, message: "Converting UInt16 to Float80 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 834)
  @inline(__always)
  public init?(exactly value: UInt16) {
    _value = Builtin.uitofp_Int16_FPIEEE80(value._value)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 839)
    if UInt16(self) != value {
      return nil
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 843)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 826)
  @_transparent
  public init(_ v: Int16) {
    _value = Builtin.sitofp_Int16_FPIEEE80(v._value)
  }
  
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 832)
  @available(*, message: "Converting Int16 to Float80 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 834)
  @inline(__always)
  public init?(exactly value: Int16) {
    _value = Builtin.sitofp_Int16_FPIEEE80(value._value)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 839)
    if Int16(self) != value {
      return nil
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 843)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 826)
  @_transparent
  public init(_ v: UInt32) {
    _value = Builtin.uitofp_Int32_FPIEEE80(v._value)
  }
  
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 832)
  @available(*, message: "Converting UInt32 to Float80 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 834)
  @inline(__always)
  public init?(exactly value: UInt32) {
    _value = Builtin.uitofp_Int32_FPIEEE80(value._value)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 839)
    if UInt32(self) != value {
      return nil
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 843)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 826)
  @_transparent
  public init(_ v: Int32) {
    _value = Builtin.sitofp_Int32_FPIEEE80(v._value)
  }
  
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 832)
  @available(*, message: "Converting Int32 to Float80 will always succeed.")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 834)
  @inline(__always)
  public init?(exactly value: Int32) {
    _value = Builtin.sitofp_Int32_FPIEEE80(value._value)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 839)
    if Int32(self) != value {
      return nil
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 843)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 826)
  @_transparent
  public init(_ v: UInt64) {
    _value = Builtin.uitofp_Int64_FPIEEE80(v._value)
  }
  
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 834)
  @inline(__always)
  public init?(exactly value: UInt64) {
    _value = Builtin.uitofp_Int64_FPIEEE80(value._value)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 843)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 826)
  @_transparent
  public init(_ v: Int64) {
    _value = Builtin.sitofp_Int64_FPIEEE80(v._value)
  }
  
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 834)
  @inline(__always)
  public init?(exactly value: Int64) {
    _value = Builtin.sitofp_Int64_FPIEEE80(value._value)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 843)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 826)
  @_transparent
  public init(_ v: UInt) {
    _value = Builtin.uitofp_Int64_FPIEEE80(v._value)
  }
  
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 834)
  @inline(__always)
  public init?(exactly value: UInt) {
    _value = Builtin.uitofp_Int64_FPIEEE80(value._value)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 843)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 826)
  @_transparent
  public init(_ v: Int) {
    _value = Builtin.sitofp_Int64_FPIEEE80(v._value)
  }
  
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 834)
  @inline(__always)
  public init?(exactly value: Int) {
    _value = Builtin.sitofp_Int64_FPIEEE80(value._value)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 843)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 845)
}

// Construction from other floating point numbers.
extension Float80 {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 852)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 856)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 864)
  /// Creates a new instance that approximates the given value.
  ///
  /// The value of `other` is rounded to a representable value, if necessary.
  /// A NaN passed as `other` results in another NaN, with a signaling NaN
  /// value converted to quiet NaN.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 870)
  ///
  ///     let x: Float = 21.25
  ///     let y = Float80(x)
  ///     // y == 21.25
  ///
  ///     let z = Float80(Float.nan)
  ///     // z.isNaN == true
  ///
  /// - Parameter other: The value to use for the new instance.
  @_transparent
  public init(_ other: Float) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 884)
    _value = Builtin.fpext_FPIEEE32_FPIEEE80(other._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 888)
  }

  /// Creates a new instance initialized to the given value, if it can be
  /// represented without rounding.
  ///
  /// If `other` can't be represented as an instance of `Float80` without
  /// rounding, the result of this initializer is `nil`. In particular,
  /// passing NaN as `other` always results in `nil`.
  ///
  ///     let x: Float = 21.25
  ///     let y = Float80(exactly: x)
  ///     // y == Optional.some(21.25)
  ///
  ///     let z = Float80(exactly: Float.nan)
  ///     // z == nil
  ///
  /// - Parameter other: The value to use for the new instance.
  @inline(__always)
  public init?(exactly other: Float) {
    self.init(other)
    // Converting the infinity value is considered value preserving.
    // In other cases, check that we can round-trip and get the same value.
    // NaN always fails.
    if Float(self) != other {
      return nil
    }
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 852)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 856)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 864)
  /// Creates a new instance that approximates the given value.
  ///
  /// The value of `other` is rounded to a representable value, if necessary.
  /// A NaN passed as `other` results in another NaN, with a signaling NaN
  /// value converted to quiet NaN.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 870)
  ///
  ///     let x: Double = 21.25
  ///     let y = Float80(x)
  ///     // y == 21.25
  ///
  ///     let z = Float80(Double.nan)
  ///     // z.isNaN == true
  ///
  /// - Parameter other: The value to use for the new instance.
  @_transparent
  public init(_ other: Double) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 884)
    _value = Builtin.fpext_FPIEEE64_FPIEEE80(other._value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 888)
  }

  /// Creates a new instance initialized to the given value, if it can be
  /// represented without rounding.
  ///
  /// If `other` can't be represented as an instance of `Float80` without
  /// rounding, the result of this initializer is `nil`. In particular,
  /// passing NaN as `other` always results in `nil`.
  ///
  ///     let x: Double = 21.25
  ///     let y = Float80(exactly: x)
  ///     // y == Optional.some(21.25)
  ///
  ///     let z = Float80(exactly: Double.nan)
  ///     // z == nil
  ///
  /// - Parameter other: The value to use for the new instance.
  @inline(__always)
  public init?(exactly other: Double) {
    self.init(other)
    // Converting the infinity value is considered value preserving.
    // In other cases, check that we can round-trip and get the same value.
    // NaN always fails.
    if Double(self) != other {
      return nil
    }
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 852)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 854)
#if (!os(Windows) || CYGWIN) && (arch(i386) || arch(x86_64))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 856)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 858)
  /// Creates a new instance initialized to the given value.
  ///
  /// The value of `other` is represented exactly by the new instance. A NaN
  /// passed as `other` results in another NaN, with a signaling NaN value
  /// converted to quiet NaN.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 870)
  ///
  ///     let x: Float80 = 21.25
  ///     let y = Float80(x)
  ///     // y == 21.25
  ///
  ///     let z = Float80(Float80.nan)
  ///     // z.isNaN == true
  ///
  /// - Parameter other: The value to use for the new instance.
  @_transparent
  public init(_ other: Float80) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 886)
    _value = other._value
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 888)
  }

  /// Creates a new instance initialized to the given value, if it can be
  /// represented without rounding.
  ///
  /// If `other` can't be represented as an instance of `Float80` without
  /// rounding, the result of this initializer is `nil`. In particular,
  /// passing NaN as `other` always results in `nil`.
  ///
  ///     let x: Float80 = 21.25
  ///     let y = Float80(exactly: x)
  ///     // y == Optional.some(21.25)
  ///
  ///     let z = Float80(exactly: Float80.nan)
  ///     // z == nil
  ///
  /// - Parameter other: The value to use for the new instance.
  @inline(__always)
  public init?(exactly other: Float80) {
    self.init(other)
    // Converting the infinity value is considered value preserving.
    // In other cases, check that we can round-trip and get the same value.
    // NaN always fails.
    if Float80(self) != other {
      return nil
    }
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 917)
#endif
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 920)
}

//===----------------------------------------------------------------------===//
// Standard Operator Table
//===----------------------------------------------------------------------===//

//  TODO: These should not be necessary, since they're already provided by
//  <T: FloatingPoint>, but in practice they are currently needed to
//  disambiguate overloads.  We should find a way to remove them, either by
//  tweaking the overload resolution rules, or by removing the other
//  definitions in the standard lib, or both.

@_transparent
public func + (lhs: Float80, rhs: Float80) -> Float80 {
  return lhs.adding(rhs)
}

@_transparent
public func - (lhs: Float80, rhs: Float80) -> Float80 {
  return lhs.subtracting(rhs)
}

@_transparent
public func * (lhs: Float80, rhs: Float80) -> Float80 {
  return lhs.multiplied(by: rhs)
}

@_transparent
public func / (lhs: Float80, rhs: Float80) -> Float80 {
  return lhs.divided(by: rhs)
}

@_transparent
public func += (lhs: inout Float80, rhs: Float80) {
  lhs.add(rhs)
}

@_transparent
public func -= (lhs: inout Float80, rhs: Float80) {
  lhs.subtract(rhs)
}

@_transparent
public func *= (lhs: inout Float80, rhs: Float80) {
  lhs.multiply(by: rhs)
}

@_transparent
public func /= (lhs: inout Float80, rhs: Float80) {
  lhs.divide(by: rhs)
}

//===----------------------------------------------------------------------===//
// Strideable Conformance
//===----------------------------------------------------------------------===//

extension Float80 : Strideable {
  /// Returns the distance from this value to the specified value.
  ///
  /// For two values `x` and `y`, the result of `x.distance(to: y)` is equal to
  /// `y - x`---a distance `d` such that `x.advanced(by: d)` approximates `y`.
  /// For example:
  ///
  ///     let x = 21.5
  ///     let d = x.distance(to: 15.0)
  ///     // d == -6.5
  ///
  ///     print(x.advanced(by: d))
  ///     // Prints "15.0"
  ///
  /// - Parameter other: A value to calculate the distance to.
  /// - Returns: The distance between this value and `other`.
  @_transparent
  public func distance(to other: Float80) -> Float80 {
    return other - self
  }

  /// Returns a new value advanced by the given distance.
  ///
  /// For two values `x` and `d`, the result of a `x.advanced(by: d)` is equal
  /// to `x + d`---a new value `y` such that `x.distance(to: y)` approximates
  /// `d`. For example:
  ///
  ///     let x = 21.5
  ///     let y = x.advanced(by: -6.5)
  ///     // y == 15.0
  ///
  ///     print(x.distance(to: y))
  ///     // Prints "-6.5"
  ///
  /// - Parameter amount: The distance to advance this value.
  /// - Returns: A new value that is `amount` added to this value.
  @_transparent
  public func advanced(by amount: Float80) -> Float80 {
    return self + amount
  }
}

//===----------------------------------------------------------------------===//
// Deprecated operators
//===----------------------------------------------------------------------===//

@_transparent
@available(*, unavailable, message: "Use truncatingRemainder instead")
public func % (lhs: Float80, rhs: Float80) -> Float80 {
  fatalError("% is not available.")
}

@_transparent
@available(*, unavailable, message: "Use formTruncatingRemainder instead")
public func %= (lhs: inout Float80, rhs: Float80) {
  fatalError("%= is not available.")
}

@_transparent
@available(*, unavailable, message: "use += 1")
@discardableResult
public prefix func ++ (rhs: inout Float80) -> Float80 {
  fatalError("++ is not available")
}
@_transparent
@available(*, unavailable, message: "use -= 1")
@discardableResult
public prefix func -- (rhs: inout Float80) -> Float80 {
  fatalError("-- is not available")
}
@_transparent
@available(*, unavailable, message: "use += 1")
@discardableResult
public postfix func ++ (lhs: inout Float80) -> Float80 {
  fatalError("++ is not available")
}
@_transparent
@available(*, unavailable, message: "use -= 1")
@discardableResult
public postfix func -- (lhs: inout Float80) -> Float80 {
  fatalError("-- is not available")
}

extension Float80 {
  @available(swift, deprecated: 3.1, obsoleted: 4.0, message: "Please use the `abs(_:)` free function")
  @_transparent
  public static func abs(_ x: Float80) -> Float80 {
    return x.magnitude
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPointTypes.swift.gyb", line: 1068)
#endif
