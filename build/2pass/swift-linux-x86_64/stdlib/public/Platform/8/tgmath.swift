// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 1)
//===--- tgmath.swift.gyb -------------------------------------*- swift -*-===//
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

// Generic functions implementable directly on FloatingPoint.
@_transparent
public func fabs<T: FloatingPoint>(_ x: T) -> T {
  return abs(x)
}

@_transparent
public func sqrt<T: FloatingPoint>(_ x: T) -> T {
  return x.squareRoot()
}

@_transparent
public func fma<T: FloatingPoint>(_ x: T, _ y: T, _ z: T) -> T {
  return z.addingProduct(x, y)
}

@_transparent
public func remainder<T: FloatingPoint>(_ x: T, _ y: T) -> T {
  return x.remainder(dividingBy: y)
}

@_transparent
public func fmod<T: FloatingPoint>(_ x: T, _ y: T) -> T {
  return x.truncatingRemainder(dividingBy: y)
}

@_transparent
public func ceil<T: FloatingPoint>(_ x: T) -> T {
  return x.rounded(.up)
}

@_transparent
public func floor<T: FloatingPoint>(_ x: T) -> T {
  return x.rounded(.down)
}

@_transparent
public func round<T: FloatingPoint>(_ x: T) -> T {
  return x.rounded()
}

@_transparent
public func trunc<T: FloatingPoint>(_ x: T) -> T {
  return x.rounded(.towardZero)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 164)

// Unary functions
// Note these do not have a corresponding LLVM intrinsic
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 168)
@_transparent
public func acos(_ x: Float) -> Float {
  return Float(acosf(CFloat(x)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 168)
@_transparent
public func asin(_ x: Float) -> Float {
  return Float(asinf(CFloat(x)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 168)
@_transparent
public func atan(_ x: Float) -> Float {
  return Float(atanf(CFloat(x)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 168)
@_transparent
public func tan(_ x: Float) -> Float {
  return Float(tanf(CFloat(x)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 168)
@_transparent
public func acosh(_ x: Float) -> Float {
  return Float(acoshf(CFloat(x)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 168)
@_transparent
public func asinh(_ x: Float) -> Float {
  return Float(asinhf(CFloat(x)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 168)
@_transparent
public func atanh(_ x: Float) -> Float {
  return Float(atanhf(CFloat(x)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 168)
@_transparent
public func cosh(_ x: Float) -> Float {
  return Float(coshf(CFloat(x)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 168)
@_transparent
public func sinh(_ x: Float) -> Float {
  return Float(sinhf(CFloat(x)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 168)
@_transparent
public func tanh(_ x: Float) -> Float {
  return Float(tanhf(CFloat(x)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 168)
@_transparent
public func expm1(_ x: Float) -> Float {
  return Float(expm1f(CFloat(x)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 168)
@_transparent
public func log1p(_ x: Float) -> Float {
  return Float(log1pf(CFloat(x)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 168)
@_transparent
public func logb(_ x: Float) -> Float {
  return Float(logbf(CFloat(x)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 168)
@_transparent
public func cbrt(_ x: Float) -> Float {
  return Float(cbrtf(CFloat(x)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 168)
@_transparent
public func erf(_ x: Float) -> Float {
  return Float(erff(CFloat(x)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 168)
@_transparent
public func erfc(_ x: Float) -> Float {
  return Float(erfcf(CFloat(x)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 168)
@_transparent
public func tgamma(_ x: Float) -> Float {
  return Float(tgammaf(CFloat(x)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 174)

#if os(OSX) || os(iOS) || os(tvOS) || os(watchOS)
// Unary intrinsic functions
// Note these have a corresponding LLVM intrinsic
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 179)
@_transparent
public func cos(_ x: Float) -> Float {
  return _cos(x)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 179)
@_transparent
public func cos(_ x: Double) -> Double {
  return _cos(x)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 179)
@_transparent
public func sin(_ x: Float) -> Float {
  return _sin(x)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 179)
@_transparent
public func sin(_ x: Double) -> Double {
  return _sin(x)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 179)
@_transparent
public func exp(_ x: Float) -> Float {
  return _exp(x)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 179)
@_transparent
public func exp(_ x: Double) -> Double {
  return _exp(x)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 179)
@_transparent
public func exp2(_ x: Float) -> Float {
  return _exp2(x)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 179)
@_transparent
public func exp2(_ x: Double) -> Double {
  return _exp2(x)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 179)
@_transparent
public func log(_ x: Float) -> Float {
  return _log(x)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 179)
@_transparent
public func log(_ x: Double) -> Double {
  return _log(x)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 179)
@_transparent
public func log10(_ x: Float) -> Float {
  return _log10(x)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 179)
@_transparent
public func log10(_ x: Double) -> Double {
  return _log10(x)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 179)
@_transparent
public func log2(_ x: Float) -> Float {
  return _log2(x)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 179)
@_transparent
public func log2(_ x: Double) -> Double {
  return _log2(x)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 179)
@_transparent
public func nearbyint(_ x: Float) -> Float {
  return _nearbyint(x)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 179)
@_transparent
public func nearbyint(_ x: Double) -> Double {
  return _nearbyint(x)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 179)
@_transparent
public func rint(_ x: Float) -> Float {
  return _rint(x)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 179)
@_transparent
public func rint(_ x: Double) -> Double {
  return _rint(x)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 185)
#else
// FIXME: As of now, we cannot declare 64-bit (Double/CDouble) overlays here.
// Since CoreFoundation also exports libc functions, they will conflict with
// Swift overlays when building Foundation. For now, just like normal
// UnaryFunctions, we define overlays only for OverlayFloatTypes.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 192)
@_transparent
public func cos(_ x: Float) -> Float {
  return Float(cosf(CFloat(x)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 192)
@_transparent
public func sin(_ x: Float) -> Float {
  return Float(sinf(CFloat(x)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 192)
@_transparent
public func exp(_ x: Float) -> Float {
  return Float(expf(CFloat(x)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 192)
@_transparent
public func exp2(_ x: Float) -> Float {
  return Float(exp2f(CFloat(x)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 192)
@_transparent
public func log(_ x: Float) -> Float {
  return Float(logf(CFloat(x)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 192)
@_transparent
public func log10(_ x: Float) -> Float {
  return Float(log10f(CFloat(x)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 192)
@_transparent
public func log2(_ x: Float) -> Float {
  return Float(log2f(CFloat(x)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 192)
@_transparent
public func nearbyint(_ x: Float) -> Float {
  return Float(nearbyintf(CFloat(x)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 192)
@_transparent
public func rint(_ x: Float) -> Float {
  return Float(rintf(CFloat(x)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 199)
#endif

// Binary functions

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 204)
@_transparent
public func atan2(_ lhs: Float, _ rhs: Float) -> Float {
  return Float(atan2f(CFloat(lhs), CFloat(rhs)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 204)
@_transparent
public func hypot(_ lhs: Float, _ rhs: Float) -> Float {
  return Float(hypotf(CFloat(lhs), CFloat(rhs)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 204)
@_transparent
public func pow(_ lhs: Float, _ rhs: Float) -> Float {
  return Float(powf(CFloat(lhs), CFloat(rhs)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 204)
@_transparent
public func copysign(_ lhs: Float, _ rhs: Float) -> Float {
  return Float(copysignf(CFloat(lhs), CFloat(rhs)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 204)
@_transparent
public func nextafter(_ lhs: Float, _ rhs: Float) -> Float {
  return Float(nextafterf(CFloat(lhs), CFloat(rhs)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 204)
@_transparent
public func fdim(_ lhs: Float, _ rhs: Float) -> Float {
  return Float(fdimf(CFloat(lhs), CFloat(rhs)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 204)
@_transparent
public func fmax(_ lhs: Float, _ rhs: Float) -> Float {
  return Float(fmaxf(CFloat(lhs), CFloat(rhs)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 204)
@_transparent
public func fmin(_ lhs: Float, _ rhs: Float) -> Float {
  return Float(fminf(CFloat(lhs), CFloat(rhs)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 210)

// Other functions
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 213)
@available(*, deprecated, message: "use the floatingPointClass property.")
public func fpclassify(_ value: Float) -> Int {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 224)
#if os(Windows) && !CYGWIN
  return Int(_fdclass(CFloat(value)))
#else
  return Int(__fpclassifyf(CFloat(value)))
#endif
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 230)
}

@available(*, unavailable, message: "use the isNormal property.")
public func isnormal(_ value: Float) -> Bool { return value.isNormal }

@available(*, unavailable, message: "use the isFinite property.")
public func isfinite(_ value: Float) -> Bool { return value.isFinite }

@available(*, unavailable, message: "use the isInfinite property.")
public func isinf(_ value: Float) -> Bool { return value.isInfinite }

@available(*, unavailable, message: "use the isNaN property.")
public func isnan(_ value: Float) -> Bool { return value.isNaN }

@available(*, unavailable, message: "use the sign property.")
public func signbit(_ value: Float) -> Int { return value.sign.rawValue }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 213)
@available(*, deprecated, message: "use the floatingPointClass property.")
public func fpclassify(_ value: Double) -> Int {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 216)
#if os(Linux)
  return Int(__fpclassify(CDouble(value)))
#elseif os(Windows) && !CYGWIN
  return Int(_dclass(CDouble(value)))
#else
  return Int(__fpclassifyd(CDouble(value)))
#endif
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 230)
}

@available(*, unavailable, message: "use the isNormal property.")
public func isnormal(_ value: Double) -> Bool { return value.isNormal }

@available(*, unavailable, message: "use the isFinite property.")
public func isfinite(_ value: Double) -> Bool { return value.isFinite }

@available(*, unavailable, message: "use the isInfinite property.")
public func isinf(_ value: Double) -> Bool { return value.isInfinite }

@available(*, unavailable, message: "use the isNaN property.")
public func isnan(_ value: Double) -> Bool { return value.isNaN }

@available(*, unavailable, message: "use the sign property.")
public func signbit(_ value: Double) -> Int { return value.sign.rawValue }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 248)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 251)
@_transparent
public func modf(_ value: Float) -> (Float, Float) {
  var ipart = CFloat(0)
  let fpart = modff(CFloat(value), &ipart)
  return (Float(ipart), Float(fpart))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 251)
@_transparent
public func modf(_ value: Double) -> (Double, Double) {
  var ipart = CDouble(0)
  let fpart = modf(CDouble(value), &ipart)
  return (Double(ipart), Double(fpart))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 259)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 262)
@_transparent
public func ldexp(_ x: Float, _ n: Int) -> Float {
  return Float(ldexpf(CFloat(x), Int32(n)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 262)
@_transparent
public func ldexp(_ x: Double, _ n: Int) -> Double {
  return Double(ldexp(CDouble(x), Int32(n)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 268)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 271)
@_transparent
public func frexp(_ value: Float) -> (Float, Int) {
  var exp = Int32(0)
  let frac = frexpf(CFloat(value), &exp)
  return (Float(frac), Int(exp))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 271)
@_transparent
public func frexp(_ value: Double) -> (Double, Int) {
  var exp = Int32(0)
  let frac = frexp(CDouble(value), &exp)
  return (Double(frac), Int(exp))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 279)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 282)
@_transparent
public func ilogb(_ x: Float) -> Int {
  return Int(ilogbf(CFloat(x)) as Int32)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 282)
@_transparent
public func ilogb(_ x: Double) -> Int {
  return Int(ilogb(CDouble(x)) as Int32)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 288)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 291)
@_transparent
public func scalbn(_ x: Float, _ n: Int) -> Float {
  return Float(scalbnf(CFloat(x), Int32(n)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 291)
@_transparent
public func scalbn(_ x: Double, _ n: Int) -> Double {
  return Double(scalbn(CDouble(x), Int32(n)))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 297)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 300)
#if os(Linux) || os(FreeBSD) || os(PS4) || os(Android) || CYGWIN
@_transparent
public func lgamma(_ x: Float) -> (Float, Int) {
  var sign = Int32(0)
  let value = lgammaf_r(CFloat(x), &sign)
  return (Float(value), Int(sign))
}
#elseif os(Windows)
#if CYGWIN
@_transparent
public func lgamma(_ x: Float) -> (Float, Int) {
  var sign = Int32(0)
  let value = lgammaf_r(CFloat(x), &sign)
  return (Float(value), Int(sign))
}
#else
// TODO(compnerd): implement
#endif
#else
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 321)
@_versioned
@_silgen_name("_swift_Darwin_lgammaf_r")
func _swift_Darwin_lgammaf_r(_: CFloat,
                                _: UnsafeMutablePointer<Int32>) -> CFloat

@_transparent
public func lgamma(_ x: Float) -> (Float, Int) {
  var sign = Int32(0)
  let value = withUnsafeMutablePointer(to: &sign) {
    (signp: UnsafeMutablePointer<Int32>) -> CFloat in
    return _swift_Darwin_lgammaf_r(CFloat(x), signp)
  }
  return (Float(value), Int(sign))
}
#endif

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 300)
#if os(Linux) || os(FreeBSD) || os(PS4) || os(Android) || CYGWIN
@_transparent
public func lgamma(_ x: Double) -> (Double, Int) {
  var sign = Int32(0)
  let value = lgamma_r(CDouble(x), &sign)
  return (Double(value), Int(sign))
}
#elseif os(Windows)
#if CYGWIN
@_transparent
public func lgamma(_ x: Double) -> (Double, Int) {
  var sign = Int32(0)
  let value = lgamma_r(CDouble(x), &sign)
  return (Double(value), Int(sign))
}
#else
// TODO(compnerd): implement
#endif
#else
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 321)
@_versioned
@_silgen_name("_swift_Darwin_lgamma_r")
func _swift_Darwin_lgamma_r(_: CDouble,
                                _: UnsafeMutablePointer<Int32>) -> CDouble

@_transparent
public func lgamma(_ x: Double) -> (Double, Int) {
  var sign = Int32(0)
  let value = withUnsafeMutablePointer(to: &sign) {
    (signp: UnsafeMutablePointer<Int32>) -> CDouble in
    return _swift_Darwin_lgamma_r(CDouble(x), signp)
  }
  return (Double(value), Int(sign))
}
#endif

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 338)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 341)
@_transparent
public func remquo(_ x: Float, _ y: Float) -> (Float, Int) {
  var quo = Int32(0)
  let rem = remquof(CFloat(x), CFloat(y), &quo)
  return (Float(rem), Int(quo))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 341)
@_transparent
public func remquo(_ x: Double, _ y: Double) -> (Double, Int) {
  var quo = Int32(0)
  let rem = remquo(CDouble(x), CDouble(y), &quo)
  return (Double(rem), Int(quo))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 349)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 351)
@_transparent
public func nan(_ tag: String) -> Float {
  return Float(nanf(tag))
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 357)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/Platform/tgmath.swift.gyb", line: 359)
@_transparent
public func jn(_ n: Int, _ x: Double) -> Double {
#if os(Windows)
#if CYGWIN
  return jn(Int32(n), x)
#else
  return _jn(Int32(n), x)
#endif
#else
  return jn(Int32(n), x)
#endif
}

@_transparent
public func yn(_ n: Int, _ x: Double) -> Double {
#if os(Windows)
#if CYGWIN
  return yn(Int32(n), x)
#else
  return _yn(Int32(n), x)
#endif
#else
  return yn(Int32(n), x)
#endif
}

