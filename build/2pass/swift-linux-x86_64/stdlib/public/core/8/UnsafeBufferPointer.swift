// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeBufferPointer.swift.gyb", line: 1)
//===--- UnsafeBufferPointer.swift.gyb ------------------------*- swift -*-===//
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

/// An iterator for the elements in the buffer referenced by an
/// `UnsafeBufferPointer` or `UnsafeMutableBufferPointer` instance.
public struct UnsafeBufferPointerIterator<Element>
  : IteratorProtocol, Sequence {

  /// Advances to the next element and returns it, or `nil` if no next element
  /// exists.
  ///
  /// Once `nil` has been returned, all subsequent calls return `nil`.
  public mutating func next() -> Element? {
    if _position == _end { return nil }

    let result = _position!.pointee
    _position! += 1
    return result
  }

  internal var _position, _end: UnsafePointer<Element>?
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeBufferPointer.swift.gyb", line: 36)
/// A non-owning collection interface to a buffer of mutable
/// elements stored contiguously in memory.
///
/// You can use an `UnsafeMutableBufferPointer` instance in low level operations to eliminate
/// uniqueness checks and, in release mode, bounds checks. Bounds checks are
/// always performed in debug mode.
///
/// UnsafeMutableBufferPointer Semantics
/// =================
///
/// An `UnsafeMutableBufferPointer` instance is a view into memory and does not own the memory
/// that it references. Copying a value of type `UnsafeMutableBufferPointer` does not copy the
/// instances stored in the underlying memory. However, initializing another
/// collection with an `UnsafeMutableBufferPointer` instance copies the instances out of the
/// referenced memory and into the new collection.
///
/// - SeeAlso: `UnsafeMutablePointer`, `UnsafeMutableRawBufferPointer`
@_fixed_layout
public struct UnsafeMutableBufferPointer<Element>
  : _MutableIndexable, MutableCollection, RandomAccessCollection {
  // FIXME: rdar://18157434 - until this is fixed, this has to be fixed layout
  // to avoid a hang in Foundation, which has the following setup:
  // struct A { struct B { let x: UnsafeMutableBufferPointer<...> } let b: B }

  public typealias Index = Int
  public typealias IndexDistance = Int
  public typealias Iterator =
    IndexingIterator<UnsafeMutableBufferPointer<Element>>

  /// The index of the first element in a nonempty buffer.
  ///
  /// The `startIndex` property of an `UnsafeMutableBufferPointer` instance
  /// is always zero.
  public var startIndex: Int {
    return 0
  }

  /// The "past the end" position---that is, the position one greater than the
  /// last valid subscript argument.
  ///
  /// The `endIndex` property of an `UnsafeMutableBufferPointer` instance is
  /// always identical to `count`.
  public var endIndex: Int {
    return count
  }

  public func index(after i: Int) -> Int {
    // NOTE: this is a manual specialization of index movement for a Strideable
    // index that is required for UnsafeBufferPointer performance. The
    // optimizer is not capable of creating partial specializations yet.
    // NOTE: Range checks are not performed here, because it is done later by
    // the subscript function.
    return i + 1
  }

  public func formIndex(after i: inout Int) {
    // NOTE: this is a manual specialization of index movement for a Strideable
    // index that is required for UnsafeBufferPointer performance. The
    // optimizer is not capable of creating partial specializations yet.
    // NOTE: Range checks are not performed here, because it is done later by
    // the subscript function.
    i += 1
  }

  public func index(before i: Int) -> Int {
    // NOTE: this is a manual specialization of index movement for a Strideable
    // index that is required for UnsafeBufferPointer performance. The
    // optimizer is not capable of creating partial specializations yet.
    // NOTE: Range checks are not performed here, because it is done later by
    // the subscript function.
    return i - 1
  }

  public func formIndex(before i: inout Int) {
    // NOTE: this is a manual specialization of index movement for a Strideable
    // index that is required for UnsafeBufferPointer performance. The
    // optimizer is not capable of creating partial specializations yet.
    // NOTE: Range checks are not performed here, because it is done later by
    // the subscript function.
    i -= 1
  }

  public func index(_ i: Int, offsetBy n: Int) -> Int {
    // NOTE: this is a manual specialization of index movement for a Strideable
    // index that is required for UnsafeBufferPointer performance. The
    // optimizer is not capable of creating partial specializations yet.
    // NOTE: Range checks are not performed here, because it is done later by
    // the subscript function.
    return i + n
  }

  public func index(
    _ i: Int, offsetBy n: Int, limitedBy limit: Int
  ) -> Int? {
    // NOTE: this is a manual specialization of index movement for a Strideable
    // index that is required for UnsafeBufferPointer performance. The
    // optimizer is not capable of creating partial specializations yet.
    // NOTE: Range checks are not performed here, because it is done later by
    // the subscript function.
    let l = limit - i
    if n > 0 ? l >= 0 && l < n : l <= 0 && n < l {
      return nil
    }
    return i + n
  }

  public func distance(from start: Int, to end: Int) -> Int {
    // NOTE: this is a manual specialization of index movement for a Strideable
    // index that is required for UnsafeBufferPointer performance. The
    // optimizer is not capable of creating partial specializations yet.
    // NOTE: Range checks are not performed here, because it is done later by
    // the subscript function.
    return end - start
  }

  public func _failEarlyRangeCheck(_ index: Int, bounds: Range<Int>) {
    // NOTE: This method is a no-op for performance reasons.
  }

  public func _failEarlyRangeCheck(_ range: Range<Int>, bounds: Range<Int>) {
    // NOTE: This method is a no-op for performance reasons.
  }

  public typealias Indices = CountableRange<Int>

  public var indices: Indices {
    return startIndex..<endIndex
  }

  /// Accesses the element at the specified position.
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeBufferPointer.swift.gyb", line: 168)
  /// The following example uses the buffer pointer's subscript to access and
  /// modifying the elements of a mutable buffer pointing to the contiguous
  /// contents of an array:
  ///
  ///     var numbers = [1, 2, 3, 4, 5]
  ///     numbers.withUnsafeMutableBufferPointer { buffer in
  ///         for i in stride(from: buffer.startIndex, to: buffer.endIndex - 1, by: 2) {
  ///             let x = buffer[i]
  ///             buffer[i + 1] = buffer[i]
  ///             buffer[i] = x
  ///         }
  ///     }
  ///     print(numbers)
  ///     // Prints "[2, 1, 4, 3, 5]"
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeBufferPointer.swift.gyb", line: 196)
  ///
  /// - Note: Bounds checks for `i` are performed only in debug mode.
  ///
  /// - Parameter i: The position of the element to access. `i` must be in the
  ///   range `0..<count`.
  public subscript(i: Int) -> Element {
    get {
      _debugPrecondition(i >= 0)
      _debugPrecondition(i < endIndex)
      return _position![i]
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeBufferPointer.swift.gyb", line: 208)
    nonmutating set {
      _debugPrecondition(i >= 0)
      _debugPrecondition(i < endIndex)
      _position![i] = newValue
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeBufferPointer.swift.gyb", line: 214)
  }

  public subscript(bounds: Range<Int>)
    -> MutableRandomAccessSlice<UnsafeMutableBufferPointer<Element>>
  {
    get {
      _debugPrecondition(bounds.lowerBound >= startIndex)
      _debugPrecondition(bounds.upperBound <= endIndex)
      return MutableRandomAccessSlice(
        base: self, bounds: bounds)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeBufferPointer.swift.gyb", line: 226)
    set {
      _debugPrecondition(bounds.lowerBound >= startIndex)
      _debugPrecondition(bounds.upperBound <= endIndex)
      // FIXME: swift-3-indexing-model: tests.
      _writeBackMutableSlice(&self, bounds: bounds, slice: newValue)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeBufferPointer.swift.gyb", line: 233)
  }

  /// Creates a new buffer pointer over the specified number of contiguous
  /// instances beginning at the given pointer.
  ///
  /// - Parameters:
  ///   - start: A pointer to the start of the buffer, or `nil`. If `start` is
  ///     `nil`, `count` must be zero. However, `count` may be zero even for a
  ///     non-`nil` `start`. The pointer passed as `start` must be aligned to
  ///     `MemoryLayout<Element>.alignment`.
  ///   - count: The number of instances in the buffer. `count` must not be
  ///     negative.
  public init(start: UnsafeMutablePointer<Element>?, count: Int) {
    _precondition(
      count >= 0, "UnsafeMutableBufferPointer with negative count")
    _precondition(
      count == 0 || start != nil,
      "UnsafeMutableBufferPointer has a nil start and nonzero count")
    _position = start
    _end = start.map { $0 + count }
  }

  /// Returns an iterator over the elements of this buffer.
  ///
  /// - Returns: An iterator over the elements of this buffer.
  public func makeIterator() -> UnsafeBufferPointerIterator<Element> {
    return UnsafeBufferPointerIterator(_position: _position, _end: _end)
  }

  /// A pointer to the first element of the buffer.
  ///
  /// If the `baseAddress` of this buffer is `nil`, the count is zero. However,
  /// a buffer can have a `count` of zero even with a non-`nil` base address.
  public var baseAddress: UnsafeMutablePointer<Element>? {
    return _position
  }

  /// The number of elements in the buffer.
  ///
  /// If the `baseAddress` of this buffer is `nil`, the count is zero. However,
  /// a buffer can have a `count` of zero even with a non-`nil` base address.
  public var count: Int {
    if let pos = _position {
      return _end! - pos
    }
    return 0
  }

  let _position, _end: UnsafeMutablePointer<Element>?
}

extension UnsafeMutableBufferPointer : CustomDebugStringConvertible {
  /// A textual representation of the buffer, suitable for debugging.
  public var debugDescription: String {
    return "UnsafeMutableBufferPointer"
      + "(start: \(_position.map(String.init(describing:)) ?? "nil"), count: \(count))"
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeBufferPointer.swift.gyb", line: 36)
/// A non-owning collection interface to a buffer of 
/// elements stored contiguously in memory.
///
/// You can use an `UnsafeBufferPointer` instance in low level operations to eliminate
/// uniqueness checks and, in release mode, bounds checks. Bounds checks are
/// always performed in debug mode.
///
/// UnsafeBufferPointer Semantics
/// =================
///
/// An `UnsafeBufferPointer` instance is a view into memory and does not own the memory
/// that it references. Copying a value of type `UnsafeBufferPointer` does not copy the
/// instances stored in the underlying memory. However, initializing another
/// collection with an `UnsafeBufferPointer` instance copies the instances out of the
/// referenced memory and into the new collection.
///
/// - SeeAlso: `UnsafePointer`, `UnsafeRawBufferPointer`
@_fixed_layout
public struct UnsafeBufferPointer<Element>
  : _Indexable, Collection, RandomAccessCollection {
  // FIXME: rdar://18157434 - until this is fixed, this has to be fixed layout
  // to avoid a hang in Foundation, which has the following setup:
  // struct A { struct B { let x: UnsafeMutableBufferPointer<...> } let b: B }

  public typealias Index = Int
  public typealias IndexDistance = Int
  public typealias Iterator =
    IndexingIterator<UnsafeBufferPointer<Element>>

  /// The index of the first element in a nonempty buffer.
  ///
  /// The `startIndex` property of an `UnsafeBufferPointer` instance
  /// is always zero.
  public var startIndex: Int {
    return 0
  }

  /// The "past the end" position---that is, the position one greater than the
  /// last valid subscript argument.
  ///
  /// The `endIndex` property of an `UnsafeBufferPointer` instance is
  /// always identical to `count`.
  public var endIndex: Int {
    return count
  }

  public func index(after i: Int) -> Int {
    // NOTE: this is a manual specialization of index movement for a Strideable
    // index that is required for UnsafeBufferPointer performance. The
    // optimizer is not capable of creating partial specializations yet.
    // NOTE: Range checks are not performed here, because it is done later by
    // the subscript function.
    return i + 1
  }

  public func formIndex(after i: inout Int) {
    // NOTE: this is a manual specialization of index movement for a Strideable
    // index that is required for UnsafeBufferPointer performance. The
    // optimizer is not capable of creating partial specializations yet.
    // NOTE: Range checks are not performed here, because it is done later by
    // the subscript function.
    i += 1
  }

  public func index(before i: Int) -> Int {
    // NOTE: this is a manual specialization of index movement for a Strideable
    // index that is required for UnsafeBufferPointer performance. The
    // optimizer is not capable of creating partial specializations yet.
    // NOTE: Range checks are not performed here, because it is done later by
    // the subscript function.
    return i - 1
  }

  public func formIndex(before i: inout Int) {
    // NOTE: this is a manual specialization of index movement for a Strideable
    // index that is required for UnsafeBufferPointer performance. The
    // optimizer is not capable of creating partial specializations yet.
    // NOTE: Range checks are not performed here, because it is done later by
    // the subscript function.
    i -= 1
  }

  public func index(_ i: Int, offsetBy n: Int) -> Int {
    // NOTE: this is a manual specialization of index movement for a Strideable
    // index that is required for UnsafeBufferPointer performance. The
    // optimizer is not capable of creating partial specializations yet.
    // NOTE: Range checks are not performed here, because it is done later by
    // the subscript function.
    return i + n
  }

  public func index(
    _ i: Int, offsetBy n: Int, limitedBy limit: Int
  ) -> Int? {
    // NOTE: this is a manual specialization of index movement for a Strideable
    // index that is required for UnsafeBufferPointer performance. The
    // optimizer is not capable of creating partial specializations yet.
    // NOTE: Range checks are not performed here, because it is done later by
    // the subscript function.
    let l = limit - i
    if n > 0 ? l >= 0 && l < n : l <= 0 && n < l {
      return nil
    }
    return i + n
  }

  public func distance(from start: Int, to end: Int) -> Int {
    // NOTE: this is a manual specialization of index movement for a Strideable
    // index that is required for UnsafeBufferPointer performance. The
    // optimizer is not capable of creating partial specializations yet.
    // NOTE: Range checks are not performed here, because it is done later by
    // the subscript function.
    return end - start
  }

  public func _failEarlyRangeCheck(_ index: Int, bounds: Range<Int>) {
    // NOTE: This method is a no-op for performance reasons.
  }

  public func _failEarlyRangeCheck(_ range: Range<Int>, bounds: Range<Int>) {
    // NOTE: This method is a no-op for performance reasons.
  }

  public typealias Indices = CountableRange<Int>

  public var indices: Indices {
    return startIndex..<endIndex
  }

  /// Accesses the element at the specified position.
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeBufferPointer.swift.gyb", line: 183)
  /// The following example uses the buffer pointer's subscript to access every
  /// other element of the buffer:
  ///
  ///     let numbers = [1, 2, 3, 4, 5]
  ///     let sum = numbers.withUnsafeBufferPointer { buffer -> Int in
  ///         var result = 0
  ///         for i in stride(from: buffer.startIndex, to: buffer.endIndex, by: 2) {
  ///             result += buffer[i]
  ///         }
  ///         return result
  ///     }
  ///     // 'sum' == 9
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeBufferPointer.swift.gyb", line: 196)
  ///
  /// - Note: Bounds checks for `i` are performed only in debug mode.
  ///
  /// - Parameter i: The position of the element to access. `i` must be in the
  ///   range `0..<count`.
  public subscript(i: Int) -> Element {
    get {
      _debugPrecondition(i >= 0)
      _debugPrecondition(i < endIndex)
      return _position![i]
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeBufferPointer.swift.gyb", line: 214)
  }

  public subscript(bounds: Range<Int>)
    -> RandomAccessSlice<UnsafeBufferPointer<Element>>
  {
    get {
      _debugPrecondition(bounds.lowerBound >= startIndex)
      _debugPrecondition(bounds.upperBound <= endIndex)
      return RandomAccessSlice(
        base: self, bounds: bounds)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeBufferPointer.swift.gyb", line: 233)
  }

  /// Creates a new buffer pointer over the specified number of contiguous
  /// instances beginning at the given pointer.
  ///
  /// - Parameters:
  ///   - start: A pointer to the start of the buffer, or `nil`. If `start` is
  ///     `nil`, `count` must be zero. However, `count` may be zero even for a
  ///     non-`nil` `start`. The pointer passed as `start` must be aligned to
  ///     `MemoryLayout<Element>.alignment`.
  ///   - count: The number of instances in the buffer. `count` must not be
  ///     negative.
  public init(start: UnsafePointer<Element>?, count: Int) {
    _precondition(
      count >= 0, "UnsafeBufferPointer with negative count")
    _precondition(
      count == 0 || start != nil,
      "UnsafeBufferPointer has a nil start and nonzero count")
    _position = start
    _end = start.map { $0 + count }
  }

  /// Returns an iterator over the elements of this buffer.
  ///
  /// - Returns: An iterator over the elements of this buffer.
  public func makeIterator() -> UnsafeBufferPointerIterator<Element> {
    return UnsafeBufferPointerIterator(_position: _position, _end: _end)
  }

  /// A pointer to the first element of the buffer.
  ///
  /// If the `baseAddress` of this buffer is `nil`, the count is zero. However,
  /// a buffer can have a `count` of zero even with a non-`nil` base address.
  public var baseAddress: UnsafePointer<Element>? {
    return _position
  }

  /// The number of elements in the buffer.
  ///
  /// If the `baseAddress` of this buffer is `nil`, the count is zero. However,
  /// a buffer can have a `count` of zero even with a non-`nil` base address.
  public var count: Int {
    if let pos = _position {
      return _end! - pos
    }
    return 0
  }

  let _position, _end: UnsafePointer<Element>?
}

extension UnsafeBufferPointer : CustomDebugStringConvertible {
  /// A textual representation of the buffer, suitable for debugging.
  public var debugDescription: String {
    return "UnsafeBufferPointer"
      + "(start: \(_position.map(String.init(describing:)) ?? "nil"), count: \(count))"
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeBufferPointer.swift.gyb", line: 292)


extension UnsafeMutableBufferPointer {
  /// Initializes memory in the buffer with the elements of `source`.
  /// Returns an iterator to any elements of `source` that didn't fit in the 
  /// buffer, and an index to the point in the buffer one past the last element
  /// written (so `startIndex` if no elements written, `endIndex` if the buffer 
  /// was completely filled).
  ///
  /// - Precondition: The memory in `self` is uninitialized. The buffer must
  ///   contain sufficient uninitialized memory to accommodate `source.underestimatedCount`.
  ///
  /// - Postcondition: The `Pointee`s at `self[startIndex..<returned index]` are
  ///   initialized.
  public func initialize<S: Sequence>(from source: S) -> (S.Iterator, Index)
    where S.Iterator.Element == Iterator.Element {
    return source._copyContents(initializing: self)
  }
}


@available(*, unavailable, renamed: "UnsafeBufferPointerIterator")
public struct UnsafeBufferPointerGenerator<Element> {}

// Local Variables:
// eval: (read-only-mode 1)
// End:
