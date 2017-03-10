// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 1)
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

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 88)

// FIXME(ABI)#66 (Conditional Conformance): There should be just one slice type
// that has conditional conformances to `BidirectionalCollection`,
// `RandomAccessCollection`, `RangeReplaceableCollection`, and
// `MutableCollection`.
// rdar://problem/21935030

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 106)

/// A view into a subsequence of elements of another collection.
///
/// A slice stores a base collection and the start and end indices of the view.
/// It does not copy the elements from the collection into separate storage.
/// Thus, creating a slice has O(1) complexity.
///
/// Slices Share Indices
/// --------------------
///
/// Indices of a slice can be used interchangeably with indices of the base
/// collection. An element of a slice is located under the same index in the
/// slice and in the base collection, as long as neither the collection nor
/// the slice has been mutated since the slice was created.
///
/// For example, suppose you have an array holding the number of absences from
/// each class during a session.
///
///     var absences = [0, 2, 0, 4, 0, 3, 1, 0]
///
/// You're tasked with finding the day with the most absences in the second
/// half of the session. To find the index of the day in question, follow
/// these setps:
///
/// 1) Create a slice of the `absences` array that holds the second half of the
///    days.
/// 2) Use the `max(by:)` method to determine the index of the day
///    with the most absences.
/// 3) Print the result using the index found in step 2 on the original
///    `absences` array.
///
/// Here's an implementation of those steps:
///
///     let secondHalf = absences.suffix(absences.count / 2)
///     if let i = secondHalf.indices.max(by: { secondHalf[$0] < secondHalf[$1] }) {
///         print("Highest second-half absences: \(absences[i])")
///     }
///     // Prints "Highest second-half absences: 3"
///
/// Slices Inherit Semantics
/// ------------------------
///
/// A slice inherits the value or reference semantics of its base collection.
/// That is, if a `Slice` instance is wrapped around a mutable
/// collection that has value semantics, such as an array, mutating the
/// original collection would trigger a copy of that collection, and not
/// affect the base collection stored inside of the slice.
///
/// For example, if you update the last element of the `absences` array from
/// `0` to `2`, the `secondHalf` slice is unchanged.
///
///     absences[7] = 2
///     print(absences)
///     // Prints "[0, 2, 0, 4, 0, 3, 1, 2]"
///     print(secondHalf)
///     // Prints "[0, 3, 1, 0]"
///
/// - Important: Use slices only for transient computation.
///   A slice may hold a reference to the entire storage of a larger
///   collection, not just to the portion it presents, even after the base
///   collection's lifetime ends. Long-term storage of a slice may therefore
///   prolong the lifetime of elements that are no longer otherwise
///   accessible, which can erroneously appear to be memory leakage.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 107)
public struct Slice<Base : _Indexable>
  : Collection {

  public typealias Index = Base.Index
  public typealias IndexDistance = Base.IndexDistance

  public var _startIndex: Index
  public var _endIndex: Index

  public var startIndex: Index {
    return _startIndex
  }

  public var endIndex: Index {
    return _endIndex
  }

  public subscript(index: Index) -> Base._Element {
    get {
      _failEarlyRangeCheck(index, bounds: startIndex..<endIndex)
      return _base[index]
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 148)
  }

  public typealias SubSequence = Slice<Base>

  public subscript(bounds: Range<Index>) -> Slice<Base> {
    get {
      _failEarlyRangeCheck(bounds, bounds: startIndex..<endIndex)
      return Slice(base: _base, bounds: bounds)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 162)
  }

  // FIXME(ABI)#67 (Associated Types with where clauses):
  //
  //   public typealias Indices = Base.Indices
  //   public var indices: Indices { ... }
  //
  // We can't do it right now because we don't have enough
  // constraints on the Base.Indices type in this context.

  public func index(after i: Index) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(after: i)
  }

  public func formIndex(after i: inout Index) {
    // FIXME: swift-3-indexing-model: range check.
    _base.formIndex(after: &i)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 193)

  public func index(_ i: Index, offsetBy n: IndexDistance) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(i, offsetBy: n)
  }

  public func index(
    _ i: Index, offsetBy n: IndexDistance, limitedBy limit: Index
  ) -> Index? {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(i, offsetBy: n, limitedBy: limit)
  }

  public func distance(from start: Index, to end: Index) -> IndexDistance {
    // FIXME: swift-3-indexing-model: range check.
    return _base.distance(from: start, to: end)
  }

  public func _failEarlyRangeCheck(_ index: Index, bounds: Range<Index>) {
    _base._failEarlyRangeCheck(index, bounds: bounds)
  }

  public func _failEarlyRangeCheck(_ range: Range<Index>, bounds: Range<Index>) {
    _base._failEarlyRangeCheck(range, bounds: bounds)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 412)

  /// Creates a view into the given collection that allows access to elements
  /// within the specified range.
  ///
  /// It is unusual to need to call this method directly. Instead, create a
  /// slice of a collection by using the collection's range-based subscript or
  /// by using methods that return a subsequence.
  ///
  ///     let singleDigits = 0...9
  ///     let subSequence = singleDigits.dropFirst(5)
  ///     print(Array(subSequence))
  ///     // Prints "[5, 6, 7, 8, 9]"
  ///
  /// In this example, the expression `singleDigits.dropFirst(5))` is
  /// equivalent to calling this initializer with `singleDigits` and a
  /// range covering the last five items of `singleDigits.indices`.
  ///
  /// - Parameters:
  ///   - base: The collection to create a view into.
  ///   - bounds: The range of indices to allow access to in the new slice.
  public init(base: Base, bounds: Range<Index>) {
    self._base = base
    self._startIndex = bounds.lowerBound
    self._endIndex = bounds.upperBound
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 441)
  internal let _base: Base
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 443)

  /// The underlying collection of the slice.
  ///
  /// You can use a slice's `base` property to access its base collection. The
  /// following example declares `singleDigits`, a range of single digit
  /// integers, and then drops the first element to create a slice of that
  /// range, `singleNonZeroDigits`. The `base` property of the slice is equal
  /// to `singleDigits`.
  ///
  ///     let singleDigits = 0..<10
  ///     let singleNonZeroDigits = singleDigits.dropFirst()
  ///     // singleNonZeroDigits is a RandomAccessSlice<CountableRange<Int>>
  ///
  ///     print(singleNonZeroDigits.count)
  ///     // Prints "9"
  ///     prints(singleNonZeroDigits.base.count)
  ///     // Prints "10"
  ///     print(singleDigits == singleNonZeroDigits.base)
  ///     // Prints "true"
  public var base: Base {
    return _base
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 106)

/// A view into a subsequence of elements of another collection.
///
/// A slice stores a base collection and the start and end indices of the view.
/// It does not copy the elements from the collection into separate storage.
/// Thus, creating a slice has O(1) complexity.
///
/// Slices Share Indices
/// --------------------
///
/// Indices of a slice can be used interchangeably with indices of the base
/// collection. An element of a slice is located under the same index in the
/// slice and in the base collection, as long as neither the collection nor
/// the slice has been mutated since the slice was created.
///
/// For example, suppose you have an array holding the number of absences from
/// each class during a session.
///
///     var absences = [0, 2, 0, 4, 0, 3, 1, 0]
///
/// You're tasked with finding the day with the most absences in the second
/// half of the session. To find the index of the day in question, follow
/// these setps:
///
/// 1) Create a slice of the `absences` array that holds the second half of the
///    days.
/// 2) Use the `max(by:)` method to determine the index of the day
///    with the most absences.
/// 3) Print the result using the index found in step 2 on the original
///    `absences` array.
///
/// Here's an implementation of those steps:
///
///     let secondHalf = absences.suffix(absences.count / 2)
///     if let i = secondHalf.indices.max(by: { secondHalf[$0] < secondHalf[$1] }) {
///         print("Highest second-half absences: \(absences[i])")
///     }
///     // Prints "Highest second-half absences: 3"
///
/// Slices Inherit Semantics
/// ------------------------
///
/// A slice inherits the value or reference semantics of its base collection.
/// That is, if a `RangeReplaceableSlice` instance is wrapped around a mutable
/// collection that has value semantics, such as an array, mutating the
/// original collection would trigger a copy of that collection, and not
/// affect the base collection stored inside of the slice.
///
/// For example, if you update the last element of the `absences` array from
/// `0` to `2`, the `secondHalf` slice is unchanged.
///
///     absences[7] = 2
///     print(absences)
///     // Prints "[0, 2, 0, 4, 0, 3, 1, 2]"
///     print(secondHalf)
///     // Prints "[0, 3, 1, 0]"
///
/// - Important: Use slices only for transient computation.
///   A slice may hold a reference to the entire storage of a larger
///   collection, not just to the portion it presents, even after the base
///   collection's lifetime ends. Long-term storage of a slice may therefore
///   prolong the lifetime of elements that are no longer otherwise
///   accessible, which can erroneously appear to be memory leakage.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 107)
public struct RangeReplaceableSlice<Base : _Indexable & _RangeReplaceableIndexable>
  : Collection, RangeReplaceableCollection {

  public typealias Index = Base.Index
  public typealias IndexDistance = Base.IndexDistance

  public var _startIndex: Index
  public var _endIndex: Index

  public var startIndex: Index {
    return _startIndex
  }

  public var endIndex: Index {
    return _endIndex
  }

  public subscript(index: Index) -> Base._Element {
    get {
      _failEarlyRangeCheck(index, bounds: startIndex..<endIndex)
      return _base[index]
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 148)
  }

  public typealias SubSequence = RangeReplaceableSlice<Base>

  public subscript(bounds: Range<Index>) -> RangeReplaceableSlice<Base> {
    get {
      _failEarlyRangeCheck(bounds, bounds: startIndex..<endIndex)
      return RangeReplaceableSlice(base: _base, bounds: bounds)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 162)
  }

  // FIXME(ABI)#67 (Associated Types with where clauses):
  //
  //   public typealias Indices = Base.Indices
  //   public var indices: Indices { ... }
  //
  // We can't do it right now because we don't have enough
  // constraints on the Base.Indices type in this context.

  public func index(after i: Index) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(after: i)
  }

  public func formIndex(after i: inout Index) {
    // FIXME: swift-3-indexing-model: range check.
    _base.formIndex(after: &i)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 193)

  public func index(_ i: Index, offsetBy n: IndexDistance) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(i, offsetBy: n)
  }

  public func index(
    _ i: Index, offsetBy n: IndexDistance, limitedBy limit: Index
  ) -> Index? {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(i, offsetBy: n, limitedBy: limit)
  }

  public func distance(from start: Index, to end: Index) -> IndexDistance {
    // FIXME: swift-3-indexing-model: range check.
    return _base.distance(from: start, to: end)
  }

  public func _failEarlyRangeCheck(_ index: Index, bounds: Range<Index>) {
    _base._failEarlyRangeCheck(index, bounds: bounds)
  }

  public func _failEarlyRangeCheck(_ range: Range<Index>, bounds: Range<Index>) {
    _base._failEarlyRangeCheck(range, bounds: bounds)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 220)
  public init() {
    self._base = Base()
    self._startIndex = _base.startIndex
    self._endIndex = _base.endIndex
  }

  public init(repeating repeatedValue: Base._Element, count: Int) {
    self._base = Base(repeating: repeatedValue, count: count)
    self._startIndex = _base.startIndex
    self._endIndex = _base.endIndex
  }

  public init<S>(_ elements: S)
    where
    S : Sequence,
    S.Iterator.Element == Base._Element {

    self._base = Base(elements)
    self._startIndex = _base.startIndex
    self._endIndex = _base.endIndex
  }

  public mutating func replaceSubrange<C>(
    _ subRange: Range<Index>, with newElements: C
  ) where
    C : Collection,
    C.Iterator.Element == Base._Element {

    // FIXME: swift-3-indexing-model: range check.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 250)
    let sliceOffset: IndexDistance =
      _base.distance(from: _base.startIndex, to: _startIndex)
    let newSliceCount: IndexDistance =
      _base.distance(from: _startIndex, to: subRange.lowerBound)
      + _base.distance(from: subRange.upperBound, to: _endIndex)
      + (numericCast(newElements.count) as IndexDistance)
    _base.replaceSubrange(subRange, with: newElements)
    _startIndex = _base.index(_base.startIndex, offsetBy: sliceOffset)
    _endIndex = _base.index(_startIndex, offsetBy: newSliceCount)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 281)
  }

  public mutating func insert(_ newElement: Base._Element, at i: Index) {
    // FIXME: swift-3-indexing-model: range check.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 286)
    let sliceOffset: IndexDistance =
      _base.distance(from: _base.startIndex, to: _startIndex)
    let newSliceCount: IndexDistance = count + 1
    _base.insert(newElement, at: i)
    _startIndex = _base.index(_base.startIndex, offsetBy: sliceOffset)
    _endIndex = _base.index(_startIndex, offsetBy: newSliceCount)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 309)
  }

  public mutating func insert<S>(contentsOf newElements: S, at i: Index)
    where
    S : Collection,
    S.Iterator.Element == Base._Element {

    // FIXME: swift-3-indexing-model: range check.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 318)
    let sliceOffset: IndexDistance =
      _base.distance(from: _base.startIndex, to: _startIndex)
    let newSliceCount: IndexDistance =
      count + (numericCast(newElements.count) as IndexDistance)
    _base.insert(contentsOf: newElements, at: i)
    _startIndex = _base.index(_base.startIndex, offsetBy: sliceOffset)
    _endIndex = _base.index(_startIndex, offsetBy: newSliceCount)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 345)
  }

  public mutating func remove(at i: Index) -> Base._Element {
    // FIXME: swift-3-indexing-model: range check.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 350)
    let sliceOffset: IndexDistance =
      _base.distance(from: _base.startIndex, to: _startIndex)
    let newSliceCount: IndexDistance = count - 1
    let result = _base.remove(at: i)
    _startIndex = _base.index(_base.startIndex, offsetBy: sliceOffset)
    _endIndex = _base.index(_startIndex, offsetBy: newSliceCount)
    return result
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 376)
  }

  public mutating func removeSubrange(_ bounds: Range<Index>) {
    // FIXME: swift-3-indexing-model: range check.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 381)
    let sliceOffset: IndexDistance =
      _base.distance(from: _base.startIndex, to: _startIndex)
    let newSliceCount: IndexDistance =
      count - distance(from: bounds.lowerBound, to: bounds.upperBound)
    _base.removeSubrange(bounds)
    _startIndex = _base.index(_base.startIndex, offsetBy: sliceOffset)
    _endIndex = _base.index(_startIndex, offsetBy: newSliceCount)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 410)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 412)

  /// Creates a view into the given collection that allows access to elements
  /// within the specified range.
  ///
  /// It is unusual to need to call this method directly. Instead, create a
  /// slice of a collection by using the collection's range-based subscript or
  /// by using methods that return a subsequence.
  ///
  ///     let singleDigits = 0...9
  ///     let subSequence = singleDigits.dropFirst(5)
  ///     print(Array(subSequence))
  ///     // Prints "[5, 6, 7, 8, 9]"
  ///
  /// In this example, the expression `singleDigits.dropFirst(5))` is
  /// equivalent to calling this initializer with `singleDigits` and a
  /// range covering the last five items of `singleDigits.indices`.
  ///
  /// - Parameters:
  ///   - base: The collection to create a view into.
  ///   - bounds: The range of indices to allow access to in the new slice.
  public init(base: Base, bounds: Range<Index>) {
    self._base = base
    self._startIndex = bounds.lowerBound
    self._endIndex = bounds.upperBound
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 439)
  internal var _base: Base
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 443)

  /// The underlying collection of the slice.
  ///
  /// You can use a slice's `base` property to access its base collection. The
  /// following example declares `singleDigits`, a range of single digit
  /// integers, and then drops the first element to create a slice of that
  /// range, `singleNonZeroDigits`. The `base` property of the slice is equal
  /// to `singleDigits`.
  ///
  ///     let singleDigits = 0..<10
  ///     let singleNonZeroDigits = singleDigits.dropFirst()
  ///     // singleNonZeroDigits is a RandomAccessSlice<CountableRange<Int>>
  ///
  ///     print(singleNonZeroDigits.count)
  ///     // Prints "9"
  ///     prints(singleNonZeroDigits.base.count)
  ///     // Prints "10"
  ///     print(singleDigits == singleNonZeroDigits.base)
  ///     // Prints "true"
  public var base: Base {
    return _base
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 106)

/// A view into a subsequence of elements of another collection.
///
/// A slice stores a base collection and the start and end indices of the view.
/// It does not copy the elements from the collection into separate storage.
/// Thus, creating a slice has O(1) complexity.
///
/// Slices Share Indices
/// --------------------
///
/// Indices of a slice can be used interchangeably with indices of the base
/// collection. An element of a slice is located under the same index in the
/// slice and in the base collection, as long as neither the collection nor
/// the slice has been mutated since the slice was created.
///
/// For example, suppose you have an array holding the number of absences from
/// each class during a session.
///
///     var absences = [0, 2, 0, 4, 0, 3, 1, 0]
///
/// You're tasked with finding the day with the most absences in the second
/// half of the session. To find the index of the day in question, follow
/// these setps:
///
/// 1) Create a slice of the `absences` array that holds the second half of the
///    days.
/// 2) Use the `max(by:)` method to determine the index of the day
///    with the most absences.
/// 3) Print the result using the index found in step 2 on the original
///    `absences` array.
///
/// Here's an implementation of those steps:
///
///     let secondHalf = absences.suffix(absences.count / 2)
///     if let i = secondHalf.indices.max(by: { secondHalf[$0] < secondHalf[$1] }) {
///         print("Highest second-half absences: \(absences[i])")
///     }
///     // Prints "Highest second-half absences: 3"
///
/// Slices Inherit Semantics
/// ------------------------
///
/// A slice inherits the value or reference semantics of its base collection.
/// That is, if a `MutableSlice` instance is wrapped around a mutable
/// collection that has value semantics, such as an array, mutating the
/// original collection would trigger a copy of that collection, and not
/// affect the base collection stored inside of the slice.
///
/// For example, if you update the last element of the `absences` array from
/// `0` to `2`, the `secondHalf` slice is unchanged.
///
///     absences[7] = 2
///     print(absences)
///     // Prints "[0, 2, 0, 4, 0, 3, 1, 2]"
///     print(secondHalf)
///     // Prints "[0, 3, 1, 0]"
///
/// - Important: Use slices only for transient computation.
///   A slice may hold a reference to the entire storage of a larger
///   collection, not just to the portion it presents, even after the base
///   collection's lifetime ends. Long-term storage of a slice may therefore
///   prolong the lifetime of elements that are no longer otherwise
///   accessible, which can erroneously appear to be memory leakage.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 107)
///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 109)
/// - Note: `MutableSlice` requires that the base collection's `subscript(_: Index)`
///   setter does not invalidate indices. If you are writing a collection and
///   mutations need to invalidate indices, don't use `MutableSlice` as its
///   subsequence type. Instead, use the nonmutable `Slice` or define your own
///   subsequence type that takes your index invalidation requirements into
///   account.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 117)
public struct MutableSlice<Base : _Indexable & _MutableIndexable>
  : Collection, MutableCollection {

  public typealias Index = Base.Index
  public typealias IndexDistance = Base.IndexDistance

  public var _startIndex: Index
  public var _endIndex: Index

  public var startIndex: Index {
    return _startIndex
  }

  public var endIndex: Index {
    return _endIndex
  }

  public subscript(index: Index) -> Base._Element {
    get {
      _failEarlyRangeCheck(index, bounds: startIndex..<endIndex)
      return _base[index]
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 140)
    set {
      _failEarlyRangeCheck(index, bounds: startIndex..<endIndex)
      _base[index] = newValue
      // MutableSlice requires that the underlying collection's subscript
      // setter does not invalidate indices, so our `startIndex` and `endIndex`
      // continue to be valid.
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 148)
  }

  public typealias SubSequence = MutableSlice<Base>

  public subscript(bounds: Range<Index>) -> MutableSlice<Base> {
    get {
      _failEarlyRangeCheck(bounds, bounds: startIndex..<endIndex)
      return MutableSlice(base: _base, bounds: bounds)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 158)
    set {
      _writeBackMutableSlice(&self, bounds: bounds, slice: newValue)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 162)
  }

  // FIXME(ABI)#67 (Associated Types with where clauses):
  //
  //   public typealias Indices = Base.Indices
  //   public var indices: Indices { ... }
  //
  // We can't do it right now because we don't have enough
  // constraints on the Base.Indices type in this context.

  public func index(after i: Index) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(after: i)
  }

  public func formIndex(after i: inout Index) {
    // FIXME: swift-3-indexing-model: range check.
    _base.formIndex(after: &i)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 193)

  public func index(_ i: Index, offsetBy n: IndexDistance) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(i, offsetBy: n)
  }

  public func index(
    _ i: Index, offsetBy n: IndexDistance, limitedBy limit: Index
  ) -> Index? {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(i, offsetBy: n, limitedBy: limit)
  }

  public func distance(from start: Index, to end: Index) -> IndexDistance {
    // FIXME: swift-3-indexing-model: range check.
    return _base.distance(from: start, to: end)
  }

  public func _failEarlyRangeCheck(_ index: Index, bounds: Range<Index>) {
    _base._failEarlyRangeCheck(index, bounds: bounds)
  }

  public func _failEarlyRangeCheck(_ range: Range<Index>, bounds: Range<Index>) {
    _base._failEarlyRangeCheck(range, bounds: bounds)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 412)

  /// Creates a view into the given collection that allows access to elements
  /// within the specified range.
  ///
  /// It is unusual to need to call this method directly. Instead, create a
  /// slice of a collection by using the collection's range-based subscript or
  /// by using methods that return a subsequence.
  ///
  ///     let singleDigits = 0...9
  ///     let subSequence = singleDigits.dropFirst(5)
  ///     print(Array(subSequence))
  ///     // Prints "[5, 6, 7, 8, 9]"
  ///
  /// In this example, the expression `singleDigits.dropFirst(5))` is
  /// equivalent to calling this initializer with `singleDigits` and a
  /// range covering the last five items of `singleDigits.indices`.
  ///
  /// - Parameters:
  ///   - base: The collection to create a view into.
  ///   - bounds: The range of indices to allow access to in the new slice.
  public init(base: Base, bounds: Range<Index>) {
    self._base = base
    self._startIndex = bounds.lowerBound
    self._endIndex = bounds.upperBound
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 439)
  internal var _base: Base
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 443)

  /// The underlying collection of the slice.
  ///
  /// You can use a slice's `base` property to access its base collection. The
  /// following example declares `singleDigits`, a range of single digit
  /// integers, and then drops the first element to create a slice of that
  /// range, `singleNonZeroDigits`. The `base` property of the slice is equal
  /// to `singleDigits`.
  ///
  ///     let singleDigits = 0..<10
  ///     let singleNonZeroDigits = singleDigits.dropFirst()
  ///     // singleNonZeroDigits is a RandomAccessSlice<CountableRange<Int>>
  ///
  ///     print(singleNonZeroDigits.count)
  ///     // Prints "9"
  ///     prints(singleNonZeroDigits.base.count)
  ///     // Prints "10"
  ///     print(singleDigits == singleNonZeroDigits.base)
  ///     // Prints "true"
  public var base: Base {
    return _base
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 106)

/// A view into a subsequence of elements of another collection.
///
/// A slice stores a base collection and the start and end indices of the view.
/// It does not copy the elements from the collection into separate storage.
/// Thus, creating a slice has O(1) complexity.
///
/// Slices Share Indices
/// --------------------
///
/// Indices of a slice can be used interchangeably with indices of the base
/// collection. An element of a slice is located under the same index in the
/// slice and in the base collection, as long as neither the collection nor
/// the slice has been mutated since the slice was created.
///
/// For example, suppose you have an array holding the number of absences from
/// each class during a session.
///
///     var absences = [0, 2, 0, 4, 0, 3, 1, 0]
///
/// You're tasked with finding the day with the most absences in the second
/// half of the session. To find the index of the day in question, follow
/// these setps:
///
/// 1) Create a slice of the `absences` array that holds the second half of the
///    days.
/// 2) Use the `max(by:)` method to determine the index of the day
///    with the most absences.
/// 3) Print the result using the index found in step 2 on the original
///    `absences` array.
///
/// Here's an implementation of those steps:
///
///     let secondHalf = absences.suffix(absences.count / 2)
///     if let i = secondHalf.indices.max(by: { secondHalf[$0] < secondHalf[$1] }) {
///         print("Highest second-half absences: \(absences[i])")
///     }
///     // Prints "Highest second-half absences: 3"
///
/// Slices Inherit Semantics
/// ------------------------
///
/// A slice inherits the value or reference semantics of its base collection.
/// That is, if a `MutableRangeReplaceableSlice` instance is wrapped around a mutable
/// collection that has value semantics, such as an array, mutating the
/// original collection would trigger a copy of that collection, and not
/// affect the base collection stored inside of the slice.
///
/// For example, if you update the last element of the `absences` array from
/// `0` to `2`, the `secondHalf` slice is unchanged.
///
///     absences[7] = 2
///     print(absences)
///     // Prints "[0, 2, 0, 4, 0, 3, 1, 2]"
///     print(secondHalf)
///     // Prints "[0, 3, 1, 0]"
///
/// - Important: Use slices only for transient computation.
///   A slice may hold a reference to the entire storage of a larger
///   collection, not just to the portion it presents, even after the base
///   collection's lifetime ends. Long-term storage of a slice may therefore
///   prolong the lifetime of elements that are no longer otherwise
///   accessible, which can erroneously appear to be memory leakage.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 107)
///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 109)
/// - Note: `MutableRangeReplaceableSlice` requires that the base collection's `subscript(_: Index)`
///   setter does not invalidate indices. If you are writing a collection and
///   mutations need to invalidate indices, don't use `MutableRangeReplaceableSlice` as its
///   subsequence type. Instead, use the nonmutable `Slice` or define your own
///   subsequence type that takes your index invalidation requirements into
///   account.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 117)
public struct MutableRangeReplaceableSlice<Base : _Indexable & _MutableIndexable & _RangeReplaceableIndexable>
  : Collection, MutableCollection, RangeReplaceableCollection {

  public typealias Index = Base.Index
  public typealias IndexDistance = Base.IndexDistance

  public var _startIndex: Index
  public var _endIndex: Index

  public var startIndex: Index {
    return _startIndex
  }

  public var endIndex: Index {
    return _endIndex
  }

  public subscript(index: Index) -> Base._Element {
    get {
      _failEarlyRangeCheck(index, bounds: startIndex..<endIndex)
      return _base[index]
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 140)
    set {
      _failEarlyRangeCheck(index, bounds: startIndex..<endIndex)
      _base[index] = newValue
      // MutableSlice requires that the underlying collection's subscript
      // setter does not invalidate indices, so our `startIndex` and `endIndex`
      // continue to be valid.
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 148)
  }

  public typealias SubSequence = MutableRangeReplaceableSlice<Base>

  public subscript(bounds: Range<Index>) -> MutableRangeReplaceableSlice<Base> {
    get {
      _failEarlyRangeCheck(bounds, bounds: startIndex..<endIndex)
      return MutableRangeReplaceableSlice(base: _base, bounds: bounds)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 158)
    set {
      _writeBackMutableSlice(&self, bounds: bounds, slice: newValue)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 162)
  }

  // FIXME(ABI)#67 (Associated Types with where clauses):
  //
  //   public typealias Indices = Base.Indices
  //   public var indices: Indices { ... }
  //
  // We can't do it right now because we don't have enough
  // constraints on the Base.Indices type in this context.

  public func index(after i: Index) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(after: i)
  }

  public func formIndex(after i: inout Index) {
    // FIXME: swift-3-indexing-model: range check.
    _base.formIndex(after: &i)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 193)

  public func index(_ i: Index, offsetBy n: IndexDistance) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(i, offsetBy: n)
  }

  public func index(
    _ i: Index, offsetBy n: IndexDistance, limitedBy limit: Index
  ) -> Index? {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(i, offsetBy: n, limitedBy: limit)
  }

  public func distance(from start: Index, to end: Index) -> IndexDistance {
    // FIXME: swift-3-indexing-model: range check.
    return _base.distance(from: start, to: end)
  }

  public func _failEarlyRangeCheck(_ index: Index, bounds: Range<Index>) {
    _base._failEarlyRangeCheck(index, bounds: bounds)
  }

  public func _failEarlyRangeCheck(_ range: Range<Index>, bounds: Range<Index>) {
    _base._failEarlyRangeCheck(range, bounds: bounds)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 220)
  public init() {
    self._base = Base()
    self._startIndex = _base.startIndex
    self._endIndex = _base.endIndex
  }

  public init(repeating repeatedValue: Base._Element, count: Int) {
    self._base = Base(repeating: repeatedValue, count: count)
    self._startIndex = _base.startIndex
    self._endIndex = _base.endIndex
  }

  public init<S>(_ elements: S)
    where
    S : Sequence,
    S.Iterator.Element == Base._Element {

    self._base = Base(elements)
    self._startIndex = _base.startIndex
    self._endIndex = _base.endIndex
  }

  public mutating func replaceSubrange<C>(
    _ subRange: Range<Index>, with newElements: C
  ) where
    C : Collection,
    C.Iterator.Element == Base._Element {

    // FIXME: swift-3-indexing-model: range check.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 250)
    let sliceOffset: IndexDistance =
      _base.distance(from: _base.startIndex, to: _startIndex)
    let newSliceCount: IndexDistance =
      _base.distance(from: _startIndex, to: subRange.lowerBound)
      + _base.distance(from: subRange.upperBound, to: _endIndex)
      + (numericCast(newElements.count) as IndexDistance)
    _base.replaceSubrange(subRange, with: newElements)
    _startIndex = _base.index(_base.startIndex, offsetBy: sliceOffset)
    _endIndex = _base.index(_startIndex, offsetBy: newSliceCount)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 281)
  }

  public mutating func insert(_ newElement: Base._Element, at i: Index) {
    // FIXME: swift-3-indexing-model: range check.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 286)
    let sliceOffset: IndexDistance =
      _base.distance(from: _base.startIndex, to: _startIndex)
    let newSliceCount: IndexDistance = count + 1
    _base.insert(newElement, at: i)
    _startIndex = _base.index(_base.startIndex, offsetBy: sliceOffset)
    _endIndex = _base.index(_startIndex, offsetBy: newSliceCount)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 309)
  }

  public mutating func insert<S>(contentsOf newElements: S, at i: Index)
    where
    S : Collection,
    S.Iterator.Element == Base._Element {

    // FIXME: swift-3-indexing-model: range check.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 318)
    let sliceOffset: IndexDistance =
      _base.distance(from: _base.startIndex, to: _startIndex)
    let newSliceCount: IndexDistance =
      count + (numericCast(newElements.count) as IndexDistance)
    _base.insert(contentsOf: newElements, at: i)
    _startIndex = _base.index(_base.startIndex, offsetBy: sliceOffset)
    _endIndex = _base.index(_startIndex, offsetBy: newSliceCount)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 345)
  }

  public mutating func remove(at i: Index) -> Base._Element {
    // FIXME: swift-3-indexing-model: range check.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 350)
    let sliceOffset: IndexDistance =
      _base.distance(from: _base.startIndex, to: _startIndex)
    let newSliceCount: IndexDistance = count - 1
    let result = _base.remove(at: i)
    _startIndex = _base.index(_base.startIndex, offsetBy: sliceOffset)
    _endIndex = _base.index(_startIndex, offsetBy: newSliceCount)
    return result
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 376)
  }

  public mutating func removeSubrange(_ bounds: Range<Index>) {
    // FIXME: swift-3-indexing-model: range check.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 381)
    let sliceOffset: IndexDistance =
      _base.distance(from: _base.startIndex, to: _startIndex)
    let newSliceCount: IndexDistance =
      count - distance(from: bounds.lowerBound, to: bounds.upperBound)
    _base.removeSubrange(bounds)
    _startIndex = _base.index(_base.startIndex, offsetBy: sliceOffset)
    _endIndex = _base.index(_startIndex, offsetBy: newSliceCount)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 410)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 412)

  /// Creates a view into the given collection that allows access to elements
  /// within the specified range.
  ///
  /// It is unusual to need to call this method directly. Instead, create a
  /// slice of a collection by using the collection's range-based subscript or
  /// by using methods that return a subsequence.
  ///
  ///     let singleDigits = 0...9
  ///     let subSequence = singleDigits.dropFirst(5)
  ///     print(Array(subSequence))
  ///     // Prints "[5, 6, 7, 8, 9]"
  ///
  /// In this example, the expression `singleDigits.dropFirst(5))` is
  /// equivalent to calling this initializer with `singleDigits` and a
  /// range covering the last five items of `singleDigits.indices`.
  ///
  /// - Parameters:
  ///   - base: The collection to create a view into.
  ///   - bounds: The range of indices to allow access to in the new slice.
  public init(base: Base, bounds: Range<Index>) {
    self._base = base
    self._startIndex = bounds.lowerBound
    self._endIndex = bounds.upperBound
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 439)
  internal var _base: Base
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 443)

  /// The underlying collection of the slice.
  ///
  /// You can use a slice's `base` property to access its base collection. The
  /// following example declares `singleDigits`, a range of single digit
  /// integers, and then drops the first element to create a slice of that
  /// range, `singleNonZeroDigits`. The `base` property of the slice is equal
  /// to `singleDigits`.
  ///
  ///     let singleDigits = 0..<10
  ///     let singleNonZeroDigits = singleDigits.dropFirst()
  ///     // singleNonZeroDigits is a RandomAccessSlice<CountableRange<Int>>
  ///
  ///     print(singleNonZeroDigits.count)
  ///     // Prints "9"
  ///     prints(singleNonZeroDigits.base.count)
  ///     // Prints "10"
  ///     print(singleDigits == singleNonZeroDigits.base)
  ///     // Prints "true"
  public var base: Base {
    return _base
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 106)

/// A view into a subsequence of elements of another collection.
///
/// A slice stores a base collection and the start and end indices of the view.
/// It does not copy the elements from the collection into separate storage.
/// Thus, creating a slice has O(1) complexity.
///
/// Slices Share Indices
/// --------------------
///
/// Indices of a slice can be used interchangeably with indices of the base
/// collection. An element of a slice is located under the same index in the
/// slice and in the base collection, as long as neither the collection nor
/// the slice has been mutated since the slice was created.
///
/// For example, suppose you have an array holding the number of absences from
/// each class during a session.
///
///     var absences = [0, 2, 0, 4, 0, 3, 1, 0]
///
/// You're tasked with finding the day with the most absences in the second
/// half of the session. To find the index of the day in question, follow
/// these setps:
///
/// 1) Create a slice of the `absences` array that holds the second half of the
///    days.
/// 2) Use the `max(by:)` method to determine the index of the day
///    with the most absences.
/// 3) Print the result using the index found in step 2 on the original
///    `absences` array.
///
/// Here's an implementation of those steps:
///
///     let secondHalf = absences.suffix(absences.count / 2)
///     if let i = secondHalf.indices.max(by: { secondHalf[$0] < secondHalf[$1] }) {
///         print("Highest second-half absences: \(absences[i])")
///     }
///     // Prints "Highest second-half absences: 3"
///
/// Slices Inherit Semantics
/// ------------------------
///
/// A slice inherits the value or reference semantics of its base collection.
/// That is, if a `BidirectionalSlice` instance is wrapped around a mutable
/// collection that has value semantics, such as an array, mutating the
/// original collection would trigger a copy of that collection, and not
/// affect the base collection stored inside of the slice.
///
/// For example, if you update the last element of the `absences` array from
/// `0` to `2`, the `secondHalf` slice is unchanged.
///
///     absences[7] = 2
///     print(absences)
///     // Prints "[0, 2, 0, 4, 0, 3, 1, 2]"
///     print(secondHalf)
///     // Prints "[0, 3, 1, 0]"
///
/// - Important: Use slices only for transient computation.
///   A slice may hold a reference to the entire storage of a larger
///   collection, not just to the portion it presents, even after the base
///   collection's lifetime ends. Long-term storage of a slice may therefore
///   prolong the lifetime of elements that are no longer otherwise
///   accessible, which can erroneously appear to be memory leakage.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 107)
public struct BidirectionalSlice<Base : _BidirectionalIndexable>
  : BidirectionalCollection {

  public typealias Index = Base.Index
  public typealias IndexDistance = Base.IndexDistance

  public var _startIndex: Index
  public var _endIndex: Index

  public var startIndex: Index {
    return _startIndex
  }

  public var endIndex: Index {
    return _endIndex
  }

  public subscript(index: Index) -> Base._Element {
    get {
      _failEarlyRangeCheck(index, bounds: startIndex..<endIndex)
      return _base[index]
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 148)
  }

  public typealias SubSequence = BidirectionalSlice<Base>

  public subscript(bounds: Range<Index>) -> BidirectionalSlice<Base> {
    get {
      _failEarlyRangeCheck(bounds, bounds: startIndex..<endIndex)
      return BidirectionalSlice(base: _base, bounds: bounds)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 162)
  }

  // FIXME(ABI)#67 (Associated Types with where clauses):
  //
  //   public typealias Indices = Base.Indices
  //   public var indices: Indices { ... }
  //
  // We can't do it right now because we don't have enough
  // constraints on the Base.Indices type in this context.

  public func index(after i: Index) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(after: i)
  }

  public func formIndex(after i: inout Index) {
    // FIXME: swift-3-indexing-model: range check.
    _base.formIndex(after: &i)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 183)
  public func index(before i: Index) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(before: i)
  }

  public func formIndex(before i: inout Index) {
    // FIXME: swift-3-indexing-model: range check.
    _base.formIndex(before: &i)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 193)

  public func index(_ i: Index, offsetBy n: IndexDistance) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(i, offsetBy: n)
  }

  public func index(
    _ i: Index, offsetBy n: IndexDistance, limitedBy limit: Index
  ) -> Index? {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(i, offsetBy: n, limitedBy: limit)
  }

  public func distance(from start: Index, to end: Index) -> IndexDistance {
    // FIXME: swift-3-indexing-model: range check.
    return _base.distance(from: start, to: end)
  }

  public func _failEarlyRangeCheck(_ index: Index, bounds: Range<Index>) {
    _base._failEarlyRangeCheck(index, bounds: bounds)
  }

  public func _failEarlyRangeCheck(_ range: Range<Index>, bounds: Range<Index>) {
    _base._failEarlyRangeCheck(range, bounds: bounds)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 412)

  /// Creates a view into the given collection that allows access to elements
  /// within the specified range.
  ///
  /// It is unusual to need to call this method directly. Instead, create a
  /// slice of a collection by using the collection's range-based subscript or
  /// by using methods that return a subsequence.
  ///
  ///     let singleDigits = 0...9
  ///     let subSequence = singleDigits.dropFirst(5)
  ///     print(Array(subSequence))
  ///     // Prints "[5, 6, 7, 8, 9]"
  ///
  /// In this example, the expression `singleDigits.dropFirst(5))` is
  /// equivalent to calling this initializer with `singleDigits` and a
  /// range covering the last five items of `singleDigits.indices`.
  ///
  /// - Parameters:
  ///   - base: The collection to create a view into.
  ///   - bounds: The range of indices to allow access to in the new slice.
  public init(base: Base, bounds: Range<Index>) {
    self._base = base
    self._startIndex = bounds.lowerBound
    self._endIndex = bounds.upperBound
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 441)
  internal let _base: Base
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 443)

  /// The underlying collection of the slice.
  ///
  /// You can use a slice's `base` property to access its base collection. The
  /// following example declares `singleDigits`, a range of single digit
  /// integers, and then drops the first element to create a slice of that
  /// range, `singleNonZeroDigits`. The `base` property of the slice is equal
  /// to `singleDigits`.
  ///
  ///     let singleDigits = 0..<10
  ///     let singleNonZeroDigits = singleDigits.dropFirst()
  ///     // singleNonZeroDigits is a RandomAccessSlice<CountableRange<Int>>
  ///
  ///     print(singleNonZeroDigits.count)
  ///     // Prints "9"
  ///     prints(singleNonZeroDigits.base.count)
  ///     // Prints "10"
  ///     print(singleDigits == singleNonZeroDigits.base)
  ///     // Prints "true"
  public var base: Base {
    return _base
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 106)

/// A view into a subsequence of elements of another collection.
///
/// A slice stores a base collection and the start and end indices of the view.
/// It does not copy the elements from the collection into separate storage.
/// Thus, creating a slice has O(1) complexity.
///
/// Slices Share Indices
/// --------------------
///
/// Indices of a slice can be used interchangeably with indices of the base
/// collection. An element of a slice is located under the same index in the
/// slice and in the base collection, as long as neither the collection nor
/// the slice has been mutated since the slice was created.
///
/// For example, suppose you have an array holding the number of absences from
/// each class during a session.
///
///     var absences = [0, 2, 0, 4, 0, 3, 1, 0]
///
/// You're tasked with finding the day with the most absences in the second
/// half of the session. To find the index of the day in question, follow
/// these setps:
///
/// 1) Create a slice of the `absences` array that holds the second half of the
///    days.
/// 2) Use the `max(by:)` method to determine the index of the day
///    with the most absences.
/// 3) Print the result using the index found in step 2 on the original
///    `absences` array.
///
/// Here's an implementation of those steps:
///
///     let secondHalf = absences.suffix(absences.count / 2)
///     if let i = secondHalf.indices.max(by: { secondHalf[$0] < secondHalf[$1] }) {
///         print("Highest second-half absences: \(absences[i])")
///     }
///     // Prints "Highest second-half absences: 3"
///
/// Slices Inherit Semantics
/// ------------------------
///
/// A slice inherits the value or reference semantics of its base collection.
/// That is, if a `RangeReplaceableBidirectionalSlice` instance is wrapped around a mutable
/// collection that has value semantics, such as an array, mutating the
/// original collection would trigger a copy of that collection, and not
/// affect the base collection stored inside of the slice.
///
/// For example, if you update the last element of the `absences` array from
/// `0` to `2`, the `secondHalf` slice is unchanged.
///
///     absences[7] = 2
///     print(absences)
///     // Prints "[0, 2, 0, 4, 0, 3, 1, 2]"
///     print(secondHalf)
///     // Prints "[0, 3, 1, 0]"
///
/// - Important: Use slices only for transient computation.
///   A slice may hold a reference to the entire storage of a larger
///   collection, not just to the portion it presents, even after the base
///   collection's lifetime ends. Long-term storage of a slice may therefore
///   prolong the lifetime of elements that are no longer otherwise
///   accessible, which can erroneously appear to be memory leakage.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 107)
public struct RangeReplaceableBidirectionalSlice<Base : _BidirectionalIndexable & _RangeReplaceableIndexable>
  : BidirectionalCollection, RangeReplaceableCollection {

  public typealias Index = Base.Index
  public typealias IndexDistance = Base.IndexDistance

  public var _startIndex: Index
  public var _endIndex: Index

  public var startIndex: Index {
    return _startIndex
  }

  public var endIndex: Index {
    return _endIndex
  }

  public subscript(index: Index) -> Base._Element {
    get {
      _failEarlyRangeCheck(index, bounds: startIndex..<endIndex)
      return _base[index]
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 148)
  }

  public typealias SubSequence = RangeReplaceableBidirectionalSlice<Base>

  public subscript(bounds: Range<Index>) -> RangeReplaceableBidirectionalSlice<Base> {
    get {
      _failEarlyRangeCheck(bounds, bounds: startIndex..<endIndex)
      return RangeReplaceableBidirectionalSlice(base: _base, bounds: bounds)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 162)
  }

  // FIXME(ABI)#67 (Associated Types with where clauses):
  //
  //   public typealias Indices = Base.Indices
  //   public var indices: Indices { ... }
  //
  // We can't do it right now because we don't have enough
  // constraints on the Base.Indices type in this context.

  public func index(after i: Index) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(after: i)
  }

  public func formIndex(after i: inout Index) {
    // FIXME: swift-3-indexing-model: range check.
    _base.formIndex(after: &i)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 183)
  public func index(before i: Index) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(before: i)
  }

  public func formIndex(before i: inout Index) {
    // FIXME: swift-3-indexing-model: range check.
    _base.formIndex(before: &i)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 193)

  public func index(_ i: Index, offsetBy n: IndexDistance) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(i, offsetBy: n)
  }

  public func index(
    _ i: Index, offsetBy n: IndexDistance, limitedBy limit: Index
  ) -> Index? {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(i, offsetBy: n, limitedBy: limit)
  }

  public func distance(from start: Index, to end: Index) -> IndexDistance {
    // FIXME: swift-3-indexing-model: range check.
    return _base.distance(from: start, to: end)
  }

  public func _failEarlyRangeCheck(_ index: Index, bounds: Range<Index>) {
    _base._failEarlyRangeCheck(index, bounds: bounds)
  }

  public func _failEarlyRangeCheck(_ range: Range<Index>, bounds: Range<Index>) {
    _base._failEarlyRangeCheck(range, bounds: bounds)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 220)
  public init() {
    self._base = Base()
    self._startIndex = _base.startIndex
    self._endIndex = _base.endIndex
  }

  public init(repeating repeatedValue: Base._Element, count: Int) {
    self._base = Base(repeating: repeatedValue, count: count)
    self._startIndex = _base.startIndex
    self._endIndex = _base.endIndex
  }

  public init<S>(_ elements: S)
    where
    S : Sequence,
    S.Iterator.Element == Base._Element {

    self._base = Base(elements)
    self._startIndex = _base.startIndex
    self._endIndex = _base.endIndex
  }

  public mutating func replaceSubrange<C>(
    _ subRange: Range<Index>, with newElements: C
  ) where
    C : Collection,
    C.Iterator.Element == Base._Element {

    // FIXME: swift-3-indexing-model: range check.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 260)
    if subRange.lowerBound == _base.startIndex {
      let newSliceCount: IndexDistance =
        _base.distance(from: _startIndex, to: subRange.lowerBound)
        + _base.distance(from: subRange.upperBound, to: _endIndex)
        + (numericCast(newElements.count) as IndexDistance)
      _base.replaceSubrange(subRange, with: newElements)
      _startIndex = _base.startIndex
      _endIndex = _base.index(_startIndex, offsetBy: newSliceCount)
    } else {
      let shouldUpdateStartIndex = subRange.lowerBound == _startIndex
      let lastValidIndex = _base.index(before: subRange.lowerBound)
      let newEndIndexOffset =
        _base.distance(from: subRange.upperBound, to: _endIndex)
        + (numericCast(newElements.count) as IndexDistance) + 1
      _base.replaceSubrange(subRange, with: newElements)
      if shouldUpdateStartIndex {
        _startIndex = _base.index(after: lastValidIndex)
      }
      _endIndex = _base.index(lastValidIndex, offsetBy: newEndIndexOffset)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 281)
  }

  public mutating func insert(_ newElement: Base._Element, at i: Index) {
    // FIXME: swift-3-indexing-model: range check.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 293)
    if i == _base.startIndex {
      let newSliceCount: IndexDistance = count + 1
      _base.insert(newElement, at: i)
      _startIndex = _base.startIndex
      _endIndex = _base.index(_startIndex, offsetBy: newSliceCount)
    } else {
      let shouldUpdateStartIndex = i == _startIndex
      let lastValidIndex = _base.index(before: i)
      let newEndIndexOffset = _base.distance(from: i, to: _endIndex) + 2
      _base.insert(newElement, at: i)
      if shouldUpdateStartIndex {
        _startIndex = _base.index(after: lastValidIndex)
      }
      _endIndex = _base.index(lastValidIndex, offsetBy: newEndIndexOffset)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 309)
  }

  public mutating func insert<S>(contentsOf newElements: S, at i: Index)
    where
    S : Collection,
    S.Iterator.Element == Base._Element {

    // FIXME: swift-3-indexing-model: range check.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 326)
    if i == _base.startIndex {
      let newSliceCount: IndexDistance =
        count + (numericCast(newElements.count) as IndexDistance)
      _base.insert(contentsOf: newElements, at: i)
      _startIndex = _base.startIndex
      _endIndex = _base.index(_startIndex, offsetBy: newSliceCount)
    } else {
      let shouldUpdateStartIndex = i == _startIndex
      let lastValidIndex = _base.index(before: i)
      let newEndIndexOffset =
        _base.distance(from: i, to: _endIndex)
        + (numericCast(newElements.count) as IndexDistance) + 1
      _base.insert(contentsOf: newElements, at: i)
      if shouldUpdateStartIndex {
        _startIndex = _base.index(after: lastValidIndex)
      }
      _endIndex = _base.index(lastValidIndex, offsetBy: newEndIndexOffset)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 345)
  }

  public mutating func remove(at i: Index) -> Base._Element {
    // FIXME: swift-3-indexing-model: range check.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 358)
    if i == _base.startIndex {
      let newSliceCount: IndexDistance = count - 1
      let result = _base.remove(at: i)
      _startIndex = _base.startIndex
      _endIndex = _base.index(_startIndex, offsetBy: newSliceCount)
      return result
    } else {
      let shouldUpdateStartIndex = i == _startIndex
      let lastValidIndex = _base.index(before: i)
      let newEndIndexOffset = _base.distance(from: i, to: _endIndex)
      let result = _base.remove(at: i)
      if shouldUpdateStartIndex {
        _startIndex = _base.index(after: lastValidIndex)
      }
      _endIndex = _base.index(lastValidIndex, offsetBy: newEndIndexOffset)
      return result
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 376)
  }

  public mutating func removeSubrange(_ bounds: Range<Index>) {
    // FIXME: swift-3-indexing-model: range check.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 389)
    if bounds.lowerBound == _base.startIndex {
      let newSliceCount: IndexDistance =
        count
        - _base.distance(from: bounds.lowerBound, to: bounds.upperBound)
      _base.removeSubrange(bounds)
      _startIndex = _base.startIndex
      _endIndex = _base.index(_startIndex, offsetBy: newSliceCount)
    } else {
      let shouldUpdateStartIndex = bounds.lowerBound == _startIndex
      let lastValidIndex = _base.index(before: bounds.lowerBound)
      let newEndIndexOffset =
        _base.distance(from: bounds.lowerBound, to: _endIndex)
        - _base.distance(from: bounds.lowerBound, to: bounds.upperBound)
        + 1
      _base.removeSubrange(bounds)
      if shouldUpdateStartIndex {
        _startIndex = _base.index(after: lastValidIndex)
      }
      _endIndex = _base.index(lastValidIndex, offsetBy: newEndIndexOffset)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 410)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 412)

  /// Creates a view into the given collection that allows access to elements
  /// within the specified range.
  ///
  /// It is unusual to need to call this method directly. Instead, create a
  /// slice of a collection by using the collection's range-based subscript or
  /// by using methods that return a subsequence.
  ///
  ///     let singleDigits = 0...9
  ///     let subSequence = singleDigits.dropFirst(5)
  ///     print(Array(subSequence))
  ///     // Prints "[5, 6, 7, 8, 9]"
  ///
  /// In this example, the expression `singleDigits.dropFirst(5))` is
  /// equivalent to calling this initializer with `singleDigits` and a
  /// range covering the last five items of `singleDigits.indices`.
  ///
  /// - Parameters:
  ///   - base: The collection to create a view into.
  ///   - bounds: The range of indices to allow access to in the new slice.
  public init(base: Base, bounds: Range<Index>) {
    self._base = base
    self._startIndex = bounds.lowerBound
    self._endIndex = bounds.upperBound
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 439)
  internal var _base: Base
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 443)

  /// The underlying collection of the slice.
  ///
  /// You can use a slice's `base` property to access its base collection. The
  /// following example declares `singleDigits`, a range of single digit
  /// integers, and then drops the first element to create a slice of that
  /// range, `singleNonZeroDigits`. The `base` property of the slice is equal
  /// to `singleDigits`.
  ///
  ///     let singleDigits = 0..<10
  ///     let singleNonZeroDigits = singleDigits.dropFirst()
  ///     // singleNonZeroDigits is a RandomAccessSlice<CountableRange<Int>>
  ///
  ///     print(singleNonZeroDigits.count)
  ///     // Prints "9"
  ///     prints(singleNonZeroDigits.base.count)
  ///     // Prints "10"
  ///     print(singleDigits == singleNonZeroDigits.base)
  ///     // Prints "true"
  public var base: Base {
    return _base
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 106)

/// A view into a subsequence of elements of another collection.
///
/// A slice stores a base collection and the start and end indices of the view.
/// It does not copy the elements from the collection into separate storage.
/// Thus, creating a slice has O(1) complexity.
///
/// Slices Share Indices
/// --------------------
///
/// Indices of a slice can be used interchangeably with indices of the base
/// collection. An element of a slice is located under the same index in the
/// slice and in the base collection, as long as neither the collection nor
/// the slice has been mutated since the slice was created.
///
/// For example, suppose you have an array holding the number of absences from
/// each class during a session.
///
///     var absences = [0, 2, 0, 4, 0, 3, 1, 0]
///
/// You're tasked with finding the day with the most absences in the second
/// half of the session. To find the index of the day in question, follow
/// these setps:
///
/// 1) Create a slice of the `absences` array that holds the second half of the
///    days.
/// 2) Use the `max(by:)` method to determine the index of the day
///    with the most absences.
/// 3) Print the result using the index found in step 2 on the original
///    `absences` array.
///
/// Here's an implementation of those steps:
///
///     let secondHalf = absences.suffix(absences.count / 2)
///     if let i = secondHalf.indices.max(by: { secondHalf[$0] < secondHalf[$1] }) {
///         print("Highest second-half absences: \(absences[i])")
///     }
///     // Prints "Highest second-half absences: 3"
///
/// Slices Inherit Semantics
/// ------------------------
///
/// A slice inherits the value or reference semantics of its base collection.
/// That is, if a `MutableBidirectionalSlice` instance is wrapped around a mutable
/// collection that has value semantics, such as an array, mutating the
/// original collection would trigger a copy of that collection, and not
/// affect the base collection stored inside of the slice.
///
/// For example, if you update the last element of the `absences` array from
/// `0` to `2`, the `secondHalf` slice is unchanged.
///
///     absences[7] = 2
///     print(absences)
///     // Prints "[0, 2, 0, 4, 0, 3, 1, 2]"
///     print(secondHalf)
///     // Prints "[0, 3, 1, 0]"
///
/// - Important: Use slices only for transient computation.
///   A slice may hold a reference to the entire storage of a larger
///   collection, not just to the portion it presents, even after the base
///   collection's lifetime ends. Long-term storage of a slice may therefore
///   prolong the lifetime of elements that are no longer otherwise
///   accessible, which can erroneously appear to be memory leakage.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 107)
///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 109)
/// - Note: `MutableBidirectionalSlice` requires that the base collection's `subscript(_: Index)`
///   setter does not invalidate indices. If you are writing a collection and
///   mutations need to invalidate indices, don't use `MutableBidirectionalSlice` as its
///   subsequence type. Instead, use the nonmutable `Slice` or define your own
///   subsequence type that takes your index invalidation requirements into
///   account.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 117)
public struct MutableBidirectionalSlice<Base : _BidirectionalIndexable & _MutableIndexable>
  : BidirectionalCollection, MutableCollection {

  public typealias Index = Base.Index
  public typealias IndexDistance = Base.IndexDistance

  public var _startIndex: Index
  public var _endIndex: Index

  public var startIndex: Index {
    return _startIndex
  }

  public var endIndex: Index {
    return _endIndex
  }

  public subscript(index: Index) -> Base._Element {
    get {
      _failEarlyRangeCheck(index, bounds: startIndex..<endIndex)
      return _base[index]
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 140)
    set {
      _failEarlyRangeCheck(index, bounds: startIndex..<endIndex)
      _base[index] = newValue
      // MutableSlice requires that the underlying collection's subscript
      // setter does not invalidate indices, so our `startIndex` and `endIndex`
      // continue to be valid.
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 148)
  }

  public typealias SubSequence = MutableBidirectionalSlice<Base>

  public subscript(bounds: Range<Index>) -> MutableBidirectionalSlice<Base> {
    get {
      _failEarlyRangeCheck(bounds, bounds: startIndex..<endIndex)
      return MutableBidirectionalSlice(base: _base, bounds: bounds)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 158)
    set {
      _writeBackMutableSlice(&self, bounds: bounds, slice: newValue)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 162)
  }

  // FIXME(ABI)#67 (Associated Types with where clauses):
  //
  //   public typealias Indices = Base.Indices
  //   public var indices: Indices { ... }
  //
  // We can't do it right now because we don't have enough
  // constraints on the Base.Indices type in this context.

  public func index(after i: Index) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(after: i)
  }

  public func formIndex(after i: inout Index) {
    // FIXME: swift-3-indexing-model: range check.
    _base.formIndex(after: &i)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 183)
  public func index(before i: Index) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(before: i)
  }

  public func formIndex(before i: inout Index) {
    // FIXME: swift-3-indexing-model: range check.
    _base.formIndex(before: &i)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 193)

  public func index(_ i: Index, offsetBy n: IndexDistance) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(i, offsetBy: n)
  }

  public func index(
    _ i: Index, offsetBy n: IndexDistance, limitedBy limit: Index
  ) -> Index? {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(i, offsetBy: n, limitedBy: limit)
  }

  public func distance(from start: Index, to end: Index) -> IndexDistance {
    // FIXME: swift-3-indexing-model: range check.
    return _base.distance(from: start, to: end)
  }

  public func _failEarlyRangeCheck(_ index: Index, bounds: Range<Index>) {
    _base._failEarlyRangeCheck(index, bounds: bounds)
  }

  public func _failEarlyRangeCheck(_ range: Range<Index>, bounds: Range<Index>) {
    _base._failEarlyRangeCheck(range, bounds: bounds)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 412)

  /// Creates a view into the given collection that allows access to elements
  /// within the specified range.
  ///
  /// It is unusual to need to call this method directly. Instead, create a
  /// slice of a collection by using the collection's range-based subscript or
  /// by using methods that return a subsequence.
  ///
  ///     let singleDigits = 0...9
  ///     let subSequence = singleDigits.dropFirst(5)
  ///     print(Array(subSequence))
  ///     // Prints "[5, 6, 7, 8, 9]"
  ///
  /// In this example, the expression `singleDigits.dropFirst(5))` is
  /// equivalent to calling this initializer with `singleDigits` and a
  /// range covering the last five items of `singleDigits.indices`.
  ///
  /// - Parameters:
  ///   - base: The collection to create a view into.
  ///   - bounds: The range of indices to allow access to in the new slice.
  public init(base: Base, bounds: Range<Index>) {
    self._base = base
    self._startIndex = bounds.lowerBound
    self._endIndex = bounds.upperBound
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 439)
  internal var _base: Base
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 443)

  /// The underlying collection of the slice.
  ///
  /// You can use a slice's `base` property to access its base collection. The
  /// following example declares `singleDigits`, a range of single digit
  /// integers, and then drops the first element to create a slice of that
  /// range, `singleNonZeroDigits`. The `base` property of the slice is equal
  /// to `singleDigits`.
  ///
  ///     let singleDigits = 0..<10
  ///     let singleNonZeroDigits = singleDigits.dropFirst()
  ///     // singleNonZeroDigits is a RandomAccessSlice<CountableRange<Int>>
  ///
  ///     print(singleNonZeroDigits.count)
  ///     // Prints "9"
  ///     prints(singleNonZeroDigits.base.count)
  ///     // Prints "10"
  ///     print(singleDigits == singleNonZeroDigits.base)
  ///     // Prints "true"
  public var base: Base {
    return _base
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 106)

/// A view into a subsequence of elements of another collection.
///
/// A slice stores a base collection and the start and end indices of the view.
/// It does not copy the elements from the collection into separate storage.
/// Thus, creating a slice has O(1) complexity.
///
/// Slices Share Indices
/// --------------------
///
/// Indices of a slice can be used interchangeably with indices of the base
/// collection. An element of a slice is located under the same index in the
/// slice and in the base collection, as long as neither the collection nor
/// the slice has been mutated since the slice was created.
///
/// For example, suppose you have an array holding the number of absences from
/// each class during a session.
///
///     var absences = [0, 2, 0, 4, 0, 3, 1, 0]
///
/// You're tasked with finding the day with the most absences in the second
/// half of the session. To find the index of the day in question, follow
/// these setps:
///
/// 1) Create a slice of the `absences` array that holds the second half of the
///    days.
/// 2) Use the `max(by:)` method to determine the index of the day
///    with the most absences.
/// 3) Print the result using the index found in step 2 on the original
///    `absences` array.
///
/// Here's an implementation of those steps:
///
///     let secondHalf = absences.suffix(absences.count / 2)
///     if let i = secondHalf.indices.max(by: { secondHalf[$0] < secondHalf[$1] }) {
///         print("Highest second-half absences: \(absences[i])")
///     }
///     // Prints "Highest second-half absences: 3"
///
/// Slices Inherit Semantics
/// ------------------------
///
/// A slice inherits the value or reference semantics of its base collection.
/// That is, if a `MutableRangeReplaceableBidirectionalSlice` instance is wrapped around a mutable
/// collection that has value semantics, such as an array, mutating the
/// original collection would trigger a copy of that collection, and not
/// affect the base collection stored inside of the slice.
///
/// For example, if you update the last element of the `absences` array from
/// `0` to `2`, the `secondHalf` slice is unchanged.
///
///     absences[7] = 2
///     print(absences)
///     // Prints "[0, 2, 0, 4, 0, 3, 1, 2]"
///     print(secondHalf)
///     // Prints "[0, 3, 1, 0]"
///
/// - Important: Use slices only for transient computation.
///   A slice may hold a reference to the entire storage of a larger
///   collection, not just to the portion it presents, even after the base
///   collection's lifetime ends. Long-term storage of a slice may therefore
///   prolong the lifetime of elements that are no longer otherwise
///   accessible, which can erroneously appear to be memory leakage.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 107)
///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 109)
/// - Note: `MutableRangeReplaceableBidirectionalSlice` requires that the base collection's `subscript(_: Index)`
///   setter does not invalidate indices. If you are writing a collection and
///   mutations need to invalidate indices, don't use `MutableRangeReplaceableBidirectionalSlice` as its
///   subsequence type. Instead, use the nonmutable `Slice` or define your own
///   subsequence type that takes your index invalidation requirements into
///   account.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 117)
public struct MutableRangeReplaceableBidirectionalSlice<Base : _BidirectionalIndexable & _MutableIndexable & _RangeReplaceableIndexable>
  : BidirectionalCollection, MutableCollection, RangeReplaceableCollection {

  public typealias Index = Base.Index
  public typealias IndexDistance = Base.IndexDistance

  public var _startIndex: Index
  public var _endIndex: Index

  public var startIndex: Index {
    return _startIndex
  }

  public var endIndex: Index {
    return _endIndex
  }

  public subscript(index: Index) -> Base._Element {
    get {
      _failEarlyRangeCheck(index, bounds: startIndex..<endIndex)
      return _base[index]
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 140)
    set {
      _failEarlyRangeCheck(index, bounds: startIndex..<endIndex)
      _base[index] = newValue
      // MutableSlice requires that the underlying collection's subscript
      // setter does not invalidate indices, so our `startIndex` and `endIndex`
      // continue to be valid.
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 148)
  }

  public typealias SubSequence = MutableRangeReplaceableBidirectionalSlice<Base>

  public subscript(bounds: Range<Index>) -> MutableRangeReplaceableBidirectionalSlice<Base> {
    get {
      _failEarlyRangeCheck(bounds, bounds: startIndex..<endIndex)
      return MutableRangeReplaceableBidirectionalSlice(base: _base, bounds: bounds)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 158)
    set {
      _writeBackMutableSlice(&self, bounds: bounds, slice: newValue)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 162)
  }

  // FIXME(ABI)#67 (Associated Types with where clauses):
  //
  //   public typealias Indices = Base.Indices
  //   public var indices: Indices { ... }
  //
  // We can't do it right now because we don't have enough
  // constraints on the Base.Indices type in this context.

  public func index(after i: Index) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(after: i)
  }

  public func formIndex(after i: inout Index) {
    // FIXME: swift-3-indexing-model: range check.
    _base.formIndex(after: &i)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 183)
  public func index(before i: Index) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(before: i)
  }

  public func formIndex(before i: inout Index) {
    // FIXME: swift-3-indexing-model: range check.
    _base.formIndex(before: &i)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 193)

  public func index(_ i: Index, offsetBy n: IndexDistance) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(i, offsetBy: n)
  }

  public func index(
    _ i: Index, offsetBy n: IndexDistance, limitedBy limit: Index
  ) -> Index? {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(i, offsetBy: n, limitedBy: limit)
  }

  public func distance(from start: Index, to end: Index) -> IndexDistance {
    // FIXME: swift-3-indexing-model: range check.
    return _base.distance(from: start, to: end)
  }

  public func _failEarlyRangeCheck(_ index: Index, bounds: Range<Index>) {
    _base._failEarlyRangeCheck(index, bounds: bounds)
  }

  public func _failEarlyRangeCheck(_ range: Range<Index>, bounds: Range<Index>) {
    _base._failEarlyRangeCheck(range, bounds: bounds)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 220)
  public init() {
    self._base = Base()
    self._startIndex = _base.startIndex
    self._endIndex = _base.endIndex
  }

  public init(repeating repeatedValue: Base._Element, count: Int) {
    self._base = Base(repeating: repeatedValue, count: count)
    self._startIndex = _base.startIndex
    self._endIndex = _base.endIndex
  }

  public init<S>(_ elements: S)
    where
    S : Sequence,
    S.Iterator.Element == Base._Element {

    self._base = Base(elements)
    self._startIndex = _base.startIndex
    self._endIndex = _base.endIndex
  }

  public mutating func replaceSubrange<C>(
    _ subRange: Range<Index>, with newElements: C
  ) where
    C : Collection,
    C.Iterator.Element == Base._Element {

    // FIXME: swift-3-indexing-model: range check.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 260)
    if subRange.lowerBound == _base.startIndex {
      let newSliceCount: IndexDistance =
        _base.distance(from: _startIndex, to: subRange.lowerBound)
        + _base.distance(from: subRange.upperBound, to: _endIndex)
        + (numericCast(newElements.count) as IndexDistance)
      _base.replaceSubrange(subRange, with: newElements)
      _startIndex = _base.startIndex
      _endIndex = _base.index(_startIndex, offsetBy: newSliceCount)
    } else {
      let shouldUpdateStartIndex = subRange.lowerBound == _startIndex
      let lastValidIndex = _base.index(before: subRange.lowerBound)
      let newEndIndexOffset =
        _base.distance(from: subRange.upperBound, to: _endIndex)
        + (numericCast(newElements.count) as IndexDistance) + 1
      _base.replaceSubrange(subRange, with: newElements)
      if shouldUpdateStartIndex {
        _startIndex = _base.index(after: lastValidIndex)
      }
      _endIndex = _base.index(lastValidIndex, offsetBy: newEndIndexOffset)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 281)
  }

  public mutating func insert(_ newElement: Base._Element, at i: Index) {
    // FIXME: swift-3-indexing-model: range check.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 293)
    if i == _base.startIndex {
      let newSliceCount: IndexDistance = count + 1
      _base.insert(newElement, at: i)
      _startIndex = _base.startIndex
      _endIndex = _base.index(_startIndex, offsetBy: newSliceCount)
    } else {
      let shouldUpdateStartIndex = i == _startIndex
      let lastValidIndex = _base.index(before: i)
      let newEndIndexOffset = _base.distance(from: i, to: _endIndex) + 2
      _base.insert(newElement, at: i)
      if shouldUpdateStartIndex {
        _startIndex = _base.index(after: lastValidIndex)
      }
      _endIndex = _base.index(lastValidIndex, offsetBy: newEndIndexOffset)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 309)
  }

  public mutating func insert<S>(contentsOf newElements: S, at i: Index)
    where
    S : Collection,
    S.Iterator.Element == Base._Element {

    // FIXME: swift-3-indexing-model: range check.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 326)
    if i == _base.startIndex {
      let newSliceCount: IndexDistance =
        count + (numericCast(newElements.count) as IndexDistance)
      _base.insert(contentsOf: newElements, at: i)
      _startIndex = _base.startIndex
      _endIndex = _base.index(_startIndex, offsetBy: newSliceCount)
    } else {
      let shouldUpdateStartIndex = i == _startIndex
      let lastValidIndex = _base.index(before: i)
      let newEndIndexOffset =
        _base.distance(from: i, to: _endIndex)
        + (numericCast(newElements.count) as IndexDistance) + 1
      _base.insert(contentsOf: newElements, at: i)
      if shouldUpdateStartIndex {
        _startIndex = _base.index(after: lastValidIndex)
      }
      _endIndex = _base.index(lastValidIndex, offsetBy: newEndIndexOffset)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 345)
  }

  public mutating func remove(at i: Index) -> Base._Element {
    // FIXME: swift-3-indexing-model: range check.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 358)
    if i == _base.startIndex {
      let newSliceCount: IndexDistance = count - 1
      let result = _base.remove(at: i)
      _startIndex = _base.startIndex
      _endIndex = _base.index(_startIndex, offsetBy: newSliceCount)
      return result
    } else {
      let shouldUpdateStartIndex = i == _startIndex
      let lastValidIndex = _base.index(before: i)
      let newEndIndexOffset = _base.distance(from: i, to: _endIndex)
      let result = _base.remove(at: i)
      if shouldUpdateStartIndex {
        _startIndex = _base.index(after: lastValidIndex)
      }
      _endIndex = _base.index(lastValidIndex, offsetBy: newEndIndexOffset)
      return result
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 376)
  }

  public mutating func removeSubrange(_ bounds: Range<Index>) {
    // FIXME: swift-3-indexing-model: range check.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 389)
    if bounds.lowerBound == _base.startIndex {
      let newSliceCount: IndexDistance =
        count
        - _base.distance(from: bounds.lowerBound, to: bounds.upperBound)
      _base.removeSubrange(bounds)
      _startIndex = _base.startIndex
      _endIndex = _base.index(_startIndex, offsetBy: newSliceCount)
    } else {
      let shouldUpdateStartIndex = bounds.lowerBound == _startIndex
      let lastValidIndex = _base.index(before: bounds.lowerBound)
      let newEndIndexOffset =
        _base.distance(from: bounds.lowerBound, to: _endIndex)
        - _base.distance(from: bounds.lowerBound, to: bounds.upperBound)
        + 1
      _base.removeSubrange(bounds)
      if shouldUpdateStartIndex {
        _startIndex = _base.index(after: lastValidIndex)
      }
      _endIndex = _base.index(lastValidIndex, offsetBy: newEndIndexOffset)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 410)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 412)

  /// Creates a view into the given collection that allows access to elements
  /// within the specified range.
  ///
  /// It is unusual to need to call this method directly. Instead, create a
  /// slice of a collection by using the collection's range-based subscript or
  /// by using methods that return a subsequence.
  ///
  ///     let singleDigits = 0...9
  ///     let subSequence = singleDigits.dropFirst(5)
  ///     print(Array(subSequence))
  ///     // Prints "[5, 6, 7, 8, 9]"
  ///
  /// In this example, the expression `singleDigits.dropFirst(5))` is
  /// equivalent to calling this initializer with `singleDigits` and a
  /// range covering the last five items of `singleDigits.indices`.
  ///
  /// - Parameters:
  ///   - base: The collection to create a view into.
  ///   - bounds: The range of indices to allow access to in the new slice.
  public init(base: Base, bounds: Range<Index>) {
    self._base = base
    self._startIndex = bounds.lowerBound
    self._endIndex = bounds.upperBound
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 439)
  internal var _base: Base
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 443)

  /// The underlying collection of the slice.
  ///
  /// You can use a slice's `base` property to access its base collection. The
  /// following example declares `singleDigits`, a range of single digit
  /// integers, and then drops the first element to create a slice of that
  /// range, `singleNonZeroDigits`. The `base` property of the slice is equal
  /// to `singleDigits`.
  ///
  ///     let singleDigits = 0..<10
  ///     let singleNonZeroDigits = singleDigits.dropFirst()
  ///     // singleNonZeroDigits is a RandomAccessSlice<CountableRange<Int>>
  ///
  ///     print(singleNonZeroDigits.count)
  ///     // Prints "9"
  ///     prints(singleNonZeroDigits.base.count)
  ///     // Prints "10"
  ///     print(singleDigits == singleNonZeroDigits.base)
  ///     // Prints "true"
  public var base: Base {
    return _base
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 106)

/// A view into a subsequence of elements of another collection.
///
/// A slice stores a base collection and the start and end indices of the view.
/// It does not copy the elements from the collection into separate storage.
/// Thus, creating a slice has O(1) complexity.
///
/// Slices Share Indices
/// --------------------
///
/// Indices of a slice can be used interchangeably with indices of the base
/// collection. An element of a slice is located under the same index in the
/// slice and in the base collection, as long as neither the collection nor
/// the slice has been mutated since the slice was created.
///
/// For example, suppose you have an array holding the number of absences from
/// each class during a session.
///
///     var absences = [0, 2, 0, 4, 0, 3, 1, 0]
///
/// You're tasked with finding the day with the most absences in the second
/// half of the session. To find the index of the day in question, follow
/// these setps:
///
/// 1) Create a slice of the `absences` array that holds the second half of the
///    days.
/// 2) Use the `max(by:)` method to determine the index of the day
///    with the most absences.
/// 3) Print the result using the index found in step 2 on the original
///    `absences` array.
///
/// Here's an implementation of those steps:
///
///     let secondHalf = absences.suffix(absences.count / 2)
///     if let i = secondHalf.indices.max(by: { secondHalf[$0] < secondHalf[$1] }) {
///         print("Highest second-half absences: \(absences[i])")
///     }
///     // Prints "Highest second-half absences: 3"
///
/// Slices Inherit Semantics
/// ------------------------
///
/// A slice inherits the value or reference semantics of its base collection.
/// That is, if a `RandomAccessSlice` instance is wrapped around a mutable
/// collection that has value semantics, such as an array, mutating the
/// original collection would trigger a copy of that collection, and not
/// affect the base collection stored inside of the slice.
///
/// For example, if you update the last element of the `absences` array from
/// `0` to `2`, the `secondHalf` slice is unchanged.
///
///     absences[7] = 2
///     print(absences)
///     // Prints "[0, 2, 0, 4, 0, 3, 1, 2]"
///     print(secondHalf)
///     // Prints "[0, 3, 1, 0]"
///
/// - Important: Use slices only for transient computation.
///   A slice may hold a reference to the entire storage of a larger
///   collection, not just to the portion it presents, even after the base
///   collection's lifetime ends. Long-term storage of a slice may therefore
///   prolong the lifetime of elements that are no longer otherwise
///   accessible, which can erroneously appear to be memory leakage.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 107)
public struct RandomAccessSlice<Base : _RandomAccessIndexable>
  : RandomAccessCollection {

  public typealias Index = Base.Index
  public typealias IndexDistance = Base.IndexDistance

  public var _startIndex: Index
  public var _endIndex: Index

  public var startIndex: Index {
    return _startIndex
  }

  public var endIndex: Index {
    return _endIndex
  }

  public subscript(index: Index) -> Base._Element {
    get {
      _failEarlyRangeCheck(index, bounds: startIndex..<endIndex)
      return _base[index]
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 148)
  }

  public typealias SubSequence = RandomAccessSlice<Base>

  public subscript(bounds: Range<Index>) -> RandomAccessSlice<Base> {
    get {
      _failEarlyRangeCheck(bounds, bounds: startIndex..<endIndex)
      return RandomAccessSlice(base: _base, bounds: bounds)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 162)
  }

  // FIXME(ABI)#67 (Associated Types with where clauses):
  //
  //   public typealias Indices = Base.Indices
  //   public var indices: Indices { ... }
  //
  // We can't do it right now because we don't have enough
  // constraints on the Base.Indices type in this context.

  public func index(after i: Index) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(after: i)
  }

  public func formIndex(after i: inout Index) {
    // FIXME: swift-3-indexing-model: range check.
    _base.formIndex(after: &i)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 183)
  public func index(before i: Index) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(before: i)
  }

  public func formIndex(before i: inout Index) {
    // FIXME: swift-3-indexing-model: range check.
    _base.formIndex(before: &i)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 193)

  public func index(_ i: Index, offsetBy n: IndexDistance) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(i, offsetBy: n)
  }

  public func index(
    _ i: Index, offsetBy n: IndexDistance, limitedBy limit: Index
  ) -> Index? {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(i, offsetBy: n, limitedBy: limit)
  }

  public func distance(from start: Index, to end: Index) -> IndexDistance {
    // FIXME: swift-3-indexing-model: range check.
    return _base.distance(from: start, to: end)
  }

  public func _failEarlyRangeCheck(_ index: Index, bounds: Range<Index>) {
    _base._failEarlyRangeCheck(index, bounds: bounds)
  }

  public func _failEarlyRangeCheck(_ range: Range<Index>, bounds: Range<Index>) {
    _base._failEarlyRangeCheck(range, bounds: bounds)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 412)

  /// Creates a view into the given collection that allows access to elements
  /// within the specified range.
  ///
  /// It is unusual to need to call this method directly. Instead, create a
  /// slice of a collection by using the collection's range-based subscript or
  /// by using methods that return a subsequence.
  ///
  ///     let singleDigits = 0...9
  ///     let subSequence = singleDigits.dropFirst(5)
  ///     print(Array(subSequence))
  ///     // Prints "[5, 6, 7, 8, 9]"
  ///
  /// In this example, the expression `singleDigits.dropFirst(5))` is
  /// equivalent to calling this initializer with `singleDigits` and a
  /// range covering the last five items of `singleDigits.indices`.
  ///
  /// - Parameters:
  ///   - base: The collection to create a view into.
  ///   - bounds: The range of indices to allow access to in the new slice.
  public init(base: Base, bounds: Range<Index>) {
    self._base = base
    self._startIndex = bounds.lowerBound
    self._endIndex = bounds.upperBound
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 441)
  internal let _base: Base
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 443)

  /// The underlying collection of the slice.
  ///
  /// You can use a slice's `base` property to access its base collection. The
  /// following example declares `singleDigits`, a range of single digit
  /// integers, and then drops the first element to create a slice of that
  /// range, `singleNonZeroDigits`. The `base` property of the slice is equal
  /// to `singleDigits`.
  ///
  ///     let singleDigits = 0..<10
  ///     let singleNonZeroDigits = singleDigits.dropFirst()
  ///     // singleNonZeroDigits is a RandomAccessSlice<CountableRange<Int>>
  ///
  ///     print(singleNonZeroDigits.count)
  ///     // Prints "9"
  ///     prints(singleNonZeroDigits.base.count)
  ///     // Prints "10"
  ///     print(singleDigits == singleNonZeroDigits.base)
  ///     // Prints "true"
  public var base: Base {
    return _base
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 106)

/// A view into a subsequence of elements of another collection.
///
/// A slice stores a base collection and the start and end indices of the view.
/// It does not copy the elements from the collection into separate storage.
/// Thus, creating a slice has O(1) complexity.
///
/// Slices Share Indices
/// --------------------
///
/// Indices of a slice can be used interchangeably with indices of the base
/// collection. An element of a slice is located under the same index in the
/// slice and in the base collection, as long as neither the collection nor
/// the slice has been mutated since the slice was created.
///
/// For example, suppose you have an array holding the number of absences from
/// each class during a session.
///
///     var absences = [0, 2, 0, 4, 0, 3, 1, 0]
///
/// You're tasked with finding the day with the most absences in the second
/// half of the session. To find the index of the day in question, follow
/// these setps:
///
/// 1) Create a slice of the `absences` array that holds the second half of the
///    days.
/// 2) Use the `max(by:)` method to determine the index of the day
///    with the most absences.
/// 3) Print the result using the index found in step 2 on the original
///    `absences` array.
///
/// Here's an implementation of those steps:
///
///     let secondHalf = absences.suffix(absences.count / 2)
///     if let i = secondHalf.indices.max(by: { secondHalf[$0] < secondHalf[$1] }) {
///         print("Highest second-half absences: \(absences[i])")
///     }
///     // Prints "Highest second-half absences: 3"
///
/// Slices Inherit Semantics
/// ------------------------
///
/// A slice inherits the value or reference semantics of its base collection.
/// That is, if a `RangeReplaceableRandomAccessSlice` instance is wrapped around a mutable
/// collection that has value semantics, such as an array, mutating the
/// original collection would trigger a copy of that collection, and not
/// affect the base collection stored inside of the slice.
///
/// For example, if you update the last element of the `absences` array from
/// `0` to `2`, the `secondHalf` slice is unchanged.
///
///     absences[7] = 2
///     print(absences)
///     // Prints "[0, 2, 0, 4, 0, 3, 1, 2]"
///     print(secondHalf)
///     // Prints "[0, 3, 1, 0]"
///
/// - Important: Use slices only for transient computation.
///   A slice may hold a reference to the entire storage of a larger
///   collection, not just to the portion it presents, even after the base
///   collection's lifetime ends. Long-term storage of a slice may therefore
///   prolong the lifetime of elements that are no longer otherwise
///   accessible, which can erroneously appear to be memory leakage.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 107)
public struct RangeReplaceableRandomAccessSlice<Base : _RandomAccessIndexable & _RangeReplaceableIndexable>
  : RandomAccessCollection, RangeReplaceableCollection {

  public typealias Index = Base.Index
  public typealias IndexDistance = Base.IndexDistance

  public var _startIndex: Index
  public var _endIndex: Index

  public var startIndex: Index {
    return _startIndex
  }

  public var endIndex: Index {
    return _endIndex
  }

  public subscript(index: Index) -> Base._Element {
    get {
      _failEarlyRangeCheck(index, bounds: startIndex..<endIndex)
      return _base[index]
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 148)
  }

  public typealias SubSequence = RangeReplaceableRandomAccessSlice<Base>

  public subscript(bounds: Range<Index>) -> RangeReplaceableRandomAccessSlice<Base> {
    get {
      _failEarlyRangeCheck(bounds, bounds: startIndex..<endIndex)
      return RangeReplaceableRandomAccessSlice(base: _base, bounds: bounds)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 162)
  }

  // FIXME(ABI)#67 (Associated Types with where clauses):
  //
  //   public typealias Indices = Base.Indices
  //   public var indices: Indices { ... }
  //
  // We can't do it right now because we don't have enough
  // constraints on the Base.Indices type in this context.

  public func index(after i: Index) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(after: i)
  }

  public func formIndex(after i: inout Index) {
    // FIXME: swift-3-indexing-model: range check.
    _base.formIndex(after: &i)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 183)
  public func index(before i: Index) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(before: i)
  }

  public func formIndex(before i: inout Index) {
    // FIXME: swift-3-indexing-model: range check.
    _base.formIndex(before: &i)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 193)

  public func index(_ i: Index, offsetBy n: IndexDistance) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(i, offsetBy: n)
  }

  public func index(
    _ i: Index, offsetBy n: IndexDistance, limitedBy limit: Index
  ) -> Index? {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(i, offsetBy: n, limitedBy: limit)
  }

  public func distance(from start: Index, to end: Index) -> IndexDistance {
    // FIXME: swift-3-indexing-model: range check.
    return _base.distance(from: start, to: end)
  }

  public func _failEarlyRangeCheck(_ index: Index, bounds: Range<Index>) {
    _base._failEarlyRangeCheck(index, bounds: bounds)
  }

  public func _failEarlyRangeCheck(_ range: Range<Index>, bounds: Range<Index>) {
    _base._failEarlyRangeCheck(range, bounds: bounds)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 220)
  public init() {
    self._base = Base()
    self._startIndex = _base.startIndex
    self._endIndex = _base.endIndex
  }

  public init(repeating repeatedValue: Base._Element, count: Int) {
    self._base = Base(repeating: repeatedValue, count: count)
    self._startIndex = _base.startIndex
    self._endIndex = _base.endIndex
  }

  public init<S>(_ elements: S)
    where
    S : Sequence,
    S.Iterator.Element == Base._Element {

    self._base = Base(elements)
    self._startIndex = _base.startIndex
    self._endIndex = _base.endIndex
  }

  public mutating func replaceSubrange<C>(
    _ subRange: Range<Index>, with newElements: C
  ) where
    C : Collection,
    C.Iterator.Element == Base._Element {

    // FIXME: swift-3-indexing-model: range check.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 260)
    if subRange.lowerBound == _base.startIndex {
      let newSliceCount: IndexDistance =
        _base.distance(from: _startIndex, to: subRange.lowerBound)
        + _base.distance(from: subRange.upperBound, to: _endIndex)
        + (numericCast(newElements.count) as IndexDistance)
      _base.replaceSubrange(subRange, with: newElements)
      _startIndex = _base.startIndex
      _endIndex = _base.index(_startIndex, offsetBy: newSliceCount)
    } else {
      let shouldUpdateStartIndex = subRange.lowerBound == _startIndex
      let lastValidIndex = _base.index(before: subRange.lowerBound)
      let newEndIndexOffset =
        _base.distance(from: subRange.upperBound, to: _endIndex)
        + (numericCast(newElements.count) as IndexDistance) + 1
      _base.replaceSubrange(subRange, with: newElements)
      if shouldUpdateStartIndex {
        _startIndex = _base.index(after: lastValidIndex)
      }
      _endIndex = _base.index(lastValidIndex, offsetBy: newEndIndexOffset)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 281)
  }

  public mutating func insert(_ newElement: Base._Element, at i: Index) {
    // FIXME: swift-3-indexing-model: range check.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 293)
    if i == _base.startIndex {
      let newSliceCount: IndexDistance = count + 1
      _base.insert(newElement, at: i)
      _startIndex = _base.startIndex
      _endIndex = _base.index(_startIndex, offsetBy: newSliceCount)
    } else {
      let shouldUpdateStartIndex = i == _startIndex
      let lastValidIndex = _base.index(before: i)
      let newEndIndexOffset = _base.distance(from: i, to: _endIndex) + 2
      _base.insert(newElement, at: i)
      if shouldUpdateStartIndex {
        _startIndex = _base.index(after: lastValidIndex)
      }
      _endIndex = _base.index(lastValidIndex, offsetBy: newEndIndexOffset)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 309)
  }

  public mutating func insert<S>(contentsOf newElements: S, at i: Index)
    where
    S : Collection,
    S.Iterator.Element == Base._Element {

    // FIXME: swift-3-indexing-model: range check.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 326)
    if i == _base.startIndex {
      let newSliceCount: IndexDistance =
        count + (numericCast(newElements.count) as IndexDistance)
      _base.insert(contentsOf: newElements, at: i)
      _startIndex = _base.startIndex
      _endIndex = _base.index(_startIndex, offsetBy: newSliceCount)
    } else {
      let shouldUpdateStartIndex = i == _startIndex
      let lastValidIndex = _base.index(before: i)
      let newEndIndexOffset =
        _base.distance(from: i, to: _endIndex)
        + (numericCast(newElements.count) as IndexDistance) + 1
      _base.insert(contentsOf: newElements, at: i)
      if shouldUpdateStartIndex {
        _startIndex = _base.index(after: lastValidIndex)
      }
      _endIndex = _base.index(lastValidIndex, offsetBy: newEndIndexOffset)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 345)
  }

  public mutating func remove(at i: Index) -> Base._Element {
    // FIXME: swift-3-indexing-model: range check.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 358)
    if i == _base.startIndex {
      let newSliceCount: IndexDistance = count - 1
      let result = _base.remove(at: i)
      _startIndex = _base.startIndex
      _endIndex = _base.index(_startIndex, offsetBy: newSliceCount)
      return result
    } else {
      let shouldUpdateStartIndex = i == _startIndex
      let lastValidIndex = _base.index(before: i)
      let newEndIndexOffset = _base.distance(from: i, to: _endIndex)
      let result = _base.remove(at: i)
      if shouldUpdateStartIndex {
        _startIndex = _base.index(after: lastValidIndex)
      }
      _endIndex = _base.index(lastValidIndex, offsetBy: newEndIndexOffset)
      return result
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 376)
  }

  public mutating func removeSubrange(_ bounds: Range<Index>) {
    // FIXME: swift-3-indexing-model: range check.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 389)
    if bounds.lowerBound == _base.startIndex {
      let newSliceCount: IndexDistance =
        count
        - _base.distance(from: bounds.lowerBound, to: bounds.upperBound)
      _base.removeSubrange(bounds)
      _startIndex = _base.startIndex
      _endIndex = _base.index(_startIndex, offsetBy: newSliceCount)
    } else {
      let shouldUpdateStartIndex = bounds.lowerBound == _startIndex
      let lastValidIndex = _base.index(before: bounds.lowerBound)
      let newEndIndexOffset =
        _base.distance(from: bounds.lowerBound, to: _endIndex)
        - _base.distance(from: bounds.lowerBound, to: bounds.upperBound)
        + 1
      _base.removeSubrange(bounds)
      if shouldUpdateStartIndex {
        _startIndex = _base.index(after: lastValidIndex)
      }
      _endIndex = _base.index(lastValidIndex, offsetBy: newEndIndexOffset)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 410)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 412)

  /// Creates a view into the given collection that allows access to elements
  /// within the specified range.
  ///
  /// It is unusual to need to call this method directly. Instead, create a
  /// slice of a collection by using the collection's range-based subscript or
  /// by using methods that return a subsequence.
  ///
  ///     let singleDigits = 0...9
  ///     let subSequence = singleDigits.dropFirst(5)
  ///     print(Array(subSequence))
  ///     // Prints "[5, 6, 7, 8, 9]"
  ///
  /// In this example, the expression `singleDigits.dropFirst(5))` is
  /// equivalent to calling this initializer with `singleDigits` and a
  /// range covering the last five items of `singleDigits.indices`.
  ///
  /// - Parameters:
  ///   - base: The collection to create a view into.
  ///   - bounds: The range of indices to allow access to in the new slice.
  public init(base: Base, bounds: Range<Index>) {
    self._base = base
    self._startIndex = bounds.lowerBound
    self._endIndex = bounds.upperBound
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 439)
  internal var _base: Base
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 443)

  /// The underlying collection of the slice.
  ///
  /// You can use a slice's `base` property to access its base collection. The
  /// following example declares `singleDigits`, a range of single digit
  /// integers, and then drops the first element to create a slice of that
  /// range, `singleNonZeroDigits`. The `base` property of the slice is equal
  /// to `singleDigits`.
  ///
  ///     let singleDigits = 0..<10
  ///     let singleNonZeroDigits = singleDigits.dropFirst()
  ///     // singleNonZeroDigits is a RandomAccessSlice<CountableRange<Int>>
  ///
  ///     print(singleNonZeroDigits.count)
  ///     // Prints "9"
  ///     prints(singleNonZeroDigits.base.count)
  ///     // Prints "10"
  ///     print(singleDigits == singleNonZeroDigits.base)
  ///     // Prints "true"
  public var base: Base {
    return _base
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 106)

/// A view into a subsequence of elements of another collection.
///
/// A slice stores a base collection and the start and end indices of the view.
/// It does not copy the elements from the collection into separate storage.
/// Thus, creating a slice has O(1) complexity.
///
/// Slices Share Indices
/// --------------------
///
/// Indices of a slice can be used interchangeably with indices of the base
/// collection. An element of a slice is located under the same index in the
/// slice and in the base collection, as long as neither the collection nor
/// the slice has been mutated since the slice was created.
///
/// For example, suppose you have an array holding the number of absences from
/// each class during a session.
///
///     var absences = [0, 2, 0, 4, 0, 3, 1, 0]
///
/// You're tasked with finding the day with the most absences in the second
/// half of the session. To find the index of the day in question, follow
/// these setps:
///
/// 1) Create a slice of the `absences` array that holds the second half of the
///    days.
/// 2) Use the `max(by:)` method to determine the index of the day
///    with the most absences.
/// 3) Print the result using the index found in step 2 on the original
///    `absences` array.
///
/// Here's an implementation of those steps:
///
///     let secondHalf = absences.suffix(absences.count / 2)
///     if let i = secondHalf.indices.max(by: { secondHalf[$0] < secondHalf[$1] }) {
///         print("Highest second-half absences: \(absences[i])")
///     }
///     // Prints "Highest second-half absences: 3"
///
/// Slices Inherit Semantics
/// ------------------------
///
/// A slice inherits the value or reference semantics of its base collection.
/// That is, if a `MutableRandomAccessSlice` instance is wrapped around a mutable
/// collection that has value semantics, such as an array, mutating the
/// original collection would trigger a copy of that collection, and not
/// affect the base collection stored inside of the slice.
///
/// For example, if you update the last element of the `absences` array from
/// `0` to `2`, the `secondHalf` slice is unchanged.
///
///     absences[7] = 2
///     print(absences)
///     // Prints "[0, 2, 0, 4, 0, 3, 1, 2]"
///     print(secondHalf)
///     // Prints "[0, 3, 1, 0]"
///
/// - Important: Use slices only for transient computation.
///   A slice may hold a reference to the entire storage of a larger
///   collection, not just to the portion it presents, even after the base
///   collection's lifetime ends. Long-term storage of a slice may therefore
///   prolong the lifetime of elements that are no longer otherwise
///   accessible, which can erroneously appear to be memory leakage.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 107)
///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 109)
/// - Note: `MutableRandomAccessSlice` requires that the base collection's `subscript(_: Index)`
///   setter does not invalidate indices. If you are writing a collection and
///   mutations need to invalidate indices, don't use `MutableRandomAccessSlice` as its
///   subsequence type. Instead, use the nonmutable `Slice` or define your own
///   subsequence type that takes your index invalidation requirements into
///   account.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 117)
public struct MutableRandomAccessSlice<Base : _RandomAccessIndexable & _MutableIndexable>
  : RandomAccessCollection, MutableCollection {

  public typealias Index = Base.Index
  public typealias IndexDistance = Base.IndexDistance

  public var _startIndex: Index
  public var _endIndex: Index

  public var startIndex: Index {
    return _startIndex
  }

  public var endIndex: Index {
    return _endIndex
  }

  public subscript(index: Index) -> Base._Element {
    get {
      _failEarlyRangeCheck(index, bounds: startIndex..<endIndex)
      return _base[index]
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 140)
    set {
      _failEarlyRangeCheck(index, bounds: startIndex..<endIndex)
      _base[index] = newValue
      // MutableSlice requires that the underlying collection's subscript
      // setter does not invalidate indices, so our `startIndex` and `endIndex`
      // continue to be valid.
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 148)
  }

  public typealias SubSequence = MutableRandomAccessSlice<Base>

  public subscript(bounds: Range<Index>) -> MutableRandomAccessSlice<Base> {
    get {
      _failEarlyRangeCheck(bounds, bounds: startIndex..<endIndex)
      return MutableRandomAccessSlice(base: _base, bounds: bounds)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 158)
    set {
      _writeBackMutableSlice(&self, bounds: bounds, slice: newValue)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 162)
  }

  // FIXME(ABI)#67 (Associated Types with where clauses):
  //
  //   public typealias Indices = Base.Indices
  //   public var indices: Indices { ... }
  //
  // We can't do it right now because we don't have enough
  // constraints on the Base.Indices type in this context.

  public func index(after i: Index) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(after: i)
  }

  public func formIndex(after i: inout Index) {
    // FIXME: swift-3-indexing-model: range check.
    _base.formIndex(after: &i)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 183)
  public func index(before i: Index) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(before: i)
  }

  public func formIndex(before i: inout Index) {
    // FIXME: swift-3-indexing-model: range check.
    _base.formIndex(before: &i)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 193)

  public func index(_ i: Index, offsetBy n: IndexDistance) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(i, offsetBy: n)
  }

  public func index(
    _ i: Index, offsetBy n: IndexDistance, limitedBy limit: Index
  ) -> Index? {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(i, offsetBy: n, limitedBy: limit)
  }

  public func distance(from start: Index, to end: Index) -> IndexDistance {
    // FIXME: swift-3-indexing-model: range check.
    return _base.distance(from: start, to: end)
  }

  public func _failEarlyRangeCheck(_ index: Index, bounds: Range<Index>) {
    _base._failEarlyRangeCheck(index, bounds: bounds)
  }

  public func _failEarlyRangeCheck(_ range: Range<Index>, bounds: Range<Index>) {
    _base._failEarlyRangeCheck(range, bounds: bounds)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 412)

  /// Creates a view into the given collection that allows access to elements
  /// within the specified range.
  ///
  /// It is unusual to need to call this method directly. Instead, create a
  /// slice of a collection by using the collection's range-based subscript or
  /// by using methods that return a subsequence.
  ///
  ///     let singleDigits = 0...9
  ///     let subSequence = singleDigits.dropFirst(5)
  ///     print(Array(subSequence))
  ///     // Prints "[5, 6, 7, 8, 9]"
  ///
  /// In this example, the expression `singleDigits.dropFirst(5))` is
  /// equivalent to calling this initializer with `singleDigits` and a
  /// range covering the last five items of `singleDigits.indices`.
  ///
  /// - Parameters:
  ///   - base: The collection to create a view into.
  ///   - bounds: The range of indices to allow access to in the new slice.
  public init(base: Base, bounds: Range<Index>) {
    self._base = base
    self._startIndex = bounds.lowerBound
    self._endIndex = bounds.upperBound
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 439)
  internal var _base: Base
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 443)

  /// The underlying collection of the slice.
  ///
  /// You can use a slice's `base` property to access its base collection. The
  /// following example declares `singleDigits`, a range of single digit
  /// integers, and then drops the first element to create a slice of that
  /// range, `singleNonZeroDigits`. The `base` property of the slice is equal
  /// to `singleDigits`.
  ///
  ///     let singleDigits = 0..<10
  ///     let singleNonZeroDigits = singleDigits.dropFirst()
  ///     // singleNonZeroDigits is a RandomAccessSlice<CountableRange<Int>>
  ///
  ///     print(singleNonZeroDigits.count)
  ///     // Prints "9"
  ///     prints(singleNonZeroDigits.base.count)
  ///     // Prints "10"
  ///     print(singleDigits == singleNonZeroDigits.base)
  ///     // Prints "true"
  public var base: Base {
    return _base
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 106)

/// A view into a subsequence of elements of another collection.
///
/// A slice stores a base collection and the start and end indices of the view.
/// It does not copy the elements from the collection into separate storage.
/// Thus, creating a slice has O(1) complexity.
///
/// Slices Share Indices
/// --------------------
///
/// Indices of a slice can be used interchangeably with indices of the base
/// collection. An element of a slice is located under the same index in the
/// slice and in the base collection, as long as neither the collection nor
/// the slice has been mutated since the slice was created.
///
/// For example, suppose you have an array holding the number of absences from
/// each class during a session.
///
///     var absences = [0, 2, 0, 4, 0, 3, 1, 0]
///
/// You're tasked with finding the day with the most absences in the second
/// half of the session. To find the index of the day in question, follow
/// these setps:
///
/// 1) Create a slice of the `absences` array that holds the second half of the
///    days.
/// 2) Use the `max(by:)` method to determine the index of the day
///    with the most absences.
/// 3) Print the result using the index found in step 2 on the original
///    `absences` array.
///
/// Here's an implementation of those steps:
///
///     let secondHalf = absences.suffix(absences.count / 2)
///     if let i = secondHalf.indices.max(by: { secondHalf[$0] < secondHalf[$1] }) {
///         print("Highest second-half absences: \(absences[i])")
///     }
///     // Prints "Highest second-half absences: 3"
///
/// Slices Inherit Semantics
/// ------------------------
///
/// A slice inherits the value or reference semantics of its base collection.
/// That is, if a `MutableRangeReplaceableRandomAccessSlice` instance is wrapped around a mutable
/// collection that has value semantics, such as an array, mutating the
/// original collection would trigger a copy of that collection, and not
/// affect the base collection stored inside of the slice.
///
/// For example, if you update the last element of the `absences` array from
/// `0` to `2`, the `secondHalf` slice is unchanged.
///
///     absences[7] = 2
///     print(absences)
///     // Prints "[0, 2, 0, 4, 0, 3, 1, 2]"
///     print(secondHalf)
///     // Prints "[0, 3, 1, 0]"
///
/// - Important: Use slices only for transient computation.
///   A slice may hold a reference to the entire storage of a larger
///   collection, not just to the portion it presents, even after the base
///   collection's lifetime ends. Long-term storage of a slice may therefore
///   prolong the lifetime of elements that are no longer otherwise
///   accessible, which can erroneously appear to be memory leakage.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 107)
///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 109)
/// - Note: `MutableRangeReplaceableRandomAccessSlice` requires that the base collection's `subscript(_: Index)`
///   setter does not invalidate indices. If you are writing a collection and
///   mutations need to invalidate indices, don't use `MutableRangeReplaceableRandomAccessSlice` as its
///   subsequence type. Instead, use the nonmutable `Slice` or define your own
///   subsequence type that takes your index invalidation requirements into
///   account.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 117)
public struct MutableRangeReplaceableRandomAccessSlice<Base : _RandomAccessIndexable & _MutableIndexable & _RangeReplaceableIndexable>
  : RandomAccessCollection, MutableCollection, RangeReplaceableCollection {

  public typealias Index = Base.Index
  public typealias IndexDistance = Base.IndexDistance

  public var _startIndex: Index
  public var _endIndex: Index

  public var startIndex: Index {
    return _startIndex
  }

  public var endIndex: Index {
    return _endIndex
  }

  public subscript(index: Index) -> Base._Element {
    get {
      _failEarlyRangeCheck(index, bounds: startIndex..<endIndex)
      return _base[index]
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 140)
    set {
      _failEarlyRangeCheck(index, bounds: startIndex..<endIndex)
      _base[index] = newValue
      // MutableSlice requires that the underlying collection's subscript
      // setter does not invalidate indices, so our `startIndex` and `endIndex`
      // continue to be valid.
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 148)
  }

  public typealias SubSequence = MutableRangeReplaceableRandomAccessSlice<Base>

  public subscript(bounds: Range<Index>) -> MutableRangeReplaceableRandomAccessSlice<Base> {
    get {
      _failEarlyRangeCheck(bounds, bounds: startIndex..<endIndex)
      return MutableRangeReplaceableRandomAccessSlice(base: _base, bounds: bounds)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 158)
    set {
      _writeBackMutableSlice(&self, bounds: bounds, slice: newValue)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 162)
  }

  // FIXME(ABI)#67 (Associated Types with where clauses):
  //
  //   public typealias Indices = Base.Indices
  //   public var indices: Indices { ... }
  //
  // We can't do it right now because we don't have enough
  // constraints on the Base.Indices type in this context.

  public func index(after i: Index) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(after: i)
  }

  public func formIndex(after i: inout Index) {
    // FIXME: swift-3-indexing-model: range check.
    _base.formIndex(after: &i)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 183)
  public func index(before i: Index) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(before: i)
  }

  public func formIndex(before i: inout Index) {
    // FIXME: swift-3-indexing-model: range check.
    _base.formIndex(before: &i)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 193)

  public func index(_ i: Index, offsetBy n: IndexDistance) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(i, offsetBy: n)
  }

  public func index(
    _ i: Index, offsetBy n: IndexDistance, limitedBy limit: Index
  ) -> Index? {
    // FIXME: swift-3-indexing-model: range check.
    return _base.index(i, offsetBy: n, limitedBy: limit)
  }

  public func distance(from start: Index, to end: Index) -> IndexDistance {
    // FIXME: swift-3-indexing-model: range check.
    return _base.distance(from: start, to: end)
  }

  public func _failEarlyRangeCheck(_ index: Index, bounds: Range<Index>) {
    _base._failEarlyRangeCheck(index, bounds: bounds)
  }

  public func _failEarlyRangeCheck(_ range: Range<Index>, bounds: Range<Index>) {
    _base._failEarlyRangeCheck(range, bounds: bounds)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 220)
  public init() {
    self._base = Base()
    self._startIndex = _base.startIndex
    self._endIndex = _base.endIndex
  }

  public init(repeating repeatedValue: Base._Element, count: Int) {
    self._base = Base(repeating: repeatedValue, count: count)
    self._startIndex = _base.startIndex
    self._endIndex = _base.endIndex
  }

  public init<S>(_ elements: S)
    where
    S : Sequence,
    S.Iterator.Element == Base._Element {

    self._base = Base(elements)
    self._startIndex = _base.startIndex
    self._endIndex = _base.endIndex
  }

  public mutating func replaceSubrange<C>(
    _ subRange: Range<Index>, with newElements: C
  ) where
    C : Collection,
    C.Iterator.Element == Base._Element {

    // FIXME: swift-3-indexing-model: range check.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 260)
    if subRange.lowerBound == _base.startIndex {
      let newSliceCount: IndexDistance =
        _base.distance(from: _startIndex, to: subRange.lowerBound)
        + _base.distance(from: subRange.upperBound, to: _endIndex)
        + (numericCast(newElements.count) as IndexDistance)
      _base.replaceSubrange(subRange, with: newElements)
      _startIndex = _base.startIndex
      _endIndex = _base.index(_startIndex, offsetBy: newSliceCount)
    } else {
      let shouldUpdateStartIndex = subRange.lowerBound == _startIndex
      let lastValidIndex = _base.index(before: subRange.lowerBound)
      let newEndIndexOffset =
        _base.distance(from: subRange.upperBound, to: _endIndex)
        + (numericCast(newElements.count) as IndexDistance) + 1
      _base.replaceSubrange(subRange, with: newElements)
      if shouldUpdateStartIndex {
        _startIndex = _base.index(after: lastValidIndex)
      }
      _endIndex = _base.index(lastValidIndex, offsetBy: newEndIndexOffset)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 281)
  }

  public mutating func insert(_ newElement: Base._Element, at i: Index) {
    // FIXME: swift-3-indexing-model: range check.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 293)
    if i == _base.startIndex {
      let newSliceCount: IndexDistance = count + 1
      _base.insert(newElement, at: i)
      _startIndex = _base.startIndex
      _endIndex = _base.index(_startIndex, offsetBy: newSliceCount)
    } else {
      let shouldUpdateStartIndex = i == _startIndex
      let lastValidIndex = _base.index(before: i)
      let newEndIndexOffset = _base.distance(from: i, to: _endIndex) + 2
      _base.insert(newElement, at: i)
      if shouldUpdateStartIndex {
        _startIndex = _base.index(after: lastValidIndex)
      }
      _endIndex = _base.index(lastValidIndex, offsetBy: newEndIndexOffset)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 309)
  }

  public mutating func insert<S>(contentsOf newElements: S, at i: Index)
    where
    S : Collection,
    S.Iterator.Element == Base._Element {

    // FIXME: swift-3-indexing-model: range check.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 326)
    if i == _base.startIndex {
      let newSliceCount: IndexDistance =
        count + (numericCast(newElements.count) as IndexDistance)
      _base.insert(contentsOf: newElements, at: i)
      _startIndex = _base.startIndex
      _endIndex = _base.index(_startIndex, offsetBy: newSliceCount)
    } else {
      let shouldUpdateStartIndex = i == _startIndex
      let lastValidIndex = _base.index(before: i)
      let newEndIndexOffset =
        _base.distance(from: i, to: _endIndex)
        + (numericCast(newElements.count) as IndexDistance) + 1
      _base.insert(contentsOf: newElements, at: i)
      if shouldUpdateStartIndex {
        _startIndex = _base.index(after: lastValidIndex)
      }
      _endIndex = _base.index(lastValidIndex, offsetBy: newEndIndexOffset)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 345)
  }

  public mutating func remove(at i: Index) -> Base._Element {
    // FIXME: swift-3-indexing-model: range check.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 358)
    if i == _base.startIndex {
      let newSliceCount: IndexDistance = count - 1
      let result = _base.remove(at: i)
      _startIndex = _base.startIndex
      _endIndex = _base.index(_startIndex, offsetBy: newSliceCount)
      return result
    } else {
      let shouldUpdateStartIndex = i == _startIndex
      let lastValidIndex = _base.index(before: i)
      let newEndIndexOffset = _base.distance(from: i, to: _endIndex)
      let result = _base.remove(at: i)
      if shouldUpdateStartIndex {
        _startIndex = _base.index(after: lastValidIndex)
      }
      _endIndex = _base.index(lastValidIndex, offsetBy: newEndIndexOffset)
      return result
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 376)
  }

  public mutating func removeSubrange(_ bounds: Range<Index>) {
    // FIXME: swift-3-indexing-model: range check.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 389)
    if bounds.lowerBound == _base.startIndex {
      let newSliceCount: IndexDistance =
        count
        - _base.distance(from: bounds.lowerBound, to: bounds.upperBound)
      _base.removeSubrange(bounds)
      _startIndex = _base.startIndex
      _endIndex = _base.index(_startIndex, offsetBy: newSliceCount)
    } else {
      let shouldUpdateStartIndex = bounds.lowerBound == _startIndex
      let lastValidIndex = _base.index(before: bounds.lowerBound)
      let newEndIndexOffset =
        _base.distance(from: bounds.lowerBound, to: _endIndex)
        - _base.distance(from: bounds.lowerBound, to: bounds.upperBound)
        + 1
      _base.removeSubrange(bounds)
      if shouldUpdateStartIndex {
        _startIndex = _base.index(after: lastValidIndex)
      }
      _endIndex = _base.index(lastValidIndex, offsetBy: newEndIndexOffset)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 410)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 412)

  /// Creates a view into the given collection that allows access to elements
  /// within the specified range.
  ///
  /// It is unusual to need to call this method directly. Instead, create a
  /// slice of a collection by using the collection's range-based subscript or
  /// by using methods that return a subsequence.
  ///
  ///     let singleDigits = 0...9
  ///     let subSequence = singleDigits.dropFirst(5)
  ///     print(Array(subSequence))
  ///     // Prints "[5, 6, 7, 8, 9]"
  ///
  /// In this example, the expression `singleDigits.dropFirst(5))` is
  /// equivalent to calling this initializer with `singleDigits` and a
  /// range covering the last five items of `singleDigits.indices`.
  ///
  /// - Parameters:
  ///   - base: The collection to create a view into.
  ///   - bounds: The range of indices to allow access to in the new slice.
  public init(base: Base, bounds: Range<Index>) {
    self._base = base
    self._startIndex = bounds.lowerBound
    self._endIndex = bounds.upperBound
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 439)
  internal var _base: Base
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 443)

  /// The underlying collection of the slice.
  ///
  /// You can use a slice's `base` property to access its base collection. The
  /// following example declares `singleDigits`, a range of single digit
  /// integers, and then drops the first element to create a slice of that
  /// range, `singleNonZeroDigits`. The `base` property of the slice is equal
  /// to `singleDigits`.
  ///
  ///     let singleDigits = 0..<10
  ///     let singleNonZeroDigits = singleDigits.dropFirst()
  ///     // singleNonZeroDigits is a RandomAccessSlice<CountableRange<Int>>
  ///
  ///     print(singleNonZeroDigits.count)
  ///     // Prints "9"
  ///     prints(singleNonZeroDigits.base.count)
  ///     // Prints "10"
  ///     print(singleDigits == singleNonZeroDigits.base)
  ///     // Prints "true"
  public var base: Base {
    return _base
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Slice.swift.gyb", line: 470)

