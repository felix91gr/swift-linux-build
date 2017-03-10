// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Map.swift.gyb", line: 1)
//===--- Map.swift.gyb - Lazily map over a Sequence -----------*- swift -*-===//
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

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Map.swift.gyb", line: 20)

/// The `IteratorProtocol` used by `MapSequence` and `MapCollection`.
/// Produces each element by passing the output of the `Base`
/// `IteratorProtocol` through a transform function returning `Element`.
public struct LazyMapIterator<
  Base : IteratorProtocol, Element
> : IteratorProtocol, Sequence {
  /// Advances to the next element and returns it, or `nil` if no next element
  /// exists.
  ///
  /// Once `nil` has been returned, all subsequent calls return `nil`.
  ///
  /// - Precondition: `next()` has not been applied to a copy of `self`
  ///   since the copy was made.
  public mutating func next() -> Element? {
    return _base.next().map(_transform)
  }

  public var base: Base { return _base }

  internal var _base: Base
  internal let _transform: (Base.Element) -> Element
}

/// A `Sequence` whose elements consist of those in a `Base`
/// `Sequence` passed through a transform function returning `Element`.
/// These elements are computed lazily, each time they're read, by
/// calling the transform function on a base element.
public struct LazyMapSequence<Base : Sequence, Element>
  : LazySequenceProtocol {

  public typealias Elements = LazyMapSequence

  /// Returns an iterator over the elements of this sequence.
  ///
  /// - Complexity: O(1).
  public func makeIterator() -> LazyMapIterator<Base.Iterator, Element> {
    return LazyMapIterator(_base: _base.makeIterator(), _transform: _transform)
  }

  /// Returns a value less than or equal to the number of elements in
  /// `self`, **nondestructively**.
  ///
  /// - Complexity: O(*n*)
  public var underestimatedCount: Int {
    return _base.underestimatedCount
  }

  /// Creates an instance with elements `transform(x)` for each element
  /// `x` of base.
  internal init(_base: Base, transform: @escaping (Base.Iterator.Element) -> Element) {
    self._base = _base
    self._transform = transform
  }

  internal var _base: Base
  internal let _transform: (Base.Iterator.Element) -> Element
}

//===--- Collections ------------------------------------------------------===//

// FIXME(ABI)#45 (Conditional Conformance): `LazyMap*Collection` types should be
// collapsed into one `LazyMapCollection` using conditional conformances.
// Maybe even combined with `LazyMapSequence`.
// rdar://problem/17144340

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Map.swift.gyb", line: 89)

/// A `Collection` whose elements consist of those in a `Base`
/// `Collection` passed through a transform function returning `Element`.
/// These elements are computed lazily, each time they're read, by
/// calling the transform function on a base element.
public struct LazyMapCollection<
  Base : Collection, Element
> : LazyCollectionProtocol, Collection {

  // FIXME(compiler limitation): should be inferable.
  public typealias Index = Base.Index

  public var startIndex: Base.Index { return _base.startIndex }
  public var endIndex: Base.Index { return _base.endIndex }

  public func index(after i: Index) -> Index { return _base.index(after: i) }

  public func formIndex(after i: inout Index) {
    _base.formIndex(after: &i)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Map.swift.gyb", line: 117)

  /// Accesses the element at `position`.
  ///
  /// - Precondition: `position` is a valid position in `self` and
  ///   `position != endIndex`.
  public subscript(position: Base.Index) -> Element {
    return _transform(_base[position])
  }

  public subscript(bounds: Range<Base.Index>) -> Slice<LazyMapCollection> {
    return Slice(base: self, bounds: bounds)
  }

  // FIXME(ABI)#46 (Associated Types with where clauses): we actually want to add:
  //
  //   typealias SubSequence = LazyMapCollection<Base.SubSequence, Element>
  //
  // so that all slicing optimizations of the base collection can kick in.
  //
  // We can't do that right now though, because that would force a lot of
  // constraints on `Base.SubSequence`, limiting the possible contexts where
  // the `.lazy.map` API can be used.

  public typealias IndexDistance = Base.IndexDistance

  public typealias Indices = Base.Indices

  public var indices: Indices {
    return _base.indices
  }

  /// A Boolean value indicating whether the collection is empty.
  public var isEmpty: Bool { return _base.isEmpty }

  /// The number of elements in the collection.
  ///
  /// To check whether the collection is empty, use its `isEmpty` property
  /// instead of comparing `count` to zero. Unless the collection guarantees
  /// random-access performance, calculating `count` can be an O(*n*)
  /// operation.
  ///
  /// - Complexity: O(1) if `Index` conforms to `RandomAccessIndex`; O(*n*)
  ///   otherwise.
  public var count: Base.IndexDistance {
    return _base.count
  }

  public var first: Element? { return _base.first.map(_transform) }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Map.swift.gyb", line: 169)

  public func index(_ i: Index, offsetBy n: Base.IndexDistance) -> Index {
    return _base.index(i, offsetBy: n)
  }

  public func index(
    _ i: Index, offsetBy n: Base.IndexDistance, limitedBy limit: Index
  ) -> Index? {
    return _base.index(i, offsetBy: n, limitedBy: limit)
  }

  public func distance(from start: Index, to end: Index) -> Base.IndexDistance {
    return _base.distance(from: start, to: end)
  }

  /// Returns an iterator over the elements of this sequence.
  ///
  /// - Complexity: O(1).
  public func makeIterator() -> LazyMapIterator<Base.Iterator, Element> {
    return LazyMapIterator(_base: _base.makeIterator(), _transform: _transform)
  }

  public var underestimatedCount: Int {
    return _base.underestimatedCount
  }

  /// Create an instance with elements `transform(x)` for each element
  /// `x` of base.
  internal init(_base: Base, transform: @escaping (Base.Iterator.Element) -> Element) {
    self._base = _base
    self._transform = transform
  }

  internal var _base: Base
  internal let _transform: (Base.Iterator.Element) -> Element
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Map.swift.gyb", line: 89)

/// A `Collection` whose elements consist of those in a `Base`
/// `Collection` passed through a transform function returning `Element`.
/// These elements are computed lazily, each time they're read, by
/// calling the transform function on a base element.
public struct LazyMapBidirectionalCollection<
  Base : BidirectionalCollection, Element
> : LazyCollectionProtocol, BidirectionalCollection {

  // FIXME(compiler limitation): should be inferable.
  public typealias Index = Base.Index

  public var startIndex: Base.Index { return _base.startIndex }
  public var endIndex: Base.Index { return _base.endIndex }

  public func index(after i: Index) -> Index { return _base.index(after: i) }

  public func formIndex(after i: inout Index) {
    _base.formIndex(after: &i)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Map.swift.gyb", line: 111)
  public func index(before i: Index) -> Index { return _base.index(before: i) }

  public func formIndex(before i: inout Index) {
    _base.formIndex(before: &i)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Map.swift.gyb", line: 117)

  /// Accesses the element at `position`.
  ///
  /// - Precondition: `position` is a valid position in `self` and
  ///   `position != endIndex`.
  public subscript(position: Base.Index) -> Element {
    return _transform(_base[position])
  }

  public subscript(bounds: Range<Base.Index>) -> BidirectionalSlice<LazyMapBidirectionalCollection> {
    return BidirectionalSlice(base: self, bounds: bounds)
  }

  // FIXME(ABI)#46 (Associated Types with where clauses): we actually want to add:
  //
  //   typealias SubSequence = LazyMapBidirectionalCollection<Base.SubSequence, Element>
  //
  // so that all slicing optimizations of the base collection can kick in.
  //
  // We can't do that right now though, because that would force a lot of
  // constraints on `Base.SubSequence`, limiting the possible contexts where
  // the `.lazy.map` API can be used.

  public typealias IndexDistance = Base.IndexDistance

  public typealias Indices = Base.Indices

  public var indices: Indices {
    return _base.indices
  }

  /// A Boolean value indicating whether the collection is empty.
  public var isEmpty: Bool { return _base.isEmpty }

  /// The number of elements in the collection.
  ///
  /// To check whether the collection is empty, use its `isEmpty` property
  /// instead of comparing `count` to zero. Unless the collection guarantees
  /// random-access performance, calculating `count` can be an O(*n*)
  /// operation.
  ///
  /// - Complexity: O(1) if `Index` conforms to `RandomAccessIndex`; O(*n*)
  ///   otherwise.
  public var count: Base.IndexDistance {
    return _base.count
  }

  public var first: Element? { return _base.first.map(_transform) }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Map.swift.gyb", line: 167)
  public var last: Element? { return _base.last.map(_transform) }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Map.swift.gyb", line: 169)

  public func index(_ i: Index, offsetBy n: Base.IndexDistance) -> Index {
    return _base.index(i, offsetBy: n)
  }

  public func index(
    _ i: Index, offsetBy n: Base.IndexDistance, limitedBy limit: Index
  ) -> Index? {
    return _base.index(i, offsetBy: n, limitedBy: limit)
  }

  public func distance(from start: Index, to end: Index) -> Base.IndexDistance {
    return _base.distance(from: start, to: end)
  }

  /// Returns an iterator over the elements of this sequence.
  ///
  /// - Complexity: O(1).
  public func makeIterator() -> LazyMapIterator<Base.Iterator, Element> {
    return LazyMapIterator(_base: _base.makeIterator(), _transform: _transform)
  }

  public var underestimatedCount: Int {
    return _base.underestimatedCount
  }

  /// Create an instance with elements `transform(x)` for each element
  /// `x` of base.
  internal init(_base: Base, transform: @escaping (Base.Iterator.Element) -> Element) {
    self._base = _base
    self._transform = transform
  }

  internal var _base: Base
  internal let _transform: (Base.Iterator.Element) -> Element
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Map.swift.gyb", line: 89)

/// A `Collection` whose elements consist of those in a `Base`
/// `Collection` passed through a transform function returning `Element`.
/// These elements are computed lazily, each time they're read, by
/// calling the transform function on a base element.
public struct LazyMapRandomAccessCollection<
  Base : RandomAccessCollection, Element
> : LazyCollectionProtocol, RandomAccessCollection {

  // FIXME(compiler limitation): should be inferable.
  public typealias Index = Base.Index

  public var startIndex: Base.Index { return _base.startIndex }
  public var endIndex: Base.Index { return _base.endIndex }

  public func index(after i: Index) -> Index { return _base.index(after: i) }

  public func formIndex(after i: inout Index) {
    _base.formIndex(after: &i)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Map.swift.gyb", line: 111)
  public func index(before i: Index) -> Index { return _base.index(before: i) }

  public func formIndex(before i: inout Index) {
    _base.formIndex(before: &i)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Map.swift.gyb", line: 117)

  /// Accesses the element at `position`.
  ///
  /// - Precondition: `position` is a valid position in `self` and
  ///   `position != endIndex`.
  public subscript(position: Base.Index) -> Element {
    return _transform(_base[position])
  }

  public subscript(bounds: Range<Base.Index>) -> RandomAccessSlice<LazyMapRandomAccessCollection> {
    return RandomAccessSlice(base: self, bounds: bounds)
  }

  // FIXME(ABI)#46 (Associated Types with where clauses): we actually want to add:
  //
  //   typealias SubSequence = LazyMapRandomAccessCollection<Base.SubSequence, Element>
  //
  // so that all slicing optimizations of the base collection can kick in.
  //
  // We can't do that right now though, because that would force a lot of
  // constraints on `Base.SubSequence`, limiting the possible contexts where
  // the `.lazy.map` API can be used.

  public typealias IndexDistance = Base.IndexDistance

  public typealias Indices = Base.Indices

  public var indices: Indices {
    return _base.indices
  }

  /// A Boolean value indicating whether the collection is empty.
  public var isEmpty: Bool { return _base.isEmpty }

  /// The number of elements in the collection.
  ///
  /// To check whether the collection is empty, use its `isEmpty` property
  /// instead of comparing `count` to zero. Unless the collection guarantees
  /// random-access performance, calculating `count` can be an O(*n*)
  /// operation.
  ///
  /// - Complexity: O(1) if `Index` conforms to `RandomAccessIndex`; O(*n*)
  ///   otherwise.
  public var count: Base.IndexDistance {
    return _base.count
  }

  public var first: Element? { return _base.first.map(_transform) }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Map.swift.gyb", line: 167)
  public var last: Element? { return _base.last.map(_transform) }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Map.swift.gyb", line: 169)

  public func index(_ i: Index, offsetBy n: Base.IndexDistance) -> Index {
    return _base.index(i, offsetBy: n)
  }

  public func index(
    _ i: Index, offsetBy n: Base.IndexDistance, limitedBy limit: Index
  ) -> Index? {
    return _base.index(i, offsetBy: n, limitedBy: limit)
  }

  public func distance(from start: Index, to end: Index) -> Base.IndexDistance {
    return _base.distance(from: start, to: end)
  }

  /// Returns an iterator over the elements of this sequence.
  ///
  /// - Complexity: O(1).
  public func makeIterator() -> LazyMapIterator<Base.Iterator, Element> {
    return LazyMapIterator(_base: _base.makeIterator(), _transform: _transform)
  }

  public var underestimatedCount: Int {
    return _base.underestimatedCount
  }

  /// Create an instance with elements `transform(x)` for each element
  /// `x` of base.
  internal init(_base: Base, transform: @escaping (Base.Iterator.Element) -> Element) {
    self._base = _base
    self._transform = transform
  }

  internal var _base: Base
  internal let _transform: (Base.Iterator.Element) -> Element
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Map.swift.gyb", line: 207)

//===--- Support for s.lazy -----------------------------------------------===//

extension LazySequenceProtocol {
  /// Returns a `LazyMapSequence` over this `Sequence`.  The elements of
  /// the result are computed lazily, each time they are read, by
  /// calling `transform` function on a base element.
  public func map<U>(
    _ transform: @escaping (Elements.Iterator.Element) -> U
  ) -> LazyMapSequence<Self.Elements, U> {
    return LazyMapSequence(_base: self.elements, transform: transform)
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Map.swift.gyb", line: 222)

extension LazyCollectionProtocol
  where
  Self : Collection,
  Elements : Collection
{
  /// Returns a `LazyMapCollection` over this `Collection`.  The elements of
  /// the result are computed lazily, each time they are read, by
  /// calling `transform` function on a base element.
  public func map<U>(
    _ transform: @escaping (Elements.Iterator.Element) -> U
  ) -> LazyMapCollection<Self.Elements, U> {
    return LazyMapCollection(
      _base: self.elements,
      transform: transform)
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Map.swift.gyb", line: 222)

extension LazyCollectionProtocol
  where
  Self : BidirectionalCollection,
  Elements : BidirectionalCollection
{
  /// Returns a `LazyMapCollection` over this `Collection`.  The elements of
  /// the result are computed lazily, each time they are read, by
  /// calling `transform` function on a base element.
  public func map<U>(
    _ transform: @escaping (Elements.Iterator.Element) -> U
  ) -> LazyMapBidirectionalCollection<Self.Elements, U> {
    return LazyMapBidirectionalCollection(
      _base: self.elements,
      transform: transform)
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Map.swift.gyb", line: 222)

extension LazyCollectionProtocol
  where
  Self : RandomAccessCollection,
  Elements : RandomAccessCollection
{
  /// Returns a `LazyMapCollection` over this `Collection`.  The elements of
  /// the result are computed lazily, each time they are read, by
  /// calling `transform` function on a base element.
  public func map<U>(
    _ transform: @escaping (Elements.Iterator.Element) -> U
  ) -> LazyMapRandomAccessCollection<Self.Elements, U> {
    return LazyMapRandomAccessCollection(
      _base: self.elements,
      transform: transform)
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Map.swift.gyb", line: 241)

@available(*, unavailable, renamed: "LazyMapIterator")
public struct LazyMapGenerator<Base : IteratorProtocol, Element> {}

extension LazyMapSequence {
  @available(*, unavailable, message: "use '.lazy.map' on the sequence")
  public init(_ base: Base, transform: (Base.Iterator.Element) -> Element) {
    Builtin.unreachable()
  }
}

extension LazyMapCollection {
  @available(*, unavailable, message: "use '.lazy.map' on the collection")
  public init(_ base: Base, transform: (Base.Iterator.Element) -> Element) {
    Builtin.unreachable()
  }
}

// Local Variables:
// eval: (read-only-mode 1)
// End:
