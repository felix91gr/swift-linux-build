// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPoint.swift.gyb", line: 1)
//===--- FloatingPoint.swift.gyb ------------------------------*- swift -*-===//
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

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPoint.swift.gyb", line: 21)

/// A floating-point numeric type.
///
/// Floating-point types are used to represent fractional numbers, like 5.5,
/// 100.0, or 3.14159274. Each floating-point type has its own possible range
/// and precision. The floating-point types in the standard library are
/// `Float`, `Double`, and `Float80` where available.
///
/// Create new instances of floating-point types using integer or
/// floating-point literals. For example:
///
///     let temperature = 33.2
///     let recordHigh = 37.5
///
/// The `FloatingPoint` protocol declares common arithmetic operations, so you
/// can write functions and algorithms that work on any floating-point type.
/// The following example declares a function that calculates the length of
/// the hypotenuse of a right triangle given its two perpendicular sides.
/// Because the `hypotenuse(_:_:)` function uses a generic parameter
/// constrained to the `FloatingPoint` protocol, you can call it using any
/// floating-point type.
///
///     func hypotenuse<T: FloatingPoint>(_ a: T, _ b: T) -> T {
///         return (a * a + b * b).squareRoot()
///     }
///
///     let (dx, dy) = (3.0, 4.0)
///     let distance = hypotenuse(dx, dy)
///     // distance == 5.0
///
/// Floating-point values are represented as a *sign* and a *magnitude*, where
/// the magnitude is calculated using the type's *radix* and the instance's
/// *significand* and *exponent*. This magnitude calculation takes the
/// following form for a floating-point value `x` of type `F`, where `**` is
/// exponentiation:
///
///     x.significand * F.radix ** x.exponent
///
/// Here's an example of the number -8.5 represented as an instance of the
/// `Double` type, which defines a radix of 2.
///
///     let y = -8.5
///     // y.sign == .minus
///     // y.significand == 1.0625
///     // y.exponent == 3
///
///     let magnitude = 1.0625 * Double(2 ** 3)
///     // magnitude == 8.5
///
/// Types that conform to the `FloatingPoint` protocol provide most basic
/// (clause 5) operations of the [IEEE 754 specification][spec]. The base,
/// precision, and exponent range are not fixed in any way by this protocol,
/// but it enforces the basic requirements of any IEEE 754 floating-point
/// type.
///
/// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
///
/// Additional Considerations
/// =========================
///
/// In addition to representing specific numbers, floating-point types also
/// have special values for working with overflow and nonnumeric results of
/// calculation.
///
/// Infinity
/// --------
///
/// Any value whose magnitude is so great that it would round to a value
/// outside the range of representable numbers is rounded to *infinity*. For a
/// type `F`, positive and negative infinity are represented as `F.infinity`
/// and `-F.infinity`, respectively. Positive infinity compares greater than
/// every finite value and negative infinity, while negative infinity compares
/// less than every finite value and positive infinity. Infinite values with
/// the same sign are equal to each other.
///
///     let values: [Double] = [10.0, 25.0, -10.0, .infinity, -.infinity]
///     print(values.sorted())
///     // Prints "[-inf, -10.0, 10.0, 25.0, inf]"
///
/// Operations with infinite values follow real arithmetic as much as possible:
/// Adding or subtracting a finite value, or multiplying or dividing infinity
/// by a nonzero finite value, results in infinity.
///
/// NaN ("not a number")
/// --------------------
///
/// Floating-point types represent values that are neither finite numbers nor
/// infinity as NaN, an abbreviation for "not a number." Comparing a NaN with
/// any value, including another NaN, results in `false`.
///
///     let myNaN = Double.nan
///     print(myNaN > 0)
///     // Prints "false"
///     print(myNaN < 0)
///     // Prints "false"
///     print(myNaN == .nan)
///     // Prints "false"
///
/// Because testing whether one NaN is equal to another NaN results in `false`,
/// use the `isNaN` property to test whether a value is NaN.
///
///     print(myNaN.isNaN)
///     // Prints "true"
///
/// NaN propagates through many arithmetic operations. When you are operating
/// on many values, this behavior is valuable because operations on NaN simply
/// forward the value and don't cause runtime errors. The following example
/// shows how NaN values operate in different contexts.
///
/// Imagine you have a set of temperature data for which you need to report
/// some general statistics: the total number of observations, the number of
/// valid observations, and the average temperature. First, a set of
/// observations in Celsius is parsed from strings to `Double` values:
///
///     let temperatureData = ["21.5", "19.25", "27", "no data", "28.25", "no data", "23"]
///     let tempsCelsius = temperatureData.map { Double($0) ?? .nan }
///     // tempsCelsius == [21.5, 19.25, 27, nan, 28.25, nan, 23.0]
///
/// Note that some elements in the `temperatureData ` array are not valid
/// numbers. When these invalid strings are parsed by the `Double` failable
/// initializer, the example uses the nil-coalescing operator (`??`) to
/// provide NaN as a fallback value.
///
/// Next, the observations in Celsius are converted to Fahrenheit:
///
///     let tempsFahrenheit = tempsCelsius.map { $0 * 1.8 + 32 }
///     // tempsFahrenheit == [70.7, 66.65, 80.6, nan, 82.85, nan, 73.4]
///
/// The NaN values in the `tempsCelsius` array are propagated through the
/// conversion and remain NaN in `tempsFahrenheit`.
///
/// Because calculating the average of the observations involves combining
/// every value of the `tempsFahrenheit` array, any NaN values cause the
/// result to also be NaN, as seen in this example:
///
///     let badAverage = tempsFahrenheit.reduce(0.0, combine: +) / Double(tempsFahrenheit.count)
///     // badAverage.isNaN == true
///
/// Instead, when you need an operation to have a specific numeric result,
/// filter out any NaN values using the `isNaN` property.
///
///     let validTemps = tempsFahrenheit.filter { !$0.isNaN }
///     let average = validTemps.reduce(0.0, combine: +) / Double(validTemps.count)
///
/// Finally, report the average temperature and observation counts:
///
///     print("Average: \(average)°F in \(validTemps.count) " +
///           "out of \(tempsFahrenheit.count) observations.")
///     // Prints "Average: 74.84°F in 5 out of 7 observations."
public protocol FloatingPoint: Comparable, AbsoluteValuable,
  SignedNumber, Strideable {

  /// A type that represents any written exponent.
  associatedtype Exponent: SignedInteger

  /// Creates a new value from the given sign, exponent, and significand.
  ///
  /// The following example uses this initializer to create a new `Double`
  /// instance. `Double` is a binary floating-point type that has a radix of
  /// `2`.
  ///
  ///     let x = Double(sign: .plus, exponent: -2, significand: 1.5)
  ///     // x == 0.375
  ///
  /// This initializer is equivalent to the following calculation, where `**`
  /// is exponentiation, computed as if by a single, correctly rounded,
  /// floating-point operation:
  ///
  ///     let sign: FloatingPointSign = .plus
  ///     let exponent = -2
  ///     let significand = 1.5
  ///     let y = (sign == .minus ? -1 : 1) * significand * Double.radix ** exponent
  ///     // y == 0.375
  ///
  /// As with any basic operation, if this value is outside the representable
  /// range of the type, overflow or underflow occurs, and zero, a subnormal
  /// value, or infinity may result. In addition, there are two other edge
  /// cases:
  ///
  /// - If the value you pass to `significand` is zero or infinite, the result
  ///   is zero or infinite, regardless of the value of `exponent`.
  /// - If the value you pass to `significand` is NaN, the result is NaN.
  ///
  /// For any floating-point value `x` of type `F`, the result of the following
  /// is equal to `x`, with the distinction that the result is canonicalized
  /// if `x` is in a noncanonical encoding:
  ///
  ///     let x0 = F(sign: x.sign, exponent: x.exponent, significand: x.significand)
  ///
  /// This initializer implements the `scaleB` operation defined by the [IEEE
  /// 754 specification][spec].
  ///
  /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
  ///
  /// - Parameters:
  ///   - sign: The sign to use for the new value.
  ///   - exponent: The new value's exponent.
  ///   - significand: The new value's significand.
  init(sign: FloatingPointSign, exponent: Exponent, significand: Self)

  /// Creates a new floating-point value using the sign of one value and the
  /// magnitude of another.
  ///
  /// The following example uses this initializer to create a new `Double`
  /// instance with the sign of `a` and the magnitude of `b`:
  ///
  ///     let a = -21.5
  ///     let b = 305.15
  ///     let c = Double(signOf: a, magnitudeOf: b)
  ///     print(c)
  ///     // Prints "-305.15"
  ///
  /// This initializer implements the IEEE 754 `copysign` operation.
  ///
  /// - Parameters:
  ///   - signOf: A value from which to use the sign. The result of the
  ///     initializer has the same sign as `signOf`.
  ///   - magnitudeOf: A value from which to use the magnitude. The result of
  ///     the initializer has the same magnitude as `magnitudeOf`.
  init(signOf: Self, magnitudeOf: Self)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPoint.swift.gyb", line: 243)
  /// Creates a new value, rounded to the closest possible representation.
  ///
  /// If two representable values are equally close, the result is the value
  /// with more trailing zeros in its significand bit pattern.
  ///
  /// - Parameter value: The integer to convert to a floating-point value.
  init(_ value: UInt8)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPoint.swift.gyb", line: 243)
  /// Creates a new value, rounded to the closest possible representation.
  ///
  /// If two representable values are equally close, the result is the value
  /// with more trailing zeros in its significand bit pattern.
  ///
  /// - Parameter value: The integer to convert to a floating-point value.
  init(_ value: Int8)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPoint.swift.gyb", line: 243)
  /// Creates a new value, rounded to the closest possible representation.
  ///
  /// If two representable values are equally close, the result is the value
  /// with more trailing zeros in its significand bit pattern.
  ///
  /// - Parameter value: The integer to convert to a floating-point value.
  init(_ value: UInt16)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPoint.swift.gyb", line: 243)
  /// Creates a new value, rounded to the closest possible representation.
  ///
  /// If two representable values are equally close, the result is the value
  /// with more trailing zeros in its significand bit pattern.
  ///
  /// - Parameter value: The integer to convert to a floating-point value.
  init(_ value: Int16)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPoint.swift.gyb", line: 243)
  /// Creates a new value, rounded to the closest possible representation.
  ///
  /// If two representable values are equally close, the result is the value
  /// with more trailing zeros in its significand bit pattern.
  ///
  /// - Parameter value: The integer to convert to a floating-point value.
  init(_ value: UInt32)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPoint.swift.gyb", line: 243)
  /// Creates a new value, rounded to the closest possible representation.
  ///
  /// If two representable values are equally close, the result is the value
  /// with more trailing zeros in its significand bit pattern.
  ///
  /// - Parameter value: The integer to convert to a floating-point value.
  init(_ value: Int32)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPoint.swift.gyb", line: 243)
  /// Creates a new value, rounded to the closest possible representation.
  ///
  /// If two representable values are equally close, the result is the value
  /// with more trailing zeros in its significand bit pattern.
  ///
  /// - Parameter value: The integer to convert to a floating-point value.
  init(_ value: UInt64)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPoint.swift.gyb", line: 243)
  /// Creates a new value, rounded to the closest possible representation.
  ///
  /// If two representable values are equally close, the result is the value
  /// with more trailing zeros in its significand bit pattern.
  ///
  /// - Parameter value: The integer to convert to a floating-point value.
  init(_ value: Int64)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPoint.swift.gyb", line: 243)
  /// Creates a new value, rounded to the closest possible representation.
  ///
  /// If two representable values are equally close, the result is the value
  /// with more trailing zeros in its significand bit pattern.
  ///
  /// - Parameter value: The integer to convert to a floating-point value.
  init(_ value: UInt)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPoint.swift.gyb", line: 243)
  /// Creates a new value, rounded to the closest possible representation.
  ///
  /// If two representable values are equally close, the result is the value
  /// with more trailing zeros in its significand bit pattern.
  ///
  /// - Parameter value: The integer to convert to a floating-point value.
  init(_ value: Int)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPoint.swift.gyb", line: 252)
  /*  TODO: Implement the following APIs once a revised integer protocol is
      introduced that allows for them to be implemented. In particular, we
      need to have an "index of most significant bit" operation and "get
      absolute value as unsigned type" operation on the Integer protocol.

  /// Creates the closest representable value to the given integer.
  ///
  /// - Parameter value: The integer to represent as a floating-point value.
  init<Source: Integer>(_ value: Source)

  /// Creates a value that exactly represents the given integer.
  ///
  /// If the given integer is outside the representable range of the type, the
  /// result is `nil`.
  ///
  /// - Parameter value: The integer to represent as a floating-point value.
  init?<Source: Integer>(exactly value: Source)
  */

  /// The radix, or base of exponentiation, for a floating-point type.
  ///
  /// The magnitude of a floating-point value `x` of type `F` can be calculated
  /// by using the following formula, where `**` is exponentiation:
  ///
  ///     let magnitude = x.significand * F.radix ** x.exponent
  ///
  /// A conforming type may use any integer radix, but values other than 2 (for
  /// binary floating-point types) or 10 (for decimal floating-point types)
  /// are extraordinarily rare in practice.
  static var radix: Int { get }

  /// A quiet NaN ("not a number").
  ///
  /// A NaN compares not equal, not greater than, and not less than every
  /// value, including itself. Passing a NaN to an operation generally results
  /// in NaN.
  ///
  ///     let x = 1.21
  ///     // x > Double.nan == false
  ///     // x < Double.nan == false
  ///     // x == Double.nan == false
  ///
  /// Because a NaN always compares not equal to itself, to test whether a
  /// floating-point value is NaN, use its `isNaN` property instead of the
  /// equal-to operator (`==`). In the following example, `y` is NaN.
  ///
  ///     let y = x + Double.nan
  ///     print(y == Double.nan)
  ///     // Prints "false"
  ///     print(y.isNaN)
  ///     // Prints "true"
  ///
  /// - SeeAlso: `isNaN`, `signalingNaN`
  static var nan: Self { get }

  /// A signaling NaN ("not a number").
  ///
  /// The default IEEE 754 behavior of operations involving a signaling NaN is
  /// to raise the Invalid flag in the floating-point environment and return a
  /// quiet NaN.
  ///
  /// Operations on types conforming to the `FloatingPoint` protocol should
  /// support this behavior, but they might also support other options. For
  /// example, it would be reasonable to implement alternative operations in
  /// which operating on a signaling NaN triggers a runtime error or results
  /// in a diagnostic for debugging purposes. Types that implement alternative
  /// behaviors for a signaling NaN must document the departure.
  ///
  /// Other than these signaling operations, a signaling NaN behaves in the
  /// same manner as a quiet NaN.
  ///
  /// - SeeAlso: `nan`
  static var signalingNaN: Self { get }

  /// Positive infinity.
  ///
  /// Infinity compares greater than all finite numbers and equal to other
  /// infinite values.
  ///
  ///     let x = Double.greatestFiniteMagnitude
  ///     let y = x * 2
  ///     // y == Double.infinity
  ///     // y > x
  static var infinity: Self { get }

  /// The greatest finite number representable by this type.
  ///
  /// This value compares greater than or equal to all finite numbers, but less
  /// than `infinity`.
  ///
  /// This value corresponds to type-specific C macros such as `FLT_MAX` and
  /// `DBL_MAX`. The naming of those macros is slightly misleading, because
  /// `infinity` is greater than this value.
  static var greatestFiniteMagnitude: Self { get }

  /// The mathematical constant pi.
  ///
  /// This value should be rounded toward zero to keep user computations with
  /// angles from inadvertently ending up in the wrong quadrant. A type that
  /// conforms to the `FloatingPoint` protocol provides the value for `pi` at
  /// its best possible precision.
  ///
  ///     print(Double.pi)
  ///     // Prints "3.14159265358979"
  static var pi: Self { get }

  // NOTE: Rationale for "ulp" instead of "epsilon":
  // We do not use that name because it is ambiguous at best and misleading
  // at worst:
  //
  // - Historically several definitions of "machine epsilon" have commonly
  //   been used, which differ by up to a factor of two or so. By contrast
  //   "ulp" is a term with a specific unambiguous definition.
  //
  // - Some languages have used "epsilon" to refer to wildly different values,
  //   such as `leastNonzeroMagnitude`.
  //
  // - Inexperienced users often believe that "epsilon" should be used as a
  //   tolerance for floating-point comparisons, because of the name. It is
  //   nearly always the wrong value to use for this purpose.

  /// The unit in the last place of this value.
  ///
  /// This is the unit of the least significant digit in this value's
  /// significand. For most numbers `x`, this is the difference between `x`
  /// and the next greater (in magnitude) representable number. There are some
  /// edge cases to be aware of:
  ///
  /// - If `x` is not a finite number, then `x.ulp` is NaN.
  /// - If `x` is very small in magnitude, then `x.ulp` may be a subnormal
  ///   number. If a type does not support subnormals, `x.ulp` may be rounded
  ///   to zero.
  /// - `greatestFiniteMagnitude.ulp` is a finite number, even though the next
  ///   greater representable value is `infinity`.
  ///
  /// This quantity, or a related quantity, is sometimes called *epsilon* or
  /// *machine epsilon.* Avoid that name because it has different meanings in
  /// different languages, which can lead to confusion, and because it
  /// suggests that it is a good tolerance to use for comparisons, which it
  /// almost never is.
  var ulp: Self { get }

  /// The unit in the last place of 1.0.
  ///
  /// The positive difference between 1.0 and the next greater representable
  /// number. The `ulpOfOne` constant corresponds to the C macros
  /// `FLT_EPSILON`, `DBL_EPSILON`, and others with a similar purpose.
  static var ulpOfOne: Self { get }

  /// The least positive normal number.
  ///
  /// This value compares less than or equal to all positive normal numbers.
  /// There may be smaller positive numbers, but they are *subnormal*, meaning
  /// that they are represented with less precision than normal numbers.
  ///
  /// This value corresponds to type-specific C macros such as `FLT_MIN` and
  /// `DBL_MIN`. The naming of those macros is slightly misleading, because
  /// subnormals, zeros, and negative numbers are smaller than this value.
  static var leastNormalMagnitude: Self { get }

  /// The least positive number.
  ///
  /// This value compares less than or equal to all positive numbers, but
  /// greater than zero. If the type supports subnormal values,
  /// `leastNonzeroMagnitude` is smaller than `leastNormalMagnitude`;
  /// otherwise they are equal.
  static var leastNonzeroMagnitude: Self { get }

  /// The sign of the floating-point value.
  ///
  /// The `sign` property is `.minus` if the value's signbit is set, and
  /// `.plus` otherwise. For example:
  ///
  ///     let x = -33.375
  ///     // x.sign == .minus
  ///
  /// Do not use this property to check whether a floating point value is
  /// negative. For a value `x`, the comparison `x.sign == .minus` is not
  /// necessarily the same as `x < 0`. In particular, `x.sign == .minus` if
  /// `x` is -0, and while `x < 0` is always `false` if `x` is NaN, `x.sign`
  /// could be either `.plus` or `.minus`.
  var sign: FloatingPointSign { get }

  /// The exponent of the floating-point value.
  ///
  /// The *exponent* of a floating-point value is the integer part of the
  /// logarithm of the value's magnitude. For a value `x` of a floating-point
  /// type `F`, the magnitude can be calculated as the following, where `**`
  /// is exponentiation:
  ///
  ///     let magnitude = x.significand * F.radix ** x.exponent
  ///
  /// In the next example, `y` has a value of `21.5`, which is encoded as
  /// `1.34375 * 2 ** 4`. The significand of `y` is therefore 1.34375.
  ///
  ///     let y: Double = 21.5
  ///     // y.significand == 1.34375
  ///     // y.exponent == 4
  ///     // Double.radix == 2
  ///
  /// The `exponent` property has the following edge cases:
  ///
  /// - If `x` is zero, then `x.exponent` is `Int.min`.
  /// - If `x` is +/-infinity or NaN, then `x.exponent` is `Int.max`
  ///
  /// This property implements the `logB` operation defined by the [IEEE 754
  /// specification][spec].
  ///
  /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
  var exponent: Exponent { get }

  /// The significand of the floating-point value.
  ///
  /// The magnitude of a floating-point value `x` of type `F` can be calculated
  /// by using the following formula, where `**` is exponentiation:
  ///
  ///     let magnitude = x.significand * F.radix ** x.exponent
  ///
  /// In the next example, `y` has a value of `21.5`, which is encoded as
  /// `1.34375 * 2 ** 4`. The significand of `y` is therefore 1.34375.
  ///
  ///     let y: Double = 21.5
  ///     // y.significand == 1.34375
  ///     // y.exponent == 4
  ///     // Double.radix == 2
  ///
  /// If a type's radix is 2, then for finite nonzero numbers, the significand
  /// is in the range `1.0 ..< 2.0`. For other values of `x`, `x.significand`
  /// is defined as follows:
  ///
  /// - If `x` is zero, then `x.significand` is 0.0.
  /// - If `x` is infinity, then `x.significand` is 1.0.
  /// - If `x` is NaN, then `x.significand` is NaN.
  /// - Note: The significand is frequently also called the *mantissa*, but
  ///   significand is the preferred terminology in the [IEEE 754
  ///   specification][spec], to allay confusion with the use of mantissa for
  ///   the fractional part of a logarithm.
  ///
  /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
  var significand: Self { get }

  /// Returns the sum of this value and the given value, rounded to a
  /// representable value.
  ///
  /// This method serves as the basis for the addition operator (`+`). For
  /// example:
  ///
  ///     let x = 1.5
  ///     print(x.adding(2.25))
  ///     // Prints "3.75"
  ///     print(x + 2.25)
  ///     // Prints "3.75"
  ///
  /// The `adding(_:)` method implements the addition operation defined by the
  /// [IEEE 754 specification][spec].
  ///
  /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
  ///
  /// - Parameter other: The value to add.
  /// - Returns: The sum of this value and `other`, rounded to a representable
  ///   value.
  ///
  /// - SeeAlso: `add(_:)`
  func adding(_ other: Self) -> Self

  /// Adds the given value to this value in place, rounded to a representable
  /// value.
  ///
  /// This method serves as the basis for the in-place addition operator
  /// (`+=`). For example:
  ///
  ///     var (x, y) = (2.25, 2.25)
  ///     x.add(7.0)
  ///     // x == 9.25
  ///     y += 7.0
  ///     // y == 9.25
  ///
  /// - Parameter other: The value to add.
  ///
  /// - SeeAlso: `adding(_:)`
  mutating func add(_ other: Self)

  /// Returns the additive inverse of this value.
  ///
  /// The result is always exact. This method serves as the basis for the
  /// negation operator (prefixed `-`). For example:
  ///
  ///     let x = 21.5
  ///     let y = x.negated()
  ///     // y == -21.5
  ///
  /// - Returns: The additive inverse of this value.
  ///
  /// - SeeAlso: `negate()`
  func negated() -> Self

  /// Replaces this value with its additive inverse.
  ///
  /// The result is always exact. This example uses the `negate()` method to
  /// negate the value of the variable `x`:
  ///
  ///     var x = 21.5
  ///     x.negate()
  ///     // x == -21.5
  ///
  /// - SeeAlso: `negated()`
  mutating func negate()

  /// Returns the difference of this value and the given value, rounded to a
  /// representable value.
  ///
  /// This method serves as the basis for the subtraction operator (`-`). For
  /// example:
  ///
  ///     let x = 7.5
  ///     print(x.subtracting(2.25))
  ///     // Prints "5.25"
  ///     print(x - 2.25)
  ///     // Prints "5.25"
  ///
  /// The `subtracting(_:)` method implements the subtraction operation
  /// defined by the [IEEE 754 specification][spec].
  ///
  /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
  ///
  /// - Parameter other: The value to subtract from this value.
  /// - Returns: The difference of this value and `other`, rounded to a
  ///   representable value.
  ///
  /// - SeeAlso: `subtract(_:)`
  func subtracting(_ other: Self) -> Self

  /// Subtracts the given value from this value in place, rounding to a
  /// representable value.
  ///
  /// This method serves as the basis for the in-place subtraction operator
  /// (`-=`). For example:
  ///
  ///     var (x, y) = (7.5, 7.5)
  ///     x.subtract(2.25)
  ///     // x == 5.25
  ///     y -= 2.25
  ///     // y == 5.25
  ///
  /// - Parameter other: The value to subtract.
  ///
  /// - SeeAlso: `subtracting(_:)`
  mutating func subtract(_ other: Self)

  /// Returns the product of this value and the given value, rounded to a
  /// representable value.
  ///
  /// This method serves as the basis for the multiplication operator (`*`).
  /// For example:
  ///
  ///     let x = 7.5
  ///     print(x.multiplied(by: 2.25))
  ///     // Prints "16.875"
  ///     print(x * 2.25)
  ///     // Prints "16.875"
  ///
  /// The `multiplied(by:)` method implements the multiplication operation
  /// defined by the [IEEE 754 specification][spec].
  ///
  /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
  ///
  /// - Parameter other: The value to multiply by this value.
  /// - Returns: The product of this value and `other`, rounded to a
  ///   representable value.
  ///
  /// - SeeAlso: `multiply(by:)`
  func multiplied(by other: Self) -> Self

  /// Multiplies this value by the given value in place, rounding to a
  /// representable value.
  ///
  /// This method serves as the basis for the in-place multiplication operator
  /// (`*=`). For example:
  ///
  ///     var (x, y) = (7.5, 7.5)
  ///     x.multiply(by: 2.25)
  ///     // x == 16.875
  ///     y *= 2.25
  ///     // y == 16.875
  ///
  /// - Parameter other: The value to multiply by this value.
  ///
  /// - SeeAlso: `multiplied(by:)`
  mutating func multiply(by other: Self)

  /// Returns the quotient of this value and the given value, rounded to a
  /// representable value.
  ///
  /// This method serves as the basis for the division operator (`/`). For
  /// example:
  ///
  ///     let x = 7.5
  ///     let y = x.divided(by: 2.25)
  ///     // y == 16.875
  ///     let z = x * 2.25
  ///     // z == 16.875
  ///
  /// The `divided(by:)` method implements the division operation
  /// defined by the [IEEE 754 specification][spec].
  ///
  /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
  ///
  /// - Parameter other: The value to use when dividing this value.
  /// - Returns: The quotient of this value and `other`, rounded to a
  ///   representable value.
  ///
  /// - SeeAlso: `divide(by:)`
  func divided(by other: Self) -> Self

  /// Divides this value by the given value in place, rounding to a
  /// representable value.
  ///
  /// This method serves as the basis for the in-place division operator
  /// (`/=`). For example:
  ///
  ///     var (x, y) = (16.875, 16.875)
  ///     x.divide(by: 2.25)
  ///     // x == 7.5
  ///     y /= 2.25
  ///     // y == 7.5
  ///
  /// - Parameter other: The value to use when dividing this value.
  ///
  /// - SeeAlso: `divided(by:)`
  mutating func divide(by other: Self)

  /// Returns the remainder of this value divided by the given value.
  ///
  /// For two finite values `x` and `y`, the remainder `r` of dividing `x` by
  /// `y` satisfies `x == y * q + r`, where `q` is the integer nearest to
  /// `x / y`. If `x / y` is exactly halfway between two integers, `q` is
  /// chosen to be even. Note that `q` is *not* `x / y` computed in
  /// floating-point arithmetic, and that `q` may not be representable in any
  /// available integer type.
  ///
  /// The following example calculates the remainder of dividing 8.625 by 0.75:
  ///
  ///     let x = 8.625
  ///     print(x / 0.75)
  ///     // Prints "11.5"
  ///
  ///     let q = (x / 0.75).rounded(.toNearestOrEven)
  ///     // q == 12.0
  ///     let r = x.remainder(dividingBy: 0.75)
  ///     // r == -0.375
  ///
  ///     let x1 = 0.75 * q + r
  ///     // x1 == 8.625
  ///
  /// If this value and `other` are finite numbers, the remainder is in the
  /// closed range `-abs(other / 2)...abs(other / 2)`. The
  /// `remainder(dividingBy:)` method is always exact. This method implements
  /// the remainder operation defined by the [IEEE 754 specification][spec].
  ///
  /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
  ///
  /// - Parameter other: The value to use when dividing this value.
  /// - Returns: The remainder of this value divided by `other`.
  ///
  /// - SeeAlso: `formRemainder(dividingBy:)`,
  ///   `truncatingRemainder(dividingBy:)`
  func remainder(dividingBy other: Self) -> Self

  /// Replaces this value with the remainder of itself divided by the given
  /// value.
  ///
  /// For two finite values `x` and `y`, the remainder `r` of dividing `x` by
  /// `y` satisfies `x == y * q + r`, where `q` is the integer nearest to
  /// `x / y`. If `x / y` is exactly halfway between two integers, `q` is
  /// chosen to be even. Note that `q` is *not* `x / y` computed in
  /// floating-point arithmetic, and that `q` may not be representable in any
  /// available integer type.
  ///
  /// The following example calculates the remainder of dividing 8.625 by 0.75:
  ///
  ///     var x = 8.625
  ///     print(x / 0.75)
  ///     // Prints "11.5"
  ///
  ///     let q = (x / 0.75).rounded(.toNearestOrEven)
  ///     // q == 12.0
  ///     x.formRemainder(dividingBy: 0.75)
  ///     // x == -0.375
  ///
  ///     let x1 = 0.75 * q + x
  ///     // x1 == 8.625
  ///
  /// If this value and `other` are finite numbers, the remainder is in the
  /// closed range `-abs(other / 2)...abs(other / 2)`. The
  /// `remainder(dividingBy:)` method is always exact.
  ///
  /// - Parameter other: The value to use when dividing this value.
  ///
  /// - SeeAlso: `remainder(dividingBy:)`,
  ///   `formTruncatingRemainder(dividingBy:)`
  mutating func formRemainder(dividingBy other: Self)

  /// Returns the remainder of this value divided by the given value using
  /// truncating division.
  ///
  /// Performing truncating division with floating-point values results in a
  /// truncated integer quotient and a remainder. For values `x` and `y` and
  /// their truncated integer quotient `q`, the remainder `r` satisfies
  /// `x == y * q + r`.
  ///
  /// The following example calculates the truncating remainder of dividing
  /// 8.625 by 0.75:
  ///
  ///     let x = 8.625
  ///     print(x / 0.75)
  ///     // Prints "11.5"
  ///
  ///     let q = (x / 0.75).rounded(.towardZero)
  ///     // q == 11.0
  ///     let r = x.truncatingRemainder(dividingBy: 0.75)
  ///     // r == 0.375
  ///
  ///     let x1 = 0.75 * q + r
  ///     // x1 == 8.625
  ///
  /// If this value and `other` are both finite numbers, the truncating
  /// remainder has the same sign as this value and is strictly smaller in
  /// magnitude than `other`. The `truncatingRemainder(dividingBy:)` method
  /// is always exact.
  ///
  /// - Parameter other: The value to use when dividing this value.
  /// - Returns: The remainder of this value divided by `other` using
  ///   truncating division.
  ///
  /// - SeeAlso: `formTruncatingRemainder(dividingBy:)`,
  ///   `remainder(dividingBy:)`
  func truncatingRemainder(dividingBy other: Self) -> Self

  /// Replaces this value with the remainder of itself divided by the given
  /// value using truncating division.
  ///
  /// Performing truncating division with floating-point values results in a
  /// truncated integer quotient and a remainder. For values `x` and `y` and
  /// their truncated integer quotient `q`, the remainder `r` satisfies
  /// `x == y * q + r`.
  ///
  /// The following example calculates the truncating remainder of dividing
  /// 8.625 by 0.75:
  ///
  ///     var x = 8.625
  ///     print(x / 0.75)
  ///     // Prints "11.5"
  ///
  ///     let q = (x / 0.75).rounded(.towardZero)
  ///     // q == 11.0
  ///     x.formTruncatingRemainder(dividingBy: 0.75)
  ///     // x == 0.375
  ///
  ///     let x1 = 0.75 * q + x
  ///     // x1 == 8.625
  ///
  /// If this value and `other` are both finite numbers, the truncating
  /// remainder has the same sign as this value and is strictly smaller in
  /// magnitude than `other`. The `formTruncatingRemainder(dividingBy:)`
  /// method is always exact.
  ///
  /// - Parameter other: The value to use when dividing this value.
  ///
  /// - SeeAlso: `truncatingRemainder(dividingBy:)`,
  ///   `formRemainder(dividingBy:)`
  mutating func formTruncatingRemainder(dividingBy other: Self)

  /// Returns the square root of the value, rounded to a representable value.
  ///
  /// The following example declares a function that calculates the length of
  /// the hypotenuse of a right triangle given its two perpendicular sides.
  ///
  ///     func hypotenuse(_ a: Double, _ b: Double) -> Double {
  ///         return (a * a + b * b).squareRoot()
  ///     }
  ///
  ///     let (dx, dy) = (3.0, 4.0)
  ///     let distance = hypotenuse(dx, dy)
  ///     // distance == 5.0
  ///
  /// - Returns: The square root of the value.
  ///
  /// - SeeAlso: `sqrt(_:)`, `formSquareRoot()`
  func squareRoot() -> Self

  /// Replaces this value with its square root, rounded to a representable
  /// value.
  ///
  /// - SeeAlso: `sqrt(_:)`, `squareRoot()`
  mutating func formSquareRoot()

  /// Returns the result of adding the product of the two given values to this
  /// value, computed without intermediate rounding.
  ///
  /// This method is equivalent to the C `fma` function and implements the
  /// `fusedMultiplyAdd` operation defined by the [IEEE 754
  /// specification][spec].
  ///
  /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
  ///
  /// - Parameters:
  ///   - lhs: One of the values to multiply before adding to this value.
  ///   - rhs: The other value to multiply.
  /// - Returns: The product of `lhs` and `rhs`, added to this value.
  func addingProduct(_ lhs: Self, _ rhs: Self) -> Self

  /// Adds the product of the two given values to this value in place, computed
  /// without intermediate rounding.
  ///
  /// - Parameters:
  ///   - lhs: One of the values to multiply before adding to this value.
  ///   - rhs: The other value to multiply.
  mutating func addProduct(_ lhs: Self, _ rhs: Self)

  /// Returns the lesser of the two given values.
  ///
  /// This method returns the minimum of two values, preserving order and
  /// eliminating NaN when possible. For two values `x` and `y`, the result of
  /// `minimum(x, y)` is `x` if `x <= y`, `y` if `y < x`, or whichever of `x`
  /// or `y` is a number if the other is a quiet NaN. If both `x` and `y` are
  /// NaN, or either `x` or `y` is a signaling NaN, the result is NaN.
  ///
  ///     Double.minimum(10.0, -25.0)
  ///     // -25.0
  ///     Double.minimum(10.0, .nan)
  ///     // 10.0
  ///     Double.minimum(.nan, -25.0)
  ///     // -25.0
  ///     Double.minimum(.nan, .nan)
  ///     // nan
  ///
  /// The `minimum` method implements the `minNum` operation defined by the
  /// [IEEE 754 specification][spec].
  ///
  /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
  ///
  /// - Parameters:
  ///   - x: A floating-point value.
  ///   - y: Another floating-point value.
  /// - Returns: The minimum of `x` and `y`, or whichever is a number if the
  ///   other is NaN.
  static func minimum(_ x: Self, _ y: Self) -> Self

  /// Returns the greater of the two given values.
  ///
  /// This method returns the maximum of two values, preserving order and
  /// eliminating NaN when possible. For two values `x` and `y`, the result of
  /// `maximum(x, y)` is `x` if `x > y`, `y` if `x <= y`, or whichever of `x`
  /// or `y` is a number if the other is a quiet NaN. If both `x` and `y` are
  /// NaN, or either `x` or `y` is a signaling NaN, the result is NaN.
  ///
  ///     Double.maximum(10.0, -25.0)
  ///     // 10.0
  ///     Double.maximum(10.0, .nan)
  ///     // 10.0
  ///     Double.maximum(.nan, -25.0)
  ///     // -25.0
  ///     Double.maximum(.nan, .nan)
  ///     // nan
  ///
  /// The `maximum` method implements the `maxNum` operation defined by the
  /// [IEEE 754 specification][spec].
  ///
  /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
  ///
  /// - Parameters:
  ///   - x: A floating-point value.
  ///   - y: Another floating-point value.
  /// - Returns: The greater of `x` and `y`, or whichever is a number if the
  ///   other is NaN.
  static func maximum(_ x: Self, _ y: Self) -> Self

  /// Returns the value with lesser magnitude.
  ///
  /// This method returns the value with lesser magnitude of the two given
  /// values, preserving order and eliminating NaN when possible. For two
  /// values `x` and `y`, the result of `minimumMagnitude(x, y)` is `x` if
  /// `x.magnitude <= y.magnitude`, `y` if `y.magnitude < x.magnitude`, or
  /// whichever of `x` or `y` is a number if the other is a quiet NaN. If both
  /// `x` and `y` are NaN, or either `x` or `y` is a signaling NaN, the result
  /// is NaN.
  ///
  ///     Double.minimumMagnitude(10.0, -25.0)
  ///     // 10.0
  ///     Double.minimumMagnitude(10.0, .nan)
  ///     // 10.0
  ///     Double.minimumMagnitude(.nan, -25.0)
  ///     // -25.0
  ///     Double.minimumMagnitude(.nan, .nan)
  ///     // nan
  ///
  /// The `minimumMagnitude` method implements the `minNumMag` operation
  /// defined by the [IEEE 754 specification][spec].
  ///
  /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
  ///
  /// - Parameters:
  ///   - x: A floating-point value.
  ///   - y: Another floating-point value.
  /// - Returns: Whichever of `x` or `y` has lesser magnitude, or whichever is
  ///   a number if the other is NaN.
  static func minimumMagnitude(_ x: Self, _ y: Self) -> Self

  /// Returns the value with greater magnitude.
  ///
  /// This method returns the value with greater magnitude of the two given
  /// values, preserving order and eliminating NaN when possible. For two
  /// values `x` and `y`, the result of `maximumMagnitude(x, y)` is `x` if
  /// `x.magnitude > y.magnitude`, `y` if `x.magnitude <= y.magnitude`, or
  /// whichever of `x` or `y` is a number if the other is a quiet NaN. If both
  /// `x` and `y` are NaN, or either `x` or `y` is a signaling NaN, the result
  /// is NaN.
  ///
  ///     Double.maximumMagnitude(10.0, -25.0)
  ///     // -25.0
  ///     Double.maximumMagnitude(10.0, .nan)
  ///     // 10.0
  ///     Double.maximumMagnitude(.nan, -25.0)
  ///     // -25.0
  ///     Double.maximumMagnitude(.nan, .nan)
  ///     // nan
  ///
  /// The `maximumMagnitude` method implements the `maxNumMag` operation
  /// defined by the [IEEE 754 specification][spec].
  ///
  /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
  ///
  /// - Parameters:
  ///   - x: A floating-point value.
  ///   - y: Another floating-point value.
  /// - Returns: Whichever of `x` or `y` has greater magnitude, or whichever is
  ///   a number if the other is NaN.
  static func maximumMagnitude(_ x: Self, _ y: Self) -> Self

  /// Returns this value rounded to an integral value using the specified
  /// rounding rule.
  ///
  /// The following example rounds a value using four different rounding rules:
  ///
  ///     let x = 6.5
  ///
  ///     // Equivalent to the C 'round' function:
  ///     print(x.rounded(.toNearestOrAwayFromZero))
  ///     // Prints "7.0"
  ///
  ///     // Equivalent to the C 'trunc' function:
  ///     print(x.rounded(.towardZero))
  ///     // Prints "6.0"
  ///
  ///     // Equivalent to the C 'ceil' function:
  ///     print(x.rounded(.up))
  ///     // Prints "7.0"
  ///
  ///     // Equivalent to the C 'floor' function:
  ///     print(x.rounded(.down))
  ///     // Prints "6.0"
  ///
  /// For more information about the available rounding rules, see the
  /// `FloatingPointRoundingRule` enumeration. To round a value using the
  /// default "schoolbook rounding", you can use the shorter `rounded()`
  /// method instead.
  ///
  ///     print(x.rounded())
  ///     // Prints "7.0"
  ///
  /// - Parameter rule: The rounding rule to use.
  /// - Returns: The integral value found by rounding using `rule`.
  ///
  /// - SeeAlso: `rounded()`, `round(_:)`, `FloatingPointRoundingRule`
  func rounded(_ rule: FloatingPointRoundingRule) -> Self

  /// Rounds the value to an integral value using the specified rounding rule.
  ///
  /// The following example rounds a value using four different rounding rules:
  ///
  ///     // Equivalent to the C 'round' function:
  ///     var w = 6.5
  ///     w.round(.toNearestOrAwayFromZero)
  ///     // w == 7.0
  ///
  ///     // Equivalent to the C 'trunc' function:
  ///     var x = 6.5
  ///     x.round(.towardZero)
  ///     // x == 6.0
  ///
  ///     // Equivalent to the C 'ceil' function:
  ///     var y = 6.5
  ///     y.round(.up)
  ///     // y == 7.0
  ///
  ///     // Equivalent to the C 'floor' function:
  ///     var z = 6.5
  ///     z.round(.down)
  ///     // z == 6.0
  ///
  /// For more information about the available rounding rules, see the
  /// `FloatingPointRoundingRule` enumeration. To round a value using the
  /// default "schoolbook rounding", you can use the shorter `round()` method
  /// instead.
  ///
  ///     var w1 = 6.5
  ///     w1.round()
  ///     // w1 == 7.0
  ///
  /// - Parameter rule: The rounding rule to use.
  ///
  /// - SeeAlso: `round()`, `rounded(_:)`, `FloatingPointRoundingRule`
  mutating func round(_ rule: FloatingPointRoundingRule)

  /// The least representable value that compares greater than this value.
  ///
  /// For any finite value `x`, `x.nextUp` is greater than `x`. For `nan` or
  /// `infinity`, `x.nextUp` is `x` itself. The following special cases also
  /// apply:
  ///
  /// - If `x` is `-infinity`, then `x.nextUp` is `-greatestFiniteMagnitude`.
  /// - If `x` is `-leastNonzeroMagnitude`, then `x.nextUp` is `-0.0`.
  /// - If `x` is zero, then `x.nextUp` is `leastNonzeroMagnitude`.
  /// - If `x` is `greatestFiniteMagnitude`, then `x.nextUp` is `infinity`.
  var nextUp: Self { get }

  /// The greatest representable value that compares less than this value.
  ///
  /// For any finite value `x`, `x.nextDown` is greater than `x`. For `nan` or
  /// `-infinity`, `x.nextDown` is `x` itself. The following special cases
  /// also apply:
  ///
  /// - If `x` is `infinity`, then `x.nextDown` is `greatestFiniteMagnitude`.
  /// - If `x` is `leastNonzeroMagnitude`, then `x.nextDown` is `0.0`.
  /// - If `x` is zero, then `x.nextDown` is `-leastNonzeroMagnitude`.
  /// - If `x` is `-greatestFiniteMagnitude`, then `x.nextDown` is `-infinity`.
  var nextDown: Self { get }

  /// Returns a Boolean value indicating whether this instance is equal to the
  /// given value.
  ///
  /// This method serves as the basis for the equal-to operator (`==`) for
  /// floating-point values. When comparing two values with this method, `-0`
  /// is equal to `+0`. NaN is not equal to any value, including itself. For
  /// example:
  ///
  ///     let x = 15.0
  ///     x.isEqual(to: 15.0)
  ///     // true
  ///     x.isEqual(to: .nan)
  ///     // false
  ///     Double.nan.isEqual(to: .nan)
  ///     // false
  ///
  /// The `isEqual(to:)` method implements the equality predicate defined by
  /// the [IEEE 754 specification][spec].
  ///
  /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
  ///
  /// - Parameter other: The value to compare with this value.
  /// - Returns: `true` if `other` has the same value as this instance;
  ///   otherwise, `false`.
  func isEqual(to other: Self) -> Bool

  /// Returns a Boolean value indicating whether this instance is less than the
  /// given value.
  ///
  /// This method serves as the basis for the less-than operator (`<`) for
  /// floating-point values. Some special cases apply:
  ///
  /// - Because NaN compares not less than nor greater than any value, this
  ///   method returns `false` when called on NaN or when NaN is passed as
  ///   `other`.
  /// - `-infinity` compares less than all values except for itself and NaN.
  /// - Every value except for NaN and `+infinity` compares less than
  ///   `+infinity`.
  ///
  ///     let x = 15.0
  ///     x.isLess(than: 20.0)
  ///     // true
  ///     x.isLess(than: .nan)
  ///     // false
  ///     Double.nan.isLess(than: x)
  ///     // false
  ///
  /// The `isLess(than:)` method implements the less-than predicate defined by
  /// the [IEEE 754 specification][spec].
  ///
  /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
  ///
  /// - Parameter other: The value to compare with this value.
  /// - Returns: `true` if `other` is less than this value; otherwise, `false`.
  func isLess(than other: Self) -> Bool

  /// Returns a Boolean value indicating whether this instance is less than or
  /// equal to the given value.
  ///
  /// This method serves as the basis for the less-than-or-equal-to operator
  /// (`<=`) for floating-point values. Some special cases apply:
  ///
  /// - Because NaN is incomparable with any value, this method returns `false`
  ///   when called on NaN or when NaN is passed as `other`.
  /// - `-infinity` compares less than or equal to all values except NaN.
  /// - Every value except NaN compares less than or equal to `+infinity`.
  ///
  ///     let x = 15.0
  ///     x.isLessThanOrEqualTo(20.0)
  ///     // true
  ///     x.isLessThanOrEqualTo(.nan)
  ///     // false
  ///     Double.nan.isLessThanOrEqualTo(x)
  ///     // false
  ///
  /// The `isLessThanOrEqualTo(_:)` method implements the less-than-or-equal
  /// predicate defined by the [IEEE 754 specification][spec].
  ///
  /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
  ///
  /// - Parameter other: The value to compare with this value.
  /// - Returns: `true` if `other` is less than this value; otherwise, `false`.
  func isLessThanOrEqualTo(_ other: Self) -> Bool

  /// Returns a Boolean value indicating whether this instance should precede the
  /// given value in an ascending sort.
  ///
  /// This relation is a refinement of the less-than-or-equal-to operator
  /// (`<=`) that provides a total order on all values of the type, including
  /// noncanonical encodings, signed zeros, and NaNs. Because it is used much
  /// less frequently than the usual comparisons, there is no operator form of
  /// this relation.
  ///
  /// The following example uses `isTotallyOrdered(below:)` to sort an array of
  /// floating-point values, including some that are NaN:
  ///
  ///     var numbers = [2.5, 21.25, 3.0, .nan, -9.5]
  ///     numbers.sort { $0.isTotallyOrdered(below: $1) }
  ///     // numbers == [-9.5, 2.5, 3.0, 21.25, nan]
  ///
  /// The `isTotallyOrdered(belowOrEqualTo:)` method implements the total order
  /// relation as defined by the [IEEE 754 specification][spec].
  ///
  /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
  ///
  /// - Parameter other: A floating-point value to compare to this value.
  /// - Returns: `true` if this value is ordered below `other` in a total
  ///   ordering of the floating-point type; otherwise, `false`.
  func isTotallyOrdered(belowOrEqualTo other: Self) -> Bool

  /// A Boolean value indicating whether this instance is normal.
  ///
  /// A *normal* value is a finite number that uses the full precision
  /// available to values of a type. Zero is neither a normal nor a subnormal
  /// number.
  var isNormal: Bool { get }

  /// A Boolean value indicating whether this instance is finite.
  ///
  /// All values other than NaN and infinity are considered finite, whether
  /// normal or subnormal.
  var isFinite: Bool { get }

  /// A Boolean value indicating whether the instance is equal to zero.
  ///
  /// The `isZero` property of a value `x` is `true` when `x` represents either
  /// `-0.0` or `+0.0`. `x.isZero` is equivalent to the following comparison:
  /// `x == 0.0`.
  ///
  ///     let x = -0.0
  ///     x.isZero        // true
  ///     x == 0.0        // true
  var isZero: Bool { get }

  /// A Boolean value indicating whether the instance is subnormal.
  ///
  /// A *subnormal* value is a nonzero number that has a lesser magnitude than
  /// the smallest normal number. Subnormal values do not use the full
  /// precision available to values of a type.
  ///
  /// Zero is neither a normal nor a subnormal number. Subnormal numbers are
  /// often called *denormal* or *denormalized*---these are different names
  /// for the same concept.
  var isSubnormal: Bool { get }

  /// A Boolean value indicating whether the instance is infinite.
  ///
  /// Note that `isFinite` and `isInfinite` do not form a dichotomy, because
  /// they are not total: If `x` is `NaN`, then both properties are `false`.
  var isInfinite: Bool { get }

  /// A Boolean value indicating whether the instance is NaN ("not a number").
  ///
  /// Because NaN is not equal to any value, including NaN, use this property
  /// instead of the equal-to operator (`==`) or not-equal-to operator (`!=`)
  /// to test whether a value is or is not NaN. For example:
  ///
  ///     let x = 0.0
  ///     let y = x * .infinity
  ///     // y is a NaN
  ///
  ///     // Comparing with the equal-to operator never returns 'true'
  ///     print(x == Double.nan)
  ///     // Prints "false"
  ///     print(y == Double.nan)
  ///     // Prints "false"
  ///
  ///     // Test with the 'isNaN' property instead
  ///     print(x.isNaN)
  ///     // Prints "false"
  ///     print(y.isNaN)
  ///     // Prints "true"
  ///
  /// This property is `true` for both quiet and signaling NaNs.
  var isNaN: Bool { get }

  /// A Boolean value indicating whether the instance is a signaling NaN.
  ///
  /// Signaling NaNs typically raise the Invalid flag when used in general
  /// computing operations.
  var isSignalingNaN: Bool { get }

  /// The classification of this value.
  ///
  /// A value's `floatingPointClass` property describes its "class" as
  /// described by the [IEEE 754 specification][spec].
  ///
  /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
  var floatingPointClass: FloatingPointClassification { get }

  /// A Boolean value indicating whether the instance's representation is in
  /// the canonical form.
  ///
  /// The [IEEE 754 specification][spec] defines a *canonical*, or preferred,
  /// encoding of a floating-point value's representation. Every `Float` or
  /// `Double` value is canonical, but noncanonical values of the `Float80`
  /// type exist, and noncanonical values may exist for other types that
  /// conform to the `FloatingPoint` protocol.
  ///
  /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
  var isCanonical: Bool { get }
}

/// The sign of a floating-point value.
public enum FloatingPointSign: Int {
  /// The sign for a positive value.
  case plus

  /// The sign for a negative value.
  case minus
}

/// The IEEE 754 floating-point classes.
public enum FloatingPointClassification {
  /// A signaling NaN ("not a number").
  ///
  /// A signaling NaN sets the floating-point exception status when used in
  /// many floating-point operations.
  case signalingNaN

  /// A silent NaN ("not a number") value.
  case quietNaN

  /// A value equal to `-infinity`.
  case negativeInfinity

  /// A negative value that uses the full precision of the floating-point type.
  ///
  /// - SeeAlso: `FloatingPoint.isNormal`
  case negativeNormal

  /// A negative, nonzero number that does not use the full precision of the
  /// floating-point type.
  ///
  /// - SeeAlso: `FloatingPoint.isSubnormal`
  case negativeSubnormal

  /// A value equal to zero with a negative sign.
  case negativeZero

  /// A value equal to zero with a positive sign.
  case positiveZero

  /// A positive, nonzero number that does not use the full precision of the
  /// floating-point type.
  ///
  /// - SeeAlso: `FloatingPoint.isSubnormal`
  case positiveSubnormal

  /// A positive value that uses the full precision of the floating-point type.
  ///
  /// - SeeAlso: `FloatingPoint.isNormal`
  case positiveNormal

  /// A value equal to `+infinity`.
  case positiveInfinity
}

/// A rule for rounding a floating-point number.
public enum FloatingPointRoundingRule {
  /// Round to the closest allowed value; if two values are equally close, the
  /// one with greater magnitude is chosen.
  ///
  /// This rounding rule is also known as "schoolbook rounding." The following
  /// example shows the results of rounding numbers using this rule:
  ///
  ///     (5.2).rounded(.toNearestOrAwayFromZero)
  ///     // 5.0
  ///     (5.5).rounded(.toNearestOrAwayFromZero)
  ///     // 6.0
  ///     (-5.2).rounded(.toNearestOrAwayFromZero)
  ///     // -5.0
  ///     (-5.5).rounded(.toNearestOrAwayFromZero)
  ///     // -6.0
  ///
  /// This rule is equivalent to the C `round` function and implements the
  /// `roundToIntegralTiesToAway` operation defined by the [IEEE 754
  /// specification][spec].
  ///
  /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
  case toNearestOrAwayFromZero

  /// Round to the closest allowed value; if two values are equally close, the
  /// even one is chosen.
  ///
  /// This rounding rule is also known as "bankers rounding," and is the
  /// default IEEE 754 rounding mode for arithmetic. The following example
  /// shows the results of rounding numbers using this rule:
  ///
  ///     (5.2).rounded(.toNearestOrEven)
  ///     // 5.0
  ///     (5.5).rounded(.toNearestOrEven)
  ///     // 6.0
  ///     (4.5).rounded(.toNearestOrEven)
  ///     // 4.0
  ///
  /// This rule implements the `roundToIntegralTiesToEven` operation defined by
  /// the [IEEE 754 specification][spec].
  ///
  /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
  case toNearestOrEven

  /// Round to the closest allowed value that is greater than or equal to the
  /// source.
  ///
  /// The following example shows the results of rounding numbers using this
  /// rule:
  ///
  ///     (5.2).rounded(.up)
  ///     // 6.0
  ///     (5.5).rounded(.up)
  ///     // 6.0
  ///     (-5.2).rounded(.up)
  ///     // -5.0
  ///     (-5.5).rounded(.up)
  ///     // -5.0
  ///
  /// This rule is equivalent to the C `ceil` function and implements the
  /// `roundToIntegralTowardPositive` operation defined by the [IEEE 754
  /// specification][spec].
  ///
  /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
  case up

  /// Round to the closest allowed value that is less than or equal to the
  /// source.
  ///
  /// The following example shows the results of rounding numbers using this
  /// rule:
  ///
  ///     (5.2).rounded(.down)
  ///     // 5.0
  ///     (5.5).rounded(.down)
  ///     // 5.0
  ///     (-5.2).rounded(.down)
  ///     // -6.0
  ///     (-5.5).rounded(.down)
  ///     // -6.0
  ///
  /// This rule is equivalent to the C `floor` function and implements the
  /// `roundToIntegralTowardNegative` operation defined by the [IEEE 754
  /// specification][spec].
  ///
  /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
  case down

  /// Round to the closest allowed value whose magnitude is less than or equal
  /// to that of the source.
  ///
  /// The following example shows the results of rounding numbers using this
  /// rule:
  ///
  ///     (5.2).rounded(.towardZero)
  ///     // 5.0
  ///     (5.5).rounded(.towardZero)
  ///     // 5.0
  ///     (-5.2).rounded(.towardZero)
  ///     // -5.0
  ///     (-5.5).rounded(.towardZero)
  ///     // -5.0
  ///
  /// This rule is equivalent to the C `trunc` function and implements the
  /// `roundToIntegralTowardZero` operation defined by the [IEEE 754
  /// specification][spec].
  ///
  /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
  case towardZero

  /// Round to the closest allowed value whose magnitude is greater than or
  /// equal to that of the source.
  ///
  /// The following example shows the results of rounding numbers using this
  /// rule:
  ///
  ///     (5.2).rounded(.awayFromZero)
  ///     // 6.0
  ///     (5.5).rounded(.awayFromZero)
  ///     // 6.0
  ///     (-5.2).rounded(.awayFromZero)
  ///     // -6.0
  ///     (-5.5).rounded(.awayFromZero)
  ///     // -6.0
  case awayFromZero
}

@_transparent
public prefix func + <T : FloatingPoint>(x: T) -> T {
  return x
}

@_transparent
public prefix func - <T : FloatingPoint>(x: T) -> T {
  return x.negated()
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPoint.swift.gyb", line: 1493)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPoint.swift.gyb", line: 1495)
@_transparent
public func +<T : FloatingPoint>(lhs: T, rhs: T) -> T {
  return lhs.adding(rhs)
}

@_transparent
public func +=<T : FloatingPoint>(lhs: inout T, rhs: T) {
  return lhs.add(rhs)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPoint.swift.gyb", line: 1495)
@_transparent
public func -<T : FloatingPoint>(lhs: T, rhs: T) -> T {
  return lhs.subtracting(rhs)
}

@_transparent
public func -=<T : FloatingPoint>(lhs: inout T, rhs: T) {
  return lhs.subtract(rhs)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPoint.swift.gyb", line: 1495)
@_transparent
public func *<T : FloatingPoint>(lhs: T, rhs: T) -> T {
  return lhs.multiplied(by: rhs)
}

@_transparent
public func *=<T : FloatingPoint>(lhs: inout T, rhs: T) {
  return lhs.multiply(by: rhs)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPoint.swift.gyb", line: 1495)
@_transparent
public func /<T : FloatingPoint>(lhs: T, rhs: T) -> T {
  return lhs.divided(by: rhs)
}

@_transparent
public func /=<T : FloatingPoint>(lhs: inout T, rhs: T) {
  return lhs.divide(by: rhs)
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPoint.swift.gyb", line: 1506)

@_transparent
public func == <T : FloatingPoint>(lhs: T, rhs: T) -> Bool {
  return lhs.isEqual(to: rhs)
}

@_transparent
public func < <T : FloatingPoint>(lhs: T, rhs: T) -> Bool {
  return lhs.isLess(than: rhs)
}

@_transparent
public func <= <T : FloatingPoint>(lhs: T, rhs: T) -> Bool {
  return lhs.isLessThanOrEqualTo(rhs)
}

@_transparent
public func > <T : FloatingPoint>(lhs: T, rhs: T) -> Bool {
  return rhs.isLess(than: lhs)
}

@_transparent
public func >= <T : FloatingPoint>(lhs: T, rhs: T) -> Bool {
  return rhs.isLessThanOrEqualTo(lhs)
}

/// A radix-2 (binary) floating-point type.
///
/// The `BinaryFloatingPoint` protocol extends the `FloatingPoint` protocol
/// with operations specific to floating-point binary types, as defined by the
/// [IEEE 754 specification][spec]. `BinaryFloatingPoint` is implemented in
/// the standard library by `Float`, `Double`, and `Float80` where available.
///
/// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
///
/// - SeeAlso: `FloatingPoint`
public protocol BinaryFloatingPoint: FloatingPoint, ExpressibleByFloatLiteral {

  /// A type that represents the encoded significand of a value.
  associatedtype RawSignificand: UnsignedInteger

  /// A type that represents the encoded exponent of a value.
  associatedtype RawExponent: UnsignedInteger

  /// Creates a new instance from the specified sign and bit patterns.
  ///
  /// The values passed as `exponentBitPattern` and `significandBitPattern` are
  /// interpreted in the binary interchange format defined by the [IEEE 754
  /// specification][spec].
  ///
  /// [spec]: http://ieeexplore.ieee.org/servlet/opac?punumber=4610933
  ///
  /// - Parameters:
  ///   - sign: The sign of the new value.
  ///   - exponentBitPattern: The bit pattern to use for the exponent field of
  ///     the new value.
  ///   - significandBitPattern: The bit pattern to use for the significand
  ///     field of the new value.
  init(sign: FloatingPointSign,
       exponentBitPattern: RawExponent,
       significandBitPattern: RawSignificand)

  /// Creates a new instance from the given value, rounded to the closest
  /// possible representation.
  ///
  /// - Parameter value: A floating-point value.
  init(_ value: Float)

  /// Creates a new instance from the given value, rounded to the closest
  /// possible representation.
  ///
  /// - Parameter value: A floating-point value.
  init(_ value: Double)

#if (!os(Windows) || CYGWIN) && (arch(i386) || arch(x86_64))
  /// Creates a new instance from the given value, rounded to the closest
  /// possible representation.
  ///
  /// - Parameter value: A floating-point value.
  init(_ value: Float80)
#endif

  /*  TODO: Implement these once it becomes possible to do so (requires revised
      Integer protocol).
  /// Creates a new instance from the given value, rounded to the closest
  /// possible representation.
  ///
  /// - Parameter value: A floating-point value.
  init<Source: BinaryFloatingPoint>(_ value: Source)

  /// Creates a new instance equivalent to the exact given value.
  ///
  /// If the value you pass as `value` can't be represented exactly, the result
  /// of this initializer is `nil`.
  ///
  /// - Parameter value: A floating-point value to represent.
  init?<Source: BinaryFloatingPoint>(exactly value: Source)
  */

  /// The number of bits used to represent the type's exponent.
  ///
  /// A binary floating-point type's `exponentBitCount` imposes a limit on the
  /// range of the exponent for normal, finite values. The *exponent bias* of
  /// a type `F` can be calculated as the following, where `**` is
  /// exponentiation:
  ///
  ///     let bias = 2 ** (F.exponentBitCount - 1) - 1
  ///
  /// The least normal exponent for values of the type `F` is `1 - bias`, and
  /// the largest finite exponent is `bias`. An all-zeros exponent is reserved
  /// for subnormals and zeros, and an all-ones exponent is reserved for
  /// infinity and NaN.
  ///
  /// For example, the `Float` type has an `exponentBitCount` of 8, which gives
  /// an exponent bias of `127` by the calculation above.
  ///
  ///     let bias = 2 ** (Float.exponentBitCount - 1) - 1
  ///     // bias == 127
  ///     print(Float.greatestFiniteMagnitude.exponent)
  ///     // Prints "127"
  ///     print(Float.leastNormalMagnitude.exponent)
  ///     // Prints "-126"
  static var exponentBitCount: Int { get }

  /// The available number of fractional significand bits.
  ///
  /// For fixed-width floating-point types, this is the actual number of
  /// fractional significand bits.
  ///
  /// For extensible floating-point types, `significandBitCount` should be the
  /// maximum allowed significand width (without counting any leading integral
  /// bit of the significand). If there is no upper limit, then
  /// `significandBitCount` should be `Int.max`.
  ///
  /// Note that `Float80.significandBitCount` is 63, even though 64 bits are
  /// used to store the significand in the memory representation of a
  /// `Float80` (unlike other floating-point types, `Float80` explicitly
  /// stores the leading integral significand bit, but the
  /// `BinaryFloatingPoint` APIs provide an abstraction so that users don't
  /// need to be aware of this detail).
  static var significandBitCount: Int { get }

  /// The raw encoding of the value's exponent field.
  ///
  /// This value is unadjusted by the type's exponent bias.
  ///
  /// - SeeAlso: `exponentBitCount`
  var exponentBitPattern: RawExponent { get }

  /// The raw encoding of the value's significand field.
  ///
  /// The `significandBitPattern` property does not include the leading
  /// integral bit of the significand, even for types like `Float80` that
  /// store it explicitly.
  var significandBitPattern: RawSignificand { get }

  /// The floating-point value with the same sign and exponent as this value,
  /// but with a significand of 1.0.
  ///
  /// A *binade* is a set of binary floating-point values that all have the
  /// same sign and exponent. The `binade` property is a member of the same
  /// binade as this value, but with a unit significand.
  ///
  /// In this example, `x` has a value of `21.5`, which is stored as
  /// `1.34375 * 2**4`, where `**` is exponentiation. Therefore, `x.binade` is
  /// equal to `1.0 * 2**4`, or `16.0`.
  ///
  ///     let x = 21.5
  ///     // x.significand == 1.34375
  ///     // x.exponent == 4
  ///
  ///     let y = x.binade
  ///     // y == 16.0
  ///     // y.significand == 1.0
  ///     // y.exponent == 4
  var binade: Self { get }

  /// The number of bits required to represent the value's significand.
  ///
  /// If this value is a finite nonzero number, `significandWidth` is the
  /// number of fractional bits required to represent the value of
  /// `significand`; otherwise, `significandWidth` is -1. The value of
  /// `significandWidth` is always -1 or between zero and
  /// `significandBitCount`. For example:
  ///
  /// - For any representable power of two, `significandWidth` is zero, because
  ///   `significand` is `1.0`.
  /// - If `x` is 10, `x.significand` is `1.01` in binary, so
  ///   `x.significandWidth` is 2.
  /// - If `x` is Float.pi, `x.significand` is `1.10010010000111111011011` in
  ///   binary, and `x.significandWidth` is 23.
  var significandWidth: Int { get }

  /*  TODO: Implement these once it becomes possible to do so. (Requires
   *  revised Integer protocol).
  func isEqual<Other: BinaryFloatingPoint>(to other: Other) -> Bool

  func isLess<Other: BinaryFloatingPoint>(than other: Other) -> Bool

  func isLessThanOrEqualTo<Other: BinaryFloatingPoint>(other: Other) -> Bool

  func isTotallyOrdered<Other: BinaryFloatingPoint>(belowOrEqualTo other: Other) -> Bool
  */
}

extension FloatingPoint {

  public static var ulpOfOne: Self {
    return Self(1).ulp
  }

  @_transparent
  public func rounded(_ rule: FloatingPointRoundingRule) -> Self {
    var lhs = self
    lhs.round(rule)
    return lhs
  }

  /// Returns this value rounded to an integral value using "schoolbook
  /// rounding."
  ///
  /// The `rounded()` method uses the `.toNearestOrAwayFromZero` rounding rule,
  /// where a value halfway between two integral values is rounded to the one
  /// with greater magnitude. The following example rounds several values
  /// using this default rule:
  ///
  ///     (5.2).rounded()
  ///     // 5.0
  ///     (5.5).rounded()
  ///     // 6.0
  ///     (-5.2).rounded()
  ///     // -5.0
  ///     (-5.5).rounded()
  ///     // -6.0
  ///
  /// To specify an alternative rule for rounding, use the `rounded(_:)` method
  /// instead.
  ///
  /// - Returns: The nearest integral value, or, if two integral values are
  ///   equally close, the integral value with greater magnitude.
  ///
  /// - SeeAlso: `rounded(_:)`, `round()`, `FloatingPointRoundingRule`
  @_transparent
  public func rounded() -> Self {
    return rounded(.toNearestOrAwayFromZero)
  }

  /// Rounds this value to an integral value using "schoolbook rounding."
  ///
  /// The `round()` method uses the `.toNearestOrAwayFromZero` rounding rule,
  /// where a value halfway between two integral values is rounded to the one
  /// with greater magnitude. The following example rounds several values
  /// using this default rule:
  ///
  ///     var x = 5.2
  ///     x.round()
  ///     // x == 5.0
  ///     var y = 5.5
  ///     y.round()
  ///     // y == 6.0
  ///     var z = -5.5
  ///     z.round()
  ///     // z == -6.0
  ///
  /// To specify an alternative rule for rounding, use the `round(_:)` method
  /// instead.
  ///
  /// - SeeAlso: `round(_:)`, `rounded()`, `FloatingPointRoundingRule`
  @_transparent
  public mutating func round() {
    round(.toNearestOrAwayFromZero)
  }

  @_transparent
  public var nextDown: Self {
    return -(-self).nextUp
  }

  @_transparent
  public func truncatingRemainder(dividingBy other: Self) -> Self {
    var lhs = self
    lhs.formTruncatingRemainder(dividingBy: other)
    return lhs
  }

  @_transparent
  public func remainder(dividingBy rhs: Self) -> Self {
    var lhs = self
    lhs.formRemainder(dividingBy: rhs)
    return lhs
  }

  @_transparent
  public func squareRoot( ) -> Self {
    var lhs = self
    lhs.formSquareRoot( )
    return lhs
  }

  @_transparent
  public func addingProduct(_ lhs: Self, _ rhs: Self) -> Self {
    var addend = self
    addend.addProduct(lhs, rhs)
    return addend
  }

  public static func minimum(_ x: Self, _ y: Self) -> Self {
    if x.isSignalingNaN || y.isSignalingNaN {
      //  Produce a quiet NaN matching platform arithmetic behavior.
      return x + y
    }
    if x <= y || y.isNaN { return x }
    return y
  }

  public static func maximum(_ x: Self, _ y: Self) -> Self {
    if x.isSignalingNaN || y.isSignalingNaN {
      //  Produce a quiet NaN matching platform arithmetic behavior.
      return x + y
    }
    if x > y || y.isNaN { return x }
    return y
  }

  public static func minimumMagnitude(_ x: Self, _ y: Self) -> Self {
    if x.isSignalingNaN || y.isSignalingNaN {
      //  Produce a quiet NaN matching platform arithmetic behavior.
      return x + y
    }
    if abs(x) <= abs(y) || y.isNaN { return x }
    return y
  }

  public static func maximumMagnitude(_ x: Self, _ y: Self) -> Self {
    if x.isSignalingNaN || y.isSignalingNaN {
      //  Produce a quiet NaN matching platform arithmetic behavior.
      return x + y
    }
    if abs(x) > abs(y) || y.isNaN { return x }
    return y
  }

  public var floatingPointClass: FloatingPointClassification {
    if isSignalingNaN { return .signalingNaN }
    if isNaN { return .quietNaN }
    if isInfinite { return sign == .minus ? .negativeInfinity : .positiveInfinity }
    if isNormal { return sign == .minus ? .negativeNormal : .positiveNormal }
    if isSubnormal { return sign == .minus ? .negativeSubnormal : .positiveSubnormal }
    return sign == .minus ? .negativeZero : .positiveZero
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPoint.swift.gyb", line: 1858)
  @_transparent
  public func adding(_ other: Self) -> Self {
    var lhs = self
    lhs.add(other)
    return lhs
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPoint.swift.gyb", line: 1858)
  @_transparent
  public func subtracting(_ other: Self) -> Self {
    var lhs = self
    lhs.subtract(other)
    return lhs
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPoint.swift.gyb", line: 1858)
  @_transparent
  public func multiplied(by other: Self) -> Self {
    var lhs = self
    lhs.multiply(by: other)
    return lhs
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPoint.swift.gyb", line: 1858)
  @_transparent
  public func divided(by other: Self) -> Self {
    var lhs = self
    lhs.divide(by: other)
    return lhs
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/FloatingPoint.swift.gyb", line: 1865)

  @_transparent
  public func negated() -> Self {
    var rhs = self
    rhs.negate()
    return rhs
  }
}

extension BinaryFloatingPoint {

  /// The radix, or base of exponentiation, for this floating-point type.
  ///
  /// All binary floating-point types have a radix of 2. The magnitude of a
  /// floating-point value `x` of type `F` can be calculated by using the
  /// following formula, where `**` is exponentiation:
  ///
  ///     let magnitude = x.significand * F.radix ** x.exponent
  public static var radix: Int { return 2 }

  public init(signOf: Self, magnitudeOf: Self) {
    self.init(sign: signOf.sign,
      exponentBitPattern: magnitudeOf.exponentBitPattern,
      significandBitPattern: magnitudeOf.significandBitPattern)
  }

  public func isTotallyOrdered(belowOrEqualTo other: Self) -> Bool {
    // Quick return when possible.
    if self < other { return true }
    if other > self { return false }
    // Self and other are either equal or unordered.
    // Every negative-signed value (even NaN) is less than every positive-
    // signed value, so if the signs do not match, we simply return the
    // sign bit of self.
    if sign != other.sign { return sign == .minus }
    // Sign bits match; look at exponents.
    if exponentBitPattern > other.exponentBitPattern { return sign == .minus }
    if exponentBitPattern < other.exponentBitPattern { return sign == .plus }
    // Signs and exponents match, look at significands.
    if significandBitPattern > other.significandBitPattern {
      return sign == .minus
    }
    if significandBitPattern < other.significandBitPattern {
      return sign == .plus
    }
    //  Sign, exponent, and significand all match.
    return true
  }


  /*  TODO: uncomment these default implementations when it becomes possible
      to use them.
  //  TODO: The following comparison implementations are not quite correct for
  //  the unusual case where one type has more exponent range and the other
  //  uses more fractional bits, *and* the value with more exponent range is
  //  subnormal when converted to the other type. This is an extremely niche
  //  corner case, however (it cannot occur with the usual IEEE 754 floating-
  //  point types). Nonetheless, this should be fixed someday.
  public func isEqual<Other: BinaryFloatingPoint>(to other: Other) -> Bool {
    if Self.significandBitCount >= Other.significandBitCount {
      return self.isEqual(to: Self(other))
    }
    return other.isEqual(to: Other(self))
  }

  public func isLess<Other: BinaryFloatingPoint>(than other: Other) -> Bool {
    if Self.significandBitCount >= Other.significandBitCount {
      return self.isLess(than: Self(other))
    }
    return Other(self).isLess(than: other)
  }

  public func isLessThanOrEqualTo<Other: BinaryFloatingPoint>(other: Other) -> Bool {
    if Self.significandBitCount >= Other.significandBitCount {
      return self.isLessThanOrEqualTo(Self(other))
    }
    return Other(self).isLessThanOrEqualTo(other)
  }

  public func isTotallyOrdered<Other: BinaryFloatingPoint>(belowOrEqualTo other: Other) -> Bool {
    if Self.significandBitCount >= Other.significandBitCount {
      return self.totalOrder(with: Self(other))
    }
    return Other(self).totalOrder(with: other)
  }
  */
}

/// Returns the absolute value of `x`.
@_transparent
public func abs<T : FloatingPoint>(_ x: T) -> T {
  return T.abs(x)
}

extension FloatingPoint {
  @available(*, unavailable, message: "Use bitPattern property instead")
  public func _toBitPattern() -> UInt {
    fatalError("unavailable")
  }

  @available(*, unavailable, message: "Use init(bitPattern:) instead")
  public static func _fromBitPattern(_ bits: UInt) -> Self {
    fatalError("unavailable")
  }
}

extension BinaryFloatingPoint {
  @available(*, unavailable, renamed: "isSignalingNaN")
  public var isSignaling: Bool {
    fatalError("unavailable")
  }

  @available(*, unavailable, renamed: "nan")
  public var NaN: Bool {
    fatalError("unavailable")
  }
  @available(*, unavailable, renamed: "nan")
  public var quietNaN: Bool {
    fatalError("unavailable")
  }
}

@available(*, unavailable, renamed: "FloatingPoint")
public typealias FloatingPointType = FloatingPoint
