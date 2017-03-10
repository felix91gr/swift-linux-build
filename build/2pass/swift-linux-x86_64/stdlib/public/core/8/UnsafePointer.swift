// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 1)
//===--- UnsafePointer.swift.gyb ------------------------------*- swift -*-===//
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

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 14)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 19)
/// A pointer for accessing and manipulating data of a
/// specific type.
///
/// You use instances of the `UnsafeMutablePointer` type to access data of a
/// specific type in memory. The type of data that a pointer can access is the
/// pointer's `Pointee` type. `UnsafeMutablePointer` provides no automated
/// memory management or alignment guarantees. You are responsible for
/// handling the life cycle of any memory you work with through unsafe
/// pointers to avoid leaks or undefined behavior.
///
/// Memory that you manually manage can be either *untyped* or *bound* to a
/// specific type. You use the `UnsafeMutablePointer` type to access and
/// manage memory that has been bound to a specific type.
///
/// Understanding a Pointer's Memory State
/// ======================================
///
/// The memory referenced by an `UnsafeMutablePointer` instance can be in
/// one of several states. Many pointer operations must only be applied to
/// pointers with memory in a specific state---you must keep track of the
/// state of the memory you are working with and understand the changes to
/// that state that different operations perform. Memory can be untyped and
/// uninitialized, bound to a type and uninitialized, or bound to a type and
/// initialized to a value. Finally, memory that was allocated previously may
/// have been deallocated, leaving existing pointers referencing unallocated
/// memory.
///
/// Uninitialized Memory
/// --------------------
///
/// Memory that has just been allocated through a typed pointer or has been
/// deinitialized is in an *uninitialized* state. Uninitialized memory must be
/// initialized before it can be accessed for reading.
///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 54)
/// You can use methods like `initialize(to:count:)`, `initialize(from:)`, and
/// `moveInitializeMemory(from:count)` to initialize the memory referenced by
/// a pointer with a value or series of values.
///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 59)
/// Initialized Memory
/// ------------------
///
/// *Initialized* memory has a value that can be read using a pointer's
/// `pointee` property or through subscript notation. In the following
/// example, `ptr` is a pointer to memory initialized with a value of `23`:
///
///     let ptr: UnsafeMutablePointer<Int> = ...
///     // ptr.pointee == 23
///     // ptr[0] == 23
///
/// Accessing a Pointer's Memory as a Different Type
/// ================================================
///
/// When you access memory through an `UnsafeMutablePointer` instance, the
/// `Pointee` type must be consistent with the bound type of the memory. If
/// you do need to access memory that is bound to one type as a different
/// type, Swift's pointer types provide type-safe ways to temporarily or
/// permanently change the bound type of the memory, or to load typed
/// instances directly from raw memory.
///
/// An `UnsafeMutablePointer<UInt8>` instance allocated with eight bytes of
/// memory, `uint8Pointer`, will be used for the examples below.
///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 84)
///     let uint8Pointer = UnsafeMutablePointer<UInt8>.allocate(capacity: 8)
///     uint8Pointer.initialize(from: [39, 77, 111, 111, 102, 33, 39, 0])
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 89)
///
/// When you only need to temporarily access a pointer's memory as a different
/// type, use the `withMemoryRebound(to:capacity:)` method. For example, you
/// can use this method to call an API that expects a pointer to a different
/// type that is layout compatible with your pointer's `Pointee`. The following
/// code temporarily rebinds the memory that `uint8Pointer` references from
/// `UInt8` to `Int8` to call the imported C `strlen` function.
///
///     // Imported from C
///     func strlen(_ __s: UnsafePointer<Int8>!) -> UInt
///
///     let length = uint8Pointer.withMemoryRebound(to: Int8.self, capacity: 8) {
///         return strlen($0)
///     }
///     // length == 7
///
/// When you need to permanently rebind memory to a different type, first
/// obtain a raw pointer to the memory and then call the
/// `bindMemory(to:capacity:)` method on the raw pointer. The following
/// example binds the memory referenced by `uint8Pointer` to one instance of
/// the `UInt64` type:
///
///     let uint64Pointer = UnsafeMutableRawPointer(uint64Pointer)
///                               .bindMemory(to: UInt64.self, capacity: 1)
///
/// After rebinding the memory referenced by `uint8Pointer` to `UInt64`,
/// accessing that pointer's referenced memory as a `UInt8` instance is
/// undefined.
///
///     var fullInteger = uint64Pointer.pointee          // OK
///     var firstByte = uint8Pointer.pointee             // undefined
///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 122)
/// Alternatively, you can access the same memory as a different type without
/// rebinding through untyped memory access, so long as the bound type and the
/// destination type are trivial types. Convert your pointer to an
/// `UnsafeMutableRawPointer` instance and then use the raw pointer's
/// `load(fromByteOffset:as:)` and `storeBytes(of:toByteOffset:as:)` methods
/// to read and write values.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 135)
///
///     let rawPointer = UnsafeMutableRawPointer(uint64Pointer)
///     fullInteger = rawPointer.load(as: UInt64.self)   // OK
///     firstByte = rawPointer.load(as: UInt8.self)      // OK
///
/// Performing Typed Pointer Arithmetic
/// ===================================
///
/// Pointer arithmetic with a typed pointer is counted in strides of the
/// pointer's `Pointee` type. When you add to or subtract from an `UnsafeMutablePointer`
/// instance, the result is a new pointer of the same type, offset by that
/// number of instances of the `Pointee` type.
///
///     // 'intPointer' points to memory initialized with [10, 20, 30, 40]
///     let intPointer: UnsafeMutablePointer<Int> = ...
///
///     // Load the first value in memory
///     let x = intPointer.pointee
///     // x == 10
///
///     // Load the third value in memory
///     let offsetPointer = intPointer + 2
///     let y = offsetPointer.pointee
///     // y == 30
///
/// You can also use subscript notation to access the value in memory at a
/// specific offset.
///
///     let z = intPointer[2]
///     // z == 30
///
/// Implicit Casting and Bridging
/// =============================
///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 170)
/// When calling a function or method with an `UnsafeMutablePointer` parameter, you can pass
/// an instance of that specific pointer type or use Swift's implicit bridging
/// to pass a compatible pointer.
///
/// For example, the `printInt(atAddress:)` function in the following code
/// sample expects an `UnsafeMutablePointer<Int>` instance as its first parameter:
///
///     func printInt(atAddress p: UnsafeMutablePointer<Int>) {
///         print(p.pointee)
///     }
///
/// As is typical in Swift, you can call the `printInt(atAddress:)` function
/// with an `UnsafeMutablePointer` instance. This example passes `intPointer`, a mutable
/// pointer to an `Int` value, to `print(address:)`.
///
///     printInt(atAddress: intPointer)
///     // Prints "42"
///
/// Alternatively, you can use Swift's *implicit bridging* to pass a pointer to
/// an instance or to the elements of an array. The following example passes a
/// pointer to the `value` variable by using inout syntax:
///
///     var value: Int = 23
///     printInt(atAddress: &value)
///     // Prints "23"
///
/// A mutable pointer to the elements of an array is implicitly created when
/// you pass the array using inout syntax. This example uses implicit bridging
/// to pass a pointer to the elements of `numbers` when calling
/// `printInt(atAddress:)`.
///
///     var numbers = [5, 10, 15, 20]
///     printInt(atAddress: &numbers)
///     // Prints "5"
///
/// However you call `printInt(atAddress:)`, Swift's type safety guarantees
/// that you can only pass a pointer to the type required by the function---in
/// this case, a pointer to an `Int`.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 264)
///
/// - Important: The pointer created through implicit bridging of an instance
///   or of an array's elements is only valid during the execution of the
///   called function. Escaping the pointer to use after the execution of the
///   function is undefined behavior. In particular, do not use implicit
///   bridging when calling an `UnsafeMutablePointer` initializer.
///
///       var number = 5
///       let numberPointer = UnsafeMutablePointer<Int>(&number)
///       // Accessing 'numberPointer' is undefined behavior.
@_fixed_layout
public struct UnsafeMutablePointer<Pointee>
  : Strideable, Hashable, _Pointer {

  /// A type that represents the distance between two pointers.
  public typealias Distance = Int

  /// The underlying raw (untyped) pointer.
  public let _rawValue: Builtin.RawPointer

  /// Creates an `UnsafeMutablePointer` from a builtin raw pointer.
  @_transparent
  public init(_ _rawValue : Builtin.RawPointer) {
    self._rawValue = _rawValue
  }

  /// Creates a new typed pointer from the given opaque pointer.
  ///
  /// - Parameter from: The opaque pointer to convert to a typed pointer.
  @_transparent
  public init(_ from : OpaquePointer) {
    _rawValue = from._rawValue
  }

  /// Creates a new typed pointer from the given opaque pointer.
  ///
  /// - Parameter from: The opaque pointer to convert to a typed pointer. If
  ///   `from` is `nil`, the result of this initializer is `nil`.
  @_transparent
  public init?(_ from : OpaquePointer?) {
    guard let unwrapped = from else { return nil }
    self.init(unwrapped)
  }

  /// Creates a new typed pointer from the given address, specified as a bit
  /// pattern.
  ///
  /// The address passed as `bitPattern` must have the correct alignment for
  /// the pointer's `Pointee` type. That is,
  /// `bitPattern % MemoryLayout<Pointee>.alignment` must be `0`.
  ///
  /// - Parameter bitPattern: A bit pattern to use for the address of the new
  ///   pointer. If `bitPattern` is zero, the result is `nil`.
  @_transparent
  public init?(bitPattern: Int) {
    if bitPattern == 0 { return nil }
    self._rawValue = Builtin.inttoptr_Word(bitPattern._builtinWordValue)
  }

  /// Creates a new typed pointer from the given address, specified as a bit
  /// pattern.
  ///
  /// The address passed as `bitPattern` must have the correct alignment for
  /// the pointer's `Pointee` type. That is,
  /// `bitPattern % MemoryLayout<Pointee>.alignment` must be `0`.
  ///
  /// - Parameter bitPattern: A bit pattern to use for the address of the new
  ///   pointer. If `bitPattern` is zero, the result is `nil`.
  @_transparent
  public init?(bitPattern: UInt) {
    if bitPattern == 0 { return nil }
    self._rawValue = Builtin.inttoptr_Word(bitPattern._builtinWordValue)
  }

  /// Creates a new pointer from the given typed pointer.
  ///
  /// - Parameter other: The typed pointer to convert.
  @_transparent
  public init(_ other: UnsafeMutablePointer<Pointee>) {
    self = other
  }

  /// Creates a new pointer from the given typed pointer.
  ///
  /// - Parameter other: The typed pointer to convert. If `other` is `nil`, the
  ///   result is `nil`.
  @_transparent
  public init?(_ other: UnsafeMutablePointer<Pointee>?) {
    guard let unwrapped = other else { return nil }
    self = unwrapped
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 357)
  /// Creates a mutable typed pointer referencing the same memory as the given
  /// immutable pointer.
  ///
  /// - Parameter other: The immutable pointer to convert.
  @_transparent
  public init(mutating other: UnsafePointer<Pointee>) {
    self._rawValue = other._rawValue
  }

  /// Creates a mutable typed pointer referencing the same memory as the given
  /// immutable pointer.
  ///
  /// - Parameter other: The immutable pointer to convert. If `other` is `nil`,
  ///   the result is `nil`.
  @_transparent
  public init?(mutating other: UnsafePointer<Pointee>?) {
    guard let unwrapped = other else { return nil }
    self.init(mutating: unwrapped)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 397)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 399)
  /// Allocates uninitialized memory for the specified number of instances of
  /// type `Pointee`.
  ///
  /// The resulting pointer references a region of memory that is bound to
  /// `Pointee` and is `count * MemoryLayout<Pointee>.stride` bytes in size.
  /// You must eventually deallocate the memory referenced by the returned
  /// pointer.
  ///
  /// The following example allocates enough new memory to store four `Int`
  /// instances and then initializes that memory with the elements of a range.
  ///
  ///     let intPointer = UnsafeMutablePointer<Int>.allocate(capacity: 4)
  ///     intPointer.initialize(from: 1...4)
  ///     print(intPointer.pointee)
  ///     // Prints "1"
  ///
  /// When you allocate memory, always remember to deallocate once you're
  /// finished.
  ///
  ///     intPointer.deallocate(capacity: 4)
  ///
  /// - Parameter count: The amount of memory to allocate, counted in instances
  ///   of `Pointee`.
  static public func allocate(capacity count: Int)
    -> UnsafeMutablePointer<Pointee> {
    let size = MemoryLayout<Pointee>.stride * count
    let rawPtr =
      Builtin.allocRaw(size._builtinWordValue, Builtin.alignof(Pointee.self))
    Builtin.bindMemory(rawPtr, count._builtinWordValue, Pointee.self)
    return UnsafeMutablePointer(rawPtr)
  }

  /// Deallocates memory that was allocated for `count` instances of `Pointee`.
  ///
  /// The memory region that is deallocated is
  /// `capacity * MemoryLayout<Pointee>.stride` bytes in size. The memory must
  /// not be initialized or `Pointee` must be a trivial type.
  ///
  /// - Parameter capacity: The amount of memory to deallocate, counted in
  ///   instances of `Pointee`.
  public func deallocate(capacity: Int) {
    let size = MemoryLayout<Pointee>.stride * capacity
    Builtin.deallocRaw(
      _rawValue, size._builtinWordValue, Builtin.alignof(Pointee.self))
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 445)

  /// Accesses the instance referenced by this pointer.
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 449)
  /// When reading from the `pointee` property, the instance referenced by this
  /// pointer must already be initialized. When `pointee` is used as the left
  /// side of an assignment, the instance must be initialized or this
  /// pointer's `Pointee` type must be a trivial type.
  ///
  /// Do not assign an instance of a nontrivial type through `pointee` to
  /// uninitialized memory. Instead, use an initializing method, such as
  /// `initialize(to:count:)`.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 461)
  public var pointee: Pointee {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 463)
    @_transparent unsafeAddress {
      return UnsafePointer(self)
    }
    @_transparent nonmutating unsafeMutableAddress {
      return self
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 474)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 477)
  /// Initializes this pointer's memory with the specified number of
  /// consecutive copies of the given value.
  ///
  /// The destination memory must be uninitialized or the pointer's `Pointee`
  /// must be a trivial type. After a call to `initialize(to:count:)`, the
  /// memory referenced by this pointer is initialized.
  ///
  /// - Parameters:
  ///   - newValue: The instance to initialize this pointer's memory with.
  ///   - count: The number of consecutive copies of `newValue` to initialize.
  ///     `count` must not be negative. The default is `1`.
  public func initialize(to newValue: Pointee, count: Int = 1) {
    // FIXME: add tests (since the `count` has been added)
    _debugPrecondition(count >= 0,
      "UnsafeMutablePointer.initialize(to:): negative count")
    // Must not use `initializeFrom` with a `Collection` as that will introduce
    // a cycle.
    for offset in 0..<count {
      Builtin.initialize(newValue, (self + offset)._rawValue)
    }
  }

  /// Retrieves and returns the referenced instance, returning the pointer's
  /// memory to an uninitialized state.
  ///
  /// Calling the `move()` method on a pointer `p` that references memory of
  /// type `T` is equivalent to the following code, aside from any cost and
  /// incidental side effects of copying and destroying the value:
  ///
  ///     let value: T = {
  ///         defer { p.deinitialize() }
  ///         return p.pointee
  ///     }()
  ///
  /// The memory referenced by this pointer must be initialized. After calling
  /// `move()`, the memory is uninitialized.
  ///
  /// - Returns: The instance referenced by this pointer.
  public func move() -> Pointee {
    return Builtin.take(_rawValue)
  }

  /// Replaces this pointer's initialized memory with the specified number of
  /// instances from the given pointer's memory.
  ///
  /// The region of memory starting at this pointer and covering `count`
  /// instances of the pointer's `Pointee` type must be initialized or
  /// `Pointee` must be a trivial type. After calling
  /// `assign(from:count:)`, the region is initialized.
  ///
  /// - Parameters:
  ///   - source: A pointer to at least `count` initialized instances of type
  ///     `Pointee`. The memory regions referenced by `source` and this
  ///     pointer may overlap.
  ///   - count: The number of instances to copy from the memory referenced by
  ///     `source` to this pointer's memory. `count` must not be negative.
  public func assign(from source: UnsafePointer<Pointee>, count: Int) {
    _debugPrecondition(
      count >= 0, "UnsafeMutablePointer.assign with negative count")
    if UnsafePointer(self) < source || UnsafePointer(self) >= source + count {
      // assign forward from a disjoint or following overlapping range.
      for i in 0..<count {
        self[i] = source[i]
      }
    }
    else {
      // assign backward from a non-following overlapping range.
      var i = count-1
      while i >= 0 {
        self[i] = source[i]
        i -= 1
      }
    }
  }

  /// Initializes the memory referenced by this pointer with the values
  /// starting at the given pointer, and then deinitializes the source memory.
  ///
  /// The region of memory starting at this pointer and covering `count`
  /// instances of the pointer's `Pointee` type must be uninitialized or
  /// `Pointee` must be a trivial type. After calling
  /// `initialize(from:count:)`, the region is initialized and the memory
  /// region `source..<(source + count)` is uninitialized.
  ///
  /// - Parameters:
  ///   - source: A pointer to the values to copy. The memory region
  ///     `source..<(source + count)` must be initialized. The memory regions
  ///     referenced by `source` and this pointer may overlap.
  ///   - count: The number of instances to move from `source` to this
  ///     pointer's memory. `count` must not be negative.
  public func moveInitialize(from source: UnsafeMutablePointer, count: Int) {
    _debugPrecondition(
      count >= 0, "UnsafeMutablePointer.moveInitialize with negative count")
    if self < source || self >= source + count {
      // initialize forward from a disjoint or following overlapping range.
      Builtin.takeArrayFrontToBack(
        Pointee.self, self._rawValue, source._rawValue, count._builtinWordValue)
      // This builtin is equivalent to:
      // for i in 0..<count {
      //   (self + i).initialize(to: (source + i).move())
      // }
    }
    else {
      // initialize backward from a non-following overlapping range.
      Builtin.takeArrayBackToFront(
        Pointee.self, self._rawValue, source._rawValue, count._builtinWordValue)
      // This builtin is equivalent to:
      // var src = source + count
      // var dst = self + count
      // while dst != self {
      //   (--dst).initialize(to: (--src).move())
      // }
    }
  }

  /// Initializes the memory referenced by this pointer with the values
  /// starting at the given pointer.
  ///
  /// The region of memory starting at this pointer and covering `count`
  /// instances of the pointer's `Pointee` type must be uninitialized or
  /// `Pointee` must be a trivial type. After calling
  /// `initialize(from:count:)`, the region is initialized.
  ///
  /// - Parameters:
  ///   - source: A pointer to the values to copy. The memory region
  ///     `source..<(source + count)` must be initialized. The memory regions
  ///     referenced by `source` and this pointer must not overlap.
  ///   - count: The number of instances to move from `source` to this
  ///     pointer's memory. `count` must not be negative.
  public func initialize(from source: UnsafePointer<Pointee>, count: Int) {
    _debugPrecondition(
      count >= 0, "UnsafeMutablePointer.initialize with negative count")
    _debugPrecondition(
      UnsafePointer(self) + count <= source ||
      source + count <= UnsafePointer(self),
      "UnsafeMutablePointer.initialize overlapping range")
    Builtin.copyArray(
      Pointee.self, self._rawValue, source._rawValue, count._builtinWordValue)
    // This builtin is equivalent to:
    // for i in 0..<count {
    //   (self + i).initialize(to: source[i])
    // }
  }

  /// Initializes memory starting at this pointer's address with the elements
  /// of the given collection.
  ///
  /// The region of memory starting at this pointer and covering `source.count`
  /// instances of the pointer's `Pointee` type must be uninitialized or
  /// `Pointee` must be a trivial type. After calling `initialize(from:)`, the
  /// region is initialized.
  ///
  /// - Parameter source: A collection of elements of the pointer's `Pointee`
  ///   type.
  // This is fundamentally unsafe since collections can underreport their count.
  @available(*, deprecated, message: "it will be removed in Swift 4.0.  Please use 'UnsafeMutableBufferPointer.initialize(from:)' instead")
  public func initialize<C : Collection>(from source: C)
    where C.Iterator.Element == Pointee {
    let buf = UnsafeMutableBufferPointer(start: self, count: numericCast(source.count))
    var (remainders,writtenUpTo) = source._copyContents(initializing: buf)
    // ensure that exactly rhs.count elements were written
    _precondition(remainders.next() == nil, "rhs underreported its count")
    _precondition(writtenUpTo == buf.endIndex, "rhs overreported its count")
  }

  /// Replaces the memory referenced by this pointer with the values
  /// starting at the given pointer, and then deinitializes the source memory.
  ///
  /// The region of memory starting at this pointer and covering `count`
  /// instances of the pointer's `Pointee` type must be initialized or
  /// `Pointee` must be a trivial type. After calling
  /// `initialize(from:count:)`, the region is initialized and the memory
  /// region `source..<(source + count)` is uninitialized.
  ///
  /// - Parameters:
  ///   - source: A pointer to the values to copy. The memory region
  ///     `source..<(source + count)` must be initialized. The memory regions
  ///     referenced by `source` and this pointer must not overlap.
  ///   - count: The number of instances to move from `source` to this
  ///     pointer's memory. `count` must not be negative.
  public func moveAssign(from source: UnsafeMutablePointer, count: Int) {
    _debugPrecondition(
      count >= 0, "UnsafeMutablePointer.moveAssign(from:) with negative count")
    _debugPrecondition(
      self + count <= source || source + count <= self,
      "moveAssign overlapping range")
    Builtin.destroyArray(Pointee.self, self._rawValue, count._builtinWordValue)
    Builtin.takeArrayFrontToBack(
      Pointee.self, self._rawValue, source._rawValue, count._builtinWordValue)
    // These builtins are equivalent to:
    // for i in 0..<count {
    //   self[i] = (source + i).move()
    // }
  }

  /// Deinitializes the specified number of values starting at this pointer.
  ///
  /// The region of memory starting at this pointer and covering `count`
  /// instances of the pointer's `Pointee` type must be initialized. After
  /// calling `deinitialize(count:)`, the memory is uninitialized, but still
  /// bound to the `Pointee` type.
  ///
  /// - Parameter count: The number of instances to deinitialize. `count` must
  ///   not be negative. The default value is `1`.
  /// - Returns: A raw pointer to the same address as this pointer. The memory
  ///   referenced by the returned raw pointer is still bound to `Pointee`.
  @discardableResult
  public func deinitialize(count: Int = 1) -> UnsafeMutableRawPointer {
    _debugPrecondition(count >= 0, "UnsafeMutablePointer.deinitialize with negative count")
    // FIXME: optimization should be implemented, where if the `count` value
    // is 1, the `Builtin.destroy(Pointee.self, _rawValue)` gets called.
    Builtin.destroyArray(Pointee.self, _rawValue, count._builtinWordValue)
    return UnsafeMutableRawPointer(self)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 692)

  /// Executes the given closure while temporarily binding the specified number
  /// of instances to the given type.
  ///
  /// Use this method when you have a pointer to memory bound to one type and
  /// you need to access that memory as instances of another type. Accessing
  /// memory as type `T` requires that the memory be bound to that type. A
  /// memory location may only be bound to one type at a time, so accessing
  /// the same memory as an unrelated type without first rebinding the memory
  /// is undefined.
  ///
  /// The region of memory starting at this pointer and covering `count`
  /// instances of the pointer's `Pointee` type must be initialized.
  ///
  /// The following example temporarily rebinds the memory of a `UInt64`
  /// pointer to `Int64`, then accesses a property on the signed integer.
  ///
  ///     let uint64Pointer: UnsafeMutablePointer<UInt64> = fetchValue()
  ///     let isNegative = uint64Pointer.withMemoryRebound(to: Int64.self) { ptr in
  ///         return ptr.pointee < 0
  ///     }
  ///
  /// Because this pointer's memory is no longer bound to its `Pointee` type
  /// while the `body` closure executes, do not access memory using the
  /// original pointer from within `body`. Instead, use the `body` closure's
  /// pointer argument to access the values in memory as instances of type
  /// `T`.
  ///
  /// After executing `body`, this method rebinds memory back to the original
  /// `Pointee` type.
  ///
  /// - Parameters:
  ///   - type: The type to temporarily bind the memory referenced by this
  ///     pointer. The type `T` must be the same size and be layout compatible
  ///     with the pointer's `Pointee` type.
  ///   - count: The number of instances of `T` to bind to `type`.
  ///   - body: A closure that takes a mutable typed pointer to the
  ///     same memory as this pointer, only bound to type `T`. The closure's
  ///     pointer argument is valid only for the duration of the closure's
  ///     execution. If `body` has a return value, it is used as the return
  ///     value for the `withMemoryRebound(to:capacity:_:)` method.
  /// - Returns: The return value of the `body` closure parameter, if any.
  public func withMemoryRebound<T, Result>(to type: T.Type, capacity count: Int,
    _ body: (UnsafeMutablePointer<T>) throws -> Result
  ) rethrows -> Result {
    Builtin.bindMemory(_rawValue, count._builtinWordValue, T.self)
    defer {
      Builtin.bindMemory(_rawValue, count._builtinWordValue, Pointee.self)
    }
    return try body(UnsafeMutablePointer<T>(_rawValue))
  }

  /// Accesses the pointee at the specified offset from this pointer.
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 747)
  /// For a pointer `p`, the memory at `p + i` must be initialized when reading
  /// the value by using the subscript. When the subscript is used as the left
  /// side of an assignment, the memory at `p + i` must be uninitialized or
  /// the pointer's `Pointee` type must be a trivial type.
  ///
  /// Do not assign an instance of a nontrivial type through the subscript to
  /// uninitialized memory. Instead, use an initializing method, such as
  /// `initialize(to:count:)`.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 759)
  ///
  /// - Parameter i: The offset from this pointer at which to access an
  ///   instance, measured in strides of the pointer's `Pointee` type.
  public subscript(i: Int) -> Pointee {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 764)
    @_transparent
    unsafeAddress {
      return UnsafePointer(self + i)
    }
    @_transparent
    nonmutating unsafeMutableAddress {
      return self + i
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 778)
  }

  //
  // Protocol conformance
  //

  /// The pointer's hash value.
  ///
  /// The hash value is not guaranteed to be stable across different
  /// invocations of the same program.  Do not persist the hash value across
  /// program runs.
  public var hashValue: Int {
    return Int(bitPattern: self)
  }

  /// Returns a pointer to the next consecutive instance.
  ///
  /// The resulting pointer must be within the bounds of the same allocation as
  /// this pointer.
  ///
  /// - Returns: A pointer advanced from this pointer by
  ///   `MemoryLayout<Pointee>.stride` bytes.
  public func successor() -> UnsafeMutablePointer {
    return self + 1
  }

  /// Returns a pointer to the previous consecutive instance.
  ///
  /// The resulting pointer must be within the bounds of the same allocation as
  /// this pointer.
  ///
  /// - Returns: A pointer shifted backward from this pointer by
  ///   `MemoryLayout<Pointee>.stride` bytes.
  public func predecessor() -> UnsafeMutablePointer {
    return self - 1
  }

  /// Returns the distance from this pointer to the given pointer, counted as
  /// instances of the pointer's `Pointee` type.
  ///
  /// With pointers `p` and `q`, the result of `p.distance(to: q)` is
  /// equivalent to `q - p`.
  ///
  /// Typed pointers are required to be properly aligned for their `Pointee`
  /// type. Proper alignment ensures that the result of `distance(to:)`
  /// accurately measures the distance between the two pointers, counted in
  /// strides of `Pointee`. To find the distance in bytes between two
  /// pointers, convert them to `UnsafeRawPointer` instances before calling
  /// `distance(to:)`.
  ///
  /// - Parameter end: The pointer to calculate the distance to.
  /// - Returns: The distance from this pointer to `end`, in strides of the
  ///   pointer's `Pointee` type. To access the stride, use
  ///   `MemoryLayout<Pointee>.stride`.
  ///
  /// - SeeAlso: `MemoryLayout`
  public func distance(to end: UnsafeMutablePointer) -> Int {
    return end - self
  }

  /// Returns a pointer offset from this pointer by the specified number of
  /// instances.
  ///
  /// With pointer `p` and distance `n`, the result of `p.advanced(by: n)` is
  /// equivalent to `p + n`.
  ///
  /// The resulting pointer must be within the bounds of the same allocation as
  /// this pointer.
  ///
  /// - Parameter n: The number of strides of the pointer's `Pointee` type to
  ///   offset this pointer. To access the stride, use
  ///   `MemoryLayout<Pointee>.stride`. `n` may be positive, negative, or
  ///   zero.
  /// - Returns: A pointer offset from this pointer by `n` instances of the
  ///   `Pointee` type.
  ///
  /// - SeeAlso: `MemoryLayout`
  public func advanced(by n: Int) -> UnsafeMutablePointer {
    return self + n
  }
}

extension UnsafeMutablePointer : CustomDebugStringConvertible {
  /// A textual representation of the pointer, suitable for debugging.
  public var debugDescription: String {
    return _rawPointerToString(_rawValue)
  }
}

extension UnsafeMutablePointer : CustomReflectable {
  public var customMirror: Mirror {
    let ptrValue = UInt64(bitPattern: Int64(Int(Builtin.ptrtoint_Word(_rawValue))))
    return Mirror(self, children: ["pointerValue": ptrValue])
  }
}

extension UnsafeMutablePointer : CustomPlaygroundQuickLookable {
  var summary: String {
    let selfType = "UnsafeMutablePointer"
    let ptrValue = UInt64(bitPattern: Int64(Int(Builtin.ptrtoint_Word(_rawValue))))
    return ptrValue == 0 ? "\(selfType)(nil)" : "\(selfType)(0x\(_uint64ToString(ptrValue, radix:16, uppercase:true)))"
  }

  public var customPlaygroundQuickLook: PlaygroundQuickLook {
    return .text(summary)
  }
}

extension UnsafeMutablePointer {
  // - Note: Strideable's implementation is potentially less efficient and cannot
  //   handle misaligned pointers.
  /// Returns a Boolean value indicating whether two pointers are equal.
  ///
  /// - Parameters:
  ///   - lhs: A pointer.
  ///   - rhs: Another pointer.
  /// - Returns: `true` if `lhs` and `rhs` reference the same memory address;
  ///   otherwise, `false`.
  @_transparent
  public static func == (lhs: UnsafeMutablePointer<Pointee>, rhs: UnsafeMutablePointer<Pointee>) -> Bool {
    return Bool(Builtin.cmp_eq_RawPointer(lhs._rawValue, rhs._rawValue))
  }

  // - Note: Strideable's implementation is potentially less efficient and
  // cannot handle misaligned pointers.
  //
  // - Note: This is an unsigned comparison unlike Strideable's implementation.
  /// Returns a Boolean value indicating whether the first pointer references
  /// an earlier memory location than the second pointer.
  ///
  /// - Parameters:
  ///   - lhs: A pointer.
  ///   - rhs: Another pointer.
  /// - Returns: `true` if `lhs` references a memory address earlier than
  ///   `rhs`; otherwise, `false`.
  @_transparent
  public static func < (lhs: UnsafeMutablePointer<Pointee>, rhs: UnsafeMutablePointer<Pointee>) -> Bool {
    return Bool(Builtin.cmp_ult_RawPointer(lhs._rawValue, rhs._rawValue))
  }

  // - Note: The following family of operator overloads are redundant
  //   with Strideable. However, optimizer improvements are needed
  //   before they can be removed without affecting performance.

  /// Creates a new pointer, offset from a pointer by a specified number of
  /// instances of the pointer's `Pointee` type.
  ///
  /// You use the addition operator (`+`) to advance a pointer by a number of
  /// contiguous instances. The resulting pointer must be within the bounds of
  /// the same allocation as `lhs`.
  ///
  /// - Parameters:
  ///   - lhs: A pointer.
  ///   - rhs: The number of strides of the pointer's `Pointee` type to offset
  ///     `lhs`. To access the stride, use `MemoryLayout<Pointee>.stride`.
  /// - Returns: A pointer offset from `lhs` by `rhs` instances of the
  ///   `Pointee` type.
  ///
  /// - SeeAlso: `MemoryLayout`
  @_transparent
  public static func + (lhs: UnsafeMutablePointer<Pointee>, rhs: Int) -> UnsafeMutablePointer<Pointee> {
    return UnsafeMutablePointer(Builtin.gep_Word(
      lhs._rawValue, rhs._builtinWordValue, Pointee.self))
  }

  /// Creates a new pointer, offset from a pointer by a specified number of
  /// instances of the pointer's `Pointee` type.
  ///
  /// You use the addition operator (`+`) to advance a pointer by a number of
  /// contiguous instances. The resulting pointer must be within the bounds of
  /// the same allocation as `rhs`.
  ///
  /// - Parameters:
  ///   - lhs: The number of strides of the pointer's `Pointee` type to offset
  ///     `rhs`. To access the stride, use `MemoryLayout<Pointee>.stride`.
  ///   - rhs: A pointer.
  /// - Returns: A pointer offset from `rhs` by `lhs` instances of the
  ///   `Pointee` type.
  ///
  /// - SeeAlso: `MemoryLayout`
  @_transparent
  public static func + (lhs: Int, rhs: UnsafeMutablePointer<Pointee>) -> UnsafeMutablePointer<Pointee> {
    return rhs + lhs
  }

  /// Creates a new pointer, offset backward from a pointer by a specified
  /// number of instances of the pointer's `Pointee` type.
  ///
  /// You use the subtraction operator (`-`) to shift a pointer backward by a
  /// number of contiguous instances. The resulting pointer must be within the
  /// bounds of the same allocation as `lhs`.
  ///
  /// - Parameters:
  ///   - lhs: A pointer.
  ///   - rhs: The number of strides of the pointer's `Pointee` type to offset
  ///     `lhs`. To access the stride, use `MemoryLayout<Pointee>.stride`.
  /// - Returns: A pointer offset backward from `lhs` by `rhs` instances of
  ///   the `Pointee` type.
  ///
  /// - SeeAlso: `MemoryLayout`
  @_transparent
  public static func - (lhs: UnsafeMutablePointer<Pointee>, rhs: Int) -> UnsafeMutablePointer<Pointee> {
    return lhs + -rhs
  }

  /// Returns the distance between two pointers, counted as instances of the
  /// pointers' `Pointee` type.
  ///
  /// Typed pointers are required to be properly aligned for their `Pointee`
  /// type. Proper alignment ensures that the result of the subtraction
  /// operator (`-`) accurately measures the distance between the two
  /// pointers, counted in strides of `Pointee`. To find the distance in bytes
  /// between two pointers, convert them to `UnsafeRawPointer` instances
  /// before subtracting.
  ///
  /// - Parameters:
  ///   - lhs: A pointer.
  ///   - rhs: Another pointer.
  /// - Returns: The distance from `lhs` to `rhs`, in strides of the pointer's
  ///   `Pointee` type. To access the stride, use
  ///   `MemoryLayout<Pointee>.stride`.
  ///
  /// - SeeAlso: `MemoryLayout`
  @_transparent
  public static func - (lhs: UnsafeMutablePointer<Pointee>, rhs: UnsafeMutablePointer<Pointee>) -> Int {
    return
      Int(Builtin.sub_Word(Builtin.ptrtoint_Word(lhs._rawValue),
                           Builtin.ptrtoint_Word(rhs._rawValue)))
      / MemoryLayout<Pointee>.stride
  }

  /// Advances a pointer by a specified number of instances of the pointer's
  /// `Pointee` type.
  ///
  /// You use the addition assignment operator (`+=`) to advance a pointer by a
  /// number of contiguous instances. The resulting pointer must be within the
  /// bounds of the same allocation as `rhs`.
  ///
  /// - Parameters:
  ///   - lhs: A pointer to advance in place.
  ///   - rhs: The number of strides of the pointer's `Pointee` type to offset
  ///     `lhs`. To access the stride, use `MemoryLayout<Pointee>.stride`.
  ///
  /// - SeeAlso: `MemoryLayout`
  @_transparent
  public static func += (lhs: inout UnsafeMutablePointer<Pointee>, rhs: Int) {
    lhs = lhs + rhs
  }

  /// Shifts a pointer backward by a specified number of instances of the
  /// pointer's `Pointee` type.
  ///
  /// You use the subtraction assignment operator (`-=`) to shift a pointer
  /// backward by a number of contiguous instances. The resulting pointer must
  /// be within the bounds of the same allocation as `rhs`.
  ///
  /// - Parameters:
  ///   - lhs: A pointer to advance in place.
  ///   - rhs: The number of strides of the pointer's `Pointee` type to offset
  ///     `lhs`. To access the stride, use `MemoryLayout<Pointee>.stride`.
  ///
  /// - SeeAlso: `MemoryLayout`
  @_transparent
  public static func -= (lhs: inout UnsafeMutablePointer<Pointee>, rhs: Int) {
    lhs = lhs - rhs
  }
}

extension UnsafeMutablePointer {
  @available(*, unavailable, message:
    "use 'withMemoryRebound(to:capacity:_)' to temporarily view memory as another layout-compatible type.")
  public init<U>(_ from : UnsafeMutablePointer<U>) { Builtin.unreachable() }

  @available(*, unavailable, message:
    "use 'withMemoryRebound(to:capacity:_)' to temporarily view memory as another layout-compatible type.")
  public init?<U>(_ from : UnsafeMutablePointer<U>?) { Builtin.unreachable(); return nil }

  @available(*, unavailable, message:
    "use 'withMemoryRebound(to:capacity:_)' to temporarily view memory as another layout-compatible type.")
  public init<U>(_ from : UnsafePointer<U>) { Builtin.unreachable() }

  @available(*, unavailable, message:
    "use 'withMemoryRebound(to:capacity:_)' to temporarily view memory as another layout-compatible type.")
  public init?<U>(_ from : UnsafePointer<U>?) { Builtin.unreachable(); return nil }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 1064)
  @available(*, unavailable, renamed: "init(mutating:)")
  public init(_ from : UnsafePointer<Pointee>) { Builtin.unreachable() }

  @available(*, unavailable, renamed: "init(mutating:)")
  public init?(_ from : UnsafePointer<Pointee>?) { Builtin.unreachable(); return nil }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 1070)

  @available(*, unavailable, renamed: "Pointee")
  public typealias Memory = Pointee

  @available(*, unavailable, message: "use 'nil' literal")
  public init() {
    Builtin.unreachable()
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 1080)
  @available(*, unavailable, renamed: "allocate(capacity:)")
  public static func alloc(_ num: Int) -> UnsafeMutablePointer {
    Builtin.unreachable()
  }

  @available(*, unavailable, message: "use 'UnsafeMutablePointer.allocate(capacity:)'")
  public init(allocatingCapacity: Int) {
    Builtin.unreachable()
  }

  @available(*, unavailable, renamed: "deallocate(capacity:)")
  public func dealloc(_ num: Int) {
    Builtin.unreachable()
  }

  @available(*, unavailable, renamed: "deallocate(capacity:)")
  public func deallocateCapacity(_ num: Int) {
    Builtin.unreachable()
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 1100)

  @available(*, unavailable, renamed: "pointee")
  public var memory: Pointee {
    get {
      Builtin.unreachable()
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 1107)
    set {
      Builtin.unreachable()
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 1111)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 1114)
  @available(*, unavailable, renamed: "initialize(to:)")
  public func initialize(_ newvalue: Pointee) {
    Builtin.unreachable()
  }

  @available(*, unavailable, renamed: "initialize(to:count:)")
  public func initialize(with newvalue: Pointee, count: Int = 1) {
    Builtin.unreachable()
  }

  @available(*, unavailable, renamed: "deinitialize(count:)")
  public func destroy() {
    Builtin.unreachable()
  }

  @available(*, unavailable, renamed: "deinitialize(count:)")
  public func destroy(_ count: Int) {
    Builtin.unreachable()
  }

  @available(*, unavailable, renamed: "initialize(from:)")
  public func initializeFrom<C : Collection>(_ source: C) {
    Builtin.unreachable()
  }

  @available(*, unavailable, renamed: "initialize(from:count:)")
  public func initializeFrom(_ source: UnsafePointer<Pointee>, count: Int) {
    Builtin.unreachable()
  }

  @available(*, unavailable, renamed: "assign(from:count:)")
  public func assignFrom(_ source: UnsafePointer<Pointee>, count: Int) {
    Builtin.unreachable()
  }

  @available(*, unavailable, renamed: "assign(from:count:)")
  public func assignBackwardFrom(_ source: UnsafePointer<Pointee>, count: Int) {
    Builtin.unreachable()
  }

  @available(*, unavailable, renamed: "moveInitialize(from:count:)")
  public func moveInitializeFrom(_ source: UnsafePointer<Pointee>, count: Int) {
    Builtin.unreachable()
  }

  @available(*, unavailable, renamed: "moveInitialize(from:count:)")
  public func moveInitializeBackwardFrom(_ source: UnsafePointer<Pointee>,
    count: Int) {
    Builtin.unreachable()
  }

  @available(*, unavailable, renamed: "moveAssign(from:count:)")
  public func moveAssignFrom(_ source: UnsafePointer<Pointee>, count: Int) {
    Builtin.unreachable()
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 1170)
}

extension Int {
  public init<U>(bitPattern: UnsafeMutablePointer<U>?) {
    if let bitPattern = bitPattern {
      self = Int(Builtin.ptrtoint_Word(bitPattern._rawValue))
    } else {
      self = 0
    }
  }
}

extension UInt {
  public init<U>(bitPattern: UnsafeMutablePointer<U>?) {
    if let bitPattern = bitPattern {
      self = UInt(Builtin.ptrtoint_Word(bitPattern._rawValue))
    } else {
      self = 0
    }
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 19)
/// A pointer for accessing  data of a
/// specific type.
///
/// You use instances of the `UnsafePointer` type to access data of a
/// specific type in memory. The type of data that a pointer can access is the
/// pointer's `Pointee` type. `UnsafePointer` provides no automated
/// memory management or alignment guarantees. You are responsible for
/// handling the life cycle of any memory you work with through unsafe
/// pointers to avoid leaks or undefined behavior.
///
/// Memory that you manually manage can be either *untyped* or *bound* to a
/// specific type. You use the `UnsafePointer` type to access and
/// manage memory that has been bound to a specific type.
///
/// Understanding a Pointer's Memory State
/// ======================================
///
/// The memory referenced by an `UnsafePointer` instance can be in
/// one of several states. Many pointer operations must only be applied to
/// pointers with memory in a specific state---you must keep track of the
/// state of the memory you are working with and understand the changes to
/// that state that different operations perform. Memory can be untyped and
/// uninitialized, bound to a type and uninitialized, or bound to a type and
/// initialized to a value. Finally, memory that was allocated previously may
/// have been deallocated, leaving existing pointers referencing unallocated
/// memory.
///
/// Uninitialized Memory
/// --------------------
///
/// Memory that has just been allocated through a typed pointer or has been
/// deinitialized is in an *uninitialized* state. Uninitialized memory must be
/// initialized before it can be accessed for reading.
///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 59)
/// Initialized Memory
/// ------------------
///
/// *Initialized* memory has a value that can be read using a pointer's
/// `pointee` property or through subscript notation. In the following
/// example, `ptr` is a pointer to memory initialized with a value of `23`:
///
///     let ptr: UnsafePointer<Int> = ...
///     // ptr.pointee == 23
///     // ptr[0] == 23
///
/// Accessing a Pointer's Memory as a Different Type
/// ================================================
///
/// When you access memory through an `UnsafePointer` instance, the
/// `Pointee` type must be consistent with the bound type of the memory. If
/// you do need to access memory that is bound to one type as a different
/// type, Swift's pointer types provide type-safe ways to temporarily or
/// permanently change the bound type of the memory, or to load typed
/// instances directly from raw memory.
///
/// An `UnsafePointer<UInt8>` instance allocated with eight bytes of
/// memory, `uint8Pointer`, will be used for the examples below.
///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 87)
///     let uint8Pointer: UnsafePointer<UInt8> = fetchEightBytes()
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 89)
///
/// When you only need to temporarily access a pointer's memory as a different
/// type, use the `withMemoryRebound(to:capacity:)` method. For example, you
/// can use this method to call an API that expects a pointer to a different
/// type that is layout compatible with your pointer's `Pointee`. The following
/// code temporarily rebinds the memory that `uint8Pointer` references from
/// `UInt8` to `Int8` to call the imported C `strlen` function.
///
///     // Imported from C
///     func strlen(_ __s: UnsafePointer<Int8>!) -> UInt
///
///     let length = uint8Pointer.withMemoryRebound(to: Int8.self, capacity: 8) {
///         return strlen($0)
///     }
///     // length == 7
///
/// When you need to permanently rebind memory to a different type, first
/// obtain a raw pointer to the memory and then call the
/// `bindMemory(to:capacity:)` method on the raw pointer. The following
/// example binds the memory referenced by `uint8Pointer` to one instance of
/// the `UInt64` type:
///
///     let uint64Pointer = UnsafeRawPointer(uint64Pointer)
///                               .bindMemory(to: UInt64.self, capacity: 1)
///
/// After rebinding the memory referenced by `uint8Pointer` to `UInt64`,
/// accessing that pointer's referenced memory as a `UInt8` instance is
/// undefined.
///
///     var fullInteger = uint64Pointer.pointee          // OK
///     var firstByte = uint8Pointer.pointee             // undefined
///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 129)
/// Alternatively, you can access the same memory as a different type without
/// rebinding through untyped memory access, so long as the bound type and the
/// destination type are trivial types. Convert your pointer to an
/// `UnsafeRawPointer` instance and then use the raw pointer's
/// `load(fromByteOffset:as:)` method to read values.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 135)
///
///     let rawPointer = UnsafeRawPointer(uint64Pointer)
///     fullInteger = rawPointer.load(as: UInt64.self)   // OK
///     firstByte = rawPointer.load(as: UInt8.self)      // OK
///
/// Performing Typed Pointer Arithmetic
/// ===================================
///
/// Pointer arithmetic with a typed pointer is counted in strides of the
/// pointer's `Pointee` type. When you add to or subtract from an `UnsafePointer`
/// instance, the result is a new pointer of the same type, offset by that
/// number of instances of the `Pointee` type.
///
///     // 'intPointer' points to memory initialized with [10, 20, 30, 40]
///     let intPointer: UnsafePointer<Int> = ...
///
///     // Load the first value in memory
///     let x = intPointer.pointee
///     // x == 10
///
///     // Load the third value in memory
///     let offsetPointer = intPointer + 2
///     let y = offsetPointer.pointee
///     // y == 30
///
/// You can also use subscript notation to access the value in memory at a
/// specific offset.
///
///     let z = intPointer[2]
///     // z == 30
///
/// Implicit Casting and Bridging
/// =============================
///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 209)
/// When calling a function or method with an `UnsafePointer` parameter, you can pass
/// an instance of that specific pointer type, pass an instance of a
/// compatible pointer type, or use Swift's implicit bridging to pass a
/// compatible pointer.
///
/// For example, the `printInt(atAddress:)` function in the following code
/// sample expects an `UnsafePointer<Int>` instance as its first parameter:
///
///     func printInt(atAddress p: UnsafePointer<Int>) {
///         print(p.pointee)
///     }
///
/// As is typical in Swift, you can call the `printInt(atAddress:)` function
/// with an `UnsafePointer` instance. This example passes `intPointer`, a pointer to
/// an `Int` value, to `print(address:)`.
///
///     printInt(atAddress: intPointer)
///     // Prints "42"
///
/// Because a mutable typed pointer can be implicitly cast to an immutable
/// pointer with the same `Pointee` type when passed as a parameter, you can
/// also call `printInt(atAddress:)` with an `UnsafeMutablePointer` instance.
///
///     let mutableIntPointer = UnsafeMutablePointer(mutating: intPointer)
///     printInt(atAddress: mutableIntPointer)
///     // Prints "42"
///
/// Alternatively, you can use Swift's *implicit bridging* to pass a pointer to
/// an instance or to the elements of an array. The following example passes a
/// pointer to the `value` variable by using inout syntax:
///
///     var value: Int = 23
///     printInt(atAddress: &value)
///     // Prints "23"
///
/// An immutable pointer to the elements of an array is implicitly created when
/// you pass the array as an argument. This example uses implicit bridging to
/// pass a pointer to the elements of `numbers` when calling
/// `printInt(atAddress:)`.
///
///     let numbers = [5, 10, 15, 20]
///     printInt(atAddress: numbers)
///     // Prints "5"
///
/// You can also use inout syntax to pass a mutable pointer to the elements of
/// an array. Because `printInt(atAddress:)` requires an immutable pointer,
/// although this is syntactically valid, it isn't necessary.
///
///     var mutableNumbers = numbers
///     printInt(atAddress: &mutableNumbers)
///
/// However you call `printInt(atAddress:)`, Swift's type safety guarantees
/// that you can only pass a pointer to the type required by the function---in
/// this case, a pointer to an `Int`.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 264)
///
/// - Important: The pointer created through implicit bridging of an instance
///   or of an array's elements is only valid during the execution of the
///   called function. Escaping the pointer to use after the execution of the
///   function is undefined behavior. In particular, do not use implicit
///   bridging when calling an `UnsafePointer` initializer.
///
///       var number = 5
///       let numberPointer = UnsafePointer<Int>(&number)
///       // Accessing 'numberPointer' is undefined behavior.
@_fixed_layout
public struct UnsafePointer<Pointee>
  : Strideable, Hashable, _Pointer {

  /// A type that represents the distance between two pointers.
  public typealias Distance = Int

  /// The underlying raw (untyped) pointer.
  public let _rawValue: Builtin.RawPointer

  /// Creates an `UnsafePointer` from a builtin raw pointer.
  @_transparent
  public init(_ _rawValue : Builtin.RawPointer) {
    self._rawValue = _rawValue
  }

  /// Creates a new typed pointer from the given opaque pointer.
  ///
  /// - Parameter from: The opaque pointer to convert to a typed pointer.
  @_transparent
  public init(_ from : OpaquePointer) {
    _rawValue = from._rawValue
  }

  /// Creates a new typed pointer from the given opaque pointer.
  ///
  /// - Parameter from: The opaque pointer to convert to a typed pointer. If
  ///   `from` is `nil`, the result of this initializer is `nil`.
  @_transparent
  public init?(_ from : OpaquePointer?) {
    guard let unwrapped = from else { return nil }
    self.init(unwrapped)
  }

  /// Creates a new typed pointer from the given address, specified as a bit
  /// pattern.
  ///
  /// The address passed as `bitPattern` must have the correct alignment for
  /// the pointer's `Pointee` type. That is,
  /// `bitPattern % MemoryLayout<Pointee>.alignment` must be `0`.
  ///
  /// - Parameter bitPattern: A bit pattern to use for the address of the new
  ///   pointer. If `bitPattern` is zero, the result is `nil`.
  @_transparent
  public init?(bitPattern: Int) {
    if bitPattern == 0 { return nil }
    self._rawValue = Builtin.inttoptr_Word(bitPattern._builtinWordValue)
  }

  /// Creates a new typed pointer from the given address, specified as a bit
  /// pattern.
  ///
  /// The address passed as `bitPattern` must have the correct alignment for
  /// the pointer's `Pointee` type. That is,
  /// `bitPattern % MemoryLayout<Pointee>.alignment` must be `0`.
  ///
  /// - Parameter bitPattern: A bit pattern to use for the address of the new
  ///   pointer. If `bitPattern` is zero, the result is `nil`.
  @_transparent
  public init?(bitPattern: UInt) {
    if bitPattern == 0 { return nil }
    self._rawValue = Builtin.inttoptr_Word(bitPattern._builtinWordValue)
  }

  /// Creates a new pointer from the given typed pointer.
  ///
  /// - Parameter other: The typed pointer to convert.
  @_transparent
  public init(_ other: UnsafePointer<Pointee>) {
    self = other
  }

  /// Creates a new pointer from the given typed pointer.
  ///
  /// - Parameter other: The typed pointer to convert. If `other` is `nil`, the
  ///   result is `nil`.
  @_transparent
  public init?(_ other: UnsafePointer<Pointee>?) {
    guard let unwrapped = other else { return nil }
    self = unwrapped
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 377)
  /// Creates an immutable typed pointer referencing the same memory as the
  /// given mutable pointer.
  ///
  /// - Parameter other: The pointer to convert.
  @_transparent
  public init(_ other: UnsafeMutablePointer<Pointee>) {
    self._rawValue = other._rawValue
  }

  /// Creates an immutable typed pointer referencing the same memory as the
  /// given mutable pointer.
  ///
  /// - Parameter other: The pointer to convert. If `other` is `nil`, the
  ///   result is `nil`.
  @_transparent
  public init?(_ other: UnsafeMutablePointer<Pointee>?) {
    guard let unwrapped = other else { return nil }
    self.init(unwrapped)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 397)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 445)

  /// Accesses the instance referenced by this pointer.
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 458)
  /// When reading from the `pointee` property, the instance referenced by
  /// this pointer must already be initialized.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 461)
  public var pointee: Pointee {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 470)
    @_transparent unsafeAddress {
      return self
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 474)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 692)

  /// Executes the given closure while temporarily binding the specified number
  /// of instances to the given type.
  ///
  /// Use this method when you have a pointer to memory bound to one type and
  /// you need to access that memory as instances of another type. Accessing
  /// memory as type `T` requires that the memory be bound to that type. A
  /// memory location may only be bound to one type at a time, so accessing
  /// the same memory as an unrelated type without first rebinding the memory
  /// is undefined.
  ///
  /// The region of memory starting at this pointer and covering `count`
  /// instances of the pointer's `Pointee` type must be initialized.
  ///
  /// The following example temporarily rebinds the memory of a `UInt64`
  /// pointer to `Int64`, then accesses a property on the signed integer.
  ///
  ///     let uint64Pointer: UnsafePointer<UInt64> = fetchValue()
  ///     let isNegative = uint64Pointer.withMemoryRebound(to: Int64.self) { ptr in
  ///         return ptr.pointee < 0
  ///     }
  ///
  /// Because this pointer's memory is no longer bound to its `Pointee` type
  /// while the `body` closure executes, do not access memory using the
  /// original pointer from within `body`. Instead, use the `body` closure's
  /// pointer argument to access the values in memory as instances of type
  /// `T`.
  ///
  /// After executing `body`, this method rebinds memory back to the original
  /// `Pointee` type.
  ///
  /// - Parameters:
  ///   - type: The type to temporarily bind the memory referenced by this
  ///     pointer. The type `T` must be the same size and be layout compatible
  ///     with the pointer's `Pointee` type.
  ///   - count: The number of instances of `T` to bind to `type`.
  ///   - body: A closure that takes a  typed pointer to the
  ///     same memory as this pointer, only bound to type `T`. The closure's
  ///     pointer argument is valid only for the duration of the closure's
  ///     execution. If `body` has a return value, it is used as the return
  ///     value for the `withMemoryRebound(to:capacity:_:)` method.
  /// - Returns: The return value of the `body` closure parameter, if any.
  public func withMemoryRebound<T, Result>(to type: T.Type, capacity count: Int,
    _ body: (UnsafePointer<T>) throws -> Result
  ) rethrows -> Result {
    Builtin.bindMemory(_rawValue, count._builtinWordValue, T.self)
    defer {
      Builtin.bindMemory(_rawValue, count._builtinWordValue, Pointee.self)
    }
    return try body(UnsafePointer<T>(_rawValue))
  }

  /// Accesses the pointee at the specified offset from this pointer.
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 756)
  ///
  /// For a pointer `p`, the memory at `p + i` must be initialized.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 759)
  ///
  /// - Parameter i: The offset from this pointer at which to access an
  ///   instance, measured in strides of the pointer's `Pointee` type.
  public subscript(i: Int) -> Pointee {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 773)
    @_transparent
    unsafeAddress {
      return self + i
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 778)
  }

  //
  // Protocol conformance
  //

  /// The pointer's hash value.
  ///
  /// The hash value is not guaranteed to be stable across different
  /// invocations of the same program.  Do not persist the hash value across
  /// program runs.
  public var hashValue: Int {
    return Int(bitPattern: self)
  }

  /// Returns a pointer to the next consecutive instance.
  ///
  /// The resulting pointer must be within the bounds of the same allocation as
  /// this pointer.
  ///
  /// - Returns: A pointer advanced from this pointer by
  ///   `MemoryLayout<Pointee>.stride` bytes.
  public func successor() -> UnsafePointer {
    return self + 1
  }

  /// Returns a pointer to the previous consecutive instance.
  ///
  /// The resulting pointer must be within the bounds of the same allocation as
  /// this pointer.
  ///
  /// - Returns: A pointer shifted backward from this pointer by
  ///   `MemoryLayout<Pointee>.stride` bytes.
  public func predecessor() -> UnsafePointer {
    return self - 1
  }

  /// Returns the distance from this pointer to the given pointer, counted as
  /// instances of the pointer's `Pointee` type.
  ///
  /// With pointers `p` and `q`, the result of `p.distance(to: q)` is
  /// equivalent to `q - p`.
  ///
  /// Typed pointers are required to be properly aligned for their `Pointee`
  /// type. Proper alignment ensures that the result of `distance(to:)`
  /// accurately measures the distance between the two pointers, counted in
  /// strides of `Pointee`. To find the distance in bytes between two
  /// pointers, convert them to `UnsafeRawPointer` instances before calling
  /// `distance(to:)`.
  ///
  /// - Parameter end: The pointer to calculate the distance to.
  /// - Returns: The distance from this pointer to `end`, in strides of the
  ///   pointer's `Pointee` type. To access the stride, use
  ///   `MemoryLayout<Pointee>.stride`.
  ///
  /// - SeeAlso: `MemoryLayout`
  public func distance(to end: UnsafePointer) -> Int {
    return end - self
  }

  /// Returns a pointer offset from this pointer by the specified number of
  /// instances.
  ///
  /// With pointer `p` and distance `n`, the result of `p.advanced(by: n)` is
  /// equivalent to `p + n`.
  ///
  /// The resulting pointer must be within the bounds of the same allocation as
  /// this pointer.
  ///
  /// - Parameter n: The number of strides of the pointer's `Pointee` type to
  ///   offset this pointer. To access the stride, use
  ///   `MemoryLayout<Pointee>.stride`. `n` may be positive, negative, or
  ///   zero.
  /// - Returns: A pointer offset from this pointer by `n` instances of the
  ///   `Pointee` type.
  ///
  /// - SeeAlso: `MemoryLayout`
  public func advanced(by n: Int) -> UnsafePointer {
    return self + n
  }
}

extension UnsafePointer : CustomDebugStringConvertible {
  /// A textual representation of the pointer, suitable for debugging.
  public var debugDescription: String {
    return _rawPointerToString(_rawValue)
  }
}

extension UnsafePointer : CustomReflectable {
  public var customMirror: Mirror {
    let ptrValue = UInt64(bitPattern: Int64(Int(Builtin.ptrtoint_Word(_rawValue))))
    return Mirror(self, children: ["pointerValue": ptrValue])
  }
}

extension UnsafePointer : CustomPlaygroundQuickLookable {
  var summary: String {
    let selfType = "UnsafePointer"
    let ptrValue = UInt64(bitPattern: Int64(Int(Builtin.ptrtoint_Word(_rawValue))))
    return ptrValue == 0 ? "\(selfType)(nil)" : "\(selfType)(0x\(_uint64ToString(ptrValue, radix:16, uppercase:true)))"
  }

  public var customPlaygroundQuickLook: PlaygroundQuickLook {
    return .text(summary)
  }
}

extension UnsafePointer {
  // - Note: Strideable's implementation is potentially less efficient and cannot
  //   handle misaligned pointers.
  /// Returns a Boolean value indicating whether two pointers are equal.
  ///
  /// - Parameters:
  ///   - lhs: A pointer.
  ///   - rhs: Another pointer.
  /// - Returns: `true` if `lhs` and `rhs` reference the same memory address;
  ///   otherwise, `false`.
  @_transparent
  public static func == (lhs: UnsafePointer<Pointee>, rhs: UnsafePointer<Pointee>) -> Bool {
    return Bool(Builtin.cmp_eq_RawPointer(lhs._rawValue, rhs._rawValue))
  }

  // - Note: Strideable's implementation is potentially less efficient and
  // cannot handle misaligned pointers.
  //
  // - Note: This is an unsigned comparison unlike Strideable's implementation.
  /// Returns a Boolean value indicating whether the first pointer references
  /// an earlier memory location than the second pointer.
  ///
  /// - Parameters:
  ///   - lhs: A pointer.
  ///   - rhs: Another pointer.
  /// - Returns: `true` if `lhs` references a memory address earlier than
  ///   `rhs`; otherwise, `false`.
  @_transparent
  public static func < (lhs: UnsafePointer<Pointee>, rhs: UnsafePointer<Pointee>) -> Bool {
    return Bool(Builtin.cmp_ult_RawPointer(lhs._rawValue, rhs._rawValue))
  }

  // - Note: The following family of operator overloads are redundant
  //   with Strideable. However, optimizer improvements are needed
  //   before they can be removed without affecting performance.

  /// Creates a new pointer, offset from a pointer by a specified number of
  /// instances of the pointer's `Pointee` type.
  ///
  /// You use the addition operator (`+`) to advance a pointer by a number of
  /// contiguous instances. The resulting pointer must be within the bounds of
  /// the same allocation as `lhs`.
  ///
  /// - Parameters:
  ///   - lhs: A pointer.
  ///   - rhs: The number of strides of the pointer's `Pointee` type to offset
  ///     `lhs`. To access the stride, use `MemoryLayout<Pointee>.stride`.
  /// - Returns: A pointer offset from `lhs` by `rhs` instances of the
  ///   `Pointee` type.
  ///
  /// - SeeAlso: `MemoryLayout`
  @_transparent
  public static func + (lhs: UnsafePointer<Pointee>, rhs: Int) -> UnsafePointer<Pointee> {
    return UnsafePointer(Builtin.gep_Word(
      lhs._rawValue, rhs._builtinWordValue, Pointee.self))
  }

  /// Creates a new pointer, offset from a pointer by a specified number of
  /// instances of the pointer's `Pointee` type.
  ///
  /// You use the addition operator (`+`) to advance a pointer by a number of
  /// contiguous instances. The resulting pointer must be within the bounds of
  /// the same allocation as `rhs`.
  ///
  /// - Parameters:
  ///   - lhs: The number of strides of the pointer's `Pointee` type to offset
  ///     `rhs`. To access the stride, use `MemoryLayout<Pointee>.stride`.
  ///   - rhs: A pointer.
  /// - Returns: A pointer offset from `rhs` by `lhs` instances of the
  ///   `Pointee` type.
  ///
  /// - SeeAlso: `MemoryLayout`
  @_transparent
  public static func + (lhs: Int, rhs: UnsafePointer<Pointee>) -> UnsafePointer<Pointee> {
    return rhs + lhs
  }

  /// Creates a new pointer, offset backward from a pointer by a specified
  /// number of instances of the pointer's `Pointee` type.
  ///
  /// You use the subtraction operator (`-`) to shift a pointer backward by a
  /// number of contiguous instances. The resulting pointer must be within the
  /// bounds of the same allocation as `lhs`.
  ///
  /// - Parameters:
  ///   - lhs: A pointer.
  ///   - rhs: The number of strides of the pointer's `Pointee` type to offset
  ///     `lhs`. To access the stride, use `MemoryLayout<Pointee>.stride`.
  /// - Returns: A pointer offset backward from `lhs` by `rhs` instances of
  ///   the `Pointee` type.
  ///
  /// - SeeAlso: `MemoryLayout`
  @_transparent
  public static func - (lhs: UnsafePointer<Pointee>, rhs: Int) -> UnsafePointer<Pointee> {
    return lhs + -rhs
  }

  /// Returns the distance between two pointers, counted as instances of the
  /// pointers' `Pointee` type.
  ///
  /// Typed pointers are required to be properly aligned for their `Pointee`
  /// type. Proper alignment ensures that the result of the subtraction
  /// operator (`-`) accurately measures the distance between the two
  /// pointers, counted in strides of `Pointee`. To find the distance in bytes
  /// between two pointers, convert them to `UnsafeRawPointer` instances
  /// before subtracting.
  ///
  /// - Parameters:
  ///   - lhs: A pointer.
  ///   - rhs: Another pointer.
  /// - Returns: The distance from `lhs` to `rhs`, in strides of the pointer's
  ///   `Pointee` type. To access the stride, use
  ///   `MemoryLayout<Pointee>.stride`.
  ///
  /// - SeeAlso: `MemoryLayout`
  @_transparent
  public static func - (lhs: UnsafePointer<Pointee>, rhs: UnsafePointer<Pointee>) -> Int {
    return
      Int(Builtin.sub_Word(Builtin.ptrtoint_Word(lhs._rawValue),
                           Builtin.ptrtoint_Word(rhs._rawValue)))
      / MemoryLayout<Pointee>.stride
  }

  /// Advances a pointer by a specified number of instances of the pointer's
  /// `Pointee` type.
  ///
  /// You use the addition assignment operator (`+=`) to advance a pointer by a
  /// number of contiguous instances. The resulting pointer must be within the
  /// bounds of the same allocation as `rhs`.
  ///
  /// - Parameters:
  ///   - lhs: A pointer to advance in place.
  ///   - rhs: The number of strides of the pointer's `Pointee` type to offset
  ///     `lhs`. To access the stride, use `MemoryLayout<Pointee>.stride`.
  ///
  /// - SeeAlso: `MemoryLayout`
  @_transparent
  public static func += (lhs: inout UnsafePointer<Pointee>, rhs: Int) {
    lhs = lhs + rhs
  }

  /// Shifts a pointer backward by a specified number of instances of the
  /// pointer's `Pointee` type.
  ///
  /// You use the subtraction assignment operator (`-=`) to shift a pointer
  /// backward by a number of contiguous instances. The resulting pointer must
  /// be within the bounds of the same allocation as `rhs`.
  ///
  /// - Parameters:
  ///   - lhs: A pointer to advance in place.
  ///   - rhs: The number of strides of the pointer's `Pointee` type to offset
  ///     `lhs`. To access the stride, use `MemoryLayout<Pointee>.stride`.
  ///
  /// - SeeAlso: `MemoryLayout`
  @_transparent
  public static func -= (lhs: inout UnsafePointer<Pointee>, rhs: Int) {
    lhs = lhs - rhs
  }
}

extension UnsafePointer {
  @available(*, unavailable, message:
    "use 'withMemoryRebound(to:capacity:_)' to temporarily view memory as another layout-compatible type.")
  public init<U>(_ from : UnsafeMutablePointer<U>) { Builtin.unreachable() }

  @available(*, unavailable, message:
    "use 'withMemoryRebound(to:capacity:_)' to temporarily view memory as another layout-compatible type.")
  public init?<U>(_ from : UnsafeMutablePointer<U>?) { Builtin.unreachable(); return nil }

  @available(*, unavailable, message:
    "use 'withMemoryRebound(to:capacity:_)' to temporarily view memory as another layout-compatible type.")
  public init<U>(_ from : UnsafePointer<U>) { Builtin.unreachable() }

  @available(*, unavailable, message:
    "use 'withMemoryRebound(to:capacity:_)' to temporarily view memory as another layout-compatible type.")
  public init?<U>(_ from : UnsafePointer<U>?) { Builtin.unreachable(); return nil }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 1070)

  @available(*, unavailable, renamed: "Pointee")
  public typealias Memory = Pointee

  @available(*, unavailable, message: "use 'nil' literal")
  public init() {
    Builtin.unreachable()
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 1100)

  @available(*, unavailable, renamed: "pointee")
  public var memory: Pointee {
    get {
      Builtin.unreachable()
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 1111)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 1170)
}

extension Int {
  public init<U>(bitPattern: UnsafePointer<U>?) {
    if let bitPattern = bitPattern {
      self = Int(Builtin.ptrtoint_Word(bitPattern._rawValue))
    } else {
      self = 0
    }
  }
}

extension UInt {
  public init<U>(bitPattern: UnsafePointer<U>?) {
    if let bitPattern = bitPattern {
      self = UInt(Builtin.ptrtoint_Word(bitPattern._rawValue))
    } else {
      self = 0
    }
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnsafePointer.swift.gyb", line: 1192)

// Local Variables:
// eval: (read-only-mode 1)
// End:
