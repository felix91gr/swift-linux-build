// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 1)
//===--- UnsafeRawBufferPointer.swift.gyb ---------------------*- swift -*-===//
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

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 14)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 18)

/// A mutable nonowning collection interface to the bytes in a
/// region of memory.
///
/// You can use an `UnsafeMutableRawBufferPointer` instance in low-level operations to eliminate
/// uniqueness checks and release mode bounds checks. Bounds checks are always
/// performed in debug mode.
///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 27)
/// An `UnsafeMutableRawBufferPointer` instance is a view of the raw bytes in a region of memory.
/// Each byte in memory is viewed as a `UInt8` value independent of the type
/// of values held in that memory. Reading from and writing to memory through
/// a raw buffer are untyped operations. Accessing this collection's bytes
/// does not bind the underlying memory to `UInt8`.
///
/// In addition to its collection interface, an `UnsafeMutableRawBufferPointer` instance also supports
/// the following methods provided by `UnsafeMutableRawPointer`, including
/// bounds checks in debug mode:
///
/// - `load(fromByteOffset:as:)`
/// - `storeBytes(of:toByteOffset:as:)`
/// - `copyBytes(from:count:)`
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 50)
///
/// To access the underlying memory through typed operations, the memory must
/// be bound to a trivial type.
///
/// - Note: A *trivial type* can be copied bit for bit with no indirection
///   or reference-counting operations. Generally, native Swift types that do
///   not contain strong or weak references or other forms of indirection are
///   trivial, as are imported C structs and enums. Copying memory that
///   contains values of nontrivial types can only be done safely with a typed
///   pointer. Copying bytes directly from nontrivial, in-memory values does
///   not produce valid copies and can only be done by calling a C API, such as
///   `memmove()`.
///
/// UnsafeMutableRawBufferPointer Semantics
/// =================
///
/// An `UnsafeMutableRawBufferPointer` instance is a view into memory and does not own the memory
/// that it references. Copying a variable or constant of type `UnsafeMutableRawBufferPointer` does
/// not copy the underlying memory. However, initializing another collection
/// with an `UnsafeMutableRawBufferPointer` instance copies bytes out of the referenced memory and
/// into the new collection.
///
/// The following example uses `someBytes`, an `UnsafeMutableRawBufferPointer` instance, to
/// demonstrate the difference between assigning a buffer pointer and using a
/// buffer pointer as the source for another collection's elements. Here, the
/// assignment to `destBytes` creates a new, nonowning buffer pointer
/// covering the first `n` bytes of the memory that `someBytes`
/// references---nothing is copied:
///
///     var destBytes = someBytes[0..<n]
///
/// Next, the bytes referenced by `destBytes` are copied into `byteArray`, a
/// new `[UInt]` array, and then the remainder of `someBytes` is appended to
/// `byteArray`:
///
///     var byteArray: [UInt8] = Array(destBytes)
///     byteArray += someBytes[n..<someBytes.count]
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 88)
///
/// Assigning into a ranged subscript of an `{$Self}` instance copies bytes
/// into the memory. The next `n` bytes of the memory that `someBytes`
/// references are copied in this code:
///
///     destBytes[0..<n] = someBytes[n..<(n + n)]
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 95)
///
/// - SeeAlso: `UnsafeMutableRawPointer`, `UnsafeMutableBufferPointer`
public struct UnsafeMutableRawBufferPointer
  : MutableCollection, RandomAccessCollection {
  // TODO: Specialize `index` and `formIndex` and
  // `_failEarlyRangeCheck` as in `UnsafeBufferPointer`.

  public typealias Index = Int
  public typealias IndexDistance = Int
  public typealias SubSequence = UnsafeMutableRawBufferPointer

  /// An iterator over the bytes viewed by a raw buffer pointer.
  public struct Iterator : IteratorProtocol, Sequence {

    /// Advances to the next byte and returns it, or `nil` if no next byte
    /// exists.
    ///
    /// Once `nil` has been returned, all subsequent calls return `nil`.
    ///
    /// - Returns: The next sequential byte in the raw buffer if another byte
    ///   exists; otherwise, `nil`.
    public mutating func next() -> UInt8? {
      if _position == _end { return nil }

      let result = _position!.load(as: UInt8.self)
      _position! += 1
      return result
    }

    internal var _position, _end: UnsafeRawPointer?
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 128)
  /// Returns a newly allocated buffer with the given size, in bytes.
  ///
  /// The memory referenced by the new buffer is allocated, but not
  /// initialized.
  ///
  /// - Parameter size: The number of bytes to allocate.
  /// - Returns: A word-aligned buffer pointer covering a region of memory 
  public static func allocate(count size: Int
  ) -> UnsafeMutableRawBufferPointer {
    return UnsafeMutableRawBufferPointer(
      start: UnsafeMutableRawPointer.allocate(
        bytes: size, alignedTo: MemoryLayout<UInt>.alignment),
      count: size)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 143)

  /// Deallocates the memory viewed by this buffer pointer.
  ///
  /// The memory to be deallocated must not be initialized or must be
  /// initialized to a trivial type. For a buffer pointer `p`, all `p.count`
  /// bytes referenced by `p` are deallocated.
  public func deallocate() {
    _position?.deallocate(
      bytes: count, alignedTo: MemoryLayout<UInt>.alignment)
  }

  /// Returns a new instance of the given type, read from the buffer pointer's
  /// raw memory at the specified byte offset.
  ///
  /// You can use this method to create new values from the buffer pointer's
  /// underlying bytes. The following example creates two new `Int32`
  /// instances from the memory referenced by the buffer pointer `someBytes`.
  /// The bytes for `a` are copied from the first four bytes of `someBytes`,
  /// and the bytes for `b` are copied from the next four bytes.
  ///
  ///     let a = someBytes.load(as: Int32.self)
  ///     let b = someBytes.load(fromByteOffset: 4, as: Int32.self)
  ///
  /// The memory to read for the new instance must not extend beyond the buffer
  /// pointer's memory region---that is, `offset + MemoryLayout<T>.size` must
  /// be less than or equal to the buffer pointer's `count`.
  ///
  /// - Parameters:
  ///   - offset: The offset, in bytes, into the buffer pointer's memory at
  ///     which to begin reading data for the new instance. The buffer pointer
  ///     plus `offset` must be properly aligned for accessing an instance of
  ///     type `T`. The default is zero.
  ///   - type: The type to use for the newly constructed instance. The memory
  ///     must be initialized to a value of a type that is layout compatible
  ///     with `type`.
  /// - Returns: A new instance of type `T`, copied from the buffer pointer's
  ///   memory.
  public func load<T>(fromByteOffset offset: Int = 0, as type: T.Type) -> T {
    _debugPrecondition(offset >= 0, "UnsafeMutableRawBufferPointer.load with negative offset")
    _debugPrecondition(offset + MemoryLayout<T>.size <= self.count,
      "UnsafeMutableRawBufferPointer.load out of bounds")
    return baseAddress!.load(fromByteOffset: offset, as: T.self)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 188)
  /// Stores a value's bytes into the buffer pointer's raw memory at the
  /// specified byte offset.
  ///
  /// The type `T` to be stored must be a trivial type. The memory must also be
  /// uninitialized, initialized to `T`, or initialized to another trivial
  /// type that is layout compatible with `T`.
  ///
  /// The memory written to must not extend beyond the buffer pointer's memory
  /// region---that is, `offset + MemoryLayout<T>.size` must be less than or
  /// equal to the buffer pointer's `count`.
  ///
  /// After calling `storeBytes(of:toByteOffset:as:)`, the memory is
  /// initialized to the raw bytes of `value`. If the memory is bound to a
  /// type `U` that is layout compatible with `T`, then it contains a value of
  /// type `U`. Calling `storeBytes(of:toByteOffset:as:)` does not change the
  /// bound type of the memory.
  ///
  /// - Parameters:
  ///   - offset: The offset in bytes into the buffer pointer's memory to begin
  ///     reading data for the new instance. The buffer pointer plus `offset`
  ///     must be properly aligned for accessing an instance of type `T`. The
  ///     default is zero.
  ///   - type: The type to use for the newly constructed instance. The memory
  ///     must be initialized to a value of a type that is layout compatible
  ///     with `type`.
  public func storeBytes<T>(
    of value: T, toByteOffset offset: Int = 0, as: T.Type
  ) {
    _debugPrecondition(offset >= 0, "UnsafeMutableRawBufferPointer.storeBytes with negative offset")
    _debugPrecondition(offset + MemoryLayout<T>.size <= self.count,
      "UnsafeMutableRawBufferPointer.storeBytes out of bounds")

    baseAddress!.storeBytes(of: value, toByteOffset: offset, as: T.self)
  }

  /// Copies the specified number of bytes from the given raw pointer's memory
  /// into this buffer's memory.
  ///
  /// If the `count` bytes of memory referenced by this pointer are bound to a
  /// type `T`, then `T` must be a trivial type, this pointer and `source`
  /// must be properly aligned for accessing `T`, and `count` must be a
  /// multiple of `MemoryLayout<T>.stride`.
  ///
  /// After calling `copyBytes(from:count:)`, the `count` bytes of memory
  /// referenced by this pointer are initialized to raw bytes. If the memory
  /// is bound to type `T`, then it contains values of type `T`.
  ///
  /// - Parameters:
  ///   - source: A pointer to the memory to copy bytes from. The memory at
  ///     `source..<(source + count)` must be initialized to a trivial type.
  ///   - count: The number of bytes to copy. `count` must not be negative.
  public func copyBytes(from source: UnsafeRawBufferPointer) {
    _debugPrecondition(source.count <= self.count,
      "UnsafeMutableRawBufferPointer.copyBytes source has too many elements")
    baseAddress?.copyBytes(from: source.baseAddress!, count: source.count)
  }

  /// Copies from a collection of `UInt8` into this buffer's memory.
  ///
  /// If the `source.count` bytes of memory referenced by this pointer are
  /// bound to a type `T`, then `T` must be a trivial type, the underlying
  /// pointer must be properly aligned for accessing `T`, and `source.count`
  /// must be a multiple of `MemoryLayout<T>.stride`.
  ///
  /// After calling `copyBytes(from:)`, the `source.count` bytes of memory
  /// referenced by this pointer are initialized to raw bytes. If the memory
  /// is bound to type `T`, then it contains values of type `T`.
  ///
  /// - Parameter source: A collection of `UInt8` elements. `source.count` must
  ///   be less than or equal to this buffer's `count`.
  public func copyBytes<C : Collection>(from source: C
  ) where C.Iterator.Element == UInt8 {
    _debugPrecondition(numericCast(source.count) <= self.count,
      "UnsafeMutableRawBufferPointer.copyBytes source has too many elements")
    guard let position = _position else {
      return
    }
    for (index, byteValue) in source.enumerated() {
      position.storeBytes(
        of: byteValue, toByteOffset: index, as: UInt8.self)
    }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 271)

  /// Creates a buffer over the specified number of contiguous bytes starting
  /// at the given pointer.
  ///
  /// - Parameters:
  ///   - start: The address of the memory that starts the buffer. If `starts` is
  ///     `nil`, `count` must be zero. However, `count` may be zero even for a
  ///     non-`nil` `start`.
  ///   - count: The number of bytes to include in the buffer. `count` must not
  ///     be negative.
  public init(start: UnsafeMutableRawPointer?, count: Int) {
    _precondition(count >= 0, "UnsafeMutableRawBufferPointer with negative count")
    _precondition(count == 0 || start != nil,
      "UnsafeMutableRawBufferPointer has a nil start and nonzero count")
    _position = start
    _end = start.map { $0 + count }
  }

  /// Creates a new buffer over the same memory as the given buffer.
  ///
  /// - Parameter bytes: The buffer to convert.
  public init(_ bytes: UnsafeMutableRawBufferPointer) {
    self.init(start: bytes.baseAddress, count: bytes.count)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 297)
  /// Creates a new mutable buffer over the same memory as the given buffer.
  ///
  /// - Parameter bytes: The buffer to convert.
  public init(mutating bytes: UnsafeRawBufferPointer) {
    self.init(start: UnsafeMutableRawPointer(mutating: bytes.baseAddress),
      count: bytes.count)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 312)

  /// Creates a raw buffer over the contiguous bytes in the given typed buffer.
  ///
  /// - Parameter buffer: The typed buffer to convert to a raw buffer. The
  ///   buffer's type `T` must be a trivial type.
  public init<T>(_ buffer: UnsafeMutableBufferPointer<T>) {
    self.init(start: buffer.baseAddress!,
      count: buffer.count * MemoryLayout<T>.stride)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 332)

  /// Always zero, which is the index of the first byte in a
  /// nonempty buffer.
  public var startIndex: Int {
    return 0
  }

  /// The "past the end" position---that is, the position one greater than the
  /// last valid subscript argument.
  ///
  /// The `endIndex` property of an `UnsafeMutableRawBufferPointer`
  /// instance is always identical to `count`.
  public var endIndex: Int {
    return count
  }

  public typealias Indices = CountableRange<Int>

  public var indices: Indices {
    return startIndex..<endIndex
  }

  /// Accesses the byte at the given offset in the memory region as a `UInt8`
  /// value.
  ///
  /// - Parameter i: The offset of the byte to access. `i` must be in the range
  ///   `0..<count`.
  public subscript(i: Int) -> UInt8 {
    get {
      _debugPrecondition(i >= 0)
      _debugPrecondition(i < endIndex)
      return _position!.load(fromByteOffset: i, as: UInt8.self)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 366)
    nonmutating set {
      _debugPrecondition(i >= 0)
      _debugPrecondition(i < endIndex)
      _position!.storeBytes(of: newValue, toByteOffset: i, as: UInt8.self)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 372)
  }

  /// Accesses the bytes in the specified memory region.
  ///
  /// - Parameter bounds: The range of byte offsets to access. The upper and
  ///   lower bounds of the range must be in the range `0...count`.
  public subscript(bounds: Range<Int>) -> UnsafeMutableRawBufferPointer {
    get {
      _debugPrecondition(bounds.lowerBound >= startIndex)
      _debugPrecondition(bounds.upperBound <= endIndex)
      return UnsafeMutableRawBufferPointer(
        start: baseAddress.map { $0 + bounds.lowerBound },
        count: bounds.count)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 387)
    nonmutating set {
      _debugPrecondition(bounds.lowerBound >= startIndex)
      _debugPrecondition(bounds.upperBound <= endIndex)
      _debugPrecondition(bounds.count == newValue.count)

      if newValue.count > 0 {
        (baseAddress! + bounds.lowerBound).copyBytes(
          from: newValue.baseAddress!,
          count: newValue.count)
      }
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 399)
  }

  /// Returns an iterator over the bytes of this sequence.
  public func makeIterator() -> Iterator {
    return Iterator(_position: _position, _end: _end)
  }

  /// A pointer to the first byte of the buffer.
  ///
  /// If the `baseAddress` of this buffer is `nil`, the count is zero. However,
  /// a buffer can have a `count` of zero even with a non-`nil` base address.
  public var baseAddress: UnsafeMutableRawPointer? {
    return _position
  }

  /// The number of bytes in the buffer.
  ///
  /// If the `baseAddress` of this buffer is `nil`, the count is zero. However,
  /// a buffer can have a `count` of zero even with a non-`nil` base address.
  public var count: Int {
    if let pos = _position {
      return _end! - pos
    }
    return 0
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 426)
  /// Initializes memory in the buffer with the elements of
  /// `source` and binds the initialized memory to type `T`.
  ///
  /// Returns an iterator to any elements of `source` that didn't fit in the 
  /// buffer, and a typed buffer of the written elements.
  ///
  /// - Precondition: The memory in `startIndex..<(source.count *
  ///   MemoryLayout<T>.stride)` is uninitialized or initialized to a
  ///   trivial type.
  ///
  /// - Precondition: The buffer must contain sufficient memory to
  ///   accommodate at least `source.underestimateCount` elements.
  ///
  /// - Postcondition: The memory at `self[startIndex..<source.count *
  ///   MemoryLayout<T>.stride]                 
  ///   is bound to type `T`.
  ///
  /// - Postcondition: The `T` values at `self[startIndex..<source.count *
  ///   MemoryLayout<T>.stride]`
  ///   are initialized.
  ///
  // TODO: Optimize where `C` is a `ContiguousArrayBuffer`.
  public func initializeMemory<S: Sequence>(
    as: S.Iterator.Element.Type, from source: S
  ) -> (unwritten: S.Iterator, initialized: UnsafeMutableBufferPointer<S.Iterator.Element>) {

    var it = source.makeIterator()
    var idx = startIndex
    let elementStride = MemoryLayout<S.Iterator.Element>.stride
    
    // This has to be a debug precondition due to the cost of walking over some collections.
    _debugPrecondition(source.underestimatedCount <= (count / elementStride),
      "insufficient space to accommodate source.underestimatedCount elements")
    guard let base = baseAddress else {
      // this can be a precondition since only an invalid argument should be costly
      _precondition(source.underestimatedCount == 0, 
        "no memory available to initialize from source")
      return (it, UnsafeMutableBufferPointer(start: nil, count: 0))
    }  

    for p in stride(from: base, 
      // only advance to as far as the last element that will fit
      to: base + count - elementStride + 1, 
      by: elementStride
    ) {
      // underflow is permitted -- e.g. a sequence into
      // the spare capacity of an Array buffer
      guard let x = it.next() else { break }
      p.initializeMemory(as: S.Iterator.Element.self, to: x)
      formIndex(&idx, offsetBy: elementStride)
    }

    return (it, UnsafeMutableBufferPointer(
                  start: base.assumingMemoryBound(to: S.Iterator.Element.self), 
                  count: idx / elementStride))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 483)

  let _position, _end: UnsafeMutableRawPointer?
}

extension UnsafeMutableRawBufferPointer : CustomDebugStringConvertible {
  /// A textual representation of the buffer, suitable for debugging.
  public var debugDescription: String {
    return "UnsafeMutableRawBufferPointer"
      + "(start: \(_position.map(String.init(describing:)) ?? "nil"), count: \(count))"
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 18)

/// A  nonowning collection interface to the bytes in a
/// region of memory.
///
/// You can use an `UnsafeRawBufferPointer` instance in low-level operations to eliminate
/// uniqueness checks and release mode bounds checks. Bounds checks are always
/// performed in debug mode.
///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 41)
/// An `UnsafeRawBufferPointer` instance is a view of the raw bytes in a region of memory.
/// Each byte in memory is viewed as a `UInt8` value independent of the type
/// of values held in that memory. Reading from memory through a raw buffer is
/// an untyped operation.
///
/// In addition to its collection interface, an `UnsafeRawBufferPointer` instance also supports
/// the `load(fromByteOffset:as:)` method provided by `UnsafeRawPointer`,
/// including bounds checks in debug mode.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 50)
///
/// To access the underlying memory through typed operations, the memory must
/// be bound to a trivial type.
///
/// - Note: A *trivial type* can be copied bit for bit with no indirection
///   or reference-counting operations. Generally, native Swift types that do
///   not contain strong or weak references or other forms of indirection are
///   trivial, as are imported C structs and enums. Copying memory that
///   contains values of nontrivial types can only be done safely with a typed
///   pointer. Copying bytes directly from nontrivial, in-memory values does
///   not produce valid copies and can only be done by calling a C API, such as
///   `memmove()`.
///
/// UnsafeRawBufferPointer Semantics
/// =================
///
/// An `UnsafeRawBufferPointer` instance is a view into memory and does not own the memory
/// that it references. Copying a variable or constant of type `UnsafeRawBufferPointer` does
/// not copy the underlying memory. However, initializing another collection
/// with an `UnsafeRawBufferPointer` instance copies bytes out of the referenced memory and
/// into the new collection.
///
/// The following example uses `someBytes`, an `UnsafeRawBufferPointer` instance, to
/// demonstrate the difference between assigning a buffer pointer and using a
/// buffer pointer as the source for another collection's elements. Here, the
/// assignment to `destBytes` creates a new, nonowning buffer pointer
/// covering the first `n` bytes of the memory that `someBytes`
/// references---nothing is copied:
///
///     var destBytes = someBytes[0..<n]
///
/// Next, the bytes referenced by `destBytes` are copied into `byteArray`, a
/// new `[UInt]` array, and then the remainder of `someBytes` is appended to
/// `byteArray`:
///
///     var byteArray: [UInt8] = Array(destBytes)
///     byteArray += someBytes[n..<someBytes.count]
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 95)
///
/// - SeeAlso: `UnsafeRawPointer`, `UnsafeBufferPointer`
public struct UnsafeRawBufferPointer
  : Collection, RandomAccessCollection {
  // TODO: Specialize `index` and `formIndex` and
  // `_failEarlyRangeCheck` as in `UnsafeBufferPointer`.

  public typealias Index = Int
  public typealias IndexDistance = Int
  public typealias SubSequence = UnsafeRawBufferPointer

  /// An iterator over the bytes viewed by a raw buffer pointer.
  public struct Iterator : IteratorProtocol, Sequence {

    /// Advances to the next byte and returns it, or `nil` if no next byte
    /// exists.
    ///
    /// Once `nil` has been returned, all subsequent calls return `nil`.
    ///
    /// - Returns: The next sequential byte in the raw buffer if another byte
    ///   exists; otherwise, `nil`.
    public mutating func next() -> UInt8? {
      if _position == _end { return nil }

      let result = _position!.load(as: UInt8.self)
      _position! += 1
      return result
    }

    internal var _position, _end: UnsafeRawPointer?
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 143)

  /// Deallocates the memory viewed by this buffer pointer.
  ///
  /// The memory to be deallocated must not be initialized or must be
  /// initialized to a trivial type. For a buffer pointer `p`, all `p.count`
  /// bytes referenced by `p` are deallocated.
  public func deallocate() {
    _position?.deallocate(
      bytes: count, alignedTo: MemoryLayout<UInt>.alignment)
  }

  /// Returns a new instance of the given type, read from the buffer pointer's
  /// raw memory at the specified byte offset.
  ///
  /// You can use this method to create new values from the buffer pointer's
  /// underlying bytes. The following example creates two new `Int32`
  /// instances from the memory referenced by the buffer pointer `someBytes`.
  /// The bytes for `a` are copied from the first four bytes of `someBytes`,
  /// and the bytes for `b` are copied from the next four bytes.
  ///
  ///     let a = someBytes.load(as: Int32.self)
  ///     let b = someBytes.load(fromByteOffset: 4, as: Int32.self)
  ///
  /// The memory to read for the new instance must not extend beyond the buffer
  /// pointer's memory region---that is, `offset + MemoryLayout<T>.size` must
  /// be less than or equal to the buffer pointer's `count`.
  ///
  /// - Parameters:
  ///   - offset: The offset, in bytes, into the buffer pointer's memory at
  ///     which to begin reading data for the new instance. The buffer pointer
  ///     plus `offset` must be properly aligned for accessing an instance of
  ///     type `T`. The default is zero.
  ///   - type: The type to use for the newly constructed instance. The memory
  ///     must be initialized to a value of a type that is layout compatible
  ///     with `type`.
  /// - Returns: A new instance of type `T`, copied from the buffer pointer's
  ///   memory.
  public func load<T>(fromByteOffset offset: Int = 0, as type: T.Type) -> T {
    _debugPrecondition(offset >= 0, "UnsafeRawBufferPointer.load with negative offset")
    _debugPrecondition(offset + MemoryLayout<T>.size <= self.count,
      "UnsafeRawBufferPointer.load out of bounds")
    return baseAddress!.load(fromByteOffset: offset, as: T.self)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 271)

  /// Creates a buffer over the specified number of contiguous bytes starting
  /// at the given pointer.
  ///
  /// - Parameters:
  ///   - start: The address of the memory that starts the buffer. If `starts` is
  ///     `nil`, `count` must be zero. However, `count` may be zero even for a
  ///     non-`nil` `start`.
  ///   - count: The number of bytes to include in the buffer. `count` must not
  ///     be negative.
  public init(start: UnsafeRawPointer?, count: Int) {
    _precondition(count >= 0, "UnsafeRawBufferPointer with negative count")
    _precondition(count == 0 || start != nil,
      "UnsafeRawBufferPointer has a nil start and nonzero count")
    _position = start
    _end = start.map { $0 + count }
  }

  /// Creates a new buffer over the same memory as the given buffer.
  ///
  /// - Parameter bytes: The buffer to convert.
  public init(_ bytes: UnsafeMutableRawBufferPointer) {
    self.init(start: bytes.baseAddress, count: bytes.count)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 305)
  /// Creates a new buffer over the same memory as the given buffer.
  ///
  /// - Parameter bytes: The buffer to convert.
  public init(_ bytes: UnsafeRawBufferPointer) {
    self.init(start: bytes.baseAddress, count: bytes.count)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 312)

  /// Creates a raw buffer over the contiguous bytes in the given typed buffer.
  ///
  /// - Parameter buffer: The typed buffer to convert to a raw buffer. The
  ///   buffer's type `T` must be a trivial type.
  public init<T>(_ buffer: UnsafeMutableBufferPointer<T>) {
    self.init(start: buffer.baseAddress!,
      count: buffer.count * MemoryLayout<T>.stride)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 323)
  /// Creates a raw buffer over the contiguous bytes in the given typed buffer.
  ///
  /// - Parameter buffer: The typed buffer to convert to a raw buffer. The
  ///   buffer's type `T` must be a trivial type.
  public init<T>(_ buffer: UnsafeBufferPointer<T>) {
    self.init(start: buffer.baseAddress!,
      count: buffer.count * MemoryLayout<T>.stride)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 332)

  /// Always zero, which is the index of the first byte in a
  /// nonempty buffer.
  public var startIndex: Int {
    return 0
  }

  /// The "past the end" position---that is, the position one greater than the
  /// last valid subscript argument.
  ///
  /// The `endIndex` property of an `UnsafeRawBufferPointer`
  /// instance is always identical to `count`.
  public var endIndex: Int {
    return count
  }

  public typealias Indices = CountableRange<Int>

  public var indices: Indices {
    return startIndex..<endIndex
  }

  /// Accesses the byte at the given offset in the memory region as a `UInt8`
  /// value.
  ///
  /// - Parameter i: The offset of the byte to access. `i` must be in the range
  ///   `0..<count`.
  public subscript(i: Int) -> UInt8 {
    get {
      _debugPrecondition(i >= 0)
      _debugPrecondition(i < endIndex)
      return _position!.load(fromByteOffset: i, as: UInt8.self)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 372)
  }

  /// Accesses the bytes in the specified memory region.
  ///
  /// - Parameter bounds: The range of byte offsets to access. The upper and
  ///   lower bounds of the range must be in the range `0...count`.
  public subscript(bounds: Range<Int>) -> UnsafeRawBufferPointer {
    get {
      _debugPrecondition(bounds.lowerBound >= startIndex)
      _debugPrecondition(bounds.upperBound <= endIndex)
      return UnsafeRawBufferPointer(
        start: baseAddress.map { $0 + bounds.lowerBound },
        count: bounds.count)
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 399)
  }

  /// Returns an iterator over the bytes of this sequence.
  public func makeIterator() -> Iterator {
    return Iterator(_position: _position, _end: _end)
  }

  /// A pointer to the first byte of the buffer.
  ///
  /// If the `baseAddress` of this buffer is `nil`, the count is zero. However,
  /// a buffer can have a `count` of zero even with a non-`nil` base address.
  public var baseAddress: UnsafeRawPointer? {
    return _position
  }

  /// The number of bytes in the buffer.
  ///
  /// If the `baseAddress` of this buffer is `nil`, the count is zero. However,
  /// a buffer can have a `count` of zero even with a non-`nil` base address.
  public var count: Int {
    if let pos = _position {
      return _end! - pos
    }
    return 0
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 483)

  let _position, _end: UnsafeRawPointer?
}

extension UnsafeRawBufferPointer : CustomDebugStringConvertible {
  /// A textual representation of the buffer, suitable for debugging.
  public var debugDescription: String {
    return "UnsafeRawBufferPointer"
      + "(start: \(_position.map(String.init(describing:)) ?? "nil"), count: \(count))"
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafeRawBufferPointer.swift.gyb", line: 496)

/// Invokes the given closure with a mutable buffer pointer covering the raw
/// bytes of the given argument.
///
/// The buffer pointer argument to the `body` closure provides a collection
/// interface to the raw bytes of `arg`. The buffer is the size of the
/// instance passed as `arg` and does not include any remote storage.
///
/// - Parameters:
///   - arg: An instance to temporarily access through a mutable raw buffer
///     pointer.
///   - body: A closure that takes a raw buffer pointer to the bytes of `arg`
///     as its sole argument. If the closure has a return value, it is used as
///     the return value of the `withUnsafeMutableBytes(of:_:)` function. The
///     buffer pointer argument is valid only for the duration of the
///     closure's execution.
/// - Returns: The return value of the `body` closure, if any.
///
/// - SeeAlso: `withUnsafeMutablePointer(to:_:)`, `withUnsafeBytes(of:_:)`
public func withUnsafeMutableBytes<T, Result>(
  of arg: inout T,
  _ body: (UnsafeMutableRawBufferPointer) throws -> Result
) rethrows -> Result
{
  return try withUnsafeMutablePointer(to: &arg) {
    return try body(UnsafeMutableRawBufferPointer(
        start: $0, count: MemoryLayout<T>.size))
  }
}

/// Invokes the given closure with a buffer pointer covering the raw bytes of
/// the given argument.
///
/// The buffer pointer argument to the `body` closure provides a collection
/// interface to the raw bytes of `arg`. The buffer is the size of the
/// instance passed as `arg` and does not include any remote storage.
///
/// - Parameters:
///   - arg: An instance to temporarily access through a raw buffer pointer.
///   - body: A closure that takes a raw buffer pointer to the bytes of `arg`
///     as its sole argument. If the closure has a return value, it is used as
///     the return value of the `withUnsafeBytes(of:_:)` function. The buffer
///     pointer argument is valid only for the duration of the closure's
///     execution.
/// - Returns: The return value of the `body` closure, if any.
///
/// - SeeAlso: `withUnsafePointer(to:_:)`, `withUnsafeMutableBytes(of:_:)`
public func withUnsafeBytes<T, Result>(
  of arg: inout T,
  _ body: (UnsafeRawBufferPointer) throws -> Result
) rethrows -> Result
{
  return try withUnsafePointer(to: &arg) {
    try body(UnsafeRawBufferPointer(start: $0, count: MemoryLayout<T>.size))
  }
}
