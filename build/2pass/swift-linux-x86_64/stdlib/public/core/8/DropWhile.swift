// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/DropWhile.swift.gyb", line: 1)
//===--- DropWhile.swift.gyb - Lazy views for drop(while:) ----*- swift -*-===//
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

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/DropWhile.swift.gyb", line: 19)

//===--- Iterator & Sequence ----------------------------------------------===//

/// An iterator over the elements traversed by a base iterator that follow the
/// initial consecutive elements that satisfy a given predicate.
///
/// This is the associated iterator for the `LazyDropWhileSequence`,
/// `LazyDropWhileCollection`, and `LazyDropWhileBidirectionalCollection`
/// types.
public struct LazyDropWhileIterator<Base : IteratorProtocol> :
  IteratorProtocol, Sequence {

  public mutating func next() -> Base.Element? {
    // Once the predicate has failed for the first time, the base iterator
    // can be used for the rest of the elements.
    if _predicateHasFailed {
      return _base.next()
    }

    // Retrieve and discard elements from the base iterator until one fails
    // the predicate.
    while let nextElement = _base.next() {
      if !_predicate(nextElement) {
        _predicateHasFailed = true
        return nextElement
      }
    }
    return nil
  }

  internal init(_base: Base, predicate: @escaping (Base.Element) -> Bool) {
    self._base = _base
    self._predicate = predicate
  }

  internal var _predicateHasFailed = false
  internal var _base: Base
  internal let _predicate: (Base.Element) -> Bool
}

/// A sequence whose elements consist of the elements that follow the initial
/// consecutive elements of some base sequence that satisfy a given predicate.
public struct LazyDropWhileSequence<Base : Sequence> : LazySequenceProtocol {

  public typealias Elements = LazyDropWhileSequence

  /// Returns an iterator over the elements of this sequence.
  ///
  /// - Complexity: O(1).
  public func makeIterator() -> LazyDropWhileIterator<Base.Iterator> {
    return LazyDropWhileIterator(
      _base: _base.makeIterator(), predicate: _predicate)
  }

  /// Create an instance with elements `transform(x)` for each element
  /// `x` of base.
  internal init(_base: Base, predicate: @escaping (Base.Iterator.Element) -> Bool) {
    self._base = _base
    self._predicate = predicate
  }

  internal var _base: Base
  internal let _predicate: (Base.Iterator.Element) -> Bool
}

extension LazySequenceProtocol {
  /// Returns a lazy sequence that skips any initial elements that satisfy
  /// `predicate`.
  ///
  /// - Parameter predicate: A closure that takes an element of the sequence as
  ///   its argument and returns `true` if the element should be skipped or
  ///   `false` otherwise. Once `predicate` returns `false` it will not be
  ///   called again.
  public func drop(
    while predicate: @escaping (Elements.Iterator.Element) -> Bool
  ) -> LazyDropWhileSequence<Self.Elements> {
    return LazyDropWhileSequence(_base: self.elements, predicate: predicate)
  }
}

//===--- Collections ------------------------------------------------------===//

/// A position in a `LazyDropWhileCollection` or
/// `LazyDropWhileBidirectionalCollection` instance.
public struct LazyDropWhileIndex<Base : Collection> : Comparable {
  /// The position corresponding to `self` in the underlying collection.
  public let base: Base.Index
}

public func == <Base : Collection>(
  lhs: LazyDropWhileIndex<Base>,
  rhs: LazyDropWhileIndex<Base>
) -> Bool {
  return lhs.base == rhs.base
}

public func < <Base : Collection>(
  lhs: LazyDropWhileIndex<Base>,
  rhs: LazyDropWhileIndex<Base>
) -> Bool {
  return lhs.base < rhs.base
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/DropWhile.swift.gyb", line: 125)

/// A lazy `Collection` wrapper that includes the elements of an underlying
/// collection after any initial consecutive elements that satisfy a
/// predicate.
///
/// - Note: The performance of accessing `startIndex`, `first`, or any methods
///   that depend on `startIndex` depends on how many elements satisfy the
///   predicate at the start of the collection, and may not offer the usual
///   performance given by the `Collection` protocol. Be aware, therefore,
///   that general operations on `LazyDropWhileCollection` instances may not have the
///   documented complexity.
public struct LazyDropWhileCollection<
  Base : Collection
> : LazyCollectionProtocol, Collection {

  // FIXME(compiler limitation): should be inferable.
  public typealias Index = LazyDropWhileIndex<Base>

  public var startIndex: Index {
    var index = _base.startIndex
    while index != _base.endIndex && _predicate(_base[index]) {
      _base.formIndex(after: &index)
    }
    return LazyDropWhileIndex(base: index)
  }

  public var endIndex: Index {
    return LazyDropWhileIndex(base: _base.endIndex)
  }

  public func index(after i: Index) -> Index {
    _precondition(i.base < _base.endIndex, "can't advance past endIndex")
    return LazyDropWhileIndex(base: _base.index(after: i.base))
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/DropWhile.swift.gyb", line: 168)

  public subscript(position: Index) -> Base.Iterator.Element {
    return _base[position.base]
  }

  public func makeIterator() -> LazyDropWhileIterator<Base.Iterator> {
    return LazyDropWhileIterator(
      _base: _base.makeIterator(), predicate: _predicate)
  }

  internal init(_base: Base, predicate: @escaping (Base.Iterator.Element) -> Bool) {
    self._base = _base
    self._predicate = predicate
  }

  internal var _base: Base
  internal let _predicate: (Base.Iterator.Element) -> Bool
}

extension LazyCollectionProtocol
  where
  Self : Collection,
  Elements : Collection
{
  /// Returns a lazy collection that skips any initial elements that satisfy
  /// `predicate`.
  ///
  /// - Parameter predicate: A closure that takes an element of the collection
  ///   as its argument and returns `true` if the element should be skipped or
  ///   `false` otherwise. Once `predicate` returns `false` it will not be
  ///   called again.
  public func drop(
    while predicate: @escaping (Elements.Iterator.Element) -> Bool
  ) -> LazyDropWhileCollection<Self.Elements> {
    return LazyDropWhileCollection(
      _base: self.elements, predicate: predicate)
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/DropWhile.swift.gyb", line: 125)

/// A lazy `BidirectionalCollection` wrapper that includes the elements of an underlying
/// collection after any initial consecutive elements that satisfy a
/// predicate.
///
/// - Note: The performance of accessing `startIndex`, `first`, or any methods
///   that depend on `startIndex` depends on how many elements satisfy the
///   predicate at the start of the collection, and may not offer the usual
///   performance given by the `Collection` protocol. Be aware, therefore,
///   that general operations on `LazyDropWhileBidirectionalCollection` instances may not have the
///   documented complexity.
public struct LazyDropWhileBidirectionalCollection<
  Base : BidirectionalCollection
> : LazyCollectionProtocol, BidirectionalCollection {

  // FIXME(compiler limitation): should be inferable.
  public typealias Index = LazyDropWhileIndex<Base>

  public var startIndex: Index {
    var index = _base.startIndex
    while index != _base.endIndex && _predicate(_base[index]) {
      _base.formIndex(after: &index)
    }
    return LazyDropWhileIndex(base: index)
  }

  public var endIndex: Index {
    return LazyDropWhileIndex(base: _base.endIndex)
  }

  public func index(after i: Index) -> Index {
    _precondition(i.base < _base.endIndex, "can't advance past endIndex")
    return LazyDropWhileIndex(base: _base.index(after: i.base))
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/DropWhile.swift.gyb", line: 161)

  public func index(before i: Index) -> Index {
    _precondition(i > startIndex, "can't move before startIndex")
    return LazyDropWhileIndex(base: _base.index(before: i.base))
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/DropWhile.swift.gyb", line: 168)

  public subscript(position: Index) -> Base.Iterator.Element {
    return _base[position.base]
  }

  public func makeIterator() -> LazyDropWhileIterator<Base.Iterator> {
    return LazyDropWhileIterator(
      _base: _base.makeIterator(), predicate: _predicate)
  }

  internal init(_base: Base, predicate: @escaping (Base.Iterator.Element) -> Bool) {
    self._base = _base
    self._predicate = predicate
  }

  internal var _base: Base
  internal let _predicate: (Base.Iterator.Element) -> Bool
}

extension LazyCollectionProtocol
  where
  Self : BidirectionalCollection,
  Elements : BidirectionalCollection
{
  /// Returns a lazy collection that skips any initial elements that satisfy
  /// `predicate`.
  ///
  /// - Parameter predicate: A closure that takes an element of the collection
  ///   as its argument and returns `true` if the element should be skipped or
  ///   `false` otherwise. Once `predicate` returns `false` it will not be
  ///   called again.
  public func drop(
    while predicate: @escaping (Elements.Iterator.Element) -> Bool
  ) -> LazyDropWhileBidirectionalCollection<Self.Elements> {
    return LazyDropWhileBidirectionalCollection(
      _base: self.elements, predicate: predicate)
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/DropWhile.swift.gyb", line: 208)

// Local Variables:
// eval: (read-only-mode 1)
// End:
