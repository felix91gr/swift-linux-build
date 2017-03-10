// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 1)
//===--- ExistentialCollection.swift.gyb ----------------------*- swift -*-===//
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

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 21)

// TODO: swift-3-indexing-model: perform type erasure on the associated
// `Indices` type.

import SwiftShims

@inline(never)
internal func _abstract(
  file: StaticString = #file,
  line: UInt = #line
) -> Never {
  fatalError("Method must be overridden", file: file, line: line)
}

//===--- Iterator ---------------------------------------------------------===//
//===----------------------------------------------------------------------===//

/// A type-erased iterator of `Element`.
///
/// This iterator forwards its `next()` method to an arbitrary underlying
/// iterator having the same `Element` type, hiding the specifics of the
/// underlying `IteratorProtocol`.
///
/// - SeeAlso: `AnySequence`
public struct AnyIterator<Element> : IteratorProtocol {
  /// Creates an iterator that wraps a base iterator but whose type depends
  /// only on the base iterator's element type.
  ///
  /// You can use `AnyIterator` to hide the type signature of a more complex
  /// iterator. For example, the `digits()` function in the following example
  /// creates an iterator over a collection that lazily maps the elements of a
  /// `CountableRange<Int>` instance to strings. Instead of returning an
  /// iterator with a type that encapsulates the implementation of the
  /// collection, the `digits()` function first wraps the iterator in an
  /// `AnyIterator` instance.
  ///
  ///     func digits() -> AnyIterator<String> {
  ///         let lazyStrings = (0..<10).lazy.map { String($0) }
  ///         let iterator:
  ///             LazyMapIterator<IndexingIterator<CountableRange<Int>>, String>
  ///             = lazyStrings.makeIterator()
  ///
  ///         return AnyIterator(iterator)
  ///     }
  ///
  /// - Parameter base: An iterator to type-erase.
  public init<I : IteratorProtocol>(_ base: I) where I.Element == Element {
    self._box = _IteratorBox(base)
  }

  /// Creates an iterator that wraps the given closure in its `next()` method.
  ///
  /// The following example creates an iterator that counts up from the initial
  /// value of an integer `x` to 15:
  ///
  ///     var x = 7
  ///     let iterator: AnyIterator<Int> = AnyIterator {
  ///         defer { x += 1 }
  ///         return x < 15 ? x : nil
  ///     }
  ///     let a = Array(iterator)
  ///     // a == [7, 8, 9, 10, 11, 12, 13, 14]
  ///
  /// - Parameter body: A closure that returns an optional element. `body` is
  ///   executed each time the `next()` method is called on the resulting
  ///   iterator.
  public init(_ body: @escaping () -> Element?) {
    self._box = _IteratorBox(_ClosureBasedIterator(body))
  }

  internal init(_box: _AnyIteratorBoxBase<Element>) {
    self._box = _box
  }

  /// Advances to the next element and returns it, or `nil` if no next element
  /// exists.
  ///
  /// Once `nil` has been returned, all subsequent calls return `nil`.
  public func next() -> Element? {
    return _box.next()
  }

  internal let _box: _AnyIteratorBoxBase<Element>
}

/// Every `IteratorProtocol` can also be a `Sequence`.  Note that
/// traversing the sequence consumes the iterator.
extension AnyIterator : Sequence {}

internal struct _ClosureBasedIterator<Element> : IteratorProtocol {
  internal init(_ body: @escaping () -> Element?) {
    self._body = body
  }
  internal func next() -> Element? { return _body() }
  internal let _body: () -> Element?
}

internal class _AnyIteratorBoxBase<Element> : IteratorProtocol {
  /// Advances to the next element and returns it, or `nil` if no next element
  /// exists.
  ///
  /// Once `nil` has been returned, all subsequent calls return `nil`.
  ///
  /// - Note: Subclasses must override this method.
  internal func next() -> Element? { _abstract() }
}

internal final class _IteratorBox<
  Base : IteratorProtocol
> : _AnyIteratorBoxBase<Base.Element> {
  internal init(_ base: Base) { self._base = base }
  internal override func next() -> Base.Element? { return _base.next() }
  internal var _base: Base
}

//===--- Sequence ---------------------------------------------------------===//
//===----------------------------------------------------------------------===//

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 140)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 142)
internal class _AnySequenceBox<Element>
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 154)
{

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 157)
  internal func _makeIterator() -> AnyIterator<Element> { _abstract() }

  internal var _underestimatedCount: Int { _abstract() }

  internal func _map<T>(
    _ transform: (Element) throws -> T
  ) rethrows -> [T] {
    _abstract()
  }

  internal func _filter(
    _ isIncluded: (Element) throws -> Bool
  ) rethrows -> [Element] {
    _abstract()
  }

  internal func _forEach(
    _ body: (Element) throws -> Void
  ) rethrows {
    _abstract()
  }

  internal func __customContainsEquatableElement(
    _ element: Element
  ) -> Bool? {
    _abstract()
  }

  internal func __preprocessingPass<R>(
    _ preprocess: () throws -> R
  ) rethrows -> R? {
    _abstract()
  }

  internal func __copyToContiguousArray() -> ContiguousArray<Element> {
    _abstract()
  }

  internal func __copyContents(initializing buf: UnsafeMutableBufferPointer<Element>)
    -> (AnyIterator<Element>,UnsafeMutableBufferPointer<Element>.Index) {
    _abstract()
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 201)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 203)
  internal  func _drop(
    while predicate: (Element) throws -> Bool
  ) rethrows -> _AnySequenceBox<Element> {
    _abstract()
  }

  internal  func _dropFirst(_ n: Int) -> _AnySequenceBox<Element> {
    _abstract()
  }

  internal  func _dropLast(_ n: Int) -> _AnySequenceBox<Element> {
    _abstract()
  }

  internal  func _prefix(_ maxLength: Int) -> _AnySequenceBox<Element> {
    _abstract()
  }

  internal  func _prefix(
    while predicate: (Element) throws -> Bool
  ) rethrows -> _AnySequenceBox<Element> {
    _abstract()
  }

  internal  func _suffix(_ maxLength: Int) -> _AnySequenceBox<Element> {
    _abstract()
  }

  internal func _split(
    maxSplits: Int, omittingEmptySubsequences: Bool,
    whereSeparator isSeparator: (Element) throws -> Bool
  ) rethrows -> [AnySequence<Element>] {
    _abstract()
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 306)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 314)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 320)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 140)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 144)
internal class _AnyCollectionBox<Element> : _AnySequenceBox<Element>
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 154)
{

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 201)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 203)
  internal override func _drop(
    while predicate: (Element) throws -> Bool
  ) rethrows -> _AnyCollectionBox<Element> {
    _abstract()
  }

  internal override func _dropFirst(_ n: Int) -> _AnyCollectionBox<Element> {
    _abstract()
  }

  internal override func _dropLast(_ n: Int) -> _AnyCollectionBox<Element> {
    _abstract()
  }

  internal override func _prefix(_ maxLength: Int) -> _AnyCollectionBox<Element> {
    _abstract()
  }

  internal override func _prefix(
    while predicate: (Element) throws -> Bool
  ) rethrows -> _AnyCollectionBox<Element> {
    _abstract()
  }

  internal override func _suffix(_ maxLength: Int) -> _AnyCollectionBox<Element> {
    _abstract()
  }

  internal func _split(
    maxSplits: Int, omittingEmptySubsequences: Bool,
    whereSeparator isSeparator: (Element) throws -> Bool
  ) rethrows -> [AnyCollection<Element>] {
    _abstract()
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 239)
  internal subscript(i: _AnyIndexBox) -> Element { _abstract() }

  internal func _index(after i: _AnyIndexBox) -> _AnyIndexBox { _abstract() }

  internal func _formIndex(after i: _AnyIndexBox) { _abstract() }

  internal func _index(
    _ i: _AnyIndexBox, offsetBy n: IntMax
  ) -> _AnyIndexBox {
    _abstract()
  }

  internal func _index(
    _ i: _AnyIndexBox, offsetBy n: IntMax, limitedBy limit: _AnyIndexBox
  ) -> _AnyIndexBox? {
    _abstract()
  }

  internal func _formIndex(_ i: inout _AnyIndexBox, offsetBy n: IntMax) {
    _abstract()
  }

  internal func _formIndex(
    _ i: inout _AnyIndexBox, offsetBy n: IntMax, limitedBy limit: _AnyIndexBox
  ) -> Bool {
    _abstract()
  }

  internal func _distance(
    from start: _AnyIndexBox, to end: _AnyIndexBox
  ) -> IntMax {
    _abstract()
  }

  // TODO: swift-3-indexing-model: forward the following methods.
  /*
  var _indices: Indices

  func prefix(upTo end: Index) -> SubSequence

  func suffix(from start: Index) -> SubSequence

  func prefix(through position: Index) -> SubSequence

  var isEmpty: Bool { get }
  */

  internal var _count: IntMax { _abstract() }

  // TODO: swift-3-indexing-model: forward the following methods.
  /*
  func _customIndexOfEquatableElement(element: Iterator.Element) -> Index??
  */

  internal var _first: Element? { _abstract() }

  internal init(
    _startIndex: _AnyIndexBox,
    endIndex: _AnyIndexBox
  ) {
    self._startIndex = _startIndex
    self._endIndex = endIndex
  }

  internal let _startIndex: _AnyIndexBox
  internal let _endIndex: _AnyIndexBox
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 306)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 309)
  internal  subscript(
    start start: _AnyIndexBox,
    end end: _AnyIndexBox
  ) -> _AnyCollectionBox<Element> { _abstract() }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 314)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 320)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 140)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 146)
internal class _AnyBidirectionalCollectionBox<Element>
  : _AnyCollectionBox<Element>
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 154)
{

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 201)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 203)
  internal override func _drop(
    while predicate: (Element) throws -> Bool
  ) rethrows -> _AnyBidirectionalCollectionBox<Element> {
    _abstract()
  }

  internal override func _dropFirst(_ n: Int) -> _AnyBidirectionalCollectionBox<Element> {
    _abstract()
  }

  internal override func _dropLast(_ n: Int) -> _AnyBidirectionalCollectionBox<Element> {
    _abstract()
  }

  internal override func _prefix(_ maxLength: Int) -> _AnyBidirectionalCollectionBox<Element> {
    _abstract()
  }

  internal override func _prefix(
    while predicate: (Element) throws -> Bool
  ) rethrows -> _AnyBidirectionalCollectionBox<Element> {
    _abstract()
  }

  internal override func _suffix(_ maxLength: Int) -> _AnyBidirectionalCollectionBox<Element> {
    _abstract()
  }

  internal func _split(
    maxSplits: Int, omittingEmptySubsequences: Bool,
    whereSeparator isSeparator: (Element) throws -> Bool
  ) rethrows -> [AnyBidirectionalCollection<Element>] {
    _abstract()
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 306)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 309)
  internal override subscript(
    start start: _AnyIndexBox,
    end end: _AnyIndexBox
  ) -> _AnyBidirectionalCollectionBox<Element> { _abstract() }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 314)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 316)
  internal func _index(before i: _AnyIndexBox) -> _AnyIndexBox { _abstract() }
  internal func _formIndex(before i: _AnyIndexBox) { _abstract() }
  internal var _last: Element? { _abstract() }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 320)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 140)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 149)
internal class _AnyRandomAccessCollectionBox<Element>
  : _AnyBidirectionalCollectionBox<Element>
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 154)
{

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 201)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 203)
  internal override func _drop(
    while predicate: (Element) throws -> Bool
  ) rethrows -> _AnyRandomAccessCollectionBox<Element> {
    _abstract()
  }

  internal override func _dropFirst(_ n: Int) -> _AnyRandomAccessCollectionBox<Element> {
    _abstract()
  }

  internal override func _dropLast(_ n: Int) -> _AnyRandomAccessCollectionBox<Element> {
    _abstract()
  }

  internal override func _prefix(_ maxLength: Int) -> _AnyRandomAccessCollectionBox<Element> {
    _abstract()
  }

  internal override func _prefix(
    while predicate: (Element) throws -> Bool
  ) rethrows -> _AnyRandomAccessCollectionBox<Element> {
    _abstract()
  }

  internal override func _suffix(_ maxLength: Int) -> _AnyRandomAccessCollectionBox<Element> {
    _abstract()
  }

  internal func _split(
    maxSplits: Int, omittingEmptySubsequences: Bool,
    whereSeparator isSeparator: (Element) throws -> Bool
  ) rethrows -> [AnyRandomAccessCollection<Element>] {
    _abstract()
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 306)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 309)
  internal override subscript(
    start start: _AnyIndexBox,
    end end: _AnyIndexBox
  ) -> _AnyRandomAccessCollectionBox<Element> { _abstract() }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 314)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 320)
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 322)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 335)

internal final class _SequenceBox<S : Sequence> : _AnySequenceBox<S.Iterator.Element>
  where
  S.SubSequence : Sequence,
  S.SubSequence.Iterator.Element == S.Iterator.Element,
  S.SubSequence.SubSequence == S.SubSequence
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 353)
{
  internal typealias Element = S.Iterator.Element

  internal override func _makeIterator() -> AnyIterator<Element> {
    return AnyIterator(_base.makeIterator())
  }
  internal override var _underestimatedCount: Int {
    return _base.underestimatedCount
  }
  internal override func _map<T>(
    _ transform: (Element) throws -> T
  ) rethrows -> [T] {
    return try _base.map(transform)
  }
  internal override func _filter(
    _ isIncluded: (Element) throws -> Bool
  ) rethrows -> [Element] {
    return try _base.filter(isIncluded)
  }
  internal override func _forEach(
    _ body: (Element) throws -> Void
  ) rethrows {
    return try _base.forEach(body)
  }
  internal override func __customContainsEquatableElement(
    _ element: Element
  ) -> Bool? {
    return _base._customContainsEquatableElement(element)
  }
  internal override func __preprocessingPass<R>(
    _ preprocess: () throws -> R
  ) rethrows -> R? {
    return try _base._preprocessingPass(preprocess)
  }
  internal override func __copyToContiguousArray() -> ContiguousArray<Element> {
    return _base._copyToContiguousArray()
  }
  internal override func __copyContents(initializing buf: UnsafeMutableBufferPointer<Element>)
    -> (AnyIterator<Element>,UnsafeMutableBufferPointer<Element>.Index) {
    let (it,idx) = _base._copyContents(initializing: buf)
    return (AnyIterator(it),idx)
  }
  internal override func _drop(
    while predicate: (Element) throws -> Bool
  ) rethrows -> _AnySequenceBox<Element> {
    return try _SequenceBox<S.SubSequence>(_base: _base.drop(while: predicate))
  }
  internal override func _dropFirst(_ n: Int) -> _AnySequenceBox<Element> {
    return _SequenceBox<S.SubSequence>(_base: _base.dropFirst(n))
  }
  internal override func _dropLast(_ n: Int) -> _AnySequenceBox<Element> {
    return _SequenceBox<S.SubSequence>(_base: _base.dropLast(n))
  }
  internal override func _prefix(
    while predicate: (Element) throws -> Bool
  ) rethrows -> _AnySequenceBox<Element> {
    return try _SequenceBox<S.SubSequence>(_base: _base.prefix(while: predicate))
  }
  internal override func _prefix(_ maxLength: Int) -> _AnySequenceBox<Element> {
    return _SequenceBox<S.SubSequence>(_base: _base.prefix(maxLength))
  }
  internal override func _suffix(_ maxLength: Int) -> _AnySequenceBox<Element> {
    return _SequenceBox<S.SubSequence>(_base: _base.suffix(maxLength))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 418)
  internal override func _split(
    maxSplits: Int, omittingEmptySubsequences: Bool,
    whereSeparator isSeparator: (Element) throws -> Bool
  ) rethrows -> [AnySequence<Element>] {
    return try _base.split(
      maxSplits: maxSplits,
      omittingEmptySubsequences: omittingEmptySubsequences,
      whereSeparator: isSeparator)
      .map {
        AnySequence(_box: _SequenceBox<S.SubSequence>(_base: $0))
      }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 431)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 433)
  internal init(_base: S) {
    self._base = _base
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 548)
  internal var _base: S
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 335)

internal final class _CollectionBox<S : Collection> : _AnyCollectionBox<S.Iterator.Element>
  where
  S.SubSequence : Collection,
  S.SubSequence.Iterator.Element == S.Iterator.Element,
  S.SubSequence.SubSequence == S.SubSequence
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 342)
  ,
  S.SubSequence.Index == S.Index,
  S.SubSequence.Indices : Collection,
  S.SubSequence.Indices.Iterator.Element == S.Index,
  S.SubSequence.Indices.Index == S.Index,
  S.SubSequence.Indices.SubSequence == S.SubSequence.Indices,
  S.Indices : Collection,
  S.Indices.Iterator.Element == S.Index,
  S.Indices.Index == S.Index,
  S.Indices.SubSequence == S.Indices
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 353)
{
  internal typealias Element = S.Iterator.Element

  internal override func _makeIterator() -> AnyIterator<Element> {
    return AnyIterator(_base.makeIterator())
  }
  internal override var _underestimatedCount: Int {
    return _base.underestimatedCount
  }
  internal override func _map<T>(
    _ transform: (Element) throws -> T
  ) rethrows -> [T] {
    return try _base.map(transform)
  }
  internal override func _filter(
    _ isIncluded: (Element) throws -> Bool
  ) rethrows -> [Element] {
    return try _base.filter(isIncluded)
  }
  internal override func _forEach(
    _ body: (Element) throws -> Void
  ) rethrows {
    return try _base.forEach(body)
  }
  internal override func __customContainsEquatableElement(
    _ element: Element
  ) -> Bool? {
    return _base._customContainsEquatableElement(element)
  }
  internal override func __preprocessingPass<R>(
    _ preprocess: () throws -> R
  ) rethrows -> R? {
    return try _base._preprocessingPass(preprocess)
  }
  internal override func __copyToContiguousArray() -> ContiguousArray<Element> {
    return _base._copyToContiguousArray()
  }
  internal override func __copyContents(initializing buf: UnsafeMutableBufferPointer<Element>)
    -> (AnyIterator<Element>,UnsafeMutableBufferPointer<Element>.Index) {
    let (it,idx) = _base._copyContents(initializing: buf)
    return (AnyIterator(it),idx)
  }
  internal override func _drop(
    while predicate: (Element) throws -> Bool
  ) rethrows -> _AnyCollectionBox<Element> {
    return try _CollectionBox<S.SubSequence>(_base: _base.drop(while: predicate))
  }
  internal override func _dropFirst(_ n: Int) -> _AnyCollectionBox<Element> {
    return _CollectionBox<S.SubSequence>(_base: _base.dropFirst(n))
  }
  internal override func _dropLast(_ n: Int) -> _AnyCollectionBox<Element> {
    return _CollectionBox<S.SubSequence>(_base: _base.dropLast(n))
  }
  internal override func _prefix(
    while predicate: (Element) throws -> Bool
  ) rethrows -> _AnyCollectionBox<Element> {
    return try _CollectionBox<S.SubSequence>(_base: _base.prefix(while: predicate))
  }
  internal override func _prefix(_ maxLength: Int) -> _AnyCollectionBox<Element> {
    return _CollectionBox<S.SubSequence>(_base: _base.prefix(maxLength))
  }
  internal override func _suffix(_ maxLength: Int) -> _AnyCollectionBox<Element> {
    return _CollectionBox<S.SubSequence>(_base: _base.suffix(maxLength))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 418)
  internal override func _split(
    maxSplits: Int, omittingEmptySubsequences: Bool,
    whereSeparator isSeparator: (Element) throws -> Bool
  ) rethrows -> [AnySequence<Element>] {
    return try _base.split(
      maxSplits: maxSplits,
      omittingEmptySubsequences: omittingEmptySubsequences,
      whereSeparator: isSeparator)
      .map {
        AnySequence(_box: _CollectionBox<S.SubSequence>(_base: $0))
      }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 418)
  internal override func _split(
    maxSplits: Int, omittingEmptySubsequences: Bool,
    whereSeparator isSeparator: (Element) throws -> Bool
  ) rethrows -> [AnyCollection<Element>] {
    return try _base.split(
      maxSplits: maxSplits,
      omittingEmptySubsequences: omittingEmptySubsequences,
      whereSeparator: isSeparator)
      .map {
        AnyCollection(_box: _CollectionBox<S.SubSequence>(_base: $0))
      }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 431)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 437)
  internal init(_base: S) {
    self._base = _base
    super.init(
      _startIndex: _IndexBox(_base: _base.startIndex),
      endIndex: _IndexBox(_base: _base.endIndex))
  }

  internal func _unbox(
    _ position: _AnyIndexBox, file: StaticString = #file, line: UInt = #line
  ) -> S.Index {
    if let i = position._unbox() as S.Index? {
      return i
    }
    fatalError("Index type mismatch!", file: file, line: line)
  }

  internal override subscript(position: _AnyIndexBox) -> Element {
    return _base[_unbox(position)]
  }

  internal override subscript(start start: _AnyIndexBox, end end: _AnyIndexBox)
    -> _AnyCollectionBox<Element>
  {
    return _CollectionBox<S.SubSequence>(_base:
      _base[_unbox(start)..<_unbox(end)]
    )
  }

  internal override func _index(after position: _AnyIndexBox) -> _AnyIndexBox {
    return _IndexBox(_base: _base.index(after: _unbox(position)))
  }

  internal override func _formIndex(after position: _AnyIndexBox) {
    if let p = position as? _IndexBox<S.Index> {
      return _base.formIndex(after: &p._base)
    }
    fatalError("Index type mismatch!")
  }

  internal override func _index(
    _ i: _AnyIndexBox, offsetBy n: IntMax
  ) -> _AnyIndexBox {
    return _IndexBox(_base: _base.index(_unbox(i), offsetBy: numericCast(n)))
  }

  internal override func _index(
    _ i: _AnyIndexBox,
    offsetBy n: IntMax,
    limitedBy limit: _AnyIndexBox
  ) -> _AnyIndexBox? {
    return _base.index(
        _unbox(i),
        offsetBy: numericCast(n),
        limitedBy: _unbox(limit))
      .map { _IndexBox(_base: $0) }
  }

  internal override func _formIndex(
    _ i: inout _AnyIndexBox, offsetBy n: IntMax
  ) {
    if let box = i as? _IndexBox<S.Index> {
      return _base.formIndex(&box._base, offsetBy: numericCast(n))
    }
    fatalError("Index type mismatch!")
  }

  internal override func _formIndex(
    _ i: inout _AnyIndexBox, offsetBy n: IntMax, limitedBy limit: _AnyIndexBox
  ) -> Bool {
    if let box = i as? _IndexBox<S.Index> {
      return _base.formIndex(
        &box._base,
        offsetBy: numericCast(n),
        limitedBy: _unbox(limit))
    }
    fatalError("Index type mismatch!")
  }

  internal override func _distance(
    from start: _AnyIndexBox,
    to end: _AnyIndexBox
  ) -> IntMax {
    return numericCast(_base.distance(from: _unbox(start), to: _unbox(end)))
  }

  internal override var _count: IntMax {
    return numericCast(_base.count)
  }

  internal override var _first: Element? {
    return _base.first
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 546)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 548)
  internal var _base: S
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 335)

internal final class _BidirectionalCollectionBox<S : BidirectionalCollection> : _AnyBidirectionalCollectionBox<S.Iterator.Element>
  where
  S.SubSequence : BidirectionalCollection,
  S.SubSequence.Iterator.Element == S.Iterator.Element,
  S.SubSequence.SubSequence == S.SubSequence
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 342)
  ,
  S.SubSequence.Index == S.Index,
  S.SubSequence.Indices : BidirectionalCollection,
  S.SubSequence.Indices.Iterator.Element == S.Index,
  S.SubSequence.Indices.Index == S.Index,
  S.SubSequence.Indices.SubSequence == S.SubSequence.Indices,
  S.Indices : BidirectionalCollection,
  S.Indices.Iterator.Element == S.Index,
  S.Indices.Index == S.Index,
  S.Indices.SubSequence == S.Indices
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 353)
{
  internal typealias Element = S.Iterator.Element

  internal override func _makeIterator() -> AnyIterator<Element> {
    return AnyIterator(_base.makeIterator())
  }
  internal override var _underestimatedCount: Int {
    return _base.underestimatedCount
  }
  internal override func _map<T>(
    _ transform: (Element) throws -> T
  ) rethrows -> [T] {
    return try _base.map(transform)
  }
  internal override func _filter(
    _ isIncluded: (Element) throws -> Bool
  ) rethrows -> [Element] {
    return try _base.filter(isIncluded)
  }
  internal override func _forEach(
    _ body: (Element) throws -> Void
  ) rethrows {
    return try _base.forEach(body)
  }
  internal override func __customContainsEquatableElement(
    _ element: Element
  ) -> Bool? {
    return _base._customContainsEquatableElement(element)
  }
  internal override func __preprocessingPass<R>(
    _ preprocess: () throws -> R
  ) rethrows -> R? {
    return try _base._preprocessingPass(preprocess)
  }
  internal override func __copyToContiguousArray() -> ContiguousArray<Element> {
    return _base._copyToContiguousArray()
  }
  internal override func __copyContents(initializing buf: UnsafeMutableBufferPointer<Element>)
    -> (AnyIterator<Element>,UnsafeMutableBufferPointer<Element>.Index) {
    let (it,idx) = _base._copyContents(initializing: buf)
    return (AnyIterator(it),idx)
  }
  internal override func _drop(
    while predicate: (Element) throws -> Bool
  ) rethrows -> _AnyBidirectionalCollectionBox<Element> {
    return try _BidirectionalCollectionBox<S.SubSequence>(_base: _base.drop(while: predicate))
  }
  internal override func _dropFirst(_ n: Int) -> _AnyBidirectionalCollectionBox<Element> {
    return _BidirectionalCollectionBox<S.SubSequence>(_base: _base.dropFirst(n))
  }
  internal override func _dropLast(_ n: Int) -> _AnyBidirectionalCollectionBox<Element> {
    return _BidirectionalCollectionBox<S.SubSequence>(_base: _base.dropLast(n))
  }
  internal override func _prefix(
    while predicate: (Element) throws -> Bool
  ) rethrows -> _AnyBidirectionalCollectionBox<Element> {
    return try _BidirectionalCollectionBox<S.SubSequence>(_base: _base.prefix(while: predicate))
  }
  internal override func _prefix(_ maxLength: Int) -> _AnyBidirectionalCollectionBox<Element> {
    return _BidirectionalCollectionBox<S.SubSequence>(_base: _base.prefix(maxLength))
  }
  internal override func _suffix(_ maxLength: Int) -> _AnyBidirectionalCollectionBox<Element> {
    return _BidirectionalCollectionBox<S.SubSequence>(_base: _base.suffix(maxLength))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 418)
  internal override func _split(
    maxSplits: Int, omittingEmptySubsequences: Bool,
    whereSeparator isSeparator: (Element) throws -> Bool
  ) rethrows -> [AnySequence<Element>] {
    return try _base.split(
      maxSplits: maxSplits,
      omittingEmptySubsequences: omittingEmptySubsequences,
      whereSeparator: isSeparator)
      .map {
        AnySequence(_box: _BidirectionalCollectionBox<S.SubSequence>(_base: $0))
      }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 418)
  internal override func _split(
    maxSplits: Int, omittingEmptySubsequences: Bool,
    whereSeparator isSeparator: (Element) throws -> Bool
  ) rethrows -> [AnyCollection<Element>] {
    return try _base.split(
      maxSplits: maxSplits,
      omittingEmptySubsequences: omittingEmptySubsequences,
      whereSeparator: isSeparator)
      .map {
        AnyCollection(_box: _BidirectionalCollectionBox<S.SubSequence>(_base: $0))
      }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 418)
  internal override func _split(
    maxSplits: Int, omittingEmptySubsequences: Bool,
    whereSeparator isSeparator: (Element) throws -> Bool
  ) rethrows -> [AnyBidirectionalCollection<Element>] {
    return try _base.split(
      maxSplits: maxSplits,
      omittingEmptySubsequences: omittingEmptySubsequences,
      whereSeparator: isSeparator)
      .map {
        AnyBidirectionalCollection(_box: _BidirectionalCollectionBox<S.SubSequence>(_base: $0))
      }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 431)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 437)
  internal init(_base: S) {
    self._base = _base
    super.init(
      _startIndex: _IndexBox(_base: _base.startIndex),
      endIndex: _IndexBox(_base: _base.endIndex))
  }

  internal func _unbox(
    _ position: _AnyIndexBox, file: StaticString = #file, line: UInt = #line
  ) -> S.Index {
    if let i = position._unbox() as S.Index? {
      return i
    }
    fatalError("Index type mismatch!", file: file, line: line)
  }

  internal override subscript(position: _AnyIndexBox) -> Element {
    return _base[_unbox(position)]
  }

  internal override subscript(start start: _AnyIndexBox, end end: _AnyIndexBox)
    -> _AnyBidirectionalCollectionBox<Element>
  {
    return _BidirectionalCollectionBox<S.SubSequence>(_base:
      _base[_unbox(start)..<_unbox(end)]
    )
  }

  internal override func _index(after position: _AnyIndexBox) -> _AnyIndexBox {
    return _IndexBox(_base: _base.index(after: _unbox(position)))
  }

  internal override func _formIndex(after position: _AnyIndexBox) {
    if let p = position as? _IndexBox<S.Index> {
      return _base.formIndex(after: &p._base)
    }
    fatalError("Index type mismatch!")
  }

  internal override func _index(
    _ i: _AnyIndexBox, offsetBy n: IntMax
  ) -> _AnyIndexBox {
    return _IndexBox(_base: _base.index(_unbox(i), offsetBy: numericCast(n)))
  }

  internal override func _index(
    _ i: _AnyIndexBox,
    offsetBy n: IntMax,
    limitedBy limit: _AnyIndexBox
  ) -> _AnyIndexBox? {
    return _base.index(
        _unbox(i),
        offsetBy: numericCast(n),
        limitedBy: _unbox(limit))
      .map { _IndexBox(_base: $0) }
  }

  internal override func _formIndex(
    _ i: inout _AnyIndexBox, offsetBy n: IntMax
  ) {
    if let box = i as? _IndexBox<S.Index> {
      return _base.formIndex(&box._base, offsetBy: numericCast(n))
    }
    fatalError("Index type mismatch!")
  }

  internal override func _formIndex(
    _ i: inout _AnyIndexBox, offsetBy n: IntMax, limitedBy limit: _AnyIndexBox
  ) -> Bool {
    if let box = i as? _IndexBox<S.Index> {
      return _base.formIndex(
        &box._base,
        offsetBy: numericCast(n),
        limitedBy: _unbox(limit))
    }
    fatalError("Index type mismatch!")
  }

  internal override func _distance(
    from start: _AnyIndexBox,
    to end: _AnyIndexBox
  ) -> IntMax {
    return numericCast(_base.distance(from: _unbox(start), to: _unbox(end)))
  }

  internal override var _count: IntMax {
    return numericCast(_base.count)
  }

  internal override var _first: Element? {
    return _base.first
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 531)
  internal override func _index(before position: _AnyIndexBox) -> _AnyIndexBox {
    return _IndexBox(_base: _base.index(before: _unbox(position)))
  }

  internal override func _formIndex(before position: _AnyIndexBox) {
    if let p = position as? _IndexBox<S.Index> {
      return _base.formIndex(before: &p._base)
    }
    fatalError("Index type mismatch!")
  }

  internal override var _last: Element? {
    return _base.last
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 546)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 548)
  internal var _base: S
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 335)

internal final class _RandomAccessCollectionBox<S : RandomAccessCollection> : _AnyRandomAccessCollectionBox<S.Iterator.Element>
  where
  S.SubSequence : RandomAccessCollection,
  S.SubSequence.Iterator.Element == S.Iterator.Element,
  S.SubSequence.SubSequence == S.SubSequence
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 342)
  ,
  S.SubSequence.Index == S.Index,
  S.SubSequence.Indices : RandomAccessCollection,
  S.SubSequence.Indices.Iterator.Element == S.Index,
  S.SubSequence.Indices.Index == S.Index,
  S.SubSequence.Indices.SubSequence == S.SubSequence.Indices,
  S.Indices : RandomAccessCollection,
  S.Indices.Iterator.Element == S.Index,
  S.Indices.Index == S.Index,
  S.Indices.SubSequence == S.Indices
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 353)
{
  internal typealias Element = S.Iterator.Element

  internal override func _makeIterator() -> AnyIterator<Element> {
    return AnyIterator(_base.makeIterator())
  }
  internal override var _underestimatedCount: Int {
    return _base.underestimatedCount
  }
  internal override func _map<T>(
    _ transform: (Element) throws -> T
  ) rethrows -> [T] {
    return try _base.map(transform)
  }
  internal override func _filter(
    _ isIncluded: (Element) throws -> Bool
  ) rethrows -> [Element] {
    return try _base.filter(isIncluded)
  }
  internal override func _forEach(
    _ body: (Element) throws -> Void
  ) rethrows {
    return try _base.forEach(body)
  }
  internal override func __customContainsEquatableElement(
    _ element: Element
  ) -> Bool? {
    return _base._customContainsEquatableElement(element)
  }
  internal override func __preprocessingPass<R>(
    _ preprocess: () throws -> R
  ) rethrows -> R? {
    return try _base._preprocessingPass(preprocess)
  }
  internal override func __copyToContiguousArray() -> ContiguousArray<Element> {
    return _base._copyToContiguousArray()
  }
  internal override func __copyContents(initializing buf: UnsafeMutableBufferPointer<Element>)
    -> (AnyIterator<Element>,UnsafeMutableBufferPointer<Element>.Index) {
    let (it,idx) = _base._copyContents(initializing: buf)
    return (AnyIterator(it),idx)
  }
  internal override func _drop(
    while predicate: (Element) throws -> Bool
  ) rethrows -> _AnyRandomAccessCollectionBox<Element> {
    return try _RandomAccessCollectionBox<S.SubSequence>(_base: _base.drop(while: predicate))
  }
  internal override func _dropFirst(_ n: Int) -> _AnyRandomAccessCollectionBox<Element> {
    return _RandomAccessCollectionBox<S.SubSequence>(_base: _base.dropFirst(n))
  }
  internal override func _dropLast(_ n: Int) -> _AnyRandomAccessCollectionBox<Element> {
    return _RandomAccessCollectionBox<S.SubSequence>(_base: _base.dropLast(n))
  }
  internal override func _prefix(
    while predicate: (Element) throws -> Bool
  ) rethrows -> _AnyRandomAccessCollectionBox<Element> {
    return try _RandomAccessCollectionBox<S.SubSequence>(_base: _base.prefix(while: predicate))
  }
  internal override func _prefix(_ maxLength: Int) -> _AnyRandomAccessCollectionBox<Element> {
    return _RandomAccessCollectionBox<S.SubSequence>(_base: _base.prefix(maxLength))
  }
  internal override func _suffix(_ maxLength: Int) -> _AnyRandomAccessCollectionBox<Element> {
    return _RandomAccessCollectionBox<S.SubSequence>(_base: _base.suffix(maxLength))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 418)
  internal override func _split(
    maxSplits: Int, omittingEmptySubsequences: Bool,
    whereSeparator isSeparator: (Element) throws -> Bool
  ) rethrows -> [AnySequence<Element>] {
    return try _base.split(
      maxSplits: maxSplits,
      omittingEmptySubsequences: omittingEmptySubsequences,
      whereSeparator: isSeparator)
      .map {
        AnySequence(_box: _RandomAccessCollectionBox<S.SubSequence>(_base: $0))
      }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 418)
  internal override func _split(
    maxSplits: Int, omittingEmptySubsequences: Bool,
    whereSeparator isSeparator: (Element) throws -> Bool
  ) rethrows -> [AnyCollection<Element>] {
    return try _base.split(
      maxSplits: maxSplits,
      omittingEmptySubsequences: omittingEmptySubsequences,
      whereSeparator: isSeparator)
      .map {
        AnyCollection(_box: _RandomAccessCollectionBox<S.SubSequence>(_base: $0))
      }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 418)
  internal override func _split(
    maxSplits: Int, omittingEmptySubsequences: Bool,
    whereSeparator isSeparator: (Element) throws -> Bool
  ) rethrows -> [AnyBidirectionalCollection<Element>] {
    return try _base.split(
      maxSplits: maxSplits,
      omittingEmptySubsequences: omittingEmptySubsequences,
      whereSeparator: isSeparator)
      .map {
        AnyBidirectionalCollection(_box: _RandomAccessCollectionBox<S.SubSequence>(_base: $0))
      }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 418)
  internal override func _split(
    maxSplits: Int, omittingEmptySubsequences: Bool,
    whereSeparator isSeparator: (Element) throws -> Bool
  ) rethrows -> [AnyRandomAccessCollection<Element>] {
    return try _base.split(
      maxSplits: maxSplits,
      omittingEmptySubsequences: omittingEmptySubsequences,
      whereSeparator: isSeparator)
      .map {
        AnyRandomAccessCollection(_box: _RandomAccessCollectionBox<S.SubSequence>(_base: $0))
      }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 431)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 437)
  internal init(_base: S) {
    self._base = _base
    super.init(
      _startIndex: _IndexBox(_base: _base.startIndex),
      endIndex: _IndexBox(_base: _base.endIndex))
  }

  internal func _unbox(
    _ position: _AnyIndexBox, file: StaticString = #file, line: UInt = #line
  ) -> S.Index {
    if let i = position._unbox() as S.Index? {
      return i
    }
    fatalError("Index type mismatch!", file: file, line: line)
  }

  internal override subscript(position: _AnyIndexBox) -> Element {
    return _base[_unbox(position)]
  }

  internal override subscript(start start: _AnyIndexBox, end end: _AnyIndexBox)
    -> _AnyRandomAccessCollectionBox<Element>
  {
    return _RandomAccessCollectionBox<S.SubSequence>(_base:
      _base[_unbox(start)..<_unbox(end)]
    )
  }

  internal override func _index(after position: _AnyIndexBox) -> _AnyIndexBox {
    return _IndexBox(_base: _base.index(after: _unbox(position)))
  }

  internal override func _formIndex(after position: _AnyIndexBox) {
    if let p = position as? _IndexBox<S.Index> {
      return _base.formIndex(after: &p._base)
    }
    fatalError("Index type mismatch!")
  }

  internal override func _index(
    _ i: _AnyIndexBox, offsetBy n: IntMax
  ) -> _AnyIndexBox {
    return _IndexBox(_base: _base.index(_unbox(i), offsetBy: numericCast(n)))
  }

  internal override func _index(
    _ i: _AnyIndexBox,
    offsetBy n: IntMax,
    limitedBy limit: _AnyIndexBox
  ) -> _AnyIndexBox? {
    return _base.index(
        _unbox(i),
        offsetBy: numericCast(n),
        limitedBy: _unbox(limit))
      .map { _IndexBox(_base: $0) }
  }

  internal override func _formIndex(
    _ i: inout _AnyIndexBox, offsetBy n: IntMax
  ) {
    if let box = i as? _IndexBox<S.Index> {
      return _base.formIndex(&box._base, offsetBy: numericCast(n))
    }
    fatalError("Index type mismatch!")
  }

  internal override func _formIndex(
    _ i: inout _AnyIndexBox, offsetBy n: IntMax, limitedBy limit: _AnyIndexBox
  ) -> Bool {
    if let box = i as? _IndexBox<S.Index> {
      return _base.formIndex(
        &box._base,
        offsetBy: numericCast(n),
        limitedBy: _unbox(limit))
    }
    fatalError("Index type mismatch!")
  }

  internal override func _distance(
    from start: _AnyIndexBox,
    to end: _AnyIndexBox
  ) -> IntMax {
    return numericCast(_base.distance(from: _unbox(start), to: _unbox(end)))
  }

  internal override var _count: IntMax {
    return numericCast(_base.count)
  }

  internal override var _first: Element? {
    return _base.first
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 531)
  internal override func _index(before position: _AnyIndexBox) -> _AnyIndexBox {
    return _IndexBox(_base: _base.index(before: _unbox(position)))
  }

  internal override func _formIndex(before position: _AnyIndexBox) {
    if let p = position as? _IndexBox<S.Index> {
      return _base.formIndex(before: &p._base)
    }
    fatalError("Index type mismatch!")
  }

  internal override var _last: Element? {
    return _base.last
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 546)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 548)
  internal var _base: S
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 551)

internal struct _ClosureBasedSequence<Iterator : IteratorProtocol>
  : Sequence {

  internal init(_ makeUnderlyingIterator: @escaping () -> Iterator) {
    self._makeUnderlyingIterator = makeUnderlyingIterator
  }

  internal func makeIterator() -> Iterator {
    return _makeUnderlyingIterator()
  }

  internal var _makeUnderlyingIterator: () -> Iterator
}

/// A type-erased sequence.
///
/// An instance of `AnySequence` forwards its operations to an underlying base
/// sequence having the same `Element` type, hiding the specifics of the
/// underlying sequence.
///
/// - SeeAlso: `AnyIterator`
public struct AnySequence<Element> : Sequence {
  /// Creates a new sequence that wraps and forwards operations to `base`.
  public init<S : Sequence>(_ base: S)
    where
    S.Iterator.Element == Element,
    S.SubSequence : Sequence,
    S.SubSequence.Iterator.Element == Element,
    S.SubSequence.SubSequence == S.SubSequence {
    self._box = _SequenceBox(_base: base)
  }

  /// Creates a sequence whose `makeIterator()` method forwards to
  /// `makeUnderlyingIterator`.
  public init<I : IteratorProtocol>(
    _ makeUnderlyingIterator: @escaping () -> I
  ) where I.Element == Element {
    self.init(_ClosureBasedSequence(makeUnderlyingIterator))
  }

  public typealias Iterator = AnyIterator<Element>

  internal init(_box: _AnySequenceBox<Element>) {
    self._box = _box
  }

  internal let _box: _AnySequenceBox<Element>
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 602)
extension AnySequence {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 604)
  /// Returns an iterator over the elements of this sequence.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 608)
  public func makeIterator() -> Iterator {
    return _box._makeIterator()
  }

  public var underestimatedCount: Int {
    return _box._underestimatedCount
  }

  public func map<T>(
    _ transform: (Element) throws -> T
  ) rethrows -> [T] {
    return try _box._map(transform)
  }

  public func filter(
    _ isIncluded: (Element) throws -> Bool
  ) rethrows -> [Element] {
    return try _box._filter(isIncluded)
  }

  public func forEach(
    _ body: (Element) throws -> Void
  ) rethrows {
    return try _box._forEach(body)
  }

  public func drop(
    while predicate: (Element) throws -> Bool
  ) rethrows -> AnySequence<Element> {
    return try AnySequence(_box: _box._drop(while: predicate))
  }

  public func dropFirst(_ n: Int) -> AnySequence<Element> {
    return AnySequence(_box: _box._dropFirst(n))
  }

  public func dropLast(_ n: Int) -> AnySequence<Element> {
    return AnySequence(_box: _box._dropLast(n))
  }

  public func prefix(
    while predicate: (Element) throws -> Bool
  ) rethrows -> AnySequence<Element> {
    return try AnySequence(_box: _box._prefix(while: predicate))
  }

  public func prefix(_ maxLength: Int) -> AnySequence<Element> {
    return AnySequence(_box: _box._prefix(maxLength))
  }

  public func suffix(_ maxLength: Int) -> AnySequence<Element> {
    return AnySequence(_box: _box._suffix(maxLength))
  }

  public func split(
    maxSplits: Int = Int.max,
    omittingEmptySubsequences: Bool = true,
    whereSeparator isSeparator: (Element) throws -> Bool
  ) rethrows -> [AnySequence<Element>] {
    return try _box._split(
      maxSplits: maxSplits,
      omittingEmptySubsequences: omittingEmptySubsequences,
      whereSeparator: isSeparator)
  }

  public func _customContainsEquatableElement(
    _ element: Element
  ) -> Bool? {
    return _box.__customContainsEquatableElement(element)
  }

  public func _preprocessingPass<R>(
    _ preprocess: () throws -> R
  ) rethrows -> R? {
    return try _box.__preprocessingPass(preprocess)
  }

  public func _copyToContiguousArray() -> ContiguousArray<Element> {
    return self._box.__copyToContiguousArray()
  }

  public func _copyContents(initializing buf: UnsafeMutableBufferPointer<Iterator.Element>)
  -> (AnyIterator<Element>,UnsafeMutableBufferPointer<Element>.Index) {
    let (it,idx) = _box.__copyContents(initializing: buf)
    return (AnyIterator(it),idx)
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 602)
extension AnyCollection {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 606)
  /// Returns an iterator over the elements of this collection.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 608)
  public func makeIterator() -> Iterator {
    return _box._makeIterator()
  }

  public var underestimatedCount: Int {
    return _box._underestimatedCount
  }

  public func map<T>(
    _ transform: (Element) throws -> T
  ) rethrows -> [T] {
    return try _box._map(transform)
  }

  public func filter(
    _ isIncluded: (Element) throws -> Bool
  ) rethrows -> [Element] {
    return try _box._filter(isIncluded)
  }

  public func forEach(
    _ body: (Element) throws -> Void
  ) rethrows {
    return try _box._forEach(body)
  }

  public func drop(
    while predicate: (Element) throws -> Bool
  ) rethrows -> AnyCollection<Element> {
    return try AnyCollection(_box: _box._drop(while: predicate))
  }

  public func dropFirst(_ n: Int) -> AnyCollection<Element> {
    return AnyCollection(_box: _box._dropFirst(n))
  }

  public func dropLast(_ n: Int) -> AnyCollection<Element> {
    return AnyCollection(_box: _box._dropLast(n))
  }

  public func prefix(
    while predicate: (Element) throws -> Bool
  ) rethrows -> AnyCollection<Element> {
    return try AnyCollection(_box: _box._prefix(while: predicate))
  }

  public func prefix(_ maxLength: Int) -> AnyCollection<Element> {
    return AnyCollection(_box: _box._prefix(maxLength))
  }

  public func suffix(_ maxLength: Int) -> AnyCollection<Element> {
    return AnyCollection(_box: _box._suffix(maxLength))
  }

  public func split(
    maxSplits: Int = Int.max,
    omittingEmptySubsequences: Bool = true,
    whereSeparator isSeparator: (Element) throws -> Bool
  ) rethrows -> [AnyCollection<Element>] {
    return try _box._split(
      maxSplits: maxSplits,
      omittingEmptySubsequences: omittingEmptySubsequences,
      whereSeparator: isSeparator)
  }

  public func _customContainsEquatableElement(
    _ element: Element
  ) -> Bool? {
    return _box.__customContainsEquatableElement(element)
  }

  public func _preprocessingPass<R>(
    _ preprocess: () throws -> R
  ) rethrows -> R? {
    return try _box.__preprocessingPass(preprocess)
  }

  public func _copyToContiguousArray() -> ContiguousArray<Element> {
    return self._box.__copyToContiguousArray()
  }

  public func _copyContents(initializing buf: UnsafeMutableBufferPointer<Iterator.Element>)
  -> (AnyIterator<Element>,UnsafeMutableBufferPointer<Element>.Index) {
    let (it,idx) = _box.__copyContents(initializing: buf)
    return (AnyIterator(it),idx)
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 602)
extension AnyBidirectionalCollection {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 606)
  /// Returns an iterator over the elements of this collection.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 608)
  public func makeIterator() -> Iterator {
    return _box._makeIterator()
  }

  public var underestimatedCount: Int {
    return _box._underestimatedCount
  }

  public func map<T>(
    _ transform: (Element) throws -> T
  ) rethrows -> [T] {
    return try _box._map(transform)
  }

  public func filter(
    _ isIncluded: (Element) throws -> Bool
  ) rethrows -> [Element] {
    return try _box._filter(isIncluded)
  }

  public func forEach(
    _ body: (Element) throws -> Void
  ) rethrows {
    return try _box._forEach(body)
  }

  public func drop(
    while predicate: (Element) throws -> Bool
  ) rethrows -> AnyBidirectionalCollection<Element> {
    return try AnyBidirectionalCollection(_box: _box._drop(while: predicate))
  }

  public func dropFirst(_ n: Int) -> AnyBidirectionalCollection<Element> {
    return AnyBidirectionalCollection(_box: _box._dropFirst(n))
  }

  public func dropLast(_ n: Int) -> AnyBidirectionalCollection<Element> {
    return AnyBidirectionalCollection(_box: _box._dropLast(n))
  }

  public func prefix(
    while predicate: (Element) throws -> Bool
  ) rethrows -> AnyBidirectionalCollection<Element> {
    return try AnyBidirectionalCollection(_box: _box._prefix(while: predicate))
  }

  public func prefix(_ maxLength: Int) -> AnyBidirectionalCollection<Element> {
    return AnyBidirectionalCollection(_box: _box._prefix(maxLength))
  }

  public func suffix(_ maxLength: Int) -> AnyBidirectionalCollection<Element> {
    return AnyBidirectionalCollection(_box: _box._suffix(maxLength))
  }

  public func split(
    maxSplits: Int = Int.max,
    omittingEmptySubsequences: Bool = true,
    whereSeparator isSeparator: (Element) throws -> Bool
  ) rethrows -> [AnyBidirectionalCollection<Element>] {
    return try _box._split(
      maxSplits: maxSplits,
      omittingEmptySubsequences: omittingEmptySubsequences,
      whereSeparator: isSeparator)
  }

  public func _customContainsEquatableElement(
    _ element: Element
  ) -> Bool? {
    return _box.__customContainsEquatableElement(element)
  }

  public func _preprocessingPass<R>(
    _ preprocess: () throws -> R
  ) rethrows -> R? {
    return try _box.__preprocessingPass(preprocess)
  }

  public func _copyToContiguousArray() -> ContiguousArray<Element> {
    return self._box.__copyToContiguousArray()
  }

  public func _copyContents(initializing buf: UnsafeMutableBufferPointer<Iterator.Element>)
  -> (AnyIterator<Element>,UnsafeMutableBufferPointer<Element>.Index) {
    let (it,idx) = _box.__copyContents(initializing: buf)
    return (AnyIterator(it),idx)
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 602)
extension AnyRandomAccessCollection {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 606)
  /// Returns an iterator over the elements of this collection.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 608)
  public func makeIterator() -> Iterator {
    return _box._makeIterator()
  }

  public var underestimatedCount: Int {
    return _box._underestimatedCount
  }

  public func map<T>(
    _ transform: (Element) throws -> T
  ) rethrows -> [T] {
    return try _box._map(transform)
  }

  public func filter(
    _ isIncluded: (Element) throws -> Bool
  ) rethrows -> [Element] {
    return try _box._filter(isIncluded)
  }

  public func forEach(
    _ body: (Element) throws -> Void
  ) rethrows {
    return try _box._forEach(body)
  }

  public func drop(
    while predicate: (Element) throws -> Bool
  ) rethrows -> AnyRandomAccessCollection<Element> {
    return try AnyRandomAccessCollection(_box: _box._drop(while: predicate))
  }

  public func dropFirst(_ n: Int) -> AnyRandomAccessCollection<Element> {
    return AnyRandomAccessCollection(_box: _box._dropFirst(n))
  }

  public func dropLast(_ n: Int) -> AnyRandomAccessCollection<Element> {
    return AnyRandomAccessCollection(_box: _box._dropLast(n))
  }

  public func prefix(
    while predicate: (Element) throws -> Bool
  ) rethrows -> AnyRandomAccessCollection<Element> {
    return try AnyRandomAccessCollection(_box: _box._prefix(while: predicate))
  }

  public func prefix(_ maxLength: Int) -> AnyRandomAccessCollection<Element> {
    return AnyRandomAccessCollection(_box: _box._prefix(maxLength))
  }

  public func suffix(_ maxLength: Int) -> AnyRandomAccessCollection<Element> {
    return AnyRandomAccessCollection(_box: _box._suffix(maxLength))
  }

  public func split(
    maxSplits: Int = Int.max,
    omittingEmptySubsequences: Bool = true,
    whereSeparator isSeparator: (Element) throws -> Bool
  ) rethrows -> [AnyRandomAccessCollection<Element>] {
    return try _box._split(
      maxSplits: maxSplits,
      omittingEmptySubsequences: omittingEmptySubsequences,
      whereSeparator: isSeparator)
  }

  public func _customContainsEquatableElement(
    _ element: Element
  ) -> Bool? {
    return _box.__customContainsEquatableElement(element)
  }

  public func _preprocessingPass<R>(
    _ preprocess: () throws -> R
  ) rethrows -> R? {
    return try _box.__preprocessingPass(preprocess)
  }

  public func _copyToContiguousArray() -> ContiguousArray<Element> {
    return self._box.__copyToContiguousArray()
  }

  public func _copyContents(initializing buf: UnsafeMutableBufferPointer<Iterator.Element>)
  -> (AnyIterator<Element>,UnsafeMutableBufferPointer<Element>.Index) {
    let (it,idx) = _box.__copyContents(initializing: buf)
    return (AnyIterator(it),idx)
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 696)

//===--- Index ------------------------------------------------------------===//
//===----------------------------------------------------------------------===//

internal protocol _AnyIndexBox : class {
  var _typeID: ObjectIdentifier { get }

  func _unbox<T : Comparable>() -> T?

  func _isEqual(to rhs: _AnyIndexBox) -> Bool

  func _isLess(than rhs: _AnyIndexBox) -> Bool
}

internal final class _IndexBox<
  BaseIndex : Comparable
> : _AnyIndexBox {
  internal var _base: BaseIndex

  internal init(_base: BaseIndex) {
    self._base = _base
  }

  internal func _unsafeUnbox(_ other: _AnyIndexBox) -> BaseIndex {
    return unsafeDowncast(other, to: _IndexBox.self)._base
  }

  internal var _typeID: ObjectIdentifier {
    return ObjectIdentifier(type(of: self))
  }

  internal func _unbox<T : Comparable>() -> T? {
    return (self as _AnyIndexBox as? _IndexBox<T>)?._base
  }

  internal func _isEqual(to rhs: _AnyIndexBox) -> Bool {
    return _base == _unsafeUnbox(rhs)
  }

  internal func _isLess(than rhs: _AnyIndexBox) -> Bool {
    return _base < _unsafeUnbox(rhs)
  }
}

/// A wrapper over an underlying index that hides the specific underlying type.
///
/// - SeeAlso: `AnyCollection`
public struct AnyIndex {
  /// Creates a new index wrapping `base`.
  public init<BaseIndex : Comparable>(_ base: BaseIndex) {
    self._box = _IndexBox(_base: base)
  }

  internal init(_box: _AnyIndexBox) {
    self._box = _box
  }

  internal var _typeID: ObjectIdentifier {
    return _box._typeID
  }

  internal var _box: _AnyIndexBox
}

extension AnyIndex : Comparable {
  /// Returns a Boolean value indicating whether two indices wrap equal
  /// underlying indices.
  ///
  /// The types of the two underlying indices must be identical.
  ///
  /// - Parameters:
  ///   - lhs: An index to compare.
  ///   - rhs: Another index to compare.
  public static func == (lhs: AnyIndex, rhs: AnyIndex) -> Bool {
    _precondition(lhs._typeID == rhs._typeID, "base index types differ")
    return lhs._box._isEqual(to: rhs._box)
  }

  /// Returns a Boolean value indicating whether the first argument represents a
  /// position before the second argument.
  ///
  /// The types of the two underlying indices must be identical.
  ///
  /// - Parameters:
  ///   - lhs: An index to compare.
  ///   - rhs: Another index to compare.
  public static func < (lhs: AnyIndex, rhs: AnyIndex) -> Bool {
    _precondition(lhs._typeID == rhs._typeID, "base index types differ")
    return lhs._box._isLess(than: rhs._box)
  }
}

//===--- Collections ------------------------------------------------------===//
//===----------------------------------------------------------------------===//

public // @testable
protocol _AnyCollectionProtocol : Collection {
  /// Identifies the underlying collection stored by `self`. Instances
  /// copied or upgraded/downgraded from one another have the same `_boxID`.
  var _boxID: ObjectIdentifier { get }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 801)
/// A type-erased wrapper over any collection with indices that
/// support forward traversal.
///
/// An `AnyCollection` instance forwards its operations to a base collection having the
/// same `Element` type, hiding the specifics of the underlying
/// collection.
///
/// - SeeAlso: `AnyBidirectionalCollection`, `AnyRandomAccessCollection`
public struct AnyCollection<Element>
  : _AnyCollectionProtocol, Collection {

//  public typealias Indices
//    = DefaultIndices<AnyCollection>

  public typealias Iterator = AnyIterator<Element>

  internal init(_box: _AnyCollectionBox<Element>) {
    self._box = _box
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 823)
  /// Creates a type-erased collection that wraps the given collection.
  ///
  /// - Parameter base: The collection to wrap.
  ///
  /// - Complexity: O(1).
  public init<C : Collection>(_ base: C)
    where
    C.Iterator.Element == Element,

    // FIXME(ABI)#101 (Associated Types with where clauses): these constraints should be applied to
    // associated types of Collection.
    C.SubSequence : Collection,
    C.SubSequence.Iterator.Element == Element,
    C.SubSequence.Index == C.Index,
    C.SubSequence.Indices : Collection,
    C.SubSequence.Indices.Iterator.Element == C.Index,
    C.SubSequence.Indices.Index == C.Index,
    C.SubSequence.Indices.SubSequence == C.SubSequence.Indices,
    C.SubSequence.SubSequence == C.SubSequence,
    C.Indices : Collection,
    C.Indices.Iterator.Element == C.Index,
    C.Indices.Index == C.Index,
    C.Indices.SubSequence == C.Indices {
    // Traversal: Forward
    // SubTraversal: Forward
    self._box = _CollectionBox<C>(
      _base: base)
  }

  /// Creates an `AnyCollection` having the same underlying collection as `other`.
  ///
  /// - Complexity: O(1)
  public init(
    _ other: AnyCollection<Element>
  ) {
    self._box = other._box
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 823)
  /// Creates a type-erased collection that wraps the given collection.
  ///
  /// - Parameter base: The collection to wrap.
  ///
  /// - Complexity: O(1).
  public init<C : BidirectionalCollection>(_ base: C)
    where
    C.Iterator.Element == Element,

    // FIXME(ABI)#101 (Associated Types with where clauses): these constraints should be applied to
    // associated types of Collection.
    C.SubSequence : BidirectionalCollection,
    C.SubSequence.Iterator.Element == Element,
    C.SubSequence.Index == C.Index,
    C.SubSequence.Indices : BidirectionalCollection,
    C.SubSequence.Indices.Iterator.Element == C.Index,
    C.SubSequence.Indices.Index == C.Index,
    C.SubSequence.Indices.SubSequence == C.SubSequence.Indices,
    C.SubSequence.SubSequence == C.SubSequence,
    C.Indices : BidirectionalCollection,
    C.Indices.Iterator.Element == C.Index,
    C.Indices.Index == C.Index,
    C.Indices.SubSequence == C.Indices {
    // Traversal: Forward
    // SubTraversal: Bidirectional
    self._box = _BidirectionalCollectionBox<C>(
      _base: base)
  }

  /// Creates an `AnyCollection` having the same underlying collection as `other`.
  ///
  /// - Complexity: O(1)
  public init(
    _ other: AnyBidirectionalCollection<Element>
  ) {
    self._box = other._box
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 823)
  /// Creates a type-erased collection that wraps the given collection.
  ///
  /// - Parameter base: The collection to wrap.
  ///
  /// - Complexity: O(1).
  public init<C : RandomAccessCollection>(_ base: C)
    where
    C.Iterator.Element == Element,

    // FIXME(ABI)#101 (Associated Types with where clauses): these constraints should be applied to
    // associated types of Collection.
    C.SubSequence : RandomAccessCollection,
    C.SubSequence.Iterator.Element == Element,
    C.SubSequence.Index == C.Index,
    C.SubSequence.Indices : RandomAccessCollection,
    C.SubSequence.Indices.Iterator.Element == C.Index,
    C.SubSequence.Indices.Index == C.Index,
    C.SubSequence.Indices.SubSequence == C.SubSequence.Indices,
    C.SubSequence.SubSequence == C.SubSequence,
    C.Indices : RandomAccessCollection,
    C.Indices.Iterator.Element == C.Index,
    C.Indices.Index == C.Index,
    C.Indices.SubSequence == C.Indices {
    // Traversal: Forward
    // SubTraversal: RandomAccess
    self._box = _RandomAccessCollectionBox<C>(
      _base: base)
  }

  /// Creates an `AnyCollection` having the same underlying collection as `other`.
  ///
  /// - Complexity: O(1)
  public init(
    _ other: AnyRandomAccessCollection<Element>
  ) {
    self._box = other._box
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 861)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 879)

  public typealias Index = AnyIndex
  public typealias IndexDistance = IntMax

  /// The position of the first element in a non-empty collection.
  ///
  /// In an empty collection, `startIndex == endIndex`.
  public var startIndex: AnyIndex {
    return AnyIndex(_box: _box._startIndex)
  }

  /// The collection's "past the end" position---that is, the position one
  /// greater than the last valid subscript argument.
  ///
  /// `endIndex` is always reachable from `startIndex` by zero or more
  /// applications of `index(after:)`.
  public var endIndex: AnyIndex {
    return AnyIndex(_box: _box._endIndex)
  }

  /// Accesses the element indicated by `position`.
  ///
  /// - Precondition: `position` indicates a valid position in `self` and
  ///   `position != endIndex`.
  public subscript(position: AnyIndex) -> Element {
    return _box[position._box]
  }

  public subscript(bounds: Range<AnyIndex>) -> AnyCollection<Element> {
    return AnyCollection(_box:
      _box[start: bounds.lowerBound._box, end: bounds.upperBound._box])
  }

  public func _failEarlyRangeCheck(_ index: AnyIndex, bounds: Range<AnyIndex>) {
    // Do nothing.  Doing a range check would involve unboxing indices,
    // performing dynamic dispatch etc.  This seems to be too costly for a fast
    // range check for QoI purposes.
  }

  public func _failEarlyRangeCheck(_ range: Range<Index>, bounds: Range<Index>) {
    // Do nothing.  Doing a range check would involve unboxing indices,
    // performing dynamic dispatch etc.  This seems to be too costly for a fast
    // range check for QoI purposes.
  }

  public func index(after i: AnyIndex) -> AnyIndex {
    return AnyIndex(_box: _box._index(after: i._box))
  }

  public func formIndex(after i: inout AnyIndex) {
    if _isUnique(&i._box) {
      _box._formIndex(after: i._box)
    }
    else {
      i = index(after: i)
    }
  }

  public func index(_ i: AnyIndex, offsetBy n: IntMax) -> AnyIndex {
    return AnyIndex(_box: _box._index(i._box, offsetBy: n))
  }

  public func index(
    _ i: AnyIndex,
    offsetBy n: IntMax,
    limitedBy limit: AnyIndex
  ) -> AnyIndex? {
    return _box._index(i._box, offsetBy: n, limitedBy: limit._box)
      .map { AnyIndex(_box:$0) }
  }

  public func formIndex(_ i: inout AnyIndex, offsetBy n: IntMax) {
    if _isUnique(&i._box) {
      return _box._formIndex(&i._box, offsetBy: n)
    } else {
      i = index(i, offsetBy: n)
    }
  }

  public func formIndex(
    _ i: inout AnyIndex,
    offsetBy n: IntMax,
    limitedBy limit: AnyIndex
  ) -> Bool {
    if _isUnique(&i._box) {
      return _box._formIndex(&i._box, offsetBy: n, limitedBy: limit._box)
    }
    if let advanced = index(i, offsetBy: n, limitedBy: limit) {
      i = advanced
      return true
    }
    i = limit
    return false
  }

  public func distance(from start: AnyIndex, to end: AnyIndex) -> IntMax {
    return _box._distance(from: start._box, to: end._box)
  }

  /// The number of elements.
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 981)
  /// To check whether a collection is empty, use its `isEmpty` property
  /// instead of comparing `count` to zero. Calculating `count` can be an O(*n*)
  /// operation.
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 986)
  /// - Complexity: O(*n*)
  public var count: IntMax {
    return _box._count
  }

  public var first: Element? {
    return _box._first
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 1013)

  /// Uniquely identifies the stored underlying collection.
  public // Due to language limitations only
  var _boxID: ObjectIdentifier {
    return ObjectIdentifier(_box)
  }

  internal let _box: _AnyCollectionBox<Element>
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 801)
/// A type-erased wrapper over any collection with indices that
/// support bidirectional traversal.
///
/// An `AnyBidirectionalCollection` instance forwards its operations to a base collection having the
/// same `Element` type, hiding the specifics of the underlying
/// collection.
///
/// - SeeAlso: `AnyRandomAccessCollection`, `AnyForwardCollection`
public struct AnyBidirectionalCollection<Element>
  : _AnyCollectionProtocol, BidirectionalCollection {

//  public typealias Indices
//    = DefaultBidirectionalIndices<AnyBidirectionalCollection>

  public typealias Iterator = AnyIterator<Element>

  internal init(_box: _AnyBidirectionalCollectionBox<Element>) {
    self._box = _box
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 823)
  /// Creates a type-erased collection that wraps the given collection.
  ///
  /// - Parameter base: The collection to wrap.
  ///
  /// - Complexity: O(1).
  public init<C : BidirectionalCollection>(_ base: C)
    where
    C.Iterator.Element == Element,

    // FIXME(ABI)#101 (Associated Types with where clauses): these constraints should be applied to
    // associated types of Collection.
    C.SubSequence : BidirectionalCollection,
    C.SubSequence.Iterator.Element == Element,
    C.SubSequence.Index == C.Index,
    C.SubSequence.Indices : BidirectionalCollection,
    C.SubSequence.Indices.Iterator.Element == C.Index,
    C.SubSequence.Indices.Index == C.Index,
    C.SubSequence.Indices.SubSequence == C.SubSequence.Indices,
    C.SubSequence.SubSequence == C.SubSequence,
    C.Indices : BidirectionalCollection,
    C.Indices.Iterator.Element == C.Index,
    C.Indices.Index == C.Index,
    C.Indices.SubSequence == C.Indices {
    // Traversal: Bidirectional
    // SubTraversal: Bidirectional
    self._box = _BidirectionalCollectionBox<C>(
      _base: base)
  }

  /// Creates an `AnyBidirectionalCollection` having the same underlying collection as `other`.
  ///
  /// - Complexity: O(1)
  public init(
    _ other: AnyBidirectionalCollection<Element>
  ) {
    self._box = other._box
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 823)
  /// Creates a type-erased collection that wraps the given collection.
  ///
  /// - Parameter base: The collection to wrap.
  ///
  /// - Complexity: O(1).
  public init<C : RandomAccessCollection>(_ base: C)
    where
    C.Iterator.Element == Element,

    // FIXME(ABI)#101 (Associated Types with where clauses): these constraints should be applied to
    // associated types of Collection.
    C.SubSequence : RandomAccessCollection,
    C.SubSequence.Iterator.Element == Element,
    C.SubSequence.Index == C.Index,
    C.SubSequence.Indices : RandomAccessCollection,
    C.SubSequence.Indices.Iterator.Element == C.Index,
    C.SubSequence.Indices.Index == C.Index,
    C.SubSequence.Indices.SubSequence == C.SubSequence.Indices,
    C.SubSequence.SubSequence == C.SubSequence,
    C.Indices : RandomAccessCollection,
    C.Indices.Iterator.Element == C.Index,
    C.Indices.Index == C.Index,
    C.Indices.SubSequence == C.Indices {
    // Traversal: Bidirectional
    // SubTraversal: RandomAccess
    self._box = _RandomAccessCollectionBox<C>(
      _base: base)
  }

  /// Creates an `AnyBidirectionalCollection` having the same underlying collection as `other`.
  ///
  /// - Complexity: O(1)
  public init(
    _ other: AnyRandomAccessCollection<Element>
  ) {
    self._box = other._box
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 861)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 863)
  /// Creates an `AnyBidirectionalCollection` having the same underlying collection as `other`.
  ///
  /// If the underlying collection stored by `other` does not satisfy
  /// `BidirectionalCollection`, the result is `nil`.
  ///
  /// - Complexity: O(1)
  public init?(
    _ other: AnyCollection<Element>
  ) {
    guard let box =
      other._box as? _AnyBidirectionalCollectionBox<Element> else {
      return nil
    }
    self._box = box
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 879)

  public typealias Index = AnyIndex
  public typealias IndexDistance = IntMax

  /// The position of the first element in a non-empty collection.
  ///
  /// In an empty collection, `startIndex == endIndex`.
  public var startIndex: AnyIndex {
    return AnyIndex(_box: _box._startIndex)
  }

  /// The collection's "past the end" position---that is, the position one
  /// greater than the last valid subscript argument.
  ///
  /// `endIndex` is always reachable from `startIndex` by zero or more
  /// applications of `index(after:)`.
  public var endIndex: AnyIndex {
    return AnyIndex(_box: _box._endIndex)
  }

  /// Accesses the element indicated by `position`.
  ///
  /// - Precondition: `position` indicates a valid position in `self` and
  ///   `position != endIndex`.
  public subscript(position: AnyIndex) -> Element {
    return _box[position._box]
  }

  public subscript(bounds: Range<AnyIndex>) -> AnyBidirectionalCollection<Element> {
    return AnyBidirectionalCollection(_box:
      _box[start: bounds.lowerBound._box, end: bounds.upperBound._box])
  }

  public func _failEarlyRangeCheck(_ index: AnyIndex, bounds: Range<AnyIndex>) {
    // Do nothing.  Doing a range check would involve unboxing indices,
    // performing dynamic dispatch etc.  This seems to be too costly for a fast
    // range check for QoI purposes.
  }

  public func _failEarlyRangeCheck(_ range: Range<Index>, bounds: Range<Index>) {
    // Do nothing.  Doing a range check would involve unboxing indices,
    // performing dynamic dispatch etc.  This seems to be too costly for a fast
    // range check for QoI purposes.
  }

  public func index(after i: AnyIndex) -> AnyIndex {
    return AnyIndex(_box: _box._index(after: i._box))
  }

  public func formIndex(after i: inout AnyIndex) {
    if _isUnique(&i._box) {
      _box._formIndex(after: i._box)
    }
    else {
      i = index(after: i)
    }
  }

  public func index(_ i: AnyIndex, offsetBy n: IntMax) -> AnyIndex {
    return AnyIndex(_box: _box._index(i._box, offsetBy: n))
  }

  public func index(
    _ i: AnyIndex,
    offsetBy n: IntMax,
    limitedBy limit: AnyIndex
  ) -> AnyIndex? {
    return _box._index(i._box, offsetBy: n, limitedBy: limit._box)
      .map { AnyIndex(_box:$0) }
  }

  public func formIndex(_ i: inout AnyIndex, offsetBy n: IntMax) {
    if _isUnique(&i._box) {
      return _box._formIndex(&i._box, offsetBy: n)
    } else {
      i = index(i, offsetBy: n)
    }
  }

  public func formIndex(
    _ i: inout AnyIndex,
    offsetBy n: IntMax,
    limitedBy limit: AnyIndex
  ) -> Bool {
    if _isUnique(&i._box) {
      return _box._formIndex(&i._box, offsetBy: n, limitedBy: limit._box)
    }
    if let advanced = index(i, offsetBy: n, limitedBy: limit) {
      i = advanced
      return true
    }
    i = limit
    return false
  }

  public func distance(from start: AnyIndex, to end: AnyIndex) -> IntMax {
    return _box._distance(from: start._box, to: end._box)
  }

  /// The number of elements.
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 981)
  /// To check whether a collection is empty, use its `isEmpty` property
  /// instead of comparing `count` to zero. Calculating `count` can be an O(*n*)
  /// operation.
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 986)
  /// - Complexity: O(*n*)
  public var count: IntMax {
    return _box._count
  }

  public var first: Element? {
    return _box._first
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 996)
  public func index(before i: AnyIndex) -> AnyIndex {
    return AnyIndex(_box: _box._index(before: i._box))
  }

  public func formIndex(before i: inout AnyIndex) {
    if _isUnique(&i._box) {
      _box._formIndex(before: i._box)
    }
    else {
      i = index(before: i)
    }
  }

  public var last: Element? {
    return _box._last
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 1013)

  /// Uniquely identifies the stored underlying collection.
  public // Due to language limitations only
  var _boxID: ObjectIdentifier {
    return ObjectIdentifier(_box)
  }

  internal let _box: _AnyBidirectionalCollectionBox<Element>
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 801)
/// A type-erased wrapper over any collection with indices that
/// support random access traversal.
///
/// An `AnyRandomAccessCollection` instance forwards its operations to a base collection having the
/// same `Element` type, hiding the specifics of the underlying
/// collection.
///
/// - SeeAlso: `AnyForwardCollection`, `AnyBidirectionalCollection`
public struct AnyRandomAccessCollection<Element>
  : _AnyCollectionProtocol, RandomAccessCollection {

//  public typealias Indices
//    = DefaultRandomAccessIndices<AnyRandomAccessCollection>

  public typealias Iterator = AnyIterator<Element>

  internal init(_box: _AnyRandomAccessCollectionBox<Element>) {
    self._box = _box
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 823)
  /// Creates a type-erased collection that wraps the given collection.
  ///
  /// - Parameter base: The collection to wrap.
  ///
  /// - Complexity: O(1).
  public init<C : RandomAccessCollection>(_ base: C)
    where
    C.Iterator.Element == Element,

    // FIXME(ABI)#101 (Associated Types with where clauses): these constraints should be applied to
    // associated types of Collection.
    C.SubSequence : RandomAccessCollection,
    C.SubSequence.Iterator.Element == Element,
    C.SubSequence.Index == C.Index,
    C.SubSequence.Indices : RandomAccessCollection,
    C.SubSequence.Indices.Iterator.Element == C.Index,
    C.SubSequence.Indices.Index == C.Index,
    C.SubSequence.Indices.SubSequence == C.SubSequence.Indices,
    C.SubSequence.SubSequence == C.SubSequence,
    C.Indices : RandomAccessCollection,
    C.Indices.Iterator.Element == C.Index,
    C.Indices.Index == C.Index,
    C.Indices.SubSequence == C.Indices {
    // Traversal: RandomAccess
    // SubTraversal: RandomAccess
    self._box = _RandomAccessCollectionBox<C>(
      _base: base)
  }

  /// Creates an `AnyRandomAccessCollection` having the same underlying collection as `other`.
  ///
  /// - Complexity: O(1)
  public init(
    _ other: AnyRandomAccessCollection<Element>
  ) {
    self._box = other._box
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 861)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 863)
  /// Creates an `AnyRandomAccessCollection` having the same underlying collection as `other`.
  ///
  /// If the underlying collection stored by `other` does not satisfy
  /// `RandomAccessCollection`, the result is `nil`.
  ///
  /// - Complexity: O(1)
  public init?(
    _ other: AnyCollection<Element>
  ) {
    guard let box =
      other._box as? _AnyRandomAccessCollectionBox<Element> else {
      return nil
    }
    self._box = box
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 863)
  /// Creates an `AnyRandomAccessCollection` having the same underlying collection as `other`.
  ///
  /// If the underlying collection stored by `other` does not satisfy
  /// `RandomAccessCollection`, the result is `nil`.
  ///
  /// - Complexity: O(1)
  public init?(
    _ other: AnyBidirectionalCollection<Element>
  ) {
    guard let box =
      other._box as? _AnyRandomAccessCollectionBox<Element> else {
      return nil
    }
    self._box = box
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 879)

  public typealias Index = AnyIndex
  public typealias IndexDistance = IntMax

  /// The position of the first element in a non-empty collection.
  ///
  /// In an empty collection, `startIndex == endIndex`.
  public var startIndex: AnyIndex {
    return AnyIndex(_box: _box._startIndex)
  }

  /// The collection's "past the end" position---that is, the position one
  /// greater than the last valid subscript argument.
  ///
  /// `endIndex` is always reachable from `startIndex` by zero or more
  /// applications of `index(after:)`.
  public var endIndex: AnyIndex {
    return AnyIndex(_box: _box._endIndex)
  }

  /// Accesses the element indicated by `position`.
  ///
  /// - Precondition: `position` indicates a valid position in `self` and
  ///   `position != endIndex`.
  public subscript(position: AnyIndex) -> Element {
    return _box[position._box]
  }

  public subscript(bounds: Range<AnyIndex>) -> AnyRandomAccessCollection<Element> {
    return AnyRandomAccessCollection(_box:
      _box[start: bounds.lowerBound._box, end: bounds.upperBound._box])
  }

  public func _failEarlyRangeCheck(_ index: AnyIndex, bounds: Range<AnyIndex>) {
    // Do nothing.  Doing a range check would involve unboxing indices,
    // performing dynamic dispatch etc.  This seems to be too costly for a fast
    // range check for QoI purposes.
  }

  public func _failEarlyRangeCheck(_ range: Range<Index>, bounds: Range<Index>) {
    // Do nothing.  Doing a range check would involve unboxing indices,
    // performing dynamic dispatch etc.  This seems to be too costly for a fast
    // range check for QoI purposes.
  }

  public func index(after i: AnyIndex) -> AnyIndex {
    return AnyIndex(_box: _box._index(after: i._box))
  }

  public func formIndex(after i: inout AnyIndex) {
    if _isUnique(&i._box) {
      _box._formIndex(after: i._box)
    }
    else {
      i = index(after: i)
    }
  }

  public func index(_ i: AnyIndex, offsetBy n: IntMax) -> AnyIndex {
    return AnyIndex(_box: _box._index(i._box, offsetBy: n))
  }

  public func index(
    _ i: AnyIndex,
    offsetBy n: IntMax,
    limitedBy limit: AnyIndex
  ) -> AnyIndex? {
    return _box._index(i._box, offsetBy: n, limitedBy: limit._box)
      .map { AnyIndex(_box:$0) }
  }

  public func formIndex(_ i: inout AnyIndex, offsetBy n: IntMax) {
    if _isUnique(&i._box) {
      return _box._formIndex(&i._box, offsetBy: n)
    } else {
      i = index(i, offsetBy: n)
    }
  }

  public func formIndex(
    _ i: inout AnyIndex,
    offsetBy n: IntMax,
    limitedBy limit: AnyIndex
  ) -> Bool {
    if _isUnique(&i._box) {
      return _box._formIndex(&i._box, offsetBy: n, limitedBy: limit._box)
    }
    if let advanced = index(i, offsetBy: n, limitedBy: limit) {
      i = advanced
      return true
    }
    i = limit
    return false
  }

  public func distance(from start: AnyIndex, to end: AnyIndex) -> IntMax {
    return _box._distance(from: start._box, to: end._box)
  }

  /// The number of elements.
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 986)
  /// - Complexity: O(1)
  public var count: IntMax {
    return _box._count
  }

  public var first: Element? {
    return _box._first
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 996)
  public func index(before i: AnyIndex) -> AnyIndex {
    return AnyIndex(_box: _box._index(before: i._box))
  }

  public func formIndex(before i: inout AnyIndex) {
    if _isUnique(&i._box) {
      _box._formIndex(before: i._box)
    }
    else {
      i = index(before: i)
    }
  }

  public var last: Element? {
    return _box._last
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 1013)

  /// Uniquely identifies the stored underlying collection.
  public // Due to language limitations only
  var _boxID: ObjectIdentifier {
    return ObjectIdentifier(_box)
  }

  internal let _box: _AnyRandomAccessCollectionBox<Element>
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 1023)

@available(*, unavailable, renamed: "AnyIterator")
public struct AnyGenerator<Element> {}

extension AnyIterator {
  @available(*, unavailable, renamed: "makeIterator()")
  public func generate() -> AnyIterator<Element> {
    Builtin.unreachable()
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 1035)
extension AnySequence {

  @available(*, unavailable, renamed: "getter:underestimatedCount()")
  public func underestimateCount() -> Int {
    Builtin.unreachable()
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 1035)
extension AnyCollection {

  @available(*, unavailable, renamed: "getter:underestimatedCount()")
  public func underestimateCount() -> Int {
    Builtin.unreachable()
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 1035)
extension AnyBidirectionalCollection {

  @available(*, unavailable, renamed: "getter:underestimatedCount()")
  public func underestimateCount() -> Int {
    Builtin.unreachable()
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 1035)
extension AnyRandomAccessCollection {

  @available(*, unavailable, renamed: "getter:underestimatedCount()")
  public func underestimateCount() -> Int {
    Builtin.unreachable()
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 1043)

@available(*, unavailable, renamed: "_AnyCollectionProtocol")
public typealias AnyCollectionType = _AnyCollectionProtocol

@available(*, unavailable, renamed: "_AnyCollectionProtocol")
public typealias AnyCollectionProtocol = _AnyCollectionProtocol

extension _AnyCollectionProtocol {
  @available(*, unavailable, renamed: "makeIterator()")
  public func generate() -> AnyIterator<Iterator.Element> {
    Builtin.unreachable()
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 1058)
@available(*, unavailable, renamed: "AnyIndex")
public typealias AnyForwardIndex = AnyIndex
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 1058)
@available(*, unavailable, renamed: "AnyIndex")
public typealias AnyBidirectionalIndex = AnyIndex
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 1058)
@available(*, unavailable, renamed: "AnyIndex")
public typealias AnyRandomAccessIndex = AnyIndex
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/ExistentialCollection.swift.gyb", line: 1061)


@available(*, unavailable, renamed: "AnyIterator.init(_:)")
public func anyGenerator<G : IteratorProtocol>(_ base: G) -> AnyIterator<G.Element> {
    Builtin.unreachable()
}

@available(*, unavailable, renamed: "AnyIterator.init(_:)")
public func anyGenerator<Element>(_ body: () -> Element?) -> AnyIterator<Element> {
  Builtin.unreachable()
}

@available(*, unavailable)
public func === <
  L : _AnyCollectionProtocol, R : _AnyCollectionProtocol
>(lhs: L, rhs: R) -> Bool {
  Builtin.unreachable()
}

@available(*, unavailable)
public func !== <
  L : _AnyCollectionProtocol, R : _AnyCollectionProtocol
>(lhs: L, rhs: R) -> Bool {
  Builtin.unreachable()
}
