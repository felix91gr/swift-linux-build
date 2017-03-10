// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 1)
//===--- Range.swift.gyb --------------------------------------*- swift -*-===//
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

// FIXME(ABI)#55 (Statically Unavailable/Dynamically Available): remove this type, it creates an ABI burden
// on the library.
//
// A dummy type that we can use when we /don't/ want to create an
// ambiguity indexing CountableRange<T> outside a generic context.
public enum _DisabledRangeIndex_ {}

/// A half-open range that forms a collection of consecutive values.
///
/// You create a `CountableRange` instance by using the half-open range
/// operator (`..<`).
///
///     let upToFive = 0..<5
///
/// The associated `Bound` type is both the element and index type of
/// `CountableRange`. Each element of the range is its own corresponding
/// index. The lower bound of a `CountableRange` instance is its start index,
/// and the upper bound is its end index.
///
///     print(upToFive.contains(3))         // Prints "true"
///     print(upToFive.contains(10))        // Prints "false"
///     print(upToFive.contains(5))         // Prints "false"
///
/// If the `Bound` type has a maximal value, it can serve as an upper bound but
/// can never be contained in a `CountableRange<Bound>` instance. For example,
/// a `CountableRange<Int8>` instance can use `Int8.max` as its upper bound,
/// but it can't represent a range that includes `Int8.max`.
///
///     let maximumRange = Int8.min..<Int8.max
///     print(maximumRange.contains(Int8.max))
///     // Prints "false"
///
/// If you need to create a range that includes the maximal value of its
/// `Bound` type, see the `CountableClosedRange` type.
///
/// You can create a countable range over any type that conforms to the
/// `Strideable` protocol and uses an integer as its associated `Stride` type.
/// By default, Swift's integer and pointer types are usable as the bounds of
/// a countable range.
///
/// Because floating-point types such as `Float` and `Double` are their own
/// `Stride` types, they cannot be used as the bounds of a countable range. If
/// you need to test whether values are contained within an interval bound by
/// floating-point values, see the `Range` type. If you need to iterate over
/// consecutive floating-point values, see the `stride(from:to:by:)` function.
///
/// Integer Index Ambiguity
/// -----------------------
///
/// Because each element of a `CountableRange` instance is its own index, for
/// the range `(-99..<100)` the element at index `0` is `0`. This is an
/// unexpected result for those accustomed to zero-based collection indices,
/// who might expect the result to be `-99`. To prevent this confusion, in a
/// context where `Bound` is known to be an integer type, subscripting
/// directly is a compile-time error:
///
///     // error: ambiguous use of 'subscript'
///     print((-99..<100)[0])
///
/// However, subscripting that range still works in a generic context:
///
///     func brackets<T>(_ x: CountableRange<T>, _ i: T) -> T {
///         return x[i] // Just forward to subscript
///     }
///     print(brackets(-99..<100, 0))
///     // Prints "0"
///
/// - SeeAlso: `CountableClosedRange`, `Range`, `ClosedRange`
public struct CountableRange<Bound> : RandomAccessCollection
  where
  // FIXME(ABI)#176 (Type checker)
  // WORKAROUND rdar://25214598 - should be just Bound : Strideable
  Bound : _Strideable & Comparable,
  Bound.Stride : SignedInteger {

  /// The range's lower bound.
  ///
  /// In an empty range, `lowerBound` is equal to `upperBound`.
  public let lowerBound: Bound

  /// The range's upper bound.
  ///
  /// `upperBound` is not a valid subscript argument and is always
  /// reachable from `lowerBound` by zero or more applications of
  /// `index(after:)`.
  ///
  /// In an empty range, `upperBound` is equal to `lowerBound`.
  public let upperBound: Bound

  /// The bound type of the range.
  public typealias Element = Bound

  /// A type that represents a position in the range.
  public typealias Index = Element

  public typealias IndexDistance = Bound.Stride

  public var startIndex: Index {
    return lowerBound
  }

  public var endIndex: Index {
    return upperBound
  }

  public func index(after i: Index) -> Index {
    _failEarlyRangeCheck(i, bounds: startIndex..<endIndex)

    return i.advanced(by: 1)
  }

  public func index(before i: Index) -> Index {
    _precondition(i > lowerBound)
    _precondition(i <= upperBound)

    return i.advanced(by: -1)
  }

  public func index(_ i: Index, offsetBy n: IndexDistance) -> Index {
    let r = i.advanced(by: n)
    _precondition(r >= lowerBound)
    _precondition(r <= upperBound)
    return r
  }

  public func distance(from start: Index, to end: Index) -> IndexDistance {
    return start.distance(to: end)
  }

  public typealias SubSequence = CountableRange<Bound>

  /// Accesses the subsequence bounded by the given range.
  ///
  /// - Parameter bounds: A range of the range's indices. The upper and lower
  ///   bounds of the `bounds` range must be valid indices of the collection.
  public subscript(bounds: Range<Index>) -> CountableRange<Bound> {
    return CountableRange(bounds)
  }

  /// Accesses the subsequence bounded by the given range.
  ///
  /// - Parameter bounds: A range of the range's indices. The upper and lower
  ///   bounds of the `bounds` range must be valid indices of the collection.
  public subscript(bounds: CountableRange<Bound>) -> CountableRange<Bound> {
    return self[Range(bounds)]
  }

  public typealias Indices = CountableRange<Bound>

  /// The indices that are valid for subscripting the range, in ascending
  /// order.
  public var indices: Indices {
    return self
  }

  /// Creates an instance with the given bounds.
  ///
  /// Because this initializer does not perform any checks, it should be used
  /// as an optimization only when you are absolutely certain that `lower` is
  /// less than or equal to `upper`. Using the half-open range operator
  /// (`..<`) to form `CountableRange` instances is preferred.
  ///
  /// - Parameter bounds: A tuple of the lower and upper bounds of the range.
  public init(uncheckedBounds bounds: (lower: Bound, upper: Bound)) {
    self.lowerBound = bounds.lower
    self.upperBound = bounds.upper
  }

  public func _customContainsEquatableElement(_ element: Element) -> Bool? {
    return lowerBound <= element && element < upperBound
  }

  /// A Boolean value indicating whether the range contains no elements.
  ///
  /// An empty range has equal lower and upper bounds.
  ///
  ///     let empty = 10..<10
  ///     print(empty.isEmpty)
  ///     // Prints "true"
  public var isEmpty: Bool {
    return lowerBound == upperBound
  }
}

//===--- Protection against 0-based indexing assumption -------------------===//
// The following two extensions provide subscript overloads that
// create *intentional* ambiguities to prevent the use of integers as
// indices for ranges, outside a generic context.  This prevents mistakes
// such as x = r[0], which will trap unless 0 happens to be contained in the
// range r.
//
// FIXME(ABI)#56 (Statically Unavailable/Dynamically Available): remove this code, it creates an ABI burden
// on the library.
extension CountableRange {
  /// Accesses the element at specified position.
  ///
  /// You can subscript a collection with any valid index other than the
  /// collection's end index. The end index refers to the position one past
  /// the last element of a collection, so it doesn't correspond with an
  /// element.
  ///
  /// - Parameter position: The position of the element to access. `position`
  ///   must be a valid index of the range, and must not equal the range's end
  ///   index.
  public subscript(position: Index) -> Element {
    // FIXME: swift-3-indexing-model: tests for the range check.
    _debugPrecondition(self.contains(position), "Index out of range")
    return position
  }

  public subscript(_position: Bound._DisabledRangeIndex) -> Element {
    fatalError("uncallable")
  }
}

extension CountableRange
  where
  Bound._DisabledRangeIndex : Strideable,
  Bound._DisabledRangeIndex.Stride : SignedInteger {

  public subscript(
    _bounds: Range<Bound._DisabledRangeIndex>
  ) -> CountableRange<Bound> {
    fatalError("uncallable")
  }

  public subscript(
    _bounds: CountableRange<Bound._DisabledRangeIndex>
  ) -> CountableRange<Bound> {
    fatalError("uncallable")
  }

  public subscript(
    _bounds: ClosedRange<Bound._DisabledRangeIndex>
  ) -> CountableRange<Bound> {
    fatalError("uncallable")
  }

  public subscript(
    _bounds: CountableClosedRange<Bound._DisabledRangeIndex>
  ) -> CountableRange<Bound> {
    fatalError("uncallable")
  }

  /// Accesses the subsequence bounded by the given range.
  ///
  /// - Parameter bounds: A range of the collection's indices. The upper and
  ///   lower bounds of the `bounds` range must be valid indices of the
  ///   collection and `bounds.upperBound` must be less than the collection's
  ///   end index.
  public subscript(bounds: ClosedRange<Bound>) -> CountableRange<Bound> {
    return self[bounds.lowerBound..<(bounds.upperBound.advanced(by: 1))]
  }

  /// Accesses the subsequence bounded by the given range.
  ///
  /// - Parameter bounds: A range of the collection's indices. The upper and
  ///   lower bounds of the `bounds` range must be valid indices of the
  ///   collection and `bounds.upperBound` must be less than the collection's
  ///   end index.
  public subscript(
    bounds: CountableClosedRange<Bound>
  ) -> CountableRange<Bound> {
    return self[ClosedRange(bounds)]
  }
}

//===--- End 0-based indexing protection ----------------------------------===//

/// A half-open interval over a comparable type, from a lower bound up to, but
/// not including, an upper bound.
///
/// You create `Range` instances by using the half-open range operator (`..<`).
///
///     let underFive = 0.0..<5.0
///
/// You can use a `Range` instance to quickly check if a value is contained in
/// a particular range of values. For example:
///
///     print(underFive.contains(3.14))     // Prints "true"
///     print(underFive.contains(6.28))     // Prints "false"
///     print(underFive.contains(5.0))      // Prints "false"
///
/// `Range` instances can represent an empty interval, unlike `ClosedRange`.
///
///     let empty = 0.0..<0.0
///     print(empty.contains(0.0))          // Prints "false"
///     print(empty.isEmpty)                // Prints "true"
///
/// - SeeAlso: `CountableRange`, `ClosedRange`, `CountableClosedRange`
@_fixed_layout
public struct Range<
  Bound : Comparable
> {
  /// Creates an instance with the given bounds.
  ///
  /// Because this initializer does not perform any checks, it should be used
  /// as an optimization only when you are absolutely certain that `lower` is
  /// less than or equal to `upper`. Using the half-open range operator
  /// (`..<`) to form `Range` instances is preferred.
  ///
  /// - Parameter bounds: A tuple of the lower and upper bounds of the range.
  @inline(__always)
  public init(uncheckedBounds bounds: (lower: Bound, upper: Bound)) {
    self.lowerBound = bounds.lower
    self.upperBound = bounds.upper
  }

  /// The range's lower bound.
  ///
  /// In an empty range, `lowerBound` is equal to `upperBound`.
  public let lowerBound: Bound

  /// The range's upper bound.
  ///
  /// In an empty range, `upperBound` is equal to `lowerBound`. A `Range`
  /// instance does not contain its upper bound.
  public let upperBound: Bound

  /// Returns a Boolean value indicating whether the given element is contained
  /// within the range.
  ///
  /// Because `Range` represents a half-open range, a `Range` instance does not
  /// contain its upper bound. `element` is contained in the range if it is
  /// greater than or equal to the lower bound and less than the upper bound.
  ///
  /// - Parameter element: The element to check for containment.
  /// - Returns: `true` if `element` is contained in the range; otherwise,
  ///   `false`.
  public func contains(_ element: Bound) -> Bool {
    return lowerBound <= element && element < upperBound
  }

  /// A Boolean value indicating whether the range contains no elements.
  ///
  /// An empty `Range` instance has equal lower and upper bounds.
  ///
  ///     let empty: Range = 10..<10
  ///     print(empty.isEmpty)
  ///     // Prints "true"
  public var isEmpty: Bool {
    return lowerBound == upperBound
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 386)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 389)
extension Range
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 394)
{
  /// Creates an instance equivalent to the given range.

  ///
  /// - Parameter other: A range to convert to a `Range` instance.
  @inline(__always)
  public init(_ other: Range<Bound>) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 407)
    let upperBound = other.upperBound
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 409)
    self.init(
      uncheckedBounds: (lower: other.lowerBound, upper: upperBound)
    )
  }
}

extension Range
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 420)
{
  /// Returns a Boolean value indicating whether this range and the given range
  /// contain an element in common.
  ///
  /// This example shows two overlapping ranges:
  ///
  ///     let x: Range = 0..<20
  ///     print(x.overlaps(10..<1000 as Range))
  ///     // Prints "true"
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 438)
  /// Because a half-open range does not include its upper bound, the ranges
  /// in the following example do not overlap:
  ///
  ///     let y: Range = 20..<30
  ///     print(x.overlaps(y))
  ///     // Prints "false"
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 445)
  ///
  /// - Parameter other: A range to check for elements in common.
  /// - Returns: `true` if this range and `other` have at least one element in
  ///   common; otherwise, `false`.
  @inline(__always)
  public func overlaps(_ other: Range<Bound>) -> Bool {
    return (!other.isEmpty && self.contains(other.lowerBound))
        || (!self.isEmpty && other.contains(lowerBound))
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 389)
extension Range
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 391)
  where
  Bound : _Strideable, Bound.Stride : SignedInteger
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 394)
{
  /// Creates an instance equivalent to the given range.

  ///
  /// - Parameter other: A range to convert to a `Range` instance.
  @inline(__always)
  public init(_ other: CountableRange<Bound>) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 407)
    let upperBound = other.upperBound
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 409)
    self.init(
      uncheckedBounds: (lower: other.lowerBound, upper: upperBound)
    )
  }
}

extension Range
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 417)
  where
  Bound : _Strideable, Bound.Stride : SignedInteger
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 420)
{
  /// Returns a Boolean value indicating whether this range and the given range
  /// contain an element in common.
  ///
  /// This example shows two overlapping ranges:
  ///
  ///     let x: Range = 0..<20
  ///     print(x.overlaps(10..<1000 as CountableRange))
  ///     // Prints "true"
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 438)
  /// Because a half-open range does not include its upper bound, the ranges
  /// in the following example do not overlap:
  ///
  ///     let y: CountableRange = 20..<30
  ///     print(x.overlaps(y))
  ///     // Prints "false"
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 445)
  ///
  /// - Parameter other: A range to check for elements in common.
  /// - Returns: `true` if this range and `other` have at least one element in
  ///   common; otherwise, `false`.
  @inline(__always)
  public func overlaps(_ other: CountableRange<Bound>) -> Bool {
    return (!other.isEmpty && self.contains(other.lowerBound))
        || (!self.isEmpty && other.contains(lowerBound))
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 389)
extension Range
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 391)
  where
  Bound : _Strideable, Bound.Stride : SignedInteger
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 394)
{
  /// Creates an instance equivalent to the given range.
  ///
  /// An equivalent range must be representable as an instance of `Range`.
  /// For example, passing a closed range with an upper bound of `Int.max`
  /// triggers a runtime error, because the resulting half-open range would
  /// require an upper bound of `Int.max + 1`, which is not representable as
  /// an `Int`.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 396)
  ///
  /// - Parameter other: A range to convert to a `Range` instance.
  @inline(__always)
  public init(_ other: ClosedRange<Bound>) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 402)
    let upperBound = other.upperBound.advanced(by: 1)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 409)
    self.init(
      uncheckedBounds: (lower: other.lowerBound, upper: upperBound)
    )
  }
}

extension Range
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 420)
{
  /// Returns a Boolean value indicating whether this range and the given range
  /// contain an element in common.
  ///
  /// This example shows two overlapping ranges:
  ///
  ///     let x: Range = 0..<20
  ///     print(x.overlaps(10...1000 as ClosedRange))
  ///     // Prints "true"
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 438)
  /// Because a half-open range does not include its upper bound, the ranges
  /// in the following example do not overlap:
  ///
  ///     let y: ClosedRange = 20..<30
  ///     print(x.overlaps(y))
  ///     // Prints "false"
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 445)
  ///
  /// - Parameter other: A range to check for elements in common.
  /// - Returns: `true` if this range and `other` have at least one element in
  ///   common; otherwise, `false`.
  @inline(__always)
  public func overlaps(_ other: ClosedRange<Bound>) -> Bool {
    return (!other.isEmpty && self.contains(other.lowerBound))
        || (!self.isEmpty && other.contains(lowerBound))
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 389)
extension Range
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 391)
  where
  Bound : _Strideable, Bound.Stride : SignedInteger
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 394)
{
  /// Creates an instance equivalent to the given range.
  ///
  /// An equivalent range must be representable as an instance of `Range`.
  /// For example, passing a closed range with an upper bound of `Int.max`
  /// triggers a runtime error, because the resulting half-open range would
  /// require an upper bound of `Int.max + 1`, which is not representable as
  /// an `Int`.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 396)
  ///
  /// - Parameter other: A range to convert to a `Range` instance.
  @inline(__always)
  public init(_ other: CountableClosedRange<Bound>) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 402)
    let upperBound = other.upperBound.advanced(by: 1)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 409)
    self.init(
      uncheckedBounds: (lower: other.lowerBound, upper: upperBound)
    )
  }
}

extension Range
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 417)
  where
  Bound : _Strideable, Bound.Stride : SignedInteger
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 420)
{
  /// Returns a Boolean value indicating whether this range and the given range
  /// contain an element in common.
  ///
  /// This example shows two overlapping ranges:
  ///
  ///     let x: Range = 0..<20
  ///     print(x.overlaps(10...1000 as CountableClosedRange))
  ///     // Prints "true"
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 438)
  /// Because a half-open range does not include its upper bound, the ranges
  /// in the following example do not overlap:
  ///
  ///     let y: CountableClosedRange = 20..<30
  ///     print(x.overlaps(y))
  ///     // Prints "false"
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 445)
  ///
  /// - Parameter other: A range to check for elements in common.
  /// - Returns: `true` if this range and `other` have at least one element in
  ///   common; otherwise, `false`.
  @inline(__always)
  public func overlaps(_ other: CountableClosedRange<Bound>) -> Bool {
    return (!other.isEmpty && self.contains(other.lowerBound))
        || (!self.isEmpty && other.contains(lowerBound))
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 456)

extension Range {
  /// Returns a copy of this range clamped to the given limiting range.
  ///
  /// The bounds of the result are always limited to the bounds of `limits`.
  /// For example:
  ///
  ///     let x: Range = 0..<20
  ///     print(x.clamped(to: 10..<1000))
  ///     // Prints "10..<20"
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 471)
  /// If the two ranges do not overlap, the result is an empty range within the
  /// bounds of `limits`.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 474)
  ///
  ///     let y: Range = 0..<5
  ///     print(y.clamped(to: 10..<1000))
  ///     // Prints "10..<10"
  ///
  /// - Parameter limits: The range to clamp the bounds of this range.
  /// - Returns: A new range clamped to the bounds of `limits`.
  @inline(__always)
  public func clamped(to limits: Range) -> Range {
    return Range(
      uncheckedBounds: (
        lower:
        limits.lowerBound > self.lowerBound ? limits.lowerBound
          : limits.upperBound < self.lowerBound ? limits.upperBound
          : self.lowerBound,
        upper:
          limits.upperBound < self.upperBound ? limits.upperBound
          : limits.lowerBound > self.upperBound ? limits.lowerBound
          : self.upperBound
      )
    )
  }
}

extension Range : CustomStringConvertible {
  /// A textual representation of the range.
  public var description: String {
    return "\(lowerBound)..<\(upperBound)"
  }
}

extension Range : CustomDebugStringConvertible {
  /// A textual representation of the range, suitable for debugging.
  public var debugDescription: String {
    return "Range(\(String(reflecting: lowerBound))"
    + "..<\(String(reflecting: upperBound)))"
  }
}

extension Range : CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(
      self, children: ["lowerBound": lowerBound, "upperBound": upperBound])
  }
}

extension Range : Equatable {
  /// Returns a Boolean value indicating whether two ranges are equal.
  ///
  /// Two ranges are equal when they have the same lower and upper bounds.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 532)
  /// That requirement holds even for empty ranges.
  ///
  ///     let x: Range = 5..<15
  ///     print(x == 5..<15)
  ///     // Prints "true"
  ///
  ///     let y: Range = 5..<5
  ///     print(y == 15..<15)
  ///     // Prints "false"
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 542)
  ///
  /// - Parameters:
  ///   - lhs: A range to compare.
  ///   - rhs: Another range to compare.
  public static func == (lhs: Range<Bound>, rhs: Range<Bound>) -> Bool {
    return
      lhs.lowerBound == rhs.lowerBound &&
      lhs.upperBound == rhs.upperBound
  }

  /// Returns a Boolean value indicating whether a value is included in a
  /// range.
  ///
  /// You can use this pattern matching operator (`~=`) to test whether a value
  /// is included in a range. The following example uses the `~=` operator to
  /// test whether an integer is included in a range of single-digit numbers.
  ///
  ///     let chosenNumber = 3
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 563)
  ///     if 0..<10 ~= chosenNumber {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 565)
  ///         print("\(chosenNumber) is a single digit.")
  ///     }
  ///     // Prints "3 is a single digit."
  ///
  /// The `~=` operator is used internally in `case` statements for pattern
  /// matching. When you match against a range in a `case` statement, this
  /// operator is called behind the scenes.
  ///
  ///     switch chosenNumber {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 577)
  ///     case 0..<10:
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 579)
  ///         print("\(chosenNumber) is a single digit.")
  ///     case Int.min..<0:
  ///         print("\(chosenNumber) is negative.")
  ///     default:
  ///         print("\(chosenNumber) is positive.")
  ///     }
  ///     // Prints "3 is a single digit."
  ///
  /// - Parameters:
  ///   - lhs: A range.
  ///   - rhs: A value to match against `lhs`.
  public static func ~= (pattern: Range<Bound>, value: Bound) -> Bool {
    return pattern.contains(value)
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 389)
extension CountableRange
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 391)
  where
  Bound : _Strideable, Bound.Stride : SignedInteger
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 394)
{
  /// Creates an instance equivalent to the given range.

  ///
  /// - Parameter other: A range to convert to a `CountableRange` instance.
  @inline(__always)
  public init(_ other: Range<Bound>) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 407)
    let upperBound = other.upperBound
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 409)
    self.init(
      uncheckedBounds: (lower: other.lowerBound, upper: upperBound)
    )
  }
}

extension CountableRange
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 417)
  where
  Bound : _Strideable, Bound.Stride : SignedInteger
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 420)
{
  /// Returns a Boolean value indicating whether this range and the given range
  /// contain an element in common.
  ///
  /// This example shows two overlapping ranges:
  ///
  ///     let x: CountableRange = 0..<20
  ///     print(x.overlaps(10..<1000 as Range))
  ///     // Prints "true"
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 438)
  /// Because a half-open range does not include its upper bound, the ranges
  /// in the following example do not overlap:
  ///
  ///     let y: Range = 20..<30
  ///     print(x.overlaps(y))
  ///     // Prints "false"
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 445)
  ///
  /// - Parameter other: A range to check for elements in common.
  /// - Returns: `true` if this range and `other` have at least one element in
  ///   common; otherwise, `false`.
  @inline(__always)
  public func overlaps(_ other: Range<Bound>) -> Bool {
    return (!other.isEmpty && self.contains(other.lowerBound))
        || (!self.isEmpty && other.contains(lowerBound))
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 389)
extension CountableRange
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 391)
  where
  Bound : _Strideable, Bound.Stride : SignedInteger
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 394)
{
  /// Creates an instance equivalent to the given range.

  ///
  /// - Parameter other: A range to convert to a `CountableRange` instance.
  @inline(__always)
  public init(_ other: CountableRange<Bound>) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 407)
    let upperBound = other.upperBound
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 409)
    self.init(
      uncheckedBounds: (lower: other.lowerBound, upper: upperBound)
    )
  }
}

extension CountableRange
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 417)
  where
  Bound : _Strideable, Bound.Stride : SignedInteger
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 420)
{
  /// Returns a Boolean value indicating whether this range and the given range
  /// contain an element in common.
  ///
  /// This example shows two overlapping ranges:
  ///
  ///     let x: CountableRange = 0..<20
  ///     print(x.overlaps(10..<1000 as CountableRange))
  ///     // Prints "true"
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 438)
  /// Because a half-open range does not include its upper bound, the ranges
  /// in the following example do not overlap:
  ///
  ///     let y: CountableRange = 20..<30
  ///     print(x.overlaps(y))
  ///     // Prints "false"
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 445)
  ///
  /// - Parameter other: A range to check for elements in common.
  /// - Returns: `true` if this range and `other` have at least one element in
  ///   common; otherwise, `false`.
  @inline(__always)
  public func overlaps(_ other: CountableRange<Bound>) -> Bool {
    return (!other.isEmpty && self.contains(other.lowerBound))
        || (!self.isEmpty && other.contains(lowerBound))
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 389)
extension CountableRange
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 391)
  where
  Bound : _Strideable, Bound.Stride : SignedInteger
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 394)
{
  /// Creates an instance equivalent to the given range.
  ///
  /// An equivalent range must be representable as an instance of `CountableRange`.
  /// For example, passing a closed range with an upper bound of `Int.max`
  /// triggers a runtime error, because the resulting half-open range would
  /// require an upper bound of `Int.max + 1`, which is not representable as
  /// an `Int`.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 396)
  ///
  /// - Parameter other: A range to convert to a `CountableRange` instance.
  @inline(__always)
  public init(_ other: ClosedRange<Bound>) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 402)
    let upperBound = other.upperBound.advanced(by: 1)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 409)
    self.init(
      uncheckedBounds: (lower: other.lowerBound, upper: upperBound)
    )
  }
}

extension CountableRange
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 417)
  where
  Bound : _Strideable, Bound.Stride : SignedInteger
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 420)
{
  /// Returns a Boolean value indicating whether this range and the given range
  /// contain an element in common.
  ///
  /// This example shows two overlapping ranges:
  ///
  ///     let x: CountableRange = 0..<20
  ///     print(x.overlaps(10...1000 as ClosedRange))
  ///     // Prints "true"
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 438)
  /// Because a half-open range does not include its upper bound, the ranges
  /// in the following example do not overlap:
  ///
  ///     let y: ClosedRange = 20..<30
  ///     print(x.overlaps(y))
  ///     // Prints "false"
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 445)
  ///
  /// - Parameter other: A range to check for elements in common.
  /// - Returns: `true` if this range and `other` have at least one element in
  ///   common; otherwise, `false`.
  @inline(__always)
  public func overlaps(_ other: ClosedRange<Bound>) -> Bool {
    return (!other.isEmpty && self.contains(other.lowerBound))
        || (!self.isEmpty && other.contains(lowerBound))
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 389)
extension CountableRange
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 391)
  where
  Bound : _Strideable, Bound.Stride : SignedInteger
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 394)
{
  /// Creates an instance equivalent to the given range.
  ///
  /// An equivalent range must be representable as an instance of `CountableRange`.
  /// For example, passing a closed range with an upper bound of `Int.max`
  /// triggers a runtime error, because the resulting half-open range would
  /// require an upper bound of `Int.max + 1`, which is not representable as
  /// an `Int`.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 396)
  ///
  /// - Parameter other: A range to convert to a `CountableRange` instance.
  @inline(__always)
  public init(_ other: CountableClosedRange<Bound>) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 402)
    let upperBound = other.upperBound.advanced(by: 1)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 409)
    self.init(
      uncheckedBounds: (lower: other.lowerBound, upper: upperBound)
    )
  }
}

extension CountableRange
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 417)
  where
  Bound : _Strideable, Bound.Stride : SignedInteger
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 420)
{
  /// Returns a Boolean value indicating whether this range and the given range
  /// contain an element in common.
  ///
  /// This example shows two overlapping ranges:
  ///
  ///     let x: CountableRange = 0..<20
  ///     print(x.overlaps(10...1000 as CountableClosedRange))
  ///     // Prints "true"
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 438)
  /// Because a half-open range does not include its upper bound, the ranges
  /// in the following example do not overlap:
  ///
  ///     let y: CountableClosedRange = 20..<30
  ///     print(x.overlaps(y))
  ///     // Prints "false"
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 445)
  ///
  /// - Parameter other: A range to check for elements in common.
  /// - Returns: `true` if this range and `other` have at least one element in
  ///   common; otherwise, `false`.
  @inline(__always)
  public func overlaps(_ other: CountableClosedRange<Bound>) -> Bool {
    return (!other.isEmpty && self.contains(other.lowerBound))
        || (!self.isEmpty && other.contains(lowerBound))
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 456)

extension CountableRange {
  /// Returns a copy of this range clamped to the given limiting range.
  ///
  /// The bounds of the result are always limited to the bounds of `limits`.
  /// For example:
  ///
  ///     let x: CountableRange = 0..<20
  ///     print(x.clamped(to: 10..<1000))
  ///     // Prints "10..<20"
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 471)
  /// If the two ranges do not overlap, the result is an empty range within the
  /// bounds of `limits`.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 474)
  ///
  ///     let y: CountableRange = 0..<5
  ///     print(y.clamped(to: 10..<1000))
  ///     // Prints "10..<10"
  ///
  /// - Parameter limits: The range to clamp the bounds of this range.
  /// - Returns: A new range clamped to the bounds of `limits`.
  @inline(__always)
  public func clamped(to limits: CountableRange) -> CountableRange {
    return CountableRange(
      uncheckedBounds: (
        lower:
        limits.lowerBound > self.lowerBound ? limits.lowerBound
          : limits.upperBound < self.lowerBound ? limits.upperBound
          : self.lowerBound,
        upper:
          limits.upperBound < self.upperBound ? limits.upperBound
          : limits.lowerBound > self.upperBound ? limits.lowerBound
          : self.upperBound
      )
    )
  }
}

extension CountableRange : CustomStringConvertible {
  /// A textual representation of the range.
  public var description: String {
    return "\(lowerBound)..<\(upperBound)"
  }
}

extension CountableRange : CustomDebugStringConvertible {
  /// A textual representation of the range, suitable for debugging.
  public var debugDescription: String {
    return "CountableRange(\(String(reflecting: lowerBound))"
    + "..<\(String(reflecting: upperBound)))"
  }
}

extension CountableRange : CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(
      self, children: ["lowerBound": lowerBound, "upperBound": upperBound])
  }
}

extension CountableRange : Equatable {
  /// Returns a Boolean value indicating whether two ranges are equal.
  ///
  /// Two ranges are equal when they have the same lower and upper bounds.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 532)
  /// That requirement holds even for empty ranges.
  ///
  ///     let x: CountableRange = 5..<15
  ///     print(x == 5..<15)
  ///     // Prints "true"
  ///
  ///     let y: CountableRange = 5..<5
  ///     print(y == 15..<15)
  ///     // Prints "false"
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 542)
  ///
  /// - Parameters:
  ///   - lhs: A range to compare.
  ///   - rhs: Another range to compare.
  public static func == (lhs: CountableRange<Bound>, rhs: CountableRange<Bound>) -> Bool {
    return
      lhs.lowerBound == rhs.lowerBound &&
      lhs.upperBound == rhs.upperBound
  }

  /// Returns a Boolean value indicating whether a value is included in a
  /// range.
  ///
  /// You can use this pattern matching operator (`~=`) to test whether a value
  /// is included in a range. The following example uses the `~=` operator to
  /// test whether an integer is included in a range of single-digit numbers.
  ///
  ///     let chosenNumber = 3
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 563)
  ///     if 0..<10 ~= chosenNumber {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 565)
  ///         print("\(chosenNumber) is a single digit.")
  ///     }
  ///     // Prints "3 is a single digit."
  ///
  /// The `~=` operator is used internally in `case` statements for pattern
  /// matching. When you match against a range in a `case` statement, this
  /// operator is called behind the scenes.
  ///
  ///     switch chosenNumber {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 577)
  ///     case 0..<10:
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 579)
  ///         print("\(chosenNumber) is a single digit.")
  ///     case Int.min..<0:
  ///         print("\(chosenNumber) is negative.")
  ///     default:
  ///         print("\(chosenNumber) is positive.")
  ///     }
  ///     // Prints "3 is a single digit."
  ///
  /// - Parameters:
  ///   - lhs: A range.
  ///   - rhs: A value to match against `lhs`.
  public static func ~= (pattern: CountableRange<Bound>, value: Bound) -> Bool {
    return pattern.contains(value)
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 389)
extension ClosedRange
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 391)
  where
  Bound : _Strideable, Bound.Stride : SignedInteger
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 394)
{
  /// Creates an instance equivalent to the given range.
  ///
  /// An equivalent range must be representable as an instance of `ClosedRange`.
  /// For example, passing an empty range as `other` triggers a runtime error,
  /// because an empty range cannot be represented by a `ClosedRange` instance.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 396)
  ///
  /// - Parameter other: A range to convert to a `ClosedRange` instance.
  @inline(__always)
  public init(_ other: Range<Bound>) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 404)
    _precondition(!other.isEmpty, "Can't form an empty closed range")
    let upperBound = other.upperBound.advanced(by: -1)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 409)
    self.init(
      uncheckedBounds: (lower: other.lowerBound, upper: upperBound)
    )
  }
}

extension ClosedRange
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 420)
{
  /// Returns a Boolean value indicating whether this range and the given range
  /// contain an element in common.
  ///
  /// This example shows two overlapping ranges:
  ///
  ///     let x: ClosedRange = 0...20
  ///     print(x.overlaps(10..<1000 as Range))
  ///     // Prints "true"
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 431)
  /// Because a closed range includes its upper bound, the ranges in the
  /// following example also overlap:
  ///
  ///     let y: Range = 20...30
  ///     print(x.overlaps(y))
  ///     // Prints "true"
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 445)
  ///
  /// - Parameter other: A range to check for elements in common.
  /// - Returns: `true` if this range and `other` have at least one element in
  ///   common; otherwise, `false`.
  @inline(__always)
  public func overlaps(_ other: Range<Bound>) -> Bool {
    return (!other.isEmpty && self.contains(other.lowerBound))
        || (!self.isEmpty && other.contains(lowerBound))
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 389)
extension ClosedRange
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 391)
  where
  Bound : _Strideable, Bound.Stride : SignedInteger
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 394)
{
  /// Creates an instance equivalent to the given range.
  ///
  /// An equivalent range must be representable as an instance of `ClosedRange`.
  /// For example, passing an empty range as `other` triggers a runtime error,
  /// because an empty range cannot be represented by a `ClosedRange` instance.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 396)
  ///
  /// - Parameter other: A range to convert to a `ClosedRange` instance.
  @inline(__always)
  public init(_ other: CountableRange<Bound>) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 404)
    _precondition(!other.isEmpty, "Can't form an empty closed range")
    let upperBound = other.upperBound.advanced(by: -1)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 409)
    self.init(
      uncheckedBounds: (lower: other.lowerBound, upper: upperBound)
    )
  }
}

extension ClosedRange
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 417)
  where
  Bound : _Strideable, Bound.Stride : SignedInteger
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 420)
{
  /// Returns a Boolean value indicating whether this range and the given range
  /// contain an element in common.
  ///
  /// This example shows two overlapping ranges:
  ///
  ///     let x: ClosedRange = 0...20
  ///     print(x.overlaps(10..<1000 as CountableRange))
  ///     // Prints "true"
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 431)
  /// Because a closed range includes its upper bound, the ranges in the
  /// following example also overlap:
  ///
  ///     let y: CountableRange = 20...30
  ///     print(x.overlaps(y))
  ///     // Prints "true"
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 445)
  ///
  /// - Parameter other: A range to check for elements in common.
  /// - Returns: `true` if this range and `other` have at least one element in
  ///   common; otherwise, `false`.
  @inline(__always)
  public func overlaps(_ other: CountableRange<Bound>) -> Bool {
    return (!other.isEmpty && self.contains(other.lowerBound))
        || (!self.isEmpty && other.contains(lowerBound))
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 389)
extension ClosedRange
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 391)
  where
  Bound : _Strideable, Bound.Stride : SignedInteger
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 394)
{
  /// Creates an instance equivalent to the given range.

  ///
  /// - Parameter other: A range to convert to a `ClosedRange` instance.
  @inline(__always)
  public init(_ other: ClosedRange<Bound>) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 407)
    let upperBound = other.upperBound
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 409)
    self.init(
      uncheckedBounds: (lower: other.lowerBound, upper: upperBound)
    )
  }
}

extension ClosedRange
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 420)
{
  /// Returns a Boolean value indicating whether this range and the given range
  /// contain an element in common.
  ///
  /// This example shows two overlapping ranges:
  ///
  ///     let x: ClosedRange = 0...20
  ///     print(x.overlaps(10...1000 as ClosedRange))
  ///     // Prints "true"
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 431)
  /// Because a closed range includes its upper bound, the ranges in the
  /// following example also overlap:
  ///
  ///     let y: ClosedRange = 20...30
  ///     print(x.overlaps(y))
  ///     // Prints "true"
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 445)
  ///
  /// - Parameter other: A range to check for elements in common.
  /// - Returns: `true` if this range and `other` have at least one element in
  ///   common; otherwise, `false`.
  @inline(__always)
  public func overlaps(_ other: ClosedRange<Bound>) -> Bool {
    return (!other.isEmpty && self.contains(other.lowerBound))
        || (!self.isEmpty && other.contains(lowerBound))
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 389)
extension ClosedRange
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 391)
  where
  Bound : _Strideable, Bound.Stride : SignedInteger
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 394)
{
  /// Creates an instance equivalent to the given range.

  ///
  /// - Parameter other: A range to convert to a `ClosedRange` instance.
  @inline(__always)
  public init(_ other: CountableClosedRange<Bound>) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 407)
    let upperBound = other.upperBound
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 409)
    self.init(
      uncheckedBounds: (lower: other.lowerBound, upper: upperBound)
    )
  }
}

extension ClosedRange
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 417)
  where
  Bound : _Strideable, Bound.Stride : SignedInteger
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 420)
{
  /// Returns a Boolean value indicating whether this range and the given range
  /// contain an element in common.
  ///
  /// This example shows two overlapping ranges:
  ///
  ///     let x: ClosedRange = 0...20
  ///     print(x.overlaps(10...1000 as CountableClosedRange))
  ///     // Prints "true"
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 431)
  /// Because a closed range includes its upper bound, the ranges in the
  /// following example also overlap:
  ///
  ///     let y: CountableClosedRange = 20...30
  ///     print(x.overlaps(y))
  ///     // Prints "true"
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 445)
  ///
  /// - Parameter other: A range to check for elements in common.
  /// - Returns: `true` if this range and `other` have at least one element in
  ///   common; otherwise, `false`.
  @inline(__always)
  public func overlaps(_ other: CountableClosedRange<Bound>) -> Bool {
    return (!other.isEmpty && self.contains(other.lowerBound))
        || (!self.isEmpty && other.contains(lowerBound))
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 456)

extension ClosedRange {
  /// Returns a copy of this range clamped to the given limiting range.
  ///
  /// The bounds of the result are always limited to the bounds of `limits`.
  /// For example:
  ///
  ///     let x: ClosedRange = 0...20
  ///     print(x.clamped(to: 10...1000))
  ///     // Prints "10...20"
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 468)
  /// If the two ranges do not overlap, the result is a single-element range at
  /// the upper or lower bound of `limits`.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 474)
  ///
  ///     let y: ClosedRange = 0...5
  ///     print(y.clamped(to: 10...1000))
  ///     // Prints "10...10"
  ///
  /// - Parameter limits: The range to clamp the bounds of this range.
  /// - Returns: A new range clamped to the bounds of `limits`.
  @inline(__always)
  public func clamped(to limits: ClosedRange) -> ClosedRange {
    return ClosedRange(
      uncheckedBounds: (
        lower:
        limits.lowerBound > self.lowerBound ? limits.lowerBound
          : limits.upperBound < self.lowerBound ? limits.upperBound
          : self.lowerBound,
        upper:
          limits.upperBound < self.upperBound ? limits.upperBound
          : limits.lowerBound > self.upperBound ? limits.lowerBound
          : self.upperBound
      )
    )
  }
}

extension ClosedRange : CustomStringConvertible {
  /// A textual representation of the range.
  public var description: String {
    return "\(lowerBound)...\(upperBound)"
  }
}

extension ClosedRange : CustomDebugStringConvertible {
  /// A textual representation of the range, suitable for debugging.
  public var debugDescription: String {
    return "ClosedRange(\(String(reflecting: lowerBound))"
    + "...\(String(reflecting: upperBound)))"
  }
}

extension ClosedRange : CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(
      self, children: ["lowerBound": lowerBound, "upperBound": upperBound])
  }
}

extension ClosedRange : Equatable {
  /// Returns a Boolean value indicating whether two ranges are equal.
  ///
  /// Two ranges are equal when they have the same lower and upper bounds.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 525)
  ///
  ///     let x: ClosedRange = 5...15
  ///     print(x == 5...15)
  ///     // Prints "true"
  ///     print(x == 10...20)
  ///     // Prints "false"
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 542)
  ///
  /// - Parameters:
  ///   - lhs: A range to compare.
  ///   - rhs: Another range to compare.
  public static func == (lhs: ClosedRange<Bound>, rhs: ClosedRange<Bound>) -> Bool {
    return
      lhs.lowerBound == rhs.lowerBound &&
      lhs.upperBound == rhs.upperBound
  }

  /// Returns a Boolean value indicating whether a value is included in a
  /// range.
  ///
  /// You can use this pattern matching operator (`~=`) to test whether a value
  /// is included in a range. The following example uses the `~=` operator to
  /// test whether an integer is included in a range of single-digit numbers.
  ///
  ///     let chosenNumber = 3
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 561)
  ///     if 0...9 ~= chosenNumber {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 565)
  ///         print("\(chosenNumber) is a single digit.")
  ///     }
  ///     // Prints "3 is a single digit."
  ///
  /// The `~=` operator is used internally in `case` statements for pattern
  /// matching. When you match against a range in a `case` statement, this
  /// operator is called behind the scenes.
  ///
  ///     switch chosenNumber {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 575)
  ///     case 0...9:
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 579)
  ///         print("\(chosenNumber) is a single digit.")
  ///     case Int.min..<0:
  ///         print("\(chosenNumber) is negative.")
  ///     default:
  ///         print("\(chosenNumber) is positive.")
  ///     }
  ///     // Prints "3 is a single digit."
  ///
  /// - Parameters:
  ///   - lhs: A range.
  ///   - rhs: A value to match against `lhs`.
  public static func ~= (pattern: ClosedRange<Bound>, value: Bound) -> Bool {
    return pattern.contains(value)
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 389)
extension CountableClosedRange
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 391)
  where
  Bound : _Strideable, Bound.Stride : SignedInteger
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 394)
{
  /// Creates an instance equivalent to the given range.
  ///
  /// An equivalent range must be representable as an instance of `CountableClosedRange`.
  /// For example, passing an empty range as `other` triggers a runtime error,
  /// because an empty range cannot be represented by a `CountableClosedRange` instance.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 396)
  ///
  /// - Parameter other: A range to convert to a `CountableClosedRange` instance.
  @inline(__always)
  public init(_ other: Range<Bound>) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 404)
    _precondition(!other.isEmpty, "Can't form an empty closed range")
    let upperBound = other.upperBound.advanced(by: -1)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 409)
    self.init(
      uncheckedBounds: (lower: other.lowerBound, upper: upperBound)
    )
  }
}

extension CountableClosedRange
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 417)
  where
  Bound : _Strideable, Bound.Stride : SignedInteger
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 420)
{
  /// Returns a Boolean value indicating whether this range and the given range
  /// contain an element in common.
  ///
  /// This example shows two overlapping ranges:
  ///
  ///     let x: CountableClosedRange = 0...20
  ///     print(x.overlaps(10..<1000 as Range))
  ///     // Prints "true"
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 431)
  /// Because a closed range includes its upper bound, the ranges in the
  /// following example also overlap:
  ///
  ///     let y: Range = 20...30
  ///     print(x.overlaps(y))
  ///     // Prints "true"
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 445)
  ///
  /// - Parameter other: A range to check for elements in common.
  /// - Returns: `true` if this range and `other` have at least one element in
  ///   common; otherwise, `false`.
  @inline(__always)
  public func overlaps(_ other: Range<Bound>) -> Bool {
    return (!other.isEmpty && self.contains(other.lowerBound))
        || (!self.isEmpty && other.contains(lowerBound))
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 389)
extension CountableClosedRange
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 391)
  where
  Bound : _Strideable, Bound.Stride : SignedInteger
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 394)
{
  /// Creates an instance equivalent to the given range.
  ///
  /// An equivalent range must be representable as an instance of `CountableClosedRange`.
  /// For example, passing an empty range as `other` triggers a runtime error,
  /// because an empty range cannot be represented by a `CountableClosedRange` instance.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 396)
  ///
  /// - Parameter other: A range to convert to a `CountableClosedRange` instance.
  @inline(__always)
  public init(_ other: CountableRange<Bound>) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 404)
    _precondition(!other.isEmpty, "Can't form an empty closed range")
    let upperBound = other.upperBound.advanced(by: -1)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 409)
    self.init(
      uncheckedBounds: (lower: other.lowerBound, upper: upperBound)
    )
  }
}

extension CountableClosedRange
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 417)
  where
  Bound : _Strideable, Bound.Stride : SignedInteger
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 420)
{
  /// Returns a Boolean value indicating whether this range and the given range
  /// contain an element in common.
  ///
  /// This example shows two overlapping ranges:
  ///
  ///     let x: CountableClosedRange = 0...20
  ///     print(x.overlaps(10..<1000 as CountableRange))
  ///     // Prints "true"
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 431)
  /// Because a closed range includes its upper bound, the ranges in the
  /// following example also overlap:
  ///
  ///     let y: CountableRange = 20...30
  ///     print(x.overlaps(y))
  ///     // Prints "true"
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 445)
  ///
  /// - Parameter other: A range to check for elements in common.
  /// - Returns: `true` if this range and `other` have at least one element in
  ///   common; otherwise, `false`.
  @inline(__always)
  public func overlaps(_ other: CountableRange<Bound>) -> Bool {
    return (!other.isEmpty && self.contains(other.lowerBound))
        || (!self.isEmpty && other.contains(lowerBound))
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 389)
extension CountableClosedRange
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 391)
  where
  Bound : _Strideable, Bound.Stride : SignedInteger
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 394)
{
  /// Creates an instance equivalent to the given range.

  ///
  /// - Parameter other: A range to convert to a `CountableClosedRange` instance.
  @inline(__always)
  public init(_ other: ClosedRange<Bound>) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 407)
    let upperBound = other.upperBound
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 409)
    self.init(
      uncheckedBounds: (lower: other.lowerBound, upper: upperBound)
    )
  }
}

extension CountableClosedRange
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 417)
  where
  Bound : _Strideable, Bound.Stride : SignedInteger
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 420)
{
  /// Returns a Boolean value indicating whether this range and the given range
  /// contain an element in common.
  ///
  /// This example shows two overlapping ranges:
  ///
  ///     let x: CountableClosedRange = 0...20
  ///     print(x.overlaps(10...1000 as ClosedRange))
  ///     // Prints "true"
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 431)
  /// Because a closed range includes its upper bound, the ranges in the
  /// following example also overlap:
  ///
  ///     let y: ClosedRange = 20...30
  ///     print(x.overlaps(y))
  ///     // Prints "true"
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 445)
  ///
  /// - Parameter other: A range to check for elements in common.
  /// - Returns: `true` if this range and `other` have at least one element in
  ///   common; otherwise, `false`.
  @inline(__always)
  public func overlaps(_ other: ClosedRange<Bound>) -> Bool {
    return (!other.isEmpty && self.contains(other.lowerBound))
        || (!self.isEmpty && other.contains(lowerBound))
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 389)
extension CountableClosedRange
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 391)
  where
  Bound : _Strideable, Bound.Stride : SignedInteger
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 394)
{
  /// Creates an instance equivalent to the given range.

  ///
  /// - Parameter other: A range to convert to a `CountableClosedRange` instance.
  @inline(__always)
  public init(_ other: CountableClosedRange<Bound>) {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 407)
    let upperBound = other.upperBound
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 409)
    self.init(
      uncheckedBounds: (lower: other.lowerBound, upper: upperBound)
    )
  }
}

extension CountableClosedRange
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 417)
  where
  Bound : _Strideable, Bound.Stride : SignedInteger
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 420)
{
  /// Returns a Boolean value indicating whether this range and the given range
  /// contain an element in common.
  ///
  /// This example shows two overlapping ranges:
  ///
  ///     let x: CountableClosedRange = 0...20
  ///     print(x.overlaps(10...1000 as CountableClosedRange))
  ///     // Prints "true"
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 431)
  /// Because a closed range includes its upper bound, the ranges in the
  /// following example also overlap:
  ///
  ///     let y: CountableClosedRange = 20...30
  ///     print(x.overlaps(y))
  ///     // Prints "true"
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 445)
  ///
  /// - Parameter other: A range to check for elements in common.
  /// - Returns: `true` if this range and `other` have at least one element in
  ///   common; otherwise, `false`.
  @inline(__always)
  public func overlaps(_ other: CountableClosedRange<Bound>) -> Bool {
    return (!other.isEmpty && self.contains(other.lowerBound))
        || (!self.isEmpty && other.contains(lowerBound))
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 456)

extension CountableClosedRange {
  /// Returns a copy of this range clamped to the given limiting range.
  ///
  /// The bounds of the result are always limited to the bounds of `limits`.
  /// For example:
  ///
  ///     let x: CountableClosedRange = 0...20
  ///     print(x.clamped(to: 10...1000))
  ///     // Prints "10...20"
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 468)
  /// If the two ranges do not overlap, the result is a single-element range at
  /// the upper or lower bound of `limits`.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 474)
  ///
  ///     let y: CountableClosedRange = 0...5
  ///     print(y.clamped(to: 10...1000))
  ///     // Prints "10...10"
  ///
  /// - Parameter limits: The range to clamp the bounds of this range.
  /// - Returns: A new range clamped to the bounds of `limits`.
  @inline(__always)
  public func clamped(to limits: CountableClosedRange) -> CountableClosedRange {
    return CountableClosedRange(
      uncheckedBounds: (
        lower:
        limits.lowerBound > self.lowerBound ? limits.lowerBound
          : limits.upperBound < self.lowerBound ? limits.upperBound
          : self.lowerBound,
        upper:
          limits.upperBound < self.upperBound ? limits.upperBound
          : limits.lowerBound > self.upperBound ? limits.lowerBound
          : self.upperBound
      )
    )
  }
}

extension CountableClosedRange : CustomStringConvertible {
  /// A textual representation of the range.
  public var description: String {
    return "\(lowerBound)...\(upperBound)"
  }
}

extension CountableClosedRange : CustomDebugStringConvertible {
  /// A textual representation of the range, suitable for debugging.
  public var debugDescription: String {
    return "CountableClosedRange(\(String(reflecting: lowerBound))"
    + "...\(String(reflecting: upperBound)))"
  }
}

extension CountableClosedRange : CustomReflectable {
  public var customMirror: Mirror {
    return Mirror(
      self, children: ["lowerBound": lowerBound, "upperBound": upperBound])
  }
}

extension CountableClosedRange : Equatable {
  /// Returns a Boolean value indicating whether two ranges are equal.
  ///
  /// Two ranges are equal when they have the same lower and upper bounds.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 525)
  ///
  ///     let x: CountableClosedRange = 5...15
  ///     print(x == 5...15)
  ///     // Prints "true"
  ///     print(x == 10...20)
  ///     // Prints "false"
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 542)
  ///
  /// - Parameters:
  ///   - lhs: A range to compare.
  ///   - rhs: Another range to compare.
  public static func == (lhs: CountableClosedRange<Bound>, rhs: CountableClosedRange<Bound>) -> Bool {
    return
      lhs.lowerBound == rhs.lowerBound &&
      lhs.upperBound == rhs.upperBound
  }

  /// Returns a Boolean value indicating whether a value is included in a
  /// range.
  ///
  /// You can use this pattern matching operator (`~=`) to test whether a value
  /// is included in a range. The following example uses the `~=` operator to
  /// test whether an integer is included in a range of single-digit numbers.
  ///
  ///     let chosenNumber = 3
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 561)
  ///     if 0...9 ~= chosenNumber {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 565)
  ///         print("\(chosenNumber) is a single digit.")
  ///     }
  ///     // Prints "3 is a single digit."
  ///
  /// The `~=` operator is used internally in `case` statements for pattern
  /// matching. When you match against a range in a `case` statement, this
  /// operator is called behind the scenes.
  ///
  ///     switch chosenNumber {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 575)
  ///     case 0...9:
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 579)
  ///         print("\(chosenNumber) is a single digit.")
  ///     case Int.min..<0:
  ///         print("\(chosenNumber) is negative.")
  ///     default:
  ///         print("\(chosenNumber) is positive.")
  ///     }
  ///     // Prints "3 is a single digit."
  ///
  /// - Parameters:
  ///   - lhs: A range.
  ///   - rhs: A value to match against `lhs`.
  public static func ~= (pattern: CountableClosedRange<Bound>, value: Bound) -> Bool {
    return pattern.contains(value)
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 595)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 600)
// FIXME(ABI)#57 (Conditional Conformance): replace this extension with a conditional
// conformance.
// rdar://problem/17144340
/// Ranges whose `Bound` is `Strideable` with `Integer` `Stride` have all
/// the capabilities of `RandomAccessCollection`s, just like
/// `CountableRange` and `CountableClosedRange`.
///
/// Unfortunately, we can't forward the full collection API, so we are
/// forwarding a few select APIs.
extension Range where Bound : _Strideable, Bound.Stride : SignedInteger {
  // FIXME(ABI)#176 (Type checker)
  // WORKAROUND rdar://25214598 - should be Bound : Strideable

  /// The number of values contained in the range.
  public var count: Bound.Stride {
    let distance = lowerBound.distance(to: upperBound)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 619)
    return distance
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 621)
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 600)
// FIXME(ABI)#57 (Conditional Conformance): replace this extension with a conditional
// conformance.
// rdar://problem/17144340
/// Ranges whose `Bound` is `Strideable` with `Integer` `Stride` have all
/// the capabilities of `RandomAccessCollection`s, just like
/// `CountableRange` and `CountableClosedRange`.
///
/// Unfortunately, we can't forward the full collection API, so we are
/// forwarding a few select APIs.
extension ClosedRange where Bound : _Strideable, Bound.Stride : SignedInteger {
  // FIXME(ABI)#176 (Type checker)
  // WORKAROUND rdar://25214598 - should be Bound : Strideable

  /// The number of values contained in the range.
  public var count: Bound.Stride {
    let distance = lowerBound.distance(to: upperBound)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 617)
    return distance + 1
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 621)
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Range.swift.gyb", line: 624)

/// Returns a half-open range that contains its lower bound but not its upper
/// bound.
///
/// Use the half-open range operator (`..<`) to create a range of any type that
/// conforms to the `Comparable` protocol. This example creates a
/// `Range<Double>` from zero up to, but not including, 5.0.
///
///     let lessThanFive = 0.0..<5.0
///     print(lessThanFive.contains(3.14))  // Prints "true"
///     print(lessThanFive.contains(5.0))   // Prints "false"
///
/// - Parameters:
///   - minimum: The lower bound for the range.
///   - maximum: The upper bound for the range.
@_transparent
public func ..< <Bound : Comparable>(minimum: Bound, maximum: Bound)
  -> Range<Bound> {
  _precondition(minimum <= maximum,
    "Can't form Range with upperBound < lowerBound")
  return Range(uncheckedBounds: (lower: minimum, upper: maximum))
}

/// Returns a countable half-open range that contains its lower bound but not
/// its upper bound.
///
/// Use the half-open range operator (`..<`) to create a range of any type that
/// conforms to the `Strideable` protocol with an associated integer `Stride`
/// type, such as any of the standard library's integer types. This example
/// creates a `CountableRange<Int>` from zero up to, but not including, 5.
///
///     let upToFive = 0..<5
///     print(upToFive.contains(3))         // Prints "true"
///     print(upToFive.contains(5))         // Prints "false"
///
/// You can use sequence or collection methods on the `upToFive` countable
/// range.
///
///     print(upToFive.count)               // Prints "5"
///     print(upToFive.last)                // Prints "4"
///
/// - Parameters:
///   - minimum: The lower bound for the range.
///   - maximum: The upper bound for the range.
@_transparent
public func ..< <Bound>(
  minimum: Bound, maximum: Bound
) -> CountableRange<Bound>
  where
  // WORKAROUND rdar://25214598 - should be just Bound : Strideable
  Bound : _Strideable & Comparable,
  Bound.Stride : Integer {

  // FIXME: swift-3-indexing-model: tests for traps.
  _precondition(minimum <= maximum,
    "Can't form Range with upperBound < lowerBound")
  return CountableRange(uncheckedBounds: (lower: minimum, upper: maximum))
}

// swift-3-indexing-model: this is not really a proper rename
@available(*, unavailable, renamed: "IndexingIterator")
public struct RangeGenerator<Bound> {}

extension Range {
  @available(*, unavailable, renamed: "lowerBound")
  public var startIndex: Bound {
    Builtin.unreachable()
  }

  @available(*, unavailable, renamed: "upperBound")
  public var endIndex: Bound {
    Builtin.unreachable()
  }
}

extension ClosedRange {
  @available(*, unavailable, message: "Call clamped(to:) and swap the argument and the receiver.  For example, x.clamp(y) becomes y.clamped(to: x) in Swift 3.")
  public func clamp(
    _ intervalToClamp: ClosedRange<Bound>
  ) -> ClosedRange<Bound> {
    Builtin.unreachable()
  }
}

extension CountableClosedRange {
  @available(*, unavailable, message: "Call clamped(to:) and swap the argument and the receiver.  For example, x.clamp(y) becomes y.clamped(to: x) in Swift 3.")
  public func clamp(
    _ intervalToClamp: CountableClosedRange<Bound>
  ) -> CountableClosedRange<Bound> {
    Builtin.unreachable()
  }
}

@available(*, unavailable, message: "IntervalType has been removed in Swift 3. Use ranges instead.")
public typealias IntervalType = Void

@available(*, unavailable, renamed: "Range")
public struct HalfOpenInterval<Bound> {}

@available(*, unavailable, renamed: "ClosedRange")
public struct ClosedInterval<Bound> {}
