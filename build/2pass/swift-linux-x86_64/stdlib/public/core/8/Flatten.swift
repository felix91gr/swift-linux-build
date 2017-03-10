// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Flatten.swift.gyb", line: 1)
//===--- Flatten.swift.gyb ------------------------------------*- swift -*-===//
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

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Flatten.swift.gyb", line: 20)

/// An iterator that produces the elements contained in each segment
/// produced by some `Base` Iterator.
///
/// The elements traversed are the concatenation of those in each
/// segment produced by the base iterator.
///
/// - Note: This is the `IteratorProtocol` used by `FlattenSequence`,
///   `FlattenCollection`, and `BidirectionalFlattenCollection`.
public struct FlattenIterator<Base : IteratorProtocol> : IteratorProtocol, Sequence
  where Base.Element : Sequence {

  /// Construct around a `base` iterator.
  internal init(_base: Base) {
    self._base = _base
  }

  /// Advances to the next element and returns it, or `nil` if no next element
  /// exists.
  ///
  /// Once `nil` has been returned, all subsequent calls return `nil`.
  ///
  /// - Precondition: `next()` has not been applied to a copy of `self`
  ///   since the copy was made.
  public mutating func next() -> Base.Element.Iterator.Element? {
    repeat {
      if _fastPath(_inner != nil) {
        let ret = _inner!.next()
        if _fastPath(ret != nil) {
          return ret
        }
      }
      let s = _base.next()
      if _slowPath(s == nil) {
        return nil
      }
      _inner = s!.makeIterator()
    }
    while true
  }

  internal var _base: Base
  internal var _inner: Base.Element.Iterator?
}

/// A sequence consisting of all the elements contained in each segment
/// contained in some `Base` sequence.
///
/// The elements of this view are a concatenation of the elements of
/// each sequence in the base.
///
/// The `joined` method is always lazy, but does not implicitly
/// confer laziness on algorithms applied to its result.  In other
/// words, for ordinary sequences `s`:
///
/// * `s.joined()` does not create new storage
/// * `s.joined().map(f)` maps eagerly and returns a new array
/// * `s.lazy.joined().map(f)` maps lazily and returns a `LazyMapSequence`
///
/// - See also: `FlattenCollection`
public struct FlattenSequence<Base : Sequence> : Sequence
  where Base.Iterator.Element : Sequence {

  /// Creates a concatenation of the elements of the elements of `base`.
  ///
  /// - Complexity: O(1)
  internal init(_base: Base) {
    self._base = _base
  }

  /// Returns an iterator over the elements of this sequence.
  ///
  /// - Complexity: O(1).
  public func makeIterator() -> FlattenIterator<Base.Iterator> {
    return FlattenIterator(_base: _base.makeIterator())
  }

  internal var _base: Base
}

extension Sequence where Iterator.Element : Sequence {
  /// Returns the elements of this sequence of sequences, concatenated.
  ///
  /// In this example, an array of three ranges is flattened so that the
  /// elements of each range can be iterated in turn.
  ///
  ///     let ranges = [0..<3, 8..<10, 15..<17]
  ///
  ///     // A for-in loop over 'ranges' accesses each range:
  ///     for range in ranges {
  ///       print(range)
  ///     }
  ///     // Prints "0..<3"
  ///     // Prints "8..<10"
  ///     // Prints "15..<17"
  ///
  ///     // Use 'joined()' to access each element of each range:
  ///     for index in ranges.joined() {
  ///         print(index, terminator: " ")
  ///     }
  ///     // Prints: "0 1 2 8 9 15 16"
  ///
  /// - Returns: A flattened view of the elements of this
  ///   sequence of sequences.
  ///
  /// - SeeAlso: `flatMap(_:)`, `joined(separator:)`
  public func joined() -> FlattenSequence<Self> {
    return FlattenSequence(_base: self)
  }

  @available(*, unavailable, renamed: "joined()")
  public func flatten() -> FlattenSequence<Self> {
    Builtin.unreachable()
  }
}

extension LazySequenceProtocol
  where
  Elements.Iterator.Element == Iterator.Element,
  Iterator.Element : Sequence {

  /// Returns a lazy sequence that concatenates the elements of this sequence of
  /// sequences.
  public func joined() -> LazySequence<
    FlattenSequence<Elements>
  > {
    return FlattenSequence(_base: elements).lazy
  }

  @available(*, unavailable, renamed: "joined()")
  public func flatten() -> LazySequence<FlattenSequence<Elements>> {
    Builtin.unreachable()
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Flatten.swift.gyb", line: 163)
/// A position in a `FlattenCollection`.
public struct FlattenCollectionIndex<BaseElements>
  where
  BaseElements : Collection,
  BaseElements.Iterator.Element : Collection {

  internal init(
    _ _outer: BaseElements.Index,
    _ inner: BaseElements.Iterator.Element.Index?) {
    self._outer = _outer
    self._inner = inner
  }

  /// The position in the outer collection of collections.
  internal let _outer: BaseElements.Index

  /// The position in the inner collection at `base[_outer]`, or `nil` if
  /// `_outer == base.endIndex`.
  ///
  /// When `_inner != nil`, `_inner!` is a valid subscript of `base[_outer]`;
  /// when `_inner == nil`, `_outer == base.endIndex` and this index is
  /// `endIndex` of the `FlattenCollection`.
  internal let _inner: BaseElements.Iterator.Element.Index?
}

extension FlattenCollectionIndex : Comparable {
  public static func == (
    lhs: FlattenCollectionIndex<BaseElements>,
    rhs: FlattenCollectionIndex<BaseElements>
  ) -> Bool {
    return lhs._outer == rhs._outer && lhs._inner == rhs._inner
  }

  public static func < (
    lhs: FlattenCollectionIndex<BaseElements>,
    rhs: FlattenCollectionIndex<BaseElements>
  ) -> Bool {
    // FIXME: swift-3-indexing-model: tests.
    if lhs._outer != rhs._outer {
      return lhs._outer < rhs._outer
    }

    if let lhsInner = lhs._inner, let rhsInner = rhs._inner {
      return lhsInner < rhsInner
    }

    // When combined, the two conditions above guarantee that both
    // `_outer` indices are `_base.endIndex` and both `_inner` indices
    // are `nil`, since `_inner` is `nil` iff `_outer == base.endIndex`.
    _precondition(lhs._inner == nil && rhs._inner == nil)

    return false
  }
}

/// A flattened view of a base collection of collections.
///
/// The elements of this view are a concatenation of the elements of
/// each collection in the base.
///
/// The `joined` method is always lazy, but does not implicitly
/// confer laziness on algorithms applied to its result.  In other
/// words, for ordinary collections `c`:
///
/// * `c.joined()` does not create new storage
/// * `c.joined().map(f)` maps eagerly and returns a new array
/// * `c.lazy.joined().map(f)` maps lazily and returns a `LazyMapCollection`
///
/// - Note: The performance of accessing `startIndex`, `first`, any methods
///   that depend on `startIndex`, or of advancing a `FlattenCollectionIndex`
///   depends on how many empty subcollections are found in the base
///   collection, and may not offer the usual performance given by
///   `Collection` or `ForwardIndex`. Be aware, therefore, that
///   general operations on `FlattenCollection` instances may not have the
///   documented complexity.
///
/// - See also: `FlattenSequence`
public struct FlattenCollection<Base> : Collection
  where
  Base : Collection,
  Base.Iterator.Element : Collection {
  // FIXME: swift-3-indexing-model: check test coverage for collection.

  /// A type that represents a valid position in the collection.
  ///
  /// Valid indices consist of the position of every element and a
  /// "past the end" position that's not valid for use as a subscript.
  public typealias Index = FlattenCollectionIndex<Base>

  public typealias IndexDistance = Base.IndexDistance

  /// Creates a flattened view of `base`.
  public init(_ base: Base) {
    self._base = base
  }

  /// Returns an iterator over the elements of this sequence.
  ///
  /// - Complexity: O(1).
  public func makeIterator() -> FlattenIterator<Base.Iterator> {
    return FlattenIterator(_base: _base.makeIterator())
  }

  /// The position of the first element in a non-empty collection.
  ///
  /// In an empty collection, `startIndex == endIndex`.
  public var startIndex: Index {
    let end = _base.endIndex
    var outer = _base.startIndex
    while outer != end {
      let innerCollection = _base[outer]
      if !innerCollection.isEmpty {
        return FlattenCollectionIndex(outer, innerCollection.startIndex)
      }
      _base.formIndex(after: &outer)
    }

    return endIndex
  }

  /// The collection's "past the end" position.
  ///
  /// `endIndex` is not a valid argument to `subscript`, and is always
  /// reachable from `startIndex` by zero or more applications of
  /// `index(after:)`.
  public var endIndex: Index {
    return FlattenCollectionIndex(_base.endIndex, nil)
  }

  // TODO: swift-3-indexing-model - add docs
  public func index(after i: Index) -> Index {
    let innerCollection = _base[i._outer]
    let nextInner = innerCollection.index(after: i._inner!)
    if _fastPath(nextInner != innerCollection.endIndex) {
      return FlattenCollectionIndex(i._outer, nextInner)
    }

    var nextOuter = _base.index(after: i._outer)
    while nextOuter != _base.endIndex {
      let nextInnerCollection = _base[nextOuter]
      if !nextInnerCollection.isEmpty {
        return FlattenCollectionIndex(nextOuter, nextInnerCollection.startIndex)
      }
      _base.formIndex(after: &nextOuter)
    }

    return endIndex
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Flatten.swift.gyb", line: 331)

  /// Accesses the element at `position`.
  ///
  /// - Precondition: `position` is a valid position in `self` and
  ///   `position != endIndex`.
  public subscript(
    position: Index
  ) -> Base.Iterator.Element.Iterator.Element {
    return _base[position._outer][position._inner!]
  }

  public subscript(bounds: Range<Index>)
    -> Slice<FlattenCollection> {
    return Slice(base: self, bounds: bounds)
  }

  // To return any estimate of the number of elements, we have to start
  // evaluating the collections.  That is a bad default for `flatMap()`, so
  // just return zero.
  public var underestimatedCount: Int { return 0 }

  public func _copyToContiguousArray()
    -> ContiguousArray<Base.Iterator.Element.Iterator.Element> {

    // The default implementation of `_copyToContiguousArray` queries the
    // `count` property, which materializes every inner collection.  This is a
    // bad default for `flatMap()`.  So we treat `self` as a sequence and only
    // rely on underestimated count.
    return _copySequenceToContiguousArray(self)
  }

  // TODO: swift-3-indexing-model - add docs
  public func forEach(
    _ body: (Base.Iterator.Element.Iterator.Element) throws -> Void
  ) rethrows {
    // FIXME: swift-3-indexing-model: tests.
    for innerCollection in _base {
      try innerCollection.forEach(body)
    }
  }

  // FIXME(performance): swift-3-indexing-model: add custom advance/distance
  // methods that skip over inner collections when random-access

  internal var _base: Base
}

extension Collection
  where Iterator.Element : Collection {
  /// Returns the elements of this collection of collections, concatenated.
  ///
  /// In this example, an array of three ranges is flattened so that the
  /// elements of each range can be iterated in turn.
  ///
  ///     let ranges = [0..<3, 8..<10, 15..<17]
  ///
  ///     // A for-in loop over 'ranges' accesses each range:
  ///     for range in ranges {
  ///       print(range)
  ///     }
  ///     // Prints "0..<3"
  ///     // Prints "8..<10"
  ///     // Prints "15..<17"
  ///
  ///     // Use 'joined()' to access each element of each range:
  ///     for index in ranges.joined() {
  ///         print(index, terminator: " ")
  ///     }
  ///     // Prints: "0 1 2 8 9 15 16"
  ///
  /// - Returns: A flattened view of the elements of this
  ///   collection of collections.
  ///
  /// - SeeAlso: `flatMap(_:)`, `joined(separator:)`
  public func joined() -> FlattenCollection<Self> {
    return FlattenCollection(self)
  }

  @available(*, unavailable, renamed: "joined()")
  public func flatten() -> FlattenCollection<Self> {
    Builtin.unreachable()
  }
}

extension LazyCollectionProtocol
  where
  Self : Collection,
  Elements : Collection,
  Iterator.Element : Collection,
  Elements.Iterator.Element : Collection,
  Iterator.Element == Elements.Iterator.Element {
  /// A concatenation of the elements of `self`.
  public func joined() -> LazyCollection<FlattenCollection<Elements>> {
    return FlattenCollection(elements).lazy
  }

  @available(*, unavailable, renamed: "joined()")
  public func flatten() -> LazyCollection<FlattenCollection<Elements>> {
    Builtin.unreachable()
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Flatten.swift.gyb", line: 163)
/// A position in a `FlattenBidirectionalCollection`.
public struct FlattenBidirectionalCollectionIndex<BaseElements>
  where
  BaseElements : BidirectionalCollection,
  BaseElements.Iterator.Element : BidirectionalCollection {

  internal init(
    _ _outer: BaseElements.Index,
    _ inner: BaseElements.Iterator.Element.Index?) {
    self._outer = _outer
    self._inner = inner
  }

  /// The position in the outer collection of collections.
  internal let _outer: BaseElements.Index

  /// The position in the inner collection at `base[_outer]`, or `nil` if
  /// `_outer == base.endIndex`.
  ///
  /// When `_inner != nil`, `_inner!` is a valid subscript of `base[_outer]`;
  /// when `_inner == nil`, `_outer == base.endIndex` and this index is
  /// `endIndex` of the `FlattenBidirectionalCollection`.
  internal let _inner: BaseElements.Iterator.Element.Index?
}

extension FlattenBidirectionalCollectionIndex : Comparable {
  public static func == (
    lhs: FlattenBidirectionalCollectionIndex<BaseElements>,
    rhs: FlattenBidirectionalCollectionIndex<BaseElements>
  ) -> Bool {
    return lhs._outer == rhs._outer && lhs._inner == rhs._inner
  }

  public static func < (
    lhs: FlattenBidirectionalCollectionIndex<BaseElements>,
    rhs: FlattenBidirectionalCollectionIndex<BaseElements>
  ) -> Bool {
    // FIXME: swift-3-indexing-model: tests.
    if lhs._outer != rhs._outer {
      return lhs._outer < rhs._outer
    }

    if let lhsInner = lhs._inner, let rhsInner = rhs._inner {
      return lhsInner < rhsInner
    }

    // When combined, the two conditions above guarantee that both
    // `_outer` indices are `_base.endIndex` and both `_inner` indices
    // are `nil`, since `_inner` is `nil` iff `_outer == base.endIndex`.
    _precondition(lhs._inner == nil && rhs._inner == nil)

    return false
  }
}

/// A flattened view of a base collection of collections.
///
/// The elements of this view are a concatenation of the elements of
/// each collection in the base.
///
/// The `joined` method is always lazy, but does not implicitly
/// confer laziness on algorithms applied to its result.  In other
/// words, for ordinary collections `c`:
///
/// * `c.joined()` does not create new storage
/// * `c.joined().map(f)` maps eagerly and returns a new array
/// * `c.lazy.joined().map(f)` maps lazily and returns a `LazyMapCollection`
///
/// - Note: The performance of accessing `startIndex`, `first`, any methods
///   that depend on `startIndex`, or of advancing a `FlattenBidirectionalCollectionIndex`
///   depends on how many empty subcollections are found in the base
///   collection, and may not offer the usual performance given by
///   `Collection` or `BidirectionalIndex`. Be aware, therefore, that
///   general operations on `FlattenBidirectionalCollection` instances may not have the
///   documented complexity.
///
/// - See also: `FlattenSequence`
public struct FlattenBidirectionalCollection<Base> : BidirectionalCollection
  where
  Base : BidirectionalCollection,
  Base.Iterator.Element : BidirectionalCollection {
  // FIXME: swift-3-indexing-model: check test coverage for collection.

  /// A type that represents a valid position in the collection.
  ///
  /// Valid indices consist of the position of every element and a
  /// "past the end" position that's not valid for use as a subscript.
  public typealias Index = FlattenBidirectionalCollectionIndex<Base>

  public typealias IndexDistance = Base.IndexDistance

  /// Creates a flattened view of `base`.
  public init(_ base: Base) {
    self._base = base
  }

  /// Returns an iterator over the elements of this sequence.
  ///
  /// - Complexity: O(1).
  public func makeIterator() -> FlattenIterator<Base.Iterator> {
    return FlattenIterator(_base: _base.makeIterator())
  }

  /// The position of the first element in a non-empty collection.
  ///
  /// In an empty collection, `startIndex == endIndex`.
  public var startIndex: Index {
    let end = _base.endIndex
    var outer = _base.startIndex
    while outer != end {
      let innerCollection = _base[outer]
      if !innerCollection.isEmpty {
        return FlattenBidirectionalCollectionIndex(outer, innerCollection.startIndex)
      }
      _base.formIndex(after: &outer)
    }

    return endIndex
  }

  /// The collection's "past the end" position.
  ///
  /// `endIndex` is not a valid argument to `subscript`, and is always
  /// reachable from `startIndex` by zero or more applications of
  /// `index(after:)`.
  public var endIndex: Index {
    return FlattenBidirectionalCollectionIndex(_base.endIndex, nil)
  }

  // TODO: swift-3-indexing-model - add docs
  public func index(after i: Index) -> Index {
    let innerCollection = _base[i._outer]
    let nextInner = innerCollection.index(after: i._inner!)
    if _fastPath(nextInner != innerCollection.endIndex) {
      return FlattenBidirectionalCollectionIndex(i._outer, nextInner)
    }

    var nextOuter = _base.index(after: i._outer)
    while nextOuter != _base.endIndex {
      let nextInnerCollection = _base[nextOuter]
      if !nextInnerCollection.isEmpty {
        return FlattenBidirectionalCollectionIndex(nextOuter, nextInnerCollection.startIndex)
      }
      _base.formIndex(after: &nextOuter)
    }

    return endIndex
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Flatten.swift.gyb", line: 313)
  // TODO: swift-3-indexing-model - add docs
  public func index(before i: Index) -> Index {
    var prevOuter = i._outer
    if prevOuter == _base.endIndex {
      prevOuter = _base.index(before: prevOuter)
    }
    var prevInnerCollection = _base[prevOuter]
    var prevInner = i._inner ?? prevInnerCollection.endIndex

    while prevInner == prevInnerCollection.startIndex {
      prevOuter = _base.index(before: prevOuter)
      prevInnerCollection = _base[prevOuter]
      prevInner = prevInnerCollection.endIndex
    }

    return FlattenBidirectionalCollectionIndex(prevOuter, prevInnerCollection.index(before: prevInner))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Flatten.swift.gyb", line: 331)

  /// Accesses the element at `position`.
  ///
  /// - Precondition: `position` is a valid position in `self` and
  ///   `position != endIndex`.
  public subscript(
    position: Index
  ) -> Base.Iterator.Element.Iterator.Element {
    return _base[position._outer][position._inner!]
  }

  public subscript(bounds: Range<Index>)
    -> BidirectionalSlice<FlattenBidirectionalCollection> {
    return BidirectionalSlice(base: self, bounds: bounds)
  }

  // To return any estimate of the number of elements, we have to start
  // evaluating the collections.  That is a bad default for `flatMap()`, so
  // just return zero.
  public var underestimatedCount: Int { return 0 }

  public func _copyToContiguousArray()
    -> ContiguousArray<Base.Iterator.Element.Iterator.Element> {

    // The default implementation of `_copyToContiguousArray` queries the
    // `count` property, which materializes every inner collection.  This is a
    // bad default for `flatMap()`.  So we treat `self` as a sequence and only
    // rely on underestimated count.
    return _copySequenceToContiguousArray(self)
  }

  // TODO: swift-3-indexing-model - add docs
  public func forEach(
    _ body: (Base.Iterator.Element.Iterator.Element) throws -> Void
  ) rethrows {
    // FIXME: swift-3-indexing-model: tests.
    for innerCollection in _base {
      try innerCollection.forEach(body)
    }
  }

  // FIXME(performance): swift-3-indexing-model: add custom advance/distance
  // methods that skip over inner collections when random-access

  internal var _base: Base
}

extension BidirectionalCollection
  where Iterator.Element : BidirectionalCollection {
  /// Returns the elements of this collection of collections, concatenated.
  ///
  /// In this example, an array of three ranges is flattened so that the
  /// elements of each range can be iterated in turn.
  ///
  ///     let ranges = [0..<3, 8..<10, 15..<17]
  ///
  ///     // A for-in loop over 'ranges' accesses each range:
  ///     for range in ranges {
  ///       print(range)
  ///     }
  ///     // Prints "0..<3"
  ///     // Prints "8..<10"
  ///     // Prints "15..<17"
  ///
  ///     // Use 'joined()' to access each element of each range:
  ///     for index in ranges.joined() {
  ///         print(index, terminator: " ")
  ///     }
  ///     // Prints: "0 1 2 8 9 15 16"
  ///
  /// - Returns: A flattened view of the elements of this
  ///   collection of collections.
  ///
  /// - SeeAlso: `flatMap(_:)`, `joined(separator:)`
  public func joined() -> FlattenBidirectionalCollection<Self> {
    return FlattenBidirectionalCollection(self)
  }

  @available(*, unavailable, renamed: "joined()")
  public func flatten() -> FlattenBidirectionalCollection<Self> {
    Builtin.unreachable()
  }
}

extension LazyCollectionProtocol
  where
  Self : BidirectionalCollection,
  Elements : BidirectionalCollection,
  Iterator.Element : BidirectionalCollection,
  Elements.Iterator.Element : BidirectionalCollection,
  Iterator.Element == Elements.Iterator.Element {
  /// A concatenation of the elements of `self`.
  public func joined() -> LazyCollection<FlattenBidirectionalCollection<Elements>> {
    return FlattenBidirectionalCollection(elements).lazy
  }

  @available(*, unavailable, renamed: "joined()")
  public func flatten() -> LazyCollection<FlattenBidirectionalCollection<Elements>> {
    Builtin.unreachable()
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Flatten.swift.gyb", line: 434)

@available(*, unavailable, renamed: "FlattenIterator")
public struct FlattenGenerator<Base : IteratorProtocol>
  where Base.Element : Sequence {}

extension FlattenSequence {
  @available(*, unavailable, renamed: "makeIterator()")
  public func generate() -> FlattenIterator<Base.Iterator> {
    Builtin.unreachable()
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Flatten.swift.gyb", line: 447)
extension FlattenCollection {
  @available(*, unavailable, renamed: "getter:underestimatedCount()")
  public func underestimateCount() -> Int {
    Builtin.unreachable()
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Flatten.swift.gyb", line: 447)
extension FlattenBidirectionalCollection {
  @available(*, unavailable, renamed: "getter:underestimatedCount()")
  public func underestimateCount() -> Int {
    Builtin.unreachable()
  }
}
