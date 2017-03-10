// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Indices.swift.gyb", line: 1)
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

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Indices.swift.gyb", line: 21)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Indices.swift.gyb", line: 25)

// FIXME(ABI)#42 (Conditional Conformance): There should be just one default
// indices type that has conditional conformances to
// `BidirectionalCollection` and `RandomAccessCollection`.
// <rdar://problem/17144340>

/// A collection of indices for an arbitrary collection.
public struct DefaultIndices<
  Elements : _Indexable
  // FIXME(ABI)#43 (Recursive Protocol Constraints):
  // Elements : Collection
  // rdar://problem/20531108
> : Collection {

  // FIXME(compiler limitation): this typealias should be inferred.
  public typealias Index = Elements.Index

  internal init(
    _elements: Elements,
    startIndex: Elements.Index,
    endIndex: Elements.Index
  ) {
    self._elements = _elements
    self._startIndex = startIndex
    self._endIndex = endIndex
  }

  public var startIndex: Elements.Index {
    return _startIndex
  }

  public var endIndex: Elements.Index {
    return _endIndex
  }

  public subscript(i: Index) -> Elements.Index {
    // FIXME: swift-3-indexing-model: range check.
    return i
  }

  // FIXME(compiler limitation): this typealias should be inferred.
  public typealias SubSequence = DefaultIndices<Elements>

  public subscript(bounds: Range<Index>) -> DefaultIndices<Elements> {
    // FIXME: swift-3-indexing-model: range check.
    return DefaultIndices(
      _elements: _elements,
      startIndex: bounds.lowerBound,
      endIndex: bounds.upperBound)
  }

  public func index(after i: Index) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _elements.index(after: i)
  }

  public func formIndex(after i: inout Index) {
    // FIXME: swift-3-indexing-model: range check.
    _elements.formIndex(after: &i)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Indices.swift.gyb", line: 97)

  // FIXME(compiler limitation): this typealias should be inferred.
  public typealias Indices = DefaultIndices<Elements>

  public var indices: Indices {
    return self
  }

  internal var _elements: Elements
  internal var _startIndex: Elements.Index
  internal var _endIndex: Elements.Index
}

extension Collection
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Indices.swift.gyb", line: 112)
  where Indices == DefaultIndices<Self>
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Indices.swift.gyb", line: 114)
{
  /// The indices that are valid for subscripting the collection, in ascending
  /// order.
  ///
  /// A collection's `indices` property can hold a strong reference to the
  /// collection itself, causing the collection to be non-uniquely referenced.
  /// If you mutate the collection while iterating over its indices, a strong
  /// reference can cause an unexpected copy of the collection. To avoid the
  /// unexpected copy, use the `index(after:)` method starting with
  /// `startIndex` to produce indices instead.
  ///
  ///     var c = MyFancyCollection([10, 20, 30, 40, 50])
  ///     var i = c.startIndex
  ///     while i != c.endIndex {
  ///         c[i] /= 5
  ///         i = c.index(after: i)
  ///     }
  ///     // c == MyFancyCollection([2, 4, 6, 8, 10])
  public var indices: DefaultIndices<Self> {
    return DefaultIndices(
      _elements: self,
      startIndex: self.startIndex,
      endIndex: self.endIndex)
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Indices.swift.gyb", line: 25)

// FIXME(ABI)#42 (Conditional Conformance): There should be just one default
// indices type that has conditional conformances to
// `BidirectionalCollection` and `RandomAccessCollection`.
// <rdar://problem/17144340>

/// A collection of indices for an arbitrary bidirectional collection.
public struct DefaultBidirectionalIndices<
  Elements : _BidirectionalIndexable
  // FIXME(ABI)#43 (Recursive Protocol Constraints):
  // Elements : Collection
  // rdar://problem/20531108
> : BidirectionalCollection {

  // FIXME(compiler limitation): this typealias should be inferred.
  public typealias Index = Elements.Index

  internal init(
    _elements: Elements,
    startIndex: Elements.Index,
    endIndex: Elements.Index
  ) {
    self._elements = _elements
    self._startIndex = startIndex
    self._endIndex = endIndex
  }

  public var startIndex: Elements.Index {
    return _startIndex
  }

  public var endIndex: Elements.Index {
    return _endIndex
  }

  public subscript(i: Index) -> Elements.Index {
    // FIXME: swift-3-indexing-model: range check.
    return i
  }

  // FIXME(compiler limitation): this typealias should be inferred.
  public typealias SubSequence = DefaultBidirectionalIndices<Elements>

  public subscript(bounds: Range<Index>) -> DefaultBidirectionalIndices<Elements> {
    // FIXME: swift-3-indexing-model: range check.
    return DefaultBidirectionalIndices(
      _elements: _elements,
      startIndex: bounds.lowerBound,
      endIndex: bounds.upperBound)
  }

  public func index(after i: Index) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _elements.index(after: i)
  }

  public func formIndex(after i: inout Index) {
    // FIXME: swift-3-indexing-model: range check.
    _elements.formIndex(after: &i)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Indices.swift.gyb", line: 87)
  public func index(before i: Index) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _elements.index(before: i)
  }

  public func formIndex(before i: inout Index) {
    // FIXME: swift-3-indexing-model: range check.
    _elements.formIndex(before: &i)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Indices.swift.gyb", line: 97)

  // FIXME(compiler limitation): this typealias should be inferred.
  public typealias Indices = DefaultBidirectionalIndices<Elements>

  public var indices: Indices {
    return self
  }

  internal var _elements: Elements
  internal var _startIndex: Elements.Index
  internal var _endIndex: Elements.Index
}

extension BidirectionalCollection
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Indices.swift.gyb", line: 112)
  where Indices == DefaultBidirectionalIndices<Self>
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Indices.swift.gyb", line: 114)
{
  /// The indices that are valid for subscripting the collection, in ascending
  /// order.
  ///
  /// A collection's `indices` property can hold a strong reference to the
  /// collection itself, causing the collection to be non-uniquely referenced.
  /// If you mutate the collection while iterating over its indices, a strong
  /// reference can cause an unexpected copy of the collection. To avoid the
  /// unexpected copy, use the `index(after:)` method starting with
  /// `startIndex` to produce indices instead.
  ///
  ///     var c = MyFancyCollection([10, 20, 30, 40, 50])
  ///     var i = c.startIndex
  ///     while i != c.endIndex {
  ///         c[i] /= 5
  ///         i = c.index(after: i)
  ///     }
  ///     // c == MyFancyCollection([2, 4, 6, 8, 10])
  public var indices: DefaultBidirectionalIndices<Self> {
    return DefaultBidirectionalIndices(
      _elements: self,
      startIndex: self.startIndex,
      endIndex: self.endIndex)
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Indices.swift.gyb", line: 25)

// FIXME(ABI)#42 (Conditional Conformance): There should be just one default
// indices type that has conditional conformances to
// `BidirectionalCollection` and `RandomAccessCollection`.
// <rdar://problem/17144340>

/// A collection of indices for an arbitrary random-access collection.
public struct DefaultRandomAccessIndices<
  Elements : _RandomAccessIndexable
  // FIXME(ABI)#43 (Recursive Protocol Constraints):
  // Elements : Collection
  // rdar://problem/20531108
> : RandomAccessCollection {

  // FIXME(compiler limitation): this typealias should be inferred.
  public typealias Index = Elements.Index

  internal init(
    _elements: Elements,
    startIndex: Elements.Index,
    endIndex: Elements.Index
  ) {
    self._elements = _elements
    self._startIndex = startIndex
    self._endIndex = endIndex
  }

  public var startIndex: Elements.Index {
    return _startIndex
  }

  public var endIndex: Elements.Index {
    return _endIndex
  }

  public subscript(i: Index) -> Elements.Index {
    // FIXME: swift-3-indexing-model: range check.
    return i
  }

  // FIXME(compiler limitation): this typealias should be inferred.
  public typealias SubSequence = DefaultRandomAccessIndices<Elements>

  public subscript(bounds: Range<Index>) -> DefaultRandomAccessIndices<Elements> {
    // FIXME: swift-3-indexing-model: range check.
    return DefaultRandomAccessIndices(
      _elements: _elements,
      startIndex: bounds.lowerBound,
      endIndex: bounds.upperBound)
  }

  public func index(after i: Index) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _elements.index(after: i)
  }

  public func formIndex(after i: inout Index) {
    // FIXME: swift-3-indexing-model: range check.
    _elements.formIndex(after: &i)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Indices.swift.gyb", line: 87)
  public func index(before i: Index) -> Index {
    // FIXME: swift-3-indexing-model: range check.
    return _elements.index(before: i)
  }

  public func formIndex(before i: inout Index) {
    // FIXME: swift-3-indexing-model: range check.
    _elements.formIndex(before: &i)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Indices.swift.gyb", line: 97)

  // FIXME(compiler limitation): this typealias should be inferred.
  public typealias Indices = DefaultRandomAccessIndices<Elements>

  public var indices: Indices {
    return self
  }

  internal var _elements: Elements
  internal var _startIndex: Elements.Index
  internal var _endIndex: Elements.Index
}

extension RandomAccessCollection
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Indices.swift.gyb", line: 114)
{
  /// The indices that are valid for subscripting the collection, in ascending
  /// order.
  ///
  /// A collection's `indices` property can hold a strong reference to the
  /// collection itself, causing the collection to be non-uniquely referenced.
  /// If you mutate the collection while iterating over its indices, a strong
  /// reference can cause an unexpected copy of the collection. To avoid the
  /// unexpected copy, use the `index(after:)` method starting with
  /// `startIndex` to produce indices instead.
  ///
  ///     var c = MyFancyCollection([10, 20, 30, 40, 50])
  ///     var i = c.startIndex
  ///     while i != c.endIndex {
  ///         c[i] /= 5
  ///         i = c.index(after: i)
  ///     }
  ///     // c == MyFancyCollection([2, 4, 6, 8, 10])
  public var indices: DefaultRandomAccessIndices<Self> {
    return DefaultRandomAccessIndices(
      _elements: self,
      startIndex: self.startIndex,
      endIndex: self.endIndex)
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Indices.swift.gyb", line: 141)

// Local Variables:
// eval: (read-only-mode 1)
// End:
