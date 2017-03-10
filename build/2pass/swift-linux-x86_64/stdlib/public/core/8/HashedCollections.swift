// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 1)
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

import SwiftShims

// General Mutable, Value-Type Collections
// =================================================
//
// Implementation notes
// ====================
//
// `Dictionary` uses two storage schemes: native storage and Cocoa storage.
//
// Native storage is a hash table with open addressing and linear probing. The
// bucket array forms a logical ring (e.g., a chain can wrap around the end of
// buckets array to the beginning of it).
//
// The logical bucket array is implemented as three arrays: Key, Value, and a
// bitmap that marks valid entries. An invalid entry marks the end of a chain.
// There is always at least one invalid entry among the buckets. `Dictionary`
// does not use tombstones.
//
// In addition to the native storage, `Dictionary` can also wrap an
// `NSDictionary` in order to allow bridging `NSDictionary` to `Dictionary` in
// `O(1)`.
//
// Currently native storage uses a data structure like this::
//
//   Dictionary<K,V> (a struct)
//   +------------------------------------------------+
//   |  _VariantDictionaryBuffer<K,V> (an enum)      |
//   | +--------------------------------------------+ |
//   | | [_NativeDictionaryBuffer<K,V> (a struct)] | |
//   | +---|----------------------------------------+ |
//   +----/-------------------------------------------+
//       /
//      |
//      V  _RawNativeDictionaryStorage (a class)  
//   +-----------------------------------------------------------+
//   | capacity                                                  |
//   | count                                                     |
//   | ptrToBits                                                 |
//   | ptrToKeys                                                 |
//   | ptrToValues                                               |
//   | [inline array of bits indicating whether bucket is set ]  |
//   | [inline array of keys                                  ]  |
//   | [inline array of values                                ]  |
//   +-----------------------------------------------------------+
//
//
// Cocoa storage uses a data structure like this::
//
//   Dictionary<K,V> (a struct)
//   +----------------------------------------------+
//   | _VariantDictionaryBuffer<K,V> (an enum)     |
//   | +----------------------------------------+   |
//   | | [ _CocoaDictionaryBuffer (a struct) ] |   |
//   | +---|------------------------------------+   |
//   +-----|----------------------------------------+
//         |
//     +---+
//     |
//     V  NSDictionary (a class)
//   +--------------+
//   | [refcount#1] |
//   +--------------+
//     ^
//     +-+
//       |     Dictionary<K,V>.Index (an enum)
//   +---|-----------------------------------+
//   |   |  _CocoaDictionaryIndex (a struct) |
//   | +-|-----------------------------+     |
//   | | * [ all keys ] [ next index ] |     |
//   | +-------------------------------+     |
//   +---------------------------------------+
//
//
// The Native Kinds of Storage
// ---------------------------
//
// There are three different classes that can provide a native backing storage: 
// * `_RawNativeDictionaryStorage`
// * `_TypedNativeDictionaryStorage<K, V>`                   (extends Raw)
// * `_HashableTypedNativeDictionaryStorage<K: Hashable, V>` (extends Typed)
//
// (Hereafter RawStorage, TypedStorage, and HashableStorage, respectively)
//
// In a less optimized implementation, the parent classes could
// be eliminated, as they exist only to provide special-case behaviors.
// HashableStorage has everything a full implementation of a Dictionary
// requires, and is subsequently able to provide a full NSDictionary 
// implementation. Note that HashableStorage must have the `K: Hashable` 
// constraint because the NSDictionary implementation can't be provided in a 
// constrained extension.
//
// In normal usage, you can expect the backing storage of a Dictionary to be a 
// NativeStorage.
//
// TypedStorage is distinguished from HashableStorage to allow us to create a
// `_NativeDictionaryBuffer<AnyObject, AnyObject>`. Without the Hashable 
// requirement, such a Buffer is restricted to operations which can be performed
// with only the structure of the Storage: indexing and iteration. This is used
// in _SwiftDeferredNSDictionary to construct twin "native" and "bridged"
// storage. Key-based lookups are performed on the native storage, with the
// resultant index then used on the bridged storage.
//
// The only thing that TypedStorage adds over RawStorage is an implementation of
// deinit, to clean up the AnyObjects it stores. Although it nominally 
// inherits an NSDictionary implementation from RawStorage, this implementation 
// isn't useful and is never used. 
//
// RawStorage exists to allow a type-punned empty singleton Storage to be 
// created. Any time an empty Dictionary is created, this Storage is used. If 
// this type didn't exist, then NativeBuffer would have to store a Storage that 
// declared its actual type parameters. Similarly, the empty singleton would 
// have to declare its actual type parameters. If the singleton was, for 
// instance, a `HashableStorage<(), ()>`, then it would be a violation of 
// Swift's strict aliasing rules to pass it where a `HashableStorage<Int, Int>`
// was expected.
//
// It's therefore necessary for several types to store a RawStorage, rather than
// a TypedStorage, to allow for the possibility of the empty singleton. 
// RawStorage also provides an implementation of an always-empty NSDictionary.
//
//
// Index Invalidation
// ------------------
//
// FIXME: decide if this guarantee is worth making, as it restricts
// collision resolution to first-come-first-serve. The most obvious alternative
// would be robin hood hashing. The Rust code base is the best
// resource on a *practical* implementation of robin hood hashing I know of: 
// https://github.com/rust-lang/rust/blob/ac919fcd9d4a958baf99b2f2ed5c3d38a2ebf9d0/src/libstd/collections/hash/map.rs#L70-L178
//
// Indexing a container, `c[i]`, uses the integral offset stored in the index
// to access the elements referenced by the container. Generally, an index into
// one container has no meaning for another. However copy-on-write currently
// preserves indices under insertion, as long as reallocation doesn't occur:
//
//   var (i, found) = d.find(k) // i is associated with d's storage
//   if found {
//      var e = d            // now d is sharing its data with e
//      e[newKey] = newValue // e now has a unique copy of the data
//      return e[i]          // use i to access e
//   }
//
// The result should be a set of iterator invalidation rules familiar to anyone
// familiar with the C++ standard library.  Note that because all accesses to a
// dictionary storage are bounds-checked, this scheme never compromises memory
// safety.
//
//
// Bridging
// ========
//
// Bridging `NSDictionary` to `Dictionary`
// ---------------------------------------
//
// FIXME(eager-bridging): rewrite this based on modern constraints.
//
// `NSDictionary` bridges to `Dictionary<NSObject, AnyObject>` in `O(1)`,
// without memory allocation.
//
// Bridging `Dictionary` to `NSDictionary`
// ---------------------------------------
//
// `Dictionary<K, V>` bridges to `NSDictionary` in O(1)
// but may incur an allocation depending on the following conditions:
//
// * If the Dictionary is freshly allocated without any elements, then it
//   contains the empty singleton Storage which is returned as a toll-free
//   implementation of `NSDictionary`.
//
// * If both `K` and `V` are bridged verbatim, then `Dictionary<K, V>` is 
//   still toll-free bridged to `NSDictionary` by returning its Storage.
//
// * If the Dictionary is actually a lazily bridged NSDictionary, then that
//   NSDictionary is returned. 
//
// * Otherwise, bridging the `Dictionary` is done by wrapping its buffer in a 
//   `_SwiftDeferredNSDictionary<K, V>`. This incurs an O(1)-sized allocation.
//
//   Complete bridging of the native Storage's elements to another Storage 
//   is performed on first access. This is O(n) work, but is hopefully amortized
//   by future accesses.
//
//   This design ensures that:
//   - Every time keys or values are accessed on the bridged `NSDictionary`,
//     new objects are not created.
//   - Accessing the same element (key or value) multiple times will return
//     the same pointer.
//
// Bridging `NSSet` to `Set` and vice versa
// ----------------------------------------
//
// Bridging guarantees for `Set<Element>` are the same as for
// `Dictionary<Element, ()>`.
//

/// This protocol is only used for compile-time checks that
/// every buffer type implements all required operations.
internal protocol _HashBuffer {
  associatedtype Key
  associatedtype Value
  associatedtype Index
  associatedtype SequenceElement
  associatedtype SequenceElementWithoutLabels
  var startIndex: Index { get }
  var endIndex: Index { get }

  func index(after i: Index) -> Index

  func formIndex(after i: inout Index)

  func index(forKey key: Key) -> Index?

  func assertingGet(_ i: Index) -> SequenceElement

  func assertingGet(_ key: Key) -> Value

  func maybeGet(_ key: Key) -> Value?

  @discardableResult
  mutating func updateValue(_ value: Value, forKey key: Key) -> Value?

  @discardableResult
  mutating func insert(
    _ value: Value, forKey key: Key
  ) -> (inserted: Bool, memberAfterInsert: Value)

  @discardableResult
  mutating func remove(at index: Index) -> SequenceElement

  @discardableResult
  mutating func removeValue(forKey key: Key) -> Value?

  mutating func removeAll(keepingCapacity keepCapacity: Bool)

  var count: Int { get }

  static func fromArray(_ elements: [SequenceElementWithoutLabels]) -> Self
}

/// The inverse of the default hash table load factor.  Factored out so that it
/// can be used in multiple places in the implementation and stay consistent.
/// Should not be used outside `Dictionary` implementation.
@_transparent
internal var _hashContainerDefaultMaxLoadFactorInverse: Double {
  return 1.0 / 0.75
}

#if _runtime(_ObjC)
/// Call `[lhs isEqual: rhs]`.
///
/// This function is part of the runtime because `Bool` type is bridged to
/// `ObjCBool`, which is in Foundation overlay.
@_silgen_name("swift_stdlib_NSObject_isEqual")
internal func _stdlib_NSObject_isEqual(_ lhs: AnyObject, _ rhs: AnyObject) -> Bool
#endif


/// A temporary view of an array of AnyObject as an array of Unmanaged<AnyObject>
/// for fast iteration and transformation of the elements.
///
/// Accesses the underlying raw memory as Unmanaged<AnyObject> using untyped
/// memory accesses. The memory remains bound to managed AnyObjects.
internal struct _UnmanagedAnyObjectArray {
  /// Underlying pointer.
  internal var value: UnsafeMutableRawPointer

  internal init(_ up: UnsafeMutablePointer<AnyObject>) {
    self.value = UnsafeMutableRawPointer(up)
  }

  internal init?(_ up: UnsafeMutablePointer<AnyObject>?) {
    guard let unwrapped = up else { return nil }
    self.init(unwrapped)
  }

  internal subscript(i: Int) -> AnyObject {
    get {
      let unmanaged = value.load(
        fromByteOffset: i * MemoryLayout<AnyObject>.stride,
        as: Unmanaged<AnyObject>.self)
      return unmanaged.takeUnretainedValue()
    }
    nonmutating set(newValue) {
      let unmanaged = Unmanaged.passUnretained(newValue)
      value.storeBytes(of: unmanaged,
        toByteOffset: i * MemoryLayout<AnyObject>.stride,
        as: Unmanaged<AnyObject>.self)
    }
  }
}

//===--- APIs unique to Set<Element> --------------------------------------===//

/// An unordered collection of unique elements.
///
/// You use a set instead of an array when you need to test efficiently for
/// membership and you aren't concerned with the order of the elements in the
/// collection, or when you need to ensure that each element appears only once
/// in a collection.
///
/// You can create a set with any element type that conforms to the `Hashable`
/// protocol. By default, most types in the standard library are hashable,
/// including strings, numeric and Boolean types, enumeration cases without
/// associated values, and even sets themselves.
///
/// Swift makes it as easy to create a new set as to create a new array. Simply
/// assign an array literal to a variable or constant with the `Set` type
/// specified.
///
///     let ingredients: Set = ["cocoa beans", "sugar", "cocoa butter", "salt"]
///     if ingredients.contains("sugar") {
///         print("No thanks, too sweet.")
///     }
///     // Prints "No thanks, too sweet."
///
/// Set Operations
/// ==============
///
/// Sets provide a suite of mathematical set operations. For example, you can
/// efficiently test a set for membership of an element or check its
/// intersection with another set:
///
/// - Use the `contains(_:)` method to test whether a set contains a specific
///   element.
/// - Use the "equal to" operator (`==`) to test whether two sets contain the
///   same elements.
/// - Use the `isSubset(of:)` method to test whether a set contains all the
///   elements of another set or sequence.
/// - Use the `isSuperset(of:)` method to test whether all elements of a set
///   are contained in another set or sequence.
/// - Use the `isStrictSubset(of:)` and `isStrictSuperset(of:)` methods to test
///   whether a set is a subset or superset of, but not equal to, another set.
/// - Use the `isDisjoint(with:)` method to test whether a set has any elements
///   in common with another set.
///
/// You can also combine, exclude, or subtract the elements of two sets:
///
/// - Use the `union(_:)` method to create a new set with the elements of a set
///   and another set or sequence.
/// - Use the `intersection(_:)` method to create a new set with only the
///   elements common to a set and another set or sequence.
/// - Use the `symmetricDifference(_:)` method to create a new set with the
///   elements that are in either a set or another set or sequence, but not in
///   both.
/// - Use the `subtracting(_:)` method to create a new set with the elements of
///   a set that are not also in another set or sequence.
///
/// You can modify a set in place by using these methods' mutating
/// counterparts: `formUnion(_:)`, `formIntersection(_:)`,
/// `formSymmetricDifference(_:)`, and `subtract(_:)`.
///
/// Set operations are not limited to use with other sets. Instead, you can
/// perform set operations with another set, an array, or any other sequence
/// type.
///
///     var primes: Set = [2, 3, 5, 7]
///
///     // Tests whether primes is a subset of a Range<Int>
///     print(primes.isSubset(of: 0..<10))
///     // Prints "true"
///
///     // Performs an intersection with an Array<Int>
///     let favoriteNumbers = [5, 7, 15, 21]
///     print(primes.intersection(favoriteNumbers))
///     // Prints "[5, 7]"
///
/// Sequence and Collection Operations
/// ==================================
///
/// In addition to the `Set` type's set operations, you can use any nonmutating
/// sequence or collection methods with a set.
///
///     if primes.isEmpty {
///         print("No primes!")
///     } else {
///         print("We have \(primes.count) primes.")
///     }
///     // Prints "We have 4 primes."
///
///     let primesSum = primes.reduce(0, +)
///     // 'primesSum' == 17
///
///     let primeStrings = primes.sorted().map(String.init)
///     // 'primeStrings' == ["2", "3", "5", "7"]
///
/// You can iterate through a set's unordered elements with a `for`-`in` loop.
///
///     for number in primes {
///         print(number)
///     }
///     // Prints "5"
///     // Prints "7"
///     // Prints "2"
///     // Prints "3"
///
/// Many sequence and collection operations return an array or a type-erasing
/// collection wrapper instead of a set. To restore efficient set operations,
/// create a new set from the result.
///
///     let morePrimes = primes.union([11, 13, 17, 19])
///
///     let laterPrimes = morePrimes.filter { $0 > 10 }
///     // 'laterPrimes' is of type Array<Int>
///
///     let laterPrimesSet = Set(morePrimes.filter { $0 > 10 })
///     // 'laterPrimesSet' is of type Set<Int>
///
/// Bridging Between Set and NSSet
/// ==============================
///
/// You can bridge between `Set` and `NSSet` using the `as` operator. For
/// bridging to be possible, the `Element` type of a set must be a class, an
/// `@objc` protocol (a protocol imported from Objective-C or marked with the
/// `@objc` attribute), or a type that bridges to a Foundation type.
///
/// Bridging from `Set` to `NSSet` always takes O(1) time and space. When the
/// set's `Element` type is neither a class nor an `@objc` protocol, any
/// required bridging of elements occurs at the first access of each element,
/// so the first operation that uses the contents of the set (for example, a
/// membership test) can take O(*n*).
///
/// Bridging from `NSSet` to `Set` first calls the `copy(with:)` method
/// (`- copyWithZone:` in Objective-C) on the set to get an immutable copy and
/// then performs additional Swift bookkeeping work that takes O(1) time. For
/// instances of `NSSet` that are already immutable, `copy(with:)` returns the
/// same set in constant time; otherwise, the copying performance is
/// unspecified. The instances of `NSSet` and `Set` share buffer using the
/// same copy-on-write optimization that is used when two instances of `Set`
/// share buffer.
///
/// - SeeAlso: `Hashable`
@_fixed_layout
public struct Set<Element : Hashable> :
  SetAlgebra, Hashable, Collection, ExpressibleByArrayLiteral {

  internal typealias _Self = Set<Element>
  internal typealias _VariantBuffer = _VariantSetBuffer<Element>
  internal typealias _NativeBuffer = _NativeSetBuffer<Element>

  @_versioned
  internal var _variantBuffer: _VariantBuffer

  /// Creates a new, empty set with at least the specified number of elements'
  /// worth of buffer.
  ///
  /// Use this initializer to avoid repeated reallocations of a set's buffer
  /// if you know you'll be adding elements to the set after creation. The
  /// actual capacity of the created set will be the smallest power of 2 that
  /// is greater than or equal to `minimumCapacity`.
  ///
  /// - Parameter minimumCapacity: The minimum number of elements that the
  ///   newly created set should be able to store without reallocating its
  ///   buffer.
  public init(minimumCapacity: Int) {
    _variantBuffer =
      _VariantBuffer.native(
        _NativeBuffer(minimumCapacity: minimumCapacity))
  }

  /// Private initializer.
  internal init(_nativeBuffer: _NativeSetBuffer<Element>) {
    _variantBuffer = _VariantBuffer.native(_nativeBuffer)
  }

  //
  // All APIs below should dispatch to `_variantBuffer`, without doing any
  // additional processing.
  //

#if _runtime(_ObjC)
  /// Private initializer used for bridging.
  ///
  /// Only use this initializer when both conditions are true:
  ///
  /// * it is statically known that the given `NSSet` is immutable;
  /// * `Element` is bridged verbatim to Objective-C (i.e.,
  ///   is a reference type).
  public init(_immutableCocoaSet: _NSSet) {
    _sanityCheck(_isBridgedVerbatimToObjectiveC(Element.self),
      "Set can be backed by NSSet _variantBuffer only when the member type can be bridged verbatim to Objective-C")
    _variantBuffer = _VariantSetBuffer.cocoa(
      _CocoaSetBuffer(cocoaSet: _immutableCocoaSet))
  }
#endif

  /// The starting position for iterating members of the set.
  ///
  /// If the set is empty, `startIndex` is equal to `endIndex`.
  public var startIndex: Index {
    return _variantBuffer.startIndex
  }

  /// The "past the end" position for the set---that is, the position one
  /// greater than the last valid subscript argument.
  ///
  /// If the set is empty, `endIndex` is equal to `startIndex`.
  public var endIndex: Index {
    return _variantBuffer.endIndex
  }

  public func index(after i: Index) -> Index {
    return _variantBuffer.index(after: i)
  }

  // APINAMING: complexity docs are broadly missing in this file.

  /// Returns a Boolean value that indicates whether the given element exists
  /// in the set.
  ///
  /// This example uses the `contains(_:)` method to test whether an integer is
  /// a member of a set of prime numbers.
  ///
  ///     let primes: Set = [2, 3, 5, 7]
  ///     let x = 5
  ///     if primes.contains(x) {
  ///         print("\(x) is prime!")
  ///     } else {
  ///         print("\(x). Not prime.")
  ///     }
  ///     // Prints "5 is prime!"
  ///
  /// - Parameter member: An element to look for in the set.
  /// - Returns: `true` if `member` exists in the set; otherwise, `false`.
  public func contains(_ member: Element) -> Bool {
    return _variantBuffer.maybeGet(member) != nil
  }

  /// Returns the index of the given element in the set, or `nil` if the
  /// element is not a member of the set.
  ///
  /// - Parameter member: An element to search for in the set.
  /// - Returns: The index of `member` if it exists in the set; otherwise,
  ///   `nil`.
  public func index(of member: Element) -> Index? {
    return _variantBuffer.index(forKey: member)
  }

  /// Inserts the given element in the set if it is not already present.
  ///
  /// If an element equal to `newMember` is already contained in the set, this
  /// method has no effect. In the following example, a new element is
  /// inserted into `classDays`, a set of days of the week. When an existing
  /// element is inserted, the `classDays` set does not change.
  ///
  ///     enum DayOfTheWeek: Int {
  ///         case sunday, monday, tuesday, wednesday, thursday,
  ///             friday, saturday
  ///     }
  ///
  ///     var classDays: Set<DayOfTheWeek> = [.wednesday, .friday]
  ///     print(classDays.insert(.monday))
  ///     // Prints "(true, .monday)"
  ///     print(classDays)
  ///     // Prints "[.friday, .wednesday, .monday]"
  ///
  ///     print(classDays.insert(.friday))
  ///     // Prints "(false, .friday)"
  ///     print(classDays)
  ///     // Prints "[.friday, .wednesday, .monday]"
  ///
  /// - Parameter newMember: An element to insert into the set.
  /// - Returns: `(true, newMember)` if `newMember` was not contained in the
  ///   set. If an element equal to `newMember` was already contained in the
  ///   set, the method returns `(false, oldMember)`, where `oldMember` is the
  ///   element that was equal to `newMember`. In some cases, `oldMember` may
  ///   be distinguishable from `newMember` by identity comparison or some
  ///   other means.
  @discardableResult
  public mutating func insert(
    _ newMember: Element
  ) -> (inserted: Bool, memberAfterInsert: Element) {
    return _variantBuffer.insert(newMember, forKey: newMember)
  }

  /// Inserts the given element into the set unconditionally.
  ///
  /// If an element equal to `newMember` is already contained in the set,
  /// `newMember` replaces the existing element. In this example, an existing
  /// element is inserted into `classDays`, a set of days of the week.
  ///
  ///     enum DayOfTheWeek: Int {
  ///         case sunday, monday, tuesday, wednesday, thursday,
  ///             friday, saturday
  ///     }
  ///
  ///     var classDays: Set<DayOfTheWeek> = [.monday, .wednesday, .friday]
  ///     print(classDays.update(with: .monday))
  ///     // Prints "Optional(.monday)"
  ///
  /// - Parameter newMember: An element to insert into the set.
  /// - Returns: An element equal to `newMember` if the set already contained
  ///   such a member; otherwise, `nil`. In some cases, the returned element
  ///   may be distinguishable from `newMember` by identity comparison or some
  ///   other means.
  @discardableResult
  public mutating func update(with newMember: Element) -> Element? {
    return _variantBuffer.updateValue(newMember, forKey: newMember)
  }

  /// Removes the specified element from the set.
  ///
  /// This example removes the element `"sugar"` from a set of ingredients.
  ///
  ///     var ingredients: Set = ["cocoa beans", "sugar", "cocoa butter", "salt"]
  ///     let toRemove = "sugar"
  ///     if let removed = ingredients.remove(toRemove) {
  ///         print("The recipe is now \(removed)-free.")
  ///     }
  ///     // Prints "The recipe is now sugar-free."
  ///
  /// - Parameter member: The element to remove from the set.
  /// - Returns: The value of the `member` parameter if it was a member of the
  ///   set; otherwise, `nil`.
  @discardableResult
  public mutating func remove(_ member: Element) -> Element? {
    return _variantBuffer.removeValue(forKey: member)
  }

  /// Removes the element at the given index of the set.
  ///
  /// - Parameter position: The index of the member to remove. `position` must
  ///   be a valid index of the set, and must not be equal to the set's end
  ///   index.
  /// - Returns: The element that was removed from the set.
  @discardableResult
  public mutating func remove(at position: Index) -> Element {
    return _variantBuffer.remove(at: position)
  }

  /// Removes all members from the set.
  ///
  /// - Parameter keepingCapacity: If `true`, the set's buffer capacity is
  ///   preserved; if `false`, the underlying buffer is released. The
  ///   default is `false`.
  public mutating func removeAll(keepingCapacity keepCapacity: Bool = false) {
    _variantBuffer.removeAll(keepingCapacity: keepCapacity)
  }

  /// Removes the first element of the set.
  ///
  /// Because a set is not an ordered collection, the "first" element may not
  /// be the first element that was added to the set. The set must not be
  /// empty.
  ///
  /// - Complexity: Amortized O(1) if the set does not wrap a bridged `NSSet`.
  ///   If the set wraps a bridged `NSSet`, the performance is unspecified.
  ///
  /// - Returns: A member of the set.
  @discardableResult
  public mutating func removeFirst() -> Element {
    _precondition(!isEmpty, "can't removeFirst from an empty Set")
    return remove(at: startIndex)
  }

  /// The number of elements in the set.
  ///
  /// - Complexity: O(1).
  public var count: Int {
    return _variantBuffer.count
  }

  //
  // `Sequence` conformance
  //

  /// Accesses the member at the given position.
  public subscript(position: Index) -> Element {
    return _variantBuffer.assertingGet(position)
  }

  /// Returns an iterator over the members of the set.
  @inline(__always)
  public func makeIterator() -> SetIterator<Element> {
    return _variantBuffer.makeIterator()
  }

  //
  // `ExpressibleByArrayLiteral` conformance
  //
  /// Creates a set containing the elements of the given array literal.
  ///
  /// Do not call this initializer directly. It is used by the compiler when
  /// you use an array literal. Instead, create a new set using an array
  /// literal as its value by enclosing a comma-separated list of values in
  /// square brackets. You can use an array literal anywhere a set is expected
  /// by the type context.
  ///
  /// Here, a set of strings is created from an array literal holding only
  /// strings.
  ///
  ///     let ingredients: Set = ["cocoa beans", "sugar", "cocoa butter", "salt"]
  ///     if ingredients.isSuperset(of: ["sugar", "salt"]) {
  ///         print("Whatever it is, it's bound to be delicious!")
  ///     }
  ///     // Prints "Whatever it is, it's bound to be delicious!"
  ///
  /// - Parameter elements: A variadic list of elements of the new set.
  public init(arrayLiteral elements: Element...) {
    self.init(_nativeBuffer: _NativeSetBuffer.fromArray(elements))
  }

  //
  // APIs below this comment should be implemented strictly in terms of
  // *public* APIs above.  `_variantBuffer` should not be accessed directly.
  //
  // This separates concerns for testing.  Tests for the following APIs need
  // not to concern themselves with testing correctness of behavior of
  // underlying buffer (and different variants of it), only correctness of the
  // API itself.
  //

  /// Creates an empty set.
  ///
  /// This is equivalent to initializing with an empty array literal. For
  /// example:
  ///
  ///     var emptySet = Set<Int>()
  ///     print(emptySet.isEmpty)
  ///     // Prints "true"
  ///
  ///     emptySet = []
  ///     print(emptySet.isEmpty)
  ///     // Prints "true"
  public init() {
    self = Set<Element>(_nativeBuffer: _NativeBuffer())
  }

  /// Creates a new set from a finite sequence of items.
  ///
  /// Use this initializer to create a new set from an existing sequence, for
  /// example, an array or a range.
  ///
  ///     let validIndices = Set(0..<7).subtracting([2, 4, 5])
  ///     print(validIndices)
  ///     // Prints "[6, 0, 1, 3]"
  ///
  /// This initializer can also be used to restore set methods after performing
  /// sequence operations such as `filter(_:)` or `map(_:)` on a set. For
  /// example, after filtering a set of prime numbers to remove any below 10,
  /// you can create a new set by using this initializer.
  ///
  ///     let primes: Set = [2, 3, 5, 7, 11, 13, 17, 19, 23]
  ///     let laterPrimes = Set(primes.lazy.filter { $0 > 10 })
  ///     print(laterPrimes)
  ///     // Prints "[17, 19, 23, 11, 13]"
  ///
  /// - Parameter sequence: The elements to use as members of the new set.
  public init<Source : Sequence>(_ sequence: Source)
    where Source.Iterator.Element == Element {
    self.init(minimumCapacity: sequence.underestimatedCount)
    if let s = sequence as? Set<Element> {
      // If this sequence is actually a native `Set`, then we can quickly
      // adopt its native buffer and let COW handle uniquing only
      // if necessary.
      switch s._variantBuffer {
        case .native(let buffer):
          _variantBuffer = .native(buffer)
        case .cocoa(let owner):
          _variantBuffer = .cocoa(owner)
      }
    } else {
      for item in sequence {
        insert(item)
      }
    }
  }

  /// Returns a Boolean value that indicates whether the set is a subset of the
  /// given sequence.
  ///
  /// Set *A* is a subset of another set *B* if every member of *A* is also a
  /// member of *B*.
  ///
  ///     let employees = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
  ///     let attendees: Set = ["Alicia", "Bethany", "Diana"]
  ///     print(attendees.isSubset(of: employees))
  ///     // Prints "true"
  ///
  /// - Parameter possibleSuperset: A sequence of elements. `possibleSuperset`
  ///   must be finite.
  /// - Returns: `true` if the set is a subset of `possibleSuperset`;
  ///   otherwise, `false`.
  public func isSubset<S : Sequence>(of possibleSuperset: S) -> Bool
    where S.Iterator.Element == Element {
    // FIXME(performance): isEmpty fast path, here and elsewhere.
    let other = Set(possibleSuperset)
    return isSubset(of: other)
  }

  /// Returns a Boolean value that indicates whether the set is a strict subset
  /// of the given sequence.
  ///
  /// Set *A* is a strict subset of another set *B* if every member of *A* is
  /// also a member of *B* and *B* contains at least one element that is not a
  /// member of *A*.
  ///
  ///     let employees = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
  ///     let attendees: Set = ["Alicia", "Bethany", "Diana"]
  ///     print(attendees.isStrictSubset(of: employees))
  ///     // Prints "true"
  ///
  ///     // A set is never a strict subset of itself:
  ///     print(attendees.isStrictSubset(of: attendees))
  ///     // Prints "false"
  ///
  /// - Parameter possibleStrictSuperset: A sequence of elements.
  ///   `possibleStrictSuperset` must be finite.
  /// - Returns: `true` is the set is strict subset of
  ///   `possibleStrictSuperset`; otherwise, `false`.
  public func isStrictSubset<S : Sequence>(of possibleStrictSuperset: S) -> Bool
    where S.Iterator.Element == Element {
    // FIXME: code duplication.
    let other = Set(possibleStrictSuperset)
    return isStrictSubset(of: other)
  }

  /// Returns a Boolean value that indicates whether the set is a superset of
  /// the given sequence.
  ///
  /// Set *A* is a superset of another set *B* if every member of *B* is also a
  /// member of *A*.
  ///
  ///     let employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
  ///     let attendees = ["Alicia", "Bethany", "Diana"]
  ///     print(employees.isSuperset(of: attendees))
  ///     // Prints "true"
  ///
  /// - Parameter possibleSubset: A sequence of elements. `possibleSubset` must
  ///   be finite.
  /// - Returns: `true` if the set is a superset of `possibleSubset`;
  ///   otherwise, `false`.
  public func isSuperset<S : Sequence>(of possibleSubset: S) -> Bool
    where S.Iterator.Element == Element {
    // FIXME(performance): Don't build a set; just ask if every element is in
    // `self`.
    let other = Set(possibleSubset)
    return other.isSubset(of: self)
  }

  /// Returns a Boolean value that indicates whether the set is a strict
  /// superset of the given sequence.
  ///
  /// Set *A* is a strict superset of another set *B* if every member of *B* is
  /// also a member of *A* and *A* contains at least one element that is *not*
  /// a member of *B*.
  ///
  ///     let employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
  ///     let attendees = ["Alicia", "Bethany", "Diana"]
  ///     print(employees.isStrictSuperset(of: attendees))
  ///     // Prints "true"
  ///     print(employees.isStrictSuperset(of: employees))
  ///     // Prints "false"
  ///
  /// - Parameter possibleStrictSubset: A sequence of elements.
  ///   `possibleStrictSubset` must be finite.
  /// - Returns: `true` if the set is a strict superset of
  ///   `possibleStrictSubset`; otherwise, `false`.
  public func isStrictSuperset<S : Sequence>(of possibleStrictSubset: S) -> Bool
    where S.Iterator.Element == Element {
    let other = Set(possibleStrictSubset)
    return other.isStrictSubset(of: self)
  }

  /// Returns a Boolean value that indicates whether the set has no members in
  /// common with the given sequence.
  ///
  /// In the following example, the `employees` set is disjoint with the
  /// elements of the `visitors` array because no name appears in both.
  ///
  ///     let employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
  ///     let visitors = ["Marcia", "Nathaniel", "Olivia"]
  ///     print(employees.isDisjoint(with: visitors))
  ///     // Prints "true"
  ///
  /// - Parameter other: A sequence of elements. `other` must be finite.
  /// - Returns: `true` if the set has no elements in common with `other`;
  ///   otherwise, `false`.
  public func isDisjoint<S : Sequence>(with other: S) -> Bool
    where S.Iterator.Element == Element {
    // FIXME(performance): Don't need to build a set.
    let otherSet = Set(other)
    return isDisjoint(with: otherSet)
  }

  /// Returns a new set with the elements of both this set and the given
  /// sequence.
  ///
  /// In the following example, the `attendeesAndVisitors` set is made up
  /// of the elements of the `attendees` set and the `visitors` array:
  ///
  ///     let attendees: Set = ["Alicia", "Bethany", "Diana"]
  ///     let visitors = ["Marcia", "Nathaniel"]
  ///     let attendeesAndVisitors = attendees.union(visitors)
  ///     print(attendeesAndVisitors)
  ///     // Prints "["Diana", "Nathaniel", "Bethany", "Alicia", "Marcia"]"
  ///
  /// If the set already contains one or more elements that are also in
  /// `other`, the existing members are kept. If `other` contains multiple
  /// instances of equivalent elements, only the first instance is kept.
  ///
  ///     let initialIndices = Set(0..<5)
  ///     let expandedIndices = initialIndices.union([2, 3, 6, 6, 7, 7])
  ///     print(expandedIndices)
  ///     // Prints "[2, 4, 6, 7, 0, 1, 3]"
  ///
  /// - Parameter other: A sequence of elements. `other` must be finite.
  /// - Returns: A new set with the unique elements of this set and `other`.
  public func union<S : Sequence>(_ other: S) -> Set<Element>
    where S.Iterator.Element == Element {
    var newSet = self
    newSet.formUnion(other)
    return newSet
  }

  /// Inserts the elements of the given sequence into the set.
  ///
  /// If the set already contains one or more elements that are also in
  /// `other`, the existing members are kept. If `other` contains multiple
  /// instances of equivalent elements, only the first instance is kept.
  ///
  ///     var attendees: Set = ["Alicia", "Bethany", "Diana"]
  ///     let visitors = ["Diana", ""Marcia", "Nathaniel"]
  ///     attendees.formUnion(visitors)
  ///     print(attendees)
  ///     // Prints "["Diana", "Nathaniel", "Bethany", "Alicia", "Marcia"]"
  ///
  /// - Parameter other: A sequence of elements. `other` must be finite.
  public mutating func formUnion<S : Sequence>(_ other: S)
    where S.Iterator.Element == Element {
    for item in other {
      insert(item)
    }
  }

  /// Returns a new set containing the elements of this set that do not occur
  /// in the given sequence.
  ///
  /// In the following example, the `nonNeighbors` set is made up of the
  /// elements of the `employees` set that are not elements of `neighbors`:
  ///
  ///     let employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
  ///     let neighbors = ["Bethany", "Eric", "Forlani", "Greta"]
  ///     let nonNeighbors = employees.subtracting(neighbors)
  ///     print(nonNeighbors)
  ///     // Prints "["Chris", "Diana", "Alicia"]"
  ///
  /// - Parameter other: A sequence of elements. `other` must be finite.
  /// - Returns: A new set.
  public func subtracting<S : Sequence>(_ other: S) -> Set<Element>
    where S.Iterator.Element == Element {
    return self._subtracting(other)
  }

  internal func _subtracting<S : Sequence>(_ other: S) -> Set<Element>
    where S.Iterator.Element == Element {
    var newSet = self
    newSet.subtract(other)
    return newSet
  }

  /// Removes the elements of the given sequence from the set.
  ///
  /// In the following example, the elements of the `employees` set that are
  /// also elements of the `neighbors` array are removed. In particular, the
  /// names `"Bethany"` and `"Eric"` are removed from `employees`.
  ///
  ///     var employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
  ///     let neighbors = ["Bethany", "Eric", "Forlani", "Greta"]
  ///     employees.subtract(neighbors)
  ///     print(employees)
  ///     // Prints "["Chris", "Diana", "Alicia"]"
  ///
  /// - Parameter other: A sequence of elements. `other` must be finite.
  public mutating func subtract<S : Sequence>(_ other: S)
    where S.Iterator.Element == Element {
    _subtract(other)
  }

  internal mutating func _subtract<S : Sequence>(_ other: S)
    where S.Iterator.Element == Element {
    for item in other {
      remove(item)
    }
  }

  /// Returns a new set with the elements that are common to both this set and
  /// the given sequence.
  ///
  /// In the following example, the `bothNeighborsAndEmployees` set is made up
  /// of the elements that are in *both* the `employees` and `neighbors` sets.
  /// Elements that are in only one or the other are left out of the result of
  /// the intersection.
  ///
  ///     let employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
  ///     let neighbors = ["Bethany", "Eric", "Forlani", "Greta"]
  ///     let bothNeighborsAndEmployees = employees.intersection(neighbors)
  ///     print(bothNeighborsAndEmployees)
  ///     // Prints "["Bethany", "Eric"]"
  ///
  /// - Parameter other: A sequence of elements. `other` must be finite.
  /// - Returns: A new set.
  public func intersection<S : Sequence>(_ other: S) -> Set<Element>
    where S.Iterator.Element == Element {
    let otherSet = Set(other)
    return intersection(otherSet)
  }

  /// Removes the elements of the set that aren't also in the given sequence.
  ///
  /// In the following example, the elements of the `employees` set that are
  /// not also members of the `neighbors` set are removed. In particular, the
  /// names `"Alicia"`, `"Chris"`, and `"Diana"` are removed.
  ///
  ///     var employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
  ///     let neighbors = ["Bethany", "Eric", "Forlani", "Greta"]
  ///     employees.formIntersection(neighbors)
  ///     print(employees)
  ///     // Prints "["Bethany", "Eric"]"
  ///
  /// - Parameter other: A sequence of elements. `other` must be finite.
  public mutating func formIntersection<S : Sequence>(_ other: S)
    where S.Iterator.Element == Element {
    // Because `intersect` needs to both modify and iterate over
    // the left-hand side, the index may become invalidated during
    // traversal so an intermediate set must be created.
    //
    // FIXME(performance): perform this operation at a lower level
    // to avoid invalidating the index and avoiding a copy.
    let result = self.intersection(other)

    // The result can only have fewer or the same number of elements.
    // If no elements were removed, don't perform a reassignment
    // as this may cause an unnecessary uniquing COW.
    if result.count != count {
      self = result
    }
  }

  /// Returns a new set with the elements that are either in this set or in the
  /// given sequence, but not in both.
  ///
  /// In the following example, the `eitherNeighborsOrEmployees` set is made up
  /// of the elements of the `employees` and `neighbors` sets that are not in
  /// both `employees` *and* `neighbors`. In particular, the names `"Bethany"`
  /// and `"Eric"` do not appear in `eitherNeighborsOrEmployees`.
  ///
  ///     let employees: Set = ["Alicia", "Bethany", "Diana", "Eric"]
  ///     let neighbors = ["Bethany", "Eric", "Forlani"]
  ///     let eitherNeighborsOrEmployees = employees.symmetricDifference(neighbors)
  ///     print(eitherNeighborsOrEmployees)
  ///     // Prints "["Diana", "Forlani", "Alicia"]"
  ///
  /// - Parameter other: A sequence of elements. `other` must be finite.
  /// - Returns: A new set.
  public func symmetricDifference<S : Sequence>(_ other: S) -> Set<Element>
    where S.Iterator.Element == Element {
    var newSet = self
    newSet.formSymmetricDifference(other)
    return newSet
  }

  /// Replace this set with the elements contained in this set or the given
  /// set, but not both.
  ///
  /// In the following example, the elements of the `employees` set that are
  /// also members of `neighbors` are removed from `employees`, while the
  /// elements of `neighbors` that are not members of `employees` are added to
  /// `employees`. In particular, the names `"Alicia"`, `"Chris"`, and
  /// `"Diana"` are removed from `employees` while the name `"Forlani"` is
  /// added.
  ///
  ///     var employees: Set = ["Alicia", "Bethany", "Diana", "Eric"]
  ///     let neighbors = ["Bethany", "Eric", "Forlani"]
  ///     employees.formSymmetricDifference(neighbors)
  ///     print(employees)
  ///     // Prints "["Diana", "Forlani", "Alicia"]"
  ///
  /// - Parameter other: A sequence of elements. `other` must be finite.
  public mutating func formSymmetricDifference<S : Sequence>(_ other: S)
    where S.Iterator.Element == Element {
    let otherSet = Set(other)
    formSymmetricDifference(otherSet)
  }

  /// The hash value for the set.
  ///
  /// Two sets that are equal will always have equal hash values.
  ///
  /// Hash values are not guaranteed to be equal across different executions of
  /// your program. Do not save hash values to use during a future execution.
  public var hashValue: Int {
    // FIXME(ABI)#177: <rdar://problem/18915294> Cache Set<T> hashValue
    var result: Int = _mixInt(0)
    for member in self {
       result ^= _mixInt(member.hashValue)
    }
    return result
  }

  //
  // `Sequence` conformance
  //

  public func _customContainsEquatableElement(_ member: Element) -> Bool? {
    return contains(member)
  }

  public func _customIndexOfEquatableElement(
     _ member: Element
    ) -> Index?? {
    return Optional(index(of: member))
  }

  //
  // Collection conformance
  //

  /// A Boolean value that indicates whether the set is empty.
  public var isEmpty: Bool {
    return count == 0
  }

  /// The first element of the set.
  ///
  /// The first element of the set is not necessarily the first element added
  /// to the set. Don't expect any particular ordering of set elements.
  ///
  /// If the set is empty, the value of this property is `nil`.
  public var first: Element? {
    return count > 0 ? self[startIndex] : nil
  }
}

/// Check for both subset and equality relationship between
/// a set and some sequence (which may itself be a `Set`).
///
/// (isSubset: lhs ⊂ rhs, isEqual: lhs ⊂ rhs and |lhs| = |rhs|)
internal func _compareSets<Element>(_ lhs: Set<Element>, _ rhs: Set<Element>)
  -> (isSubset: Bool, isEqual: Bool) {
  // FIXME(performance): performance could be better if we start by comparing
  // counts.
  for member in lhs {
    if !rhs.contains(member) {
      return (false, false)
    }
  }
  return (true, lhs.count == rhs.count)
}

// FIXME: rdar://problem/23549059 (Optimize == for Set)
// Look into initially trying to compare the two sets by directly comparing the
// contents of both buffers in order. If they happen to have the exact same
// ordering we can get the `true` response without ever hashing. If the two
// buffers' contents differ at all then we have to fall back to hashing the
// rest of the elements (but we don't need to hash any prefix that did match).
extension Set {
  /// Returns a Boolean value indicating whether two sets have equal elements.
  ///
  /// - Parameters:
  ///   - lhs: A set.
  ///   - rhs: Another set.
  /// - Returns: `true` if the `lhs` and `rhs` have the same elements; otherwise,
  ///   `false`.
  public static func == (lhs: Set<Element>, rhs: Set<Element>) -> Bool {
    switch (lhs._variantBuffer, rhs._variantBuffer) {
    case (.native(let lhsNative), .native(let rhsNative)):

      if lhsNative._storage === rhsNative._storage {
        return true
      }

      if lhsNative.count != rhsNative.count {
        return false
      }

      for member in lhs {
        let (_, found) =
          rhsNative._find(member, startBucket: rhsNative._bucket(member))
        if !found {
          return false
        }
      }
      return true

    case (_VariantSetBuffer.cocoa(let lhsCocoa),
        _VariantSetBuffer.cocoa(let rhsCocoa)):
  #if _runtime(_ObjC)
      return _stdlib_NSObject_isEqual(lhsCocoa.cocoaSet, rhsCocoa.cocoaSet)
  #else
        _sanityCheckFailure("internal error: unexpected cocoa set")
  #endif

    case (_VariantSetBuffer.native(let lhsNative),
      _VariantSetBuffer.cocoa(let rhsCocoa)):
  #if _runtime(_ObjC)

      if lhsNative.count != rhsCocoa.count {
        return false
      }

      let endIndex = lhsNative.endIndex
      var i = lhsNative.startIndex
      while i != endIndex {
        let key = lhsNative.assertingGet(i)
        let bridgedKey: AnyObject = _bridgeAnythingToObjectiveC(key)
        let optRhsValue: AnyObject? = rhsCocoa.maybeGet(bridgedKey)
        if let rhsValue = optRhsValue {
          if key == _forceBridgeFromObjectiveC(rhsValue, Element.self) {
            i = lhsNative.index(after: i)
            continue
          }
        }
        i = lhsNative.index(after: i)
        return false
      }
      return true
  #else
        _sanityCheckFailure("internal error: unexpected cocoa set")
  #endif

    case (_VariantSetBuffer.cocoa, _VariantSetBuffer.native):
  #if _runtime(_ObjC)
      return rhs == lhs
  #else
        _sanityCheckFailure("internal error: unexpected cocoa set")
  #endif
    }
  }
}

extension Set : CustomStringConvertible, CustomDebugStringConvertible {
  internal func makeDescription(isDebug: Bool) -> String {
    var result = isDebug ? "Set([" : "["
    var first = true
    for member in self {
      if first {
        first = false
      } else {
        result += ", "
      }
      debugPrint(member, terminator: "", to: &result)
    }
    result += isDebug ? "])" : "]"
    return result
  }

  /// A string that represents the contents of the set.
  public var description: String {
    return makeDescription(isDebug: false)
  }

  /// A string that represents the contents of the set, suitable for debugging.
  public var debugDescription: String {
    return makeDescription(isDebug: true)
  }
}

#if _runtime(_ObjC)
@_silgen_name("swift_stdlib_CFSetGetValues")
func _stdlib_CFSetGetValues(_ nss: _NSSet, _: UnsafeMutablePointer<AnyObject>)

/// Equivalent to `NSSet.allObjects`, but does not leave objects on the
/// autorelease pool.
internal func _stdlib_NSSet_allObjects(_ nss: _NSSet) ->
  _HeapBuffer<Int, AnyObject> {
  let count = nss.count
  let storage = _HeapBuffer<Int, AnyObject>(
    _HeapBufferStorage<Int, AnyObject>.self, count, count)
  _stdlib_CFSetGetValues(nss, storage.baseAddress)
  return storage
}
#endif

//===--- Compiler conversion/casting entry points for Set<Element> --------===//

/// Perform a non-bridged upcast that always succeeds.
///
/// - Precondition: `BaseValue` is a base class or base `@objc`
///   protocol (such as `AnyObject`) of `DerivedValue`.
public func _setUpCast<DerivedValue, BaseValue>(_ source: Set<DerivedValue>)
  -> Set<BaseValue> {
  var builder = _SetBuilder<BaseValue>(count: source.count)
  for x in source {
    builder.add(member: x as! BaseValue)
  }
  return builder.take()
}

#if _runtime(_ObjC)

/// Implements an unconditional upcast that involves bridging.
///
/// The cast can fail if bridging fails.
///
/// - Precondition: `SwiftValue` is bridged to Objective-C
///   and requires non-trivial bridging.
public func _setBridgeToObjectiveC<SwiftValue, ObjCValue>(
  _ source: Set<SwiftValue>
) -> Set<ObjCValue> {
  _sanityCheck(_isClassOrObjCExistential(ObjCValue.self))
  _sanityCheck(!_isBridgedVerbatimToObjectiveC(SwiftValue.self))

  var result = Set<ObjCValue>(minimumCapacity: source.count)
  let valueBridgesDirectly =
    _isBridgedVerbatimToObjectiveC(SwiftValue.self) ==
    _isBridgedVerbatimToObjectiveC(ObjCValue.self)

  for member in source {
    var bridgedMember: ObjCValue
    if valueBridgesDirectly {
      bridgedMember = unsafeBitCast(member, to: ObjCValue.self)
    } else {
      let bridged: AnyObject = _bridgeAnythingToObjectiveC(member)
      bridgedMember = unsafeBitCast(bridged, to: ObjCValue.self)
    }
    result.insert(bridgedMember)
  }
  return result
}

#endif

@_silgen_name("_swift_setDownCastIndirect")
public func _setDownCastIndirect<SourceValue, TargetValue>(
  _ source: UnsafePointer<Set<SourceValue>>,
  _ target: UnsafeMutablePointer<Set<TargetValue>>) {
  target.initialize(to: _setDownCast(source.pointee))
}

/// Implements a forced downcast.  This operation should have O(1) complexity.
///
/// The cast can fail if bridging fails.  The actual checks and bridging can be
/// deferred.
///
/// - Precondition: `DerivedValue` is a subtype of `BaseValue` and both
///   are reference types.
public func _setDownCast<BaseValue, DerivedValue>(_ source: Set<BaseValue>)
  -> Set<DerivedValue> {

#if _runtime(_ObjC)
  if _isClassOrObjCExistential(BaseValue.self)
  && _isClassOrObjCExistential(DerivedValue.self) {
    switch source._variantBuffer {
    case _VariantSetBuffer.native(let buffer):
      return Set(_immutableCocoaSet: buffer.bridged())
    case _VariantSetBuffer.cocoa(let cocoaBuffer):
      return Set(_immutableCocoaSet: cocoaBuffer.cocoaSet)
    }
  }
#endif
  return _setDownCastConditional(source)!
}

@_silgen_name("_swift_setDownCastConditionalIndirect")
public func _setDownCastConditionalIndirect<SourceValue, TargetValue>(
  _ source: UnsafePointer<Set<SourceValue>>,
  _ target: UnsafeMutablePointer<Set<TargetValue>>
) -> Bool {
  if let result: Set<TargetValue> = _setDownCastConditional(source.pointee) {
    target.initialize(to: result)
    return true
  }
  return false
}

/// Implements a conditional downcast.
///
/// If the cast fails, the function returns `nil`.  All checks should be
/// performed eagerly.
///
/// - Precondition: `DerivedValue` is a subtype of `BaseValue` and both
///   are reference types.
public func _setDownCastConditional<BaseValue, DerivedValue>(
  _ source: Set<BaseValue>
) -> Set<DerivedValue>? {
  var result = Set<DerivedValue>(minimumCapacity: source.count)
  for member in source {
    if let derivedMember = member as? DerivedValue {
      result.insert(derivedMember)
      continue
    }
    return nil
  }
  return result
}

#if _runtime(_ObjC)

/// Implements an unconditional downcast that involves bridging.
///
/// - Precondition: At least one of `SwiftValue` is a bridged value
///   type, and the corresponding `ObjCValue` is a reference type.
public func _setBridgeFromObjectiveC<ObjCValue, SwiftValue>(
  _ source: Set<ObjCValue>
) -> Set<SwiftValue> {
  let result: Set<SwiftValue>? = _setBridgeFromObjectiveCConditional(source)
  _precondition(result != nil, "This set cannot be bridged from Objective-C")
  return result!
}

/// Implements a conditional downcast that involves bridging.
///
/// If the cast fails, the function returns `nil`.  All checks should be
/// performed eagerly.
///
/// - Precondition: At least one of `SwiftValue` is a bridged value
///   type, and the corresponding `ObjCValue` is a reference type.
public func _setBridgeFromObjectiveCConditional<
  ObjCValue, SwiftValue
>(
  _ source: Set<ObjCValue>
) -> Set<SwiftValue>? {
  _sanityCheck(_isClassOrObjCExistential(ObjCValue.self))
  _sanityCheck(!_isBridgedVerbatimToObjectiveC(SwiftValue.self))

  let valueBridgesDirectly =
    _isBridgedVerbatimToObjectiveC(SwiftValue.self) ==
      _isBridgedVerbatimToObjectiveC(ObjCValue.self)

  var result = Set<SwiftValue>(minimumCapacity: source.count)
  for value in source {
    // Downcast the value.
    var resultValue: SwiftValue
    if valueBridgesDirectly {
      if let bridgedValue = value as? SwiftValue {
        resultValue = bridgedValue
      } else {
        return nil
      }
    } else {
      if let bridgedValue = _conditionallyBridgeFromObjectiveC(
          _reinterpretCastToAnyObject(value), SwiftValue.self) {
        resultValue = bridgedValue
      } else {
        return nil
      }
    }
    result.insert(resultValue)
  }
  return result
}

#endif

//===--- APIs unique to Dictionary<Key, Value> ----------------------------===//

/// A collection whose elements are key-value pairs.
///
/// A dictionary is a type of hash table, providing fast access to the entries
/// it contains. Each entry in the table is identified using its key, which is
/// a hashable type such as a string or number. You use that key to retrieve
/// the corresponding value, which can be any object. In other languages,
/// similar data types are known as hashes or associated arrays.
///
/// Create a new dictionary by using a dictionary literal. A dictionary literal
/// is a comma-separated list of key-value pairs, in which a colon separates
/// each key from its associated value, surrounded by square brackets. You can
/// assign a dictionary literal to a variable or constant or pass it to a
/// function that expects a dictionary.
///
/// Here's how you would create a dictionary of HTTP response codes and their
/// related messages:
///
///     var responseMessages = [200: "OK",
///                             403: "Access forbidden",
///                             404: "File not found",
///                             500: "Internal server error"]
///
/// The `responseMessages` variable is inferred to have type `[Int: String]`.
/// The `Key` type of the dictionary is `Int`, and the `Value` type of the
/// dictionary is `String`.
///
/// To create a dictionary with no key-value pairs, use an empty dictionary
/// literal (`[:]`).
///
///     var emptyDict: [String: String] = [:]
///
/// Any type that conforms to the `Hashable` protocol can be used as a
/// dictionary's `Key` type, including all of Swift's basic types. You can use
/// your own custom types as dictionary keys by making them conform to the
/// `Hashable` protocol.
///
/// Getting and Setting Dictionary Values
/// =====================================
///
/// The most common way to access values in a dictionary is to use a key as a
/// subscript. Subscripting with a key takes the following form:
///
///     print(responseMessages[200])
///     // Prints "Optional("OK")"
///
/// Subscripting a dictionary with a key returns an optional value, because a
/// dictionary might not hold a value for the key that you use in the
/// subscript.
///
/// The next example uses key-based subscripting of the `responseMessages`
/// dictionary with two keys that exist in the dictionary and one that does
/// not.
///
///     let httpResponseCodes = [200, 403, 301]
///     for code in httpResponseCodes {
///         if let message = responseMessages[code] {
///             print("Response \(code): \(message)")
///         } else {
///             print("Unknown response \(code)")
///         }
///     }
///     // Prints "Response 200: OK"
///     // Prints "Response 403: Access Forbidden"
///     // Prints "Unknown response 301"
///
/// You can also update, modify, or remove keys and values from a dictionary
/// using the key-based subscript. To add a new key-value pair, assign a value
/// to a key that isn't yet a part of the dictionary.
///
///     responseMessages[301] = "Moved permanently"
///     print(responseMessages[301])
///     // Prints "Optional("Moved permanently")"
///
/// Update an existing value by assigning a new value to a key that already
/// exists in the dictionary. If you assign `nil` to an existing key, the key
/// and its associated value are removed. The following example updates the
/// value for the `404` code to be simply "Not found" and removes the
/// key-value pair for the `500` code entirely.
///
///     responseMessages[404] = "Not found"
///     responseMessages[500] = nil
///     print(responseMessages)
///     // Prints "[301: "Moved permanently", 200: "OK", 403: "Access forbidden", 404: "Not found"]"
///
/// In a mutable `Dictionary` instance, you can modify in place a value that
/// you've accessed through a keyed subscript. The code sample below declares a
/// dictionary called `interestingNumbers` with string keys and values that
/// are integer arrays, then sorts each array in-place in descending order.
///
///     var interestingNumbers = ["primes": [2, 3, 5, 7, 11, 13, 15],
///                               "triangular": [1, 3, 6, 10, 15, 21, 28],
///                               "hexagonal": [1, 6, 15, 28, 45, 66, 91]]
///     for key in interestingNumbers.keys {
///         interestingNumbers[key]?.sort(by: >)
///     }
///
///     print(interestingNumbers["primes"]!)
///     // Prints "[15, 13, 11, 7, 5, 3, 2]"
///
/// Iterating Over the Contents of a Dictionary
/// ===========================================
///
/// Every dictionary is an unordered collection of key-value pairs. You can
/// iterate over a dictionary using a `for`-`in` loop, decomposing each
/// key-value pair into the elements of a tuple.
///
///     let imagePaths = ["star": "/glyphs/star.png",
///                       "portrait": "/images/content/portrait.jpg",
///                       "spacer": "/images/shared/spacer.gif"]
///
///     for (name, path) in imagePaths {
///         print("The path to '\(name)' is '\(path)'.")
///     }
///     // Prints "The path to 'star' is '/glyphs/star.png'."
///     // Prints "The path to 'portrait' is '/images/content/portrait.jpg'."
///     // Prints "The path to 'spacer' is '/images/shared/spacer.gif'."
///
/// The order of key-value pairs in a dictionary is stable between mutations
/// but is otherwise unpredictable. If you need an ordered collection of
/// key-value pairs and don't need the fast key lookup that `Dictionary`
/// provides, see the `DictionaryLiteral` type for an alternative.
///
/// You can search a dictionary's contents for a particular value using the
/// `contains(where:)` or `index(where:)` methods supplied by default
/// implementation. The following example checks to see if `imagePaths` contains
/// any paths in the `"/glyphs"` directory:
///
///     let glyphIndex = imagePaths.index { $0.value.hasPrefix("/glyphs") }
///     if let index = glyphIndex {
///         print("The '\(imagesPaths[index].key)' image is a glyph.")
///     } else {
///         print("No glyphs found!")
///     }
///     // Prints "The 'star' image is a glyph.")
///
/// Note that in this example, `imagePaths` is subscripted using a dictionary
/// index. Unlike the key-based subscript, the index-based subscript returns
/// the corresponding key-value pair as a non-optional tuple.
///
///     print(imagePaths[glyphIndex!])
///     // Prints "("star", "/glyphs/star.png")"
///
/// A dictionary's indices stay valid across additions to the dictionary as
/// long as the dictionary has enough capacity to store the added values
/// without allocating more buffer. When a dictionary outgrows its buffer,
/// existing indices may be invalidated without any notification.
///
/// When you know how many new values you're adding to a dictionary, use the
/// `init(minimumCapacity:)` initializer to allocate the correct amount of
/// buffer.
///
/// Bridging Between Dictionary and NSDictionary
/// ============================================
///
/// You can bridge between `Dictionary` and `NSDictionary` using the `as`
/// operator. For bridging to be possible, the `Key` and `Value` types of a
/// dictionary must be classes, `@objc` protocols, or types that bridge to
/// Foundation types.
///
/// Bridging from `Dictionary` to `NSDictionary` always takes O(1) time and
/// space. When the dictionary's `Key` and `Value` types are neither classes
/// nor `@objc` protocols, any required bridging of elements occurs at the
/// first access of each element. For this reason, the first operation that
/// uses the contents of the dictionary may take O(*n*).
///
/// Bridging from `NSDictionary` to `Dictionary` first calls the `copy(with:)`
/// method (`- copyWithZone:` in Objective-C) on the dictionary to get an
/// immutable copy and then performs additional Swift bookkeeping work that
/// takes O(1) time. For instances of `NSDictionary` that are already
/// immutable, `copy(with:)` usually returns the same dictionary in O(1) time;
/// otherwise, the copying performance is unspecified. The instances of
/// `NSDictionary` and `Dictionary` share buffer using the same copy-on-write
/// optimization that is used when two instances of `Dictionary` share
/// buffer.
///
/// - SeeAlso: `Hashable`
@_fixed_layout
public struct Dictionary<Key : Hashable, Value> :
  Collection, ExpressibleByDictionaryLiteral {

  internal typealias _Self = Dictionary<Key, Value>
  internal typealias _VariantBuffer = _VariantDictionaryBuffer<Key, Value>
  internal typealias _NativeBuffer = _NativeDictionaryBuffer<Key, Value>

  /// The element type of a dictionary: a tuple containing an individual
  /// key-value pair.
  public typealias Element = (key: Key, value: Value)

  @_versioned
  internal var _variantBuffer: _VariantBuffer

  /// Creates an empty dictionary.
  public init() {
    self = Dictionary<Key, Value>(_nativeBuffer: _NativeBuffer())
  }

  /// Creates a dictionary with at least the given number of elements worth of
  /// buffer.
  ///
  /// Use this initializer to avoid intermediate reallocations when you know
  /// how many key-value pairs you are adding to a dictionary. The actual
  /// capacity of the created dictionary is the smallest power of 2 that
  /// is greater than or equal to `minimumCapacity`.
  ///
  /// - Parameter minimumCapacity: The minimum number of key-value pairs to
  ///   allocate buffer for in the new dictionary.
  public init(minimumCapacity: Int) {
    _variantBuffer =
      .native(_NativeBuffer(minimumCapacity: minimumCapacity))
  }

  internal init(_nativeBuffer: _NativeDictionaryBuffer<Key, Value>) {
    _variantBuffer =
      .native(_nativeBuffer)
  }

#if _runtime(_ObjC)
  /// Private initializer used for bridging.
  ///
  /// Only use this initializer when both conditions are true:
  ///
  /// * it is statically known that the given `NSDictionary` is immutable;
  /// * `Key` and `Value` are bridged verbatim to Objective-C (i.e.,
  ///   are reference types).
  public init(_immutableCocoaDictionary: _NSDictionary) {
    _sanityCheck(
      _isBridgedVerbatimToObjectiveC(Key.self) &&
      _isBridgedVerbatimToObjectiveC(Value.self),
      "Dictionary can be backed by NSDictionary buffer only when both key and value are bridged verbatim to Objective-C")
    _variantBuffer = .cocoa(
      _CocoaDictionaryBuffer(cocoaDictionary: _immutableCocoaDictionary))
  }
#endif

  //
  // All APIs below should dispatch to `_variantBuffer`, without doing any
  // additional processing.
  //

  /// The position of the first element in a nonempty dictionary.
  ///
  /// If the collection is empty, `startIndex` is equal to `endIndex`.
  ///
  /// - Complexity: Amortized O(1) if the dictionary does not wrap a bridged
  ///   `NSDictionary`. If the dictionary wraps a bridged `NSDictionary`, the
  ///   performance is unspecified.
  public var startIndex: Index {
    return _variantBuffer.startIndex
  }

  /// The dictionary's "past the end" position---that is, the position one
  /// greater than the last valid subscript argument.
  ///
  /// If the collection is empty, `endIndex` is equal to `startIndex`.
  ///
  /// - Complexity: Amortized O(1) if the dictionary does not wrap a bridged
  ///   `NSDictionary`; otherwise, the performance is unspecified.
  public var endIndex: Index {
    return _variantBuffer.endIndex
  }

  public func index(after i: Index) -> Index {
    return _variantBuffer.index(after: i)
  }

  /// Returns the index for the given key.
  ///
  /// If the given key is found in the dictionary, this method returns an index
  /// into the dictionary that corresponds with the key-value pair.
  ///
  ///     let countryCodes = ["BR": "Brazil", "GH": "Ghana", "JP": "Japan"]
  ///     let index = countryCodes.index(forKey: "JP")
  ///
  ///     print("Country code for \(countryCodes[index!].value): '\(countryCodes[index!].key)'.")
  ///     // Prints "Country code for Japan: 'JP'."
  ///
  /// - Parameter key: The key to find in the dictionary.
  /// - Returns: The index for `key` and its associated value if `key` is in
  ///   the dictionary; otherwise, `nil`.
  @inline(__always)
  public func index(forKey key: Key) -> Index? {
    // Complexity: amortized O(1) for native buffer, O(*n*) when wrapping an
    // NSDictionary.
    return _variantBuffer.index(forKey: key)
  }

  /// Accesses the key-value pair at the specified position.
  ///
  /// This subscript takes an index into the dictionary, instead of a key, and
  /// returns the corresponding key-value pair as a tuple. When performing
  /// collection-based operations that return an index into a dictionary, use
  /// this subscript with the resulting value.
  ///
  /// For example, to find the key for a particular value in a dictionary, use
  /// the `index(where:)` method.
  ///
  ///     let countryCodes = ["BR": "Brazil", "GH": "Ghana", "JP": "Japan"]
  ///     if let index = countryCodes.index(where: { $0.value == "Japan" }) {
  ///         print(countryCodes[index])
  ///         print("Japan's country code is '\(countryCodes[index].key)'.")
  ///     } else {
  ///         print("Didn't find 'Japan' as a value in the dictionary.")
  ///     }
  ///     // Prints "("JP", "Japan")"
  ///     // Prints "Japan's country code is 'JP'."
  ///
  /// - Parameter position: The position of the key-value pair to access.
  ///   `position` must be a valid index of the dictionary and not equal to
  ///   `endIndex`.
  /// - Returns: A two-element tuple with the key and value corresponding to
  ///   `position`.
  public subscript(position: Index) -> Element {
    return _variantBuffer.assertingGet(position)
  }

  /// Accesses the value associated with the given key for reading and writing.
  ///
  /// This *key-based* subscript returns the value for the given key if the key
  /// is found in the dictionary, or `nil` if the key is not found.
  ///
  /// The following example creates a new dictionary and prints the value of a
  /// key found in the dictionary (`"Coral"`) and a key not found in the
  /// dictionary (`"Cerise"`).
  ///
  ///     var hues = ["Heliotrope": 296, "Coral": 16, "Aquamarine": 156]
  ///     print(hues["Coral"])
  ///     // Prints "Optional(16)"
  ///     print(hues["Cerise"])
  ///     // Prints "nil"
  ///
  /// When you assign a value for a key and that key already exists, the
  /// dictionary overwrites the existing value. If the dictionary doesn't
  /// contain the key, the key and value are added as a new key-value pair.
  ///
  /// Here, the value for the key `"Coral"` is updated from `16` to `18` and a
  /// new key-value pair is added for the key `"Cerise"`.
  ///
  ///     hues["Coral"] = 18
  ///     print(hues["Coral"])
  ///     // Prints "Optional(18)"
  ///
  ///     hues["Cerise"] = 330
  ///     print(hues["Cerise"])
  ///     // Prints "Optional(330)"
  ///
  /// If you assign `nil` as the value for the given key, the dictionary
  /// removes that key and its associated value.
  ///
  /// In the following example, the key-value pair for the key `"Aquamarine"`
  /// is removed from the dictionary by assigning `nil` to the key-based
  /// subscript.
  ///
  ///     hues["Aquamarine"] = nil
  ///     print(hues)
  ///     // Prints "["Coral": 18, "Heliotrope": 296, "Cerise": 330]"
  ///
  /// - Parameter key: The key to find in the dictionary.
  /// - Returns: The value associated with `key` if `key` is in the dictionary;
  ///   otherwise, `nil`.
  public subscript(key: Key) -> Value? {
    @inline(__always)
    get {
      return _variantBuffer.maybeGet(key)
    }
    set(newValue) {
      if let x = newValue {
        // FIXME(performance): this loads and discards the old value.
        _variantBuffer.updateValue(x, forKey: key)
      }
      else {
        // FIXME(performance): this loads and discards the old value.
        removeValue(forKey: key)
      }
    }
  }

  /// Updates the value stored in the dictionary for the given key, or adds a
  /// new key-value pair if the key does not exist.
  ///
  /// Use this method instead of key-based subscripting when you need to know
  /// whether the new value supplants the value of an existing key. If the
  /// value of an existing key is updated, `updateValue(_:forKey:)` returns
  /// the original value.
  ///
  ///     var hues = ["Heliotrope": 296, "Coral": 16, "Aquamarine": 156]
  ///
  ///     if let oldValue = hues.updateValue(18, forKey: "Coral") {
  ///         print("The old value of \(oldValue) was replaced with a new one.")
  ///     }
  ///     // Prints "The old value of 16 was replaced with a new one."
  ///
  /// If the given key is not present in the dictionary, this method adds the
  /// key-value pair and returns `nil`.
  ///
  ///     if let oldValue = hues.updateValue(330, forKey: "Cerise") {
  ///         print("The old value of \(oldValue) was replaced with a new one.")
  ///     } else {
  ///         print("No value was found in the dictionary for that key.")
  ///     }
  ///     // Prints "No value was found in the dictionary for that key."
  ///
  /// - Parameters:
  ///   - value: The new value to add to the dictionary.
  ///   - key: The key to associate with `value`. If `key` already exists in
  ///     the dictionary, `value` replaces the existing associated value. If
  ///     `key` isn't already a key of the dictionary, the `(key, value)` pair
  ///     is added.
  /// - Returns: The value that was replaced, or `nil` if a new key-value pair
  ///   was added.
  @discardableResult
  public mutating func updateValue(
    _ value: Value, forKey key: Key
  ) -> Value? {
    return _variantBuffer.updateValue(value, forKey: key)
  }

  /// Removes and returns the key-value pair at the specified index.
  ///
  /// Calling this method invalidates any existing indices for use with this
  /// dictionary.
  ///
  /// - Parameter index: The position of the key-value pair to remove. `index`
  ///   must be a valid index of the dictionary, and must not equal the
  ///   dictionary's end index.
  /// - Returns: The key-value pair that correspond to `index`.
  ///
  /// - Complexity: O(*n*), where *n* is the number of key-value pairs in the
  ///   dictionary.
  @discardableResult
  public mutating func remove(at index: Index) -> Element {
    return _variantBuffer.remove(at: index)
  }

  /// Removes the given key and its associated value from the dictionary.
  ///
  /// If the key is found in the dictionary, this method returns the key's
  /// associated value. On removal, this method invalidates all indices with
  /// respect to the dictionary.
  ///
  ///     var hues = ["Heliotrope": 296, "Coral": 16, "Aquamarine": 156]
  ///     if let value = hues.removeValue(forKey: "Coral") {
  ///         print("The value \(value) was removed.")
  ///     }
  ///     // Prints "The value 16 was removed."
  ///
  /// If the key isn't found in the dictionary, `removeValue(forKey:)` returns
  /// `nil`.
  ///
  ///     if let value = hues.removeValueForKey("Cerise") {
  ///         print("The value \(value) was removed.")
  ///     } else {
  ///         print("No value found for that key.")
  ///     }
  ///     // Prints "No value found for that key.""
  ///
  /// - Parameter key: The key to remove along with its associated value.
  /// - Returns: The value that was removed, or `nil` if the key was not
  ///   present in the dictionary.
  ///
  /// - Complexity: O(*n*), where *n* is the number of key-value pairs in the
  ///   dictionary.
  @discardableResult
  public mutating func removeValue(forKey key: Key) -> Value? {
    return _variantBuffer.removeValue(forKey: key)
  }

  /// Removes all key-value pairs from the dictionary.
  ///
  /// Calling this method invalidates all indices with respect to the
  /// dictionary.
  ///
  /// - Parameter keepCapacity: Whether the dictionary should keep its
  ///   underlying buffer. If you pass `true`, the operation preserves the
  ///   buffer capacity that the collection has, otherwise the underlying
  ///   buffer is released.  The default is `false`.
  ///
  /// - Complexity: O(*n*), where *n* is the number of key-value pairs in the
  ///   dictionary.
  public mutating func removeAll(keepingCapacity keepCapacity: Bool = false) {
    // The 'will not decrease' part in the documentation comment is worded very
    // carefully.  The capacity can increase if we replace Cocoa buffer with
    // native buffer.
    _variantBuffer.removeAll(keepingCapacity: keepCapacity)
  }

  /// The number of key-value pairs in the dictionary.
  ///
  /// - Complexity: O(1).
  public var count: Int {
    return _variantBuffer.count
  }

  //
  // `Sequence` conformance
  //

  /// Returns an iterator over the dictionary's key-value pairs.
  ///
  /// Iterating over a dictionary yields the key-value pairs as two-element
  /// tuples. You can decompose the tuple in a `for`-`in` loop, which calls
  /// `makeIterator()` behind the scenes, or when calling the iterator's
  /// `next()` method directly.
  ///
  ///     let hues = ["Heliotrope": 296, "Coral": 16, "Aquamarine": 156]
  ///     for (name, hueValue) in hues {
  ///         print("The hue of \(name) is \(hueValue).")
  ///     }
  ///     // Prints "The hue of Heliotrope is 296."
  ///     // Prints "The hue of Coral is 16."
  ///     // Prints "The hue of Aquamarine is 156."
  ///
  /// - Returns: An iterator over the dictionary with elements of type
  ///   `(key: Key, value: Value)`.
  @inline(__always)
  public func makeIterator() -> DictionaryIterator<Key, Value> {
    return _variantBuffer.makeIterator()
  }

  //
  // ExpressibleByDictionaryLiteral conformance
  //

  /// Creates a dictionary initialized with a dictionary literal.
  ///
  /// Do not call this initializer directly. It is called by the compiler to
  /// handle dictionary literals. To use a dictionary literal as the initial
  /// value of a dictionary, enclose a comma-separated list of key-value pairs
  /// in square brackets.
  ///
  /// For example, the code sample below creates a dictionary with string keys
  /// and values.
  ///
  ///     let countryCodes = ["BR": "Brazil", "GH": "Ghana", "JP": "Japan"]
  ///     print(countryCodes)
  ///     // Prints "["BR": "Brazil", "JP": "Japan", "GH": "Ghana"]"
  ///
  /// - Parameter elements: The key-value pairs that will make up the new
  ///   dictionary. Each key in `elements` must be unique.
  ///
  /// - SeeAlso: `ExpressibleByDictionaryLiteral`
  @effects(readonly)
  public init(dictionaryLiteral elements: (Key, Value)...) {
    self.init(_nativeBuffer: _NativeDictionaryBuffer.fromArray(elements))
  }

  //
  // APIs below this comment should be implemented strictly in terms of
  // *public* APIs above.  `_variantBuffer` should not be accessed directly.
  //
  // This separates concerns for testing.  Tests for the following APIs need
  // not to concern themselves with testing correctness of behavior of
  // underlying buffer (and different variants of it), only correctness of the
  // API itself.
  //

  /// A collection containing just the keys of the dictionary.
  ///
  /// When iterated over, keys appear in this collection in the same order as they
  /// occur in the dictionary's key-value pairs. Each key in the keys
  /// collection has a unique value.
  ///
  ///     let countryCodes = ["BR": "Brazil", "GH": "Ghana", "JP": "Japan"]
  ///     for k in countryCodes.keys {
  ///         print(k)
  ///     }
  ///     // Prints "BR"
  ///     // Prints "JP"
  ///     // Prints "GH"
  public var keys: LazyMapCollection<Dictionary, Key> {
    return self.lazy.map { $0.key }
  }

  /// A collection containing just the values of the dictionary.
  ///
  /// When iterated over, values appear in this collection in the same order as they
  /// occur in the dictionary's key-value pairs.
  ///
  ///     let countryCodes = ["BR": "Brazil", "GH": "Ghana", "JP": "Japan"]
  ///     print(countryCodes)
  ///     // Prints "["BR": "Brazil", "JP": "Japan", "GH": "Ghana"]"
  ///     for v in countryCodes.values {
  ///         print(v)
  ///     }
  ///     // Prints "Brazil"
  ///     // Prints "Japan"
  ///     // Prints "Ghana"
  public var values: LazyMapCollection<Dictionary, Value> {
    return self.lazy.map { $0.value }
  }

  //
  // Collection conformance
  //

  /// A Boolean value that indicates whether the dictionary is empty. (read
  /// only)
  ///
  /// Dictionaries are empty when created with an initializer or an empty
  /// dictionary literal.
  ///
  ///     var frequencies: [String: Int] = [:]
  ///     print(frequencies.isEmpty)
  ///     // Prints "true"
  public var isEmpty: Bool {
    return count == 0
  }

}

extension Dictionary where Key : Equatable, Value : Equatable {
  public static func == (lhs: [Key : Value], rhs: [Key : Value]) -> Bool {
    switch (lhs._variantBuffer, rhs._variantBuffer) {
    case (.native(let lhsNative), .native(let rhsNative)):

      if lhsNative._storage === rhsNative._storage {
        return true
      }

      if lhsNative.count != rhsNative.count {
        return false
      }

      for (k, v) in lhs {
        let (pos, found) = rhsNative._find(k, startBucket: rhsNative._bucket(k))
        // FIXME: Can't write the simple code pending
        // <rdar://problem/15484639> Refcounting bug
        /*
        if !found || rhs[pos].value != lhsElement.value {
          return false
        }
        */
        if !found {
          return false
        }
        if rhsNative.value(at: pos.offset) != v {
          return false
        }
      }
      return true

    case (.cocoa(let lhsCocoa), .cocoa(let rhsCocoa)):
  #if _runtime(_ObjC)
      return _stdlib_NSObject_isEqual(
        lhsCocoa.cocoaDictionary, rhsCocoa.cocoaDictionary)
  #else
      _sanityCheckFailure("internal error: unexpected cocoa dictionary")
  #endif

    case (.native(let lhsNative), .cocoa(let rhsCocoa)):
  #if _runtime(_ObjC)

      if lhsNative.count != rhsCocoa.count {
        return false
      }

      let endIndex = lhsNative.endIndex
      var index = lhsNative.startIndex
      while index != endIndex {
        let (key, value) = lhsNative.assertingGet(index)
        let optRhsValue: AnyObject? =
          rhsCocoa.maybeGet(_bridgeAnythingToObjectiveC(key))

        guard let rhsValue = optRhsValue,
          value == _forceBridgeFromObjectiveC(rhsValue, Value.self)
        else {
          return false
        }

        lhsNative.formIndex(after: &index)
        continue
      }
      return true
  #else
      _sanityCheckFailure("internal error: unexpected cocoa dictionary")
  #endif

    case (.cocoa, .native):
  #if _runtime(_ObjC)
      return rhs == lhs
  #else
      _sanityCheckFailure("internal error: unexpected cocoa dictionary")
  #endif
    }
  }

  public static func != (lhs: [Key : Value], rhs: [Key : Value]) -> Bool {
    return !(lhs == rhs)
  }
}

extension Dictionary : CustomStringConvertible, CustomDebugStringConvertible {
  internal func _makeDescription() -> String {
    if count == 0 {
      return "[:]"
    }

    var result = "["
    var first = true
    for (k, v) in self {
      if first {
        first = false
      } else {
        result += ", "
      }
      debugPrint(k, terminator: "", to: &result)
      result += ": "
      debugPrint(v, terminator: "", to: &result)
    }
    result += "]"
    return result
  }

  /// A string that represents the contents of the dictionary.
  public var description: String {
    return _makeDescription()
  }

  /// A string that represents the contents of the dictionary, suitable for
  /// debugging.
  public var debugDescription: String {
    return _makeDescription()
  }
}

#if _runtime(_ObjC)
/// Equivalent to `NSDictionary.allKeys`, but does not leave objects on the
/// autorelease pool.
internal func _stdlib_NSDictionary_allKeys(_ nsd: _NSDictionary)
    -> _HeapBuffer<Int, AnyObject> {
  let count = nsd.count
  let storage = _HeapBuffer<Int, AnyObject>(
    _HeapBufferStorage<Int, AnyObject>.self, count, count)

  nsd.getObjects(nil, andKeys: storage.baseAddress)
  return storage
}
#endif

//===--- Compiler conversion/casting entry points for Dictionary<K, V> ----===//

/// Perform a non-bridged upcast that always succeeds.
///
/// - Precondition: `BaseKey` and `BaseValue` are base classes or base `@objc`
///   protocols (such as `AnyObject`) of `DerivedKey` and `DerivedValue`,
///   respectively.
public func _dictionaryUpCast<DerivedKey, DerivedValue, BaseKey, BaseValue>(
    _ source: Dictionary<DerivedKey, DerivedValue>
) -> Dictionary<BaseKey, BaseValue> {
  var result = Dictionary<BaseKey, BaseValue>(minimumCapacity: source.count)

  for (k, v) in source {
    result[k as! BaseKey] = (v as! BaseValue)
  }
  return result
}

#if _runtime(_ObjC)

/// Implements an unconditional upcast that involves bridging.
///
/// The cast can fail if bridging fails.
///
/// - Precondition: `SwiftKey` and `SwiftValue` are bridged to Objective-C,
///   and at least one of them requires non-trivial bridging.
@inline(never)
@_semantics("stdlib_binary_only")
public func _dictionaryBridgeToObjectiveC<
  SwiftKey, SwiftValue, ObjCKey, ObjCValue
>(
  _ source: Dictionary<SwiftKey, SwiftValue>
) -> Dictionary<ObjCKey, ObjCValue> {

  // Note: We force this function to stay in the swift dylib because
  // it is not performance sensitive and keeping it in the dylib saves
  // a new kilobytes for each specialization for all users of dictionary.

  _sanityCheck(
    !_isBridgedVerbatimToObjectiveC(SwiftKey.self) ||
    !_isBridgedVerbatimToObjectiveC(SwiftValue.self))
  _sanityCheck(
    _isClassOrObjCExistential(ObjCKey.self) ||
    _isClassOrObjCExistential(ObjCValue.self))

  var result = Dictionary<ObjCKey, ObjCValue>(minimumCapacity: source.count)
  let keyBridgesDirectly =
    _isBridgedVerbatimToObjectiveC(SwiftKey.self) ==
      _isBridgedVerbatimToObjectiveC(ObjCKey.self)
  let valueBridgesDirectly =
    _isBridgedVerbatimToObjectiveC(SwiftValue.self) ==
      _isBridgedVerbatimToObjectiveC(ObjCValue.self)
  for (key, value) in source {
    // Bridge the key
    var bridgedKey: ObjCKey
    if keyBridgesDirectly {
      bridgedKey = unsafeBitCast(key, to: ObjCKey.self)
    } else {
      let bridged: AnyObject = _bridgeAnythingToObjectiveC(key)
      bridgedKey = unsafeBitCast(bridged, to: ObjCKey.self)
    }

    // Bridge the value
    var bridgedValue: ObjCValue
    if valueBridgesDirectly {
      bridgedValue = unsafeBitCast(value, to: ObjCValue.self)
    } else {
      let bridged: AnyObject? = _bridgeAnythingToObjectiveC(value)
      bridgedValue = unsafeBitCast(bridged, to: ObjCValue.self)
    }

    result[bridgedKey] = bridgedValue
  }

  return result
}
#endif

@_silgen_name("_swift_dictionaryDownCastIndirect")
public func _dictionaryDownCastIndirect<SourceKey, SourceValue,
                                        TargetKey, TargetValue>(
  _ source: UnsafePointer<Dictionary<SourceKey, SourceValue>>,
  _ target: UnsafeMutablePointer<Dictionary<TargetKey, TargetValue>>) {
  target.initialize(to: _dictionaryDownCast(source.pointee))
}

/// Implements a forced downcast.  This operation should have O(1) complexity.
///
/// The cast can fail if bridging fails.  The actual checks and bridging can be
/// deferred.
///
/// - Precondition: `DerivedKey` is a subtype of `BaseKey`, `DerivedValue` is
///   a subtype of `BaseValue`, and all of these types are reference types.
public func _dictionaryDownCast<BaseKey, BaseValue, DerivedKey, DerivedValue>(
  _ source: Dictionary<BaseKey, BaseValue>
) -> Dictionary<DerivedKey, DerivedValue> {

#if _runtime(_ObjC)
  if _isClassOrObjCExistential(BaseKey.self)
  && _isClassOrObjCExistential(BaseValue.self)
  && _isClassOrObjCExistential(DerivedKey.self)
  && _isClassOrObjCExistential(DerivedValue.self) {

    switch source._variantBuffer {
    case .native(let buffer):
      // Note: it is safe to treat the buffer as immutable here because
      // Dictionary will not mutate buffer with reference count greater than 1.
      return Dictionary(_immutableCocoaDictionary: buffer.bridged())
    case .cocoa(let cocoaBuffer):
      return Dictionary(_immutableCocoaDictionary: cocoaBuffer.cocoaDictionary)
    }
  }
#endif
  return _dictionaryDownCastConditional(source)!
}

@_silgen_name("_swift_dictionaryDownCastConditionalIndirect")
public func _dictionaryDownCastConditionalIndirect<SourceKey, SourceValue,
                                                   TargetKey, TargetValue>(
  _ source: UnsafePointer<Dictionary<SourceKey, SourceValue>>,
  _ target: UnsafeMutablePointer<Dictionary<TargetKey, TargetValue>>
) -> Bool {
  if let result: Dictionary<TargetKey, TargetValue>
       = _dictionaryDownCastConditional(source.pointee) {
    target.initialize(to: result)
    return true
  }
  return false
}

/// Implements a conditional downcast.
///
/// If the cast fails, the function returns `nil`.  All checks should be
/// performed eagerly.
///
/// - Precondition: `DerivedKey` is a subtype of `BaseKey`, `DerivedValue` is
///   a subtype of `BaseValue`, and all of these types are reference types.
public func _dictionaryDownCastConditional<
  BaseKey, BaseValue, DerivedKey, DerivedValue
>(
  _ source: Dictionary<BaseKey, BaseValue>
) -> Dictionary<DerivedKey, DerivedValue>? {

  var result = Dictionary<DerivedKey, DerivedValue>()
  for (k, v) in source {
    guard let k1 = k as? DerivedKey, let v1 = v as? DerivedValue
    else { return nil }
    result[k1] = v1
  }
  return result
}

#if _runtime(_ObjC)
/// Implements an unconditional downcast that involves bridging.
///
/// - Precondition: At least one of `SwiftKey` or `SwiftValue` is a bridged value
///   type, and the corresponding `ObjCKey` or `ObjCValue` is a reference type.
public func _dictionaryBridgeFromObjectiveC<
  ObjCKey, ObjCValue, SwiftKey, SwiftValue
>(
  _ source: Dictionary<ObjCKey, ObjCValue>
) -> Dictionary<SwiftKey, SwiftValue> {
  let result: Dictionary<SwiftKey, SwiftValue>? =
    _dictionaryBridgeFromObjectiveCConditional(source)
  _precondition(result != nil, "dictionary cannot be bridged from Objective-C")
  return result!
}

/// Implements a conditional downcast that involves bridging.
///
/// If the cast fails, the function returns `nil`.  All checks should be
/// performed eagerly.
///
/// - Precondition: At least one of `SwiftKey` or `SwiftValue` is a bridged value
///   type, and the corresponding `ObjCKey` or `ObjCValue` is a reference type.
public func _dictionaryBridgeFromObjectiveCConditional<
  ObjCKey, ObjCValue, SwiftKey, SwiftValue
>(
  _ source: Dictionary<ObjCKey, ObjCValue>
) -> Dictionary<SwiftKey, SwiftValue>? {
  _sanityCheck(
    _isClassOrObjCExistential(ObjCKey.self) ||
    _isClassOrObjCExistential(ObjCValue.self))
  _sanityCheck(
    !_isBridgedVerbatimToObjectiveC(SwiftKey.self) ||
    !_isBridgedVerbatimToObjectiveC(SwiftValue.self))

  let keyBridgesDirectly =
    _isBridgedVerbatimToObjectiveC(SwiftKey.self) ==
      _isBridgedVerbatimToObjectiveC(ObjCKey.self)
  let valueBridgesDirectly =
    _isBridgedVerbatimToObjectiveC(SwiftValue.self) ==
      _isBridgedVerbatimToObjectiveC(ObjCValue.self)

  var result = Dictionary<SwiftKey, SwiftValue>(minimumCapacity: source.count)
  for (key, value) in source {
    // Downcast the key.
    var resultKey: SwiftKey
    if keyBridgesDirectly {
      if let bridgedKey = key as? SwiftKey {
        resultKey = bridgedKey
      } else {
        return nil
      }
    } else {
      if let bridgedKey = _conditionallyBridgeFromObjectiveC(
        _reinterpretCastToAnyObject(key), SwiftKey.self) {
          resultKey = bridgedKey
      } else {
        return nil
      }
    }

    // Downcast the value.
    var resultValue: SwiftValue
    if valueBridgesDirectly {
      if let bridgedValue = value as? SwiftValue {
        resultValue = bridgedValue
      } else {
        return nil
      }
    } else {
      if let bridgedValue = _conditionallyBridgeFromObjectiveC(
        _reinterpretCastToAnyObject(value), SwiftValue.self) {
          resultValue = bridgedValue
      } else {
        return nil
      }
    }

    result[resultKey] = resultValue
  }
  return result
}
#endif
//===--- APIs templated for Dictionary and Set ----------------------------===//

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2468)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2470)

/// An instance of this class has all `Set` data tail-allocated.
/// Enough bytes are allocated to hold the bitmap for marking valid entries,
/// keys, and values. The data layout starts with the bitmap, followed by the
/// keys, followed by the values.
//
// See the docs at the top of the file for more details on this type
//
// NOTE: The precise layout of this type is relied on in the runtime
// to provide a statically allocated empty singleton. 
// See stdlib/public/stubs/GlobalObjects.cpp for details.
@objc_non_lazy_realization
internal class _RawNativeSetStorage:
  _SwiftNativeNSSet, _NSSetCore
{
  internal typealias RawStorage = _RawNativeSetStorage
  
  internal final var capacity: Int
  internal final var count: Int

  internal final var initializedEntries: _UnsafeBitMap
  internal final var keys: UnsafeMutableRawPointer
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2495)

  // This API is unsafe and needs a `_fixLifetime` in the caller.
  internal final
  var _initializedHashtableEntriesBitMapBuffer: UnsafeMutablePointer<UInt> {
    return UnsafeMutablePointer(Builtin.projectTailElems(self, UInt.self))
  }

  /// The empty singleton that is used for every single Dictionary that is
  /// created without any elements. The contents of the storage should never
  /// be mutated.
  internal static var empty: RawStorage {
    return Builtin.bridgeFromRawPointer(
      Builtin.addressof(&_swiftEmptySetStorage))
  }

  // This type is made with allocWithTailElems, so no init is ever called.
  // But we still need to have an init to satisfy the compiler.
  internal init(_doNotCallMe: ()) {
    _sanityCheckFailure("Only create this by using the `empty` singleton")
  }

#if _runtime(_ObjC)
  //
  // NSSet implementation, assuming Self is the empty singleton
  //

  /// Get the NSEnumerator implementation for self.
  /// _HashableTypedNativeSetStorage overloads this to give 
  /// _NativeSelfNSEnumerator proper type parameters.
  func enumerator() -> _NSEnumerator {
    return _NativeSetNSEnumerator<AnyObject>(
        _NativeSetBuffer(_storage: self))
  }

  @objc(copyWithZone:)
  func copy(with zone: _SwiftNSZone?) -> AnyObject {
    return self
  }

  @objc(countByEnumeratingWithState:objects:count:)
  func countByEnumerating(
    with state: UnsafeMutablePointer<_SwiftNSFastEnumerationState>,
    objects: UnsafeMutablePointer<AnyObject>?, count: Int
  ) -> Int {
    // Even though we never do anything in here, we need to update the
    // state so that callers know we actually ran.
    
    var theState = state.pointee
    if theState.state == 0 {
      theState.state = 1 // Arbitrary non-zero value.
      theState.itemsPtr = AutoreleasingUnsafeMutablePointer(objects)
      theState.mutationsPtr = _fastEnumerationStorageMutationsPtr
    }
    state.pointee = theState
    
    return 0
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2554)

  @objc
  internal required init(objects: UnsafePointer<AnyObject?>, count: Int) {
    _sanityCheckFailure("don't call this designated initializer")
  }

  @objc
  internal func member(_ object: AnyObject) -> AnyObject? {
    return nil
  }

  @objc
  internal func objectEnumerator() -> _NSEnumerator {
    return enumerator()
  }
  
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2596)
#endif
}

// See the docs at the top of this file for a description of this type
@_versioned
internal class _TypedNativeSetStorage<Element> :
  _RawNativeSetStorage {

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2605)
  internal typealias Key = Element
  internal typealias Value = Element
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2608)

  deinit {
    let keys = self.keys.assumingMemoryBound(to: Key.self)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2614)

    if !_isPOD(Key.self) {
      for i in 0 ..< capacity {
        if initializedEntries[i] {
          (keys+i).deinitialize()
        }
      }
    }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2632)
    _fixLifetime(self)
  }

  // This type is made with allocWithTailElems, so no init is ever called.
  // But we still need to have an init to satisfy the compiler.
  override internal init(_doNotCallMe: ()) {
    _sanityCheckFailure("Only create this by calling Buffer's inits")
  }

#if _runtime(_ObjC)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2643)
  @objc
  internal required init(objects: UnsafePointer<AnyObject?>, count: Int) {
    _sanityCheckFailure("don't call this designated initializer")
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2657)
#endif
}


// See the docs at the top of this file for a description of this type
@_versioned
final internal class _HashableTypedNativeSetStorage<Element : Hashable> :
  _TypedNativeSetStorage<Element> {

  internal typealias FullContainer = Set<Element>
  internal typealias Buffer = _NativeSetBuffer<Element>

  // This type is made with allocWithTailElems, so no init is ever called.
  // But we still need to have an init to satisfy the compiler.
  override internal init(_doNotCallMe: ()) {
    _sanityCheckFailure("Only create this by calling Buffer's inits'")
  }

  
#if _runtime(_ObjC)
  // NSSet bridging:

  // All actual functionality comes from buffer/full, which are
  // just wrappers around a RawNativeSetStorage.
  
  var buffer: Buffer {
    return Buffer(_storage: self)
  }

  var full: FullContainer {
    return FullContainer(_nativeBuffer: buffer)
  }

  override func enumerator() -> _NSEnumerator {
    return _NativeSetNSEnumerator<Element>(
        Buffer(_storage: self))
  }

  @objc(countByEnumeratingWithState:objects:count:)
  override func countByEnumerating(
    with state: UnsafeMutablePointer<_SwiftNSFastEnumerationState>,
    objects: UnsafeMutablePointer<AnyObject>?, count: Int
  ) -> Int {
    var theState = state.pointee
    if theState.state == 0 {
      theState.state = 1 // Arbitrary non-zero value.
      theState.itemsPtr = AutoreleasingUnsafeMutablePointer(objects)
      theState.mutationsPtr = _fastEnumerationStorageMutationsPtr
      theState.extra.0 = CUnsignedLong(full.startIndex._nativeIndex.offset)
    }

    // Test 'objects' rather than 'count' because (a) this is very rare anyway,
    // and (b) the optimizer should then be able to optimize away the
    // unwrapping check below.
    if _slowPath(objects == nil) {
      return 0
    }

    let unmanagedObjects = _UnmanagedAnyObjectArray(objects!)
    var currIndex = _NativeSetIndex<Element>(
        offset: Int(theState.extra.0))
    let endIndex = buffer.endIndex
    var stored = 0
    for i in 0..<count {
      if (currIndex == endIndex) {
        break
      }

      unmanagedObjects[i] = buffer.bridgedKey(at: currIndex)
      
      stored += 1
      buffer.formIndex(after: &currIndex)
    }
    theState.extra.0 = CUnsignedLong(currIndex.offset)
    state.pointee = theState
    return stored
  }

  internal func getObjectFor(_ aKey: AnyObject) -> AnyObject? {
    guard let nativeKey = _conditionallyBridgeFromObjectiveC(aKey, Key.self)
    else { return nil }

    let (i, found) = buffer._find(nativeKey, 
        startBucket: buffer._bucket(nativeKey))

    if found {
      return buffer.bridgedValue(at: i)
    }
    return nil
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2749)

  @objc
  internal required init(objects: UnsafePointer<AnyObject?>, count: Int) {
    _sanityCheckFailure("don't call this designated initializer")
  }

  @objc
  override internal func member(_ object: AnyObject) -> AnyObject? {
    return getObjectFor(object)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2806)
#endif
}


/// A wrapper around _RawNativeSetStorage that provides most of the 
/// implementation of Set.
///
/// This type and most of its functionality doesn't require Hashable at all.
/// The reason for this is to support storing AnyObject for bridging
/// with _SwiftDeferredNSSet. What functionality actually relies on
/// Hashable can be found in an extension.
@_versioned
@_fixed_layout
internal struct _NativeSetBuffer<Element> {

  internal typealias RawStorage = _RawNativeSetStorage
  internal typealias TypedStorage = _TypedNativeSetStorage<Element>
  internal typealias Buffer = _NativeSetBuffer<Element>
  internal typealias Index = _NativeSetIndex<Element>

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2827)
  internal typealias Key = Element
  internal typealias Value = Element
  internal typealias SequenceElementWithoutLabels = Element
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2833)

  /// See this comments on _RawNativeSetStorage and its subclasses to
  /// understand why we store an untyped storage here.
  internal var _storage: RawStorage

  /// Creates a Buffer with a storage that is typed, but doesn't understand
  /// Hashing. Mostly for bridging; prefer `init(capacity:)`.
  internal init(capacity: Int, unhashable: ()) {
    let numWordsForBitmap = _UnsafeBitMap.sizeInWords(forSizeInBits: capacity)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2848)
    let storage = Builtin.allocWithTailElems_2(TypedStorage.self,
        numWordsForBitmap._builtinWordValue, UInt.self,
        capacity._builtinWordValue, Key.self)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2852)
    self.init(capacity: capacity, storage: storage)
  }

  /// Given a capacity and uninitialized RawStorage, completes the 
  /// initialization and returns a Buffer.  
  internal init(capacity: Int, storage: RawStorage) {
    storage.capacity = capacity
    storage.count = 0
    
    self.init(_storage: storage)

    let initializedEntries = _UnsafeBitMap(
        storage: _initializedHashtableEntriesBitMapBuffer,
        bitCount: capacity)
    initializedEntries.initializeToZero()

    // Compute all the array offsets now, so we don't have to later
    let bitmapAddr = Builtin.projectTailElems(_storage, UInt.self)
    let numWordsForBitmap = _UnsafeBitMap.sizeInWords(forSizeInBits: capacity)
    let keysAddr = Builtin.getTailAddr_Word(bitmapAddr,
           numWordsForBitmap._builtinWordValue, UInt.self, Key.self)

    // Initialize header
    _storage.initializedEntries = initializedEntries
    _storage.keys = UnsafeMutableRawPointer(keysAddr)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2882)
  }

  // Forwarding the individual fields of the storage in various forms

  @_versioned
  internal var capacity: Int {
    return _assumeNonNegative(_storage.capacity)
  }

  @_versioned
  internal var count: Int {
    set {
      _storage.count = newValue
    }
    get {
      return _assumeNonNegative(_storage.count)
    }
  }

  internal
  var _initializedHashtableEntriesBitMapBuffer: UnsafeMutablePointer<UInt> {
    return _storage._initializedHashtableEntriesBitMapBuffer
  }

  // This API is unsafe and needs a `_fixLifetime` in the caller.
  @_versioned
  internal var keys: UnsafeMutablePointer<Key> {
    return _storage.keys.assumingMemoryBound(to: Key.self)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2919)

  /// Constructs a buffer adopting the given storage.
  init(_storage: RawStorage) {
    self._storage = _storage
  }

  /// Constructs an instance from the empty singleton.
  init() {
    self._storage = RawStorage.empty
  }



  // Most of the implementation of the _HashBuffer protocol,
  // but only the parts that don't actually rely on hashing.

  @_versioned
  @inline(__always)
  internal func key(at i: Int) -> Key {
    _sanityCheck(i >= 0 && i < capacity)
    _sanityCheck(isInitializedEntry(at: i))
    defer { _fixLifetime(self) }

    let res = (keys + i).pointee
    return res
  }

#if _runtime(_ObjC)
  /// Returns the key at the given Index, bridged.
  ///
  /// Intended for use with verbatim bridgeable keys.
  internal func bridgedKey(at index: Index) -> AnyObject {
    let k = key(at: index.offset)
    return _bridgeAnythingToObjectiveC(k)
  }

  /// Returns the value at the given Index, bridged.
  ///
  /// Intended for use with verbatim bridgeable keys.
  internal func bridgedValue(at index: Index) -> AnyObject {
    let v = value(at: index.offset)
    return _bridgeAnythingToObjectiveC(v)
  }
#endif

  @_versioned
  internal func isInitializedEntry(at i: Int) -> Bool {
    _sanityCheck(i >= 0 && i < capacity)
    defer { _fixLifetime(self) }

    return _storage.initializedEntries[i]
  }

  @_transparent
  internal func destroyEntry(at i: Int) {
    _sanityCheck(isInitializedEntry(at: i))
    defer { _fixLifetime(self) }

    (keys + i).deinitialize()
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2981)
    _storage.initializedEntries[i] = false
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2985)
  @_transparent
  internal func initializeKey(_ k: Key, at i: Int) {
    _sanityCheck(!isInitializedEntry(at: i))
    defer { _fixLifetime(self) }

    (keys + i).initialize(to: k)
    _storage.initializedEntries[i] = true
  }

  @_transparent
  internal func moveInitializeEntry(from: Buffer, at: Int, toEntryAt: Int) {
    _sanityCheck(!isInitializedEntry(at: toEntryAt))

    defer { _fixLifetime(self) }

    (keys + toEntryAt).initialize(to: (from.keys + at).move())
    from._storage.initializedEntries[at] = false
    _storage.initializedEntries[toEntryAt] = true
  }

  /// Alias for key(at:) in Sets for better code reuse
  @_versioned
  @_transparent
  internal func value(at i: Int) -> Value {
    return key(at: i)
  }

  internal func setKey(_ key: Key, at i: Int) {
    _sanityCheck(i >= 0 && i < capacity)
    _sanityCheck(isInitializedEntry(at: i))
    defer { _fixLifetime(self) }

    (keys + i).pointee = key
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3061)

  @_versioned
  internal var startIndex: Index {
    // We start at "index after -1" instead of "0" because we need to find the
    // first occupied slot.
    return index(after: Index(offset: -1))
  }

  @_versioned
  internal var endIndex: Index {
    return Index(offset: capacity)
  }

  @_versioned
  internal func index(after i: Index) -> Index {
    _precondition(i != endIndex)
    var idx = i.offset + 1
    while idx < capacity && !isInitializedEntry(at: idx) {
      idx += 1
    }

    return Index(offset: idx)
  }

  @_versioned
  internal func formIndex(after i: inout Index) {
    i = index(after: i)
  }

  
  internal func assertingGet(_ i: Index) -> SequenceElement {
    _precondition(i.offset >= 0 && i.offset < capacity)
    _precondition(
      isInitializedEntry(at: i.offset),
      "attempting to access Set elements using an invalid Index")
    let key = self.key(at: i.offset)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3098)
    return key
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3102)

  }
}

extension _NativeSetBuffer 
  where Element : Hashable
{
  internal typealias HashTypedStorage = 
    _HashableTypedNativeSetStorage<Element>
  internal typealias SequenceElement = Element

  @inline(__always)
  internal init(minimumCapacity: Int) {
    // Make sure there's a representable power of 2 >= minimumCapacity
    _sanityCheck(minimumCapacity <= (Int.max >> 1) + 1)
    var capacity = 2
    while capacity < minimumCapacity {
      capacity <<= 1
    }
    self.init(capacity: capacity)
  }

  /// Create a buffer instance with room for at least 'capacity'
  /// entries and all entries marked invalid.
  internal init(capacity: Int) {
    let numWordsForBitmap = _UnsafeBitMap.sizeInWords(forSizeInBits: capacity)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3134)
    let storage = Builtin.allocWithTailElems_2(HashTypedStorage.self,
        numWordsForBitmap._builtinWordValue, UInt.self,
        capacity._builtinWordValue, Key.self)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3138)
    self.init(capacity: capacity, storage: storage)
  }

#if _runtime(_ObjC)
  func bridged() -> _NSSet {
    // We can zero-cost bridge if our keys are verbatim
    // or if we're the empty singleton.

    // Temporary var for SOME type safety before a cast.
    let nsSet: _NSSetCore

    if (_isBridgedVerbatimToObjectiveC(Key.self) &&
        _isBridgedVerbatimToObjectiveC(Value.self)) ||
        self._storage === RawStorage.empty {
      nsSet = self._storage
    } else {
      nsSet = _SwiftDeferredNSSet(nativeBuffer: self)
    }

    // Cast from "minimal NSSet" to "NSSet"
    // Note that if you actually ask Swift for this cast, it will fail.
    // Never trust a shadow protocol!
    return unsafeBitCast(nsSet, to: _NSSet.self)
  }
#endif

  /// A textual representation of `self`.
  var description: String {
    var result = ""
#if INTERNAL_CHECKS_ENABLED
    for i in 0..<capacity {
      if isInitializedEntry(at: i) {
        let key = self.key(at: i)
        result += "bucket \(i), ideal bucket = \(_bucket(key)), key = \(key)\n"
      } else {
        result += "bucket \(i), empty\n"
      }
    }
#endif
    return result
  }

  internal var _bucketMask: Int {
    // The capacity is not negative, therefore subtracting 1 will not overflow.
    return capacity &- 1
  }

  @_versioned
  @inline(__always) // For performance reasons.
  internal func _bucket(_ k: Key) -> Int {
    return _squeezeHashValue(k.hashValue, capacity)
  }

  @_versioned
  internal func _index(after bucket: Int) -> Int {
    // Bucket is within 0 and capacity. Therefore adding 1 does not overflow.
    return (bucket &+ 1) & _bucketMask
  }

  internal func _prev(_ bucket: Int) -> Int {
    // Bucket is not negative. Therefore subtracting 1 does not overflow.
    return (bucket &- 1) & _bucketMask
  }

  /// Search for a given key starting from the specified bucket.
  ///
  /// If the key is not present, returns the position where it could be
  /// inserted.
  @_versioned
  @inline(__always)
  internal func _find(_ key: Key, startBucket: Int)
    -> (pos: Index, found: Bool) {

    var bucket = startBucket

    // The invariant guarantees there's always a hole, so we just loop
    // until we find one
    while true {
      let isHole = !isInitializedEntry(at: bucket)
      if isHole {
        return (Index(offset: bucket), false)
      }
      if self.key(at: bucket) == key {
        return (Index(offset: bucket), true)
      }
      bucket = _index(after: bucket)
    }
  }

  @_transparent
  internal static func minimumCapacity(
    minimumCount: Int,
    maxLoadFactorInverse: Double
  ) -> Int {
    // `minimumCount + 1` below ensures that we don't fill in the last hole
    return max(Int(Double(minimumCount) * maxLoadFactorInverse),
               minimumCount + 1)
  }

  /// Buffer should be uniquely referenced.
  /// The `key` should not be present in the Set.
  /// This function does *not* update `count`.

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3242)

  internal func unsafeAddNew(key newKey: Element) {
    let (i, found) = _find(newKey, startBucket: _bucket(newKey))
    _sanityCheck(
      !found, "unsafeAddNew was called, but the key is already present")
    initializeKey(newKey, at: i.offset)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3260)

  //
  // _HashBuffer conformance
  //

  @_versioned
  @inline(__always)
  internal func index(forKey key: Key) -> Index? {
    if count == 0 {
      // Fast path that avoids computing the hash of the key.
      return nil
    }
    let (i, found) = _find(key, startBucket: _bucket(key))
    return found ? i : nil
  }


  internal func assertingGet(_ key: Key) -> Value {
    let (i, found) = _find(key, startBucket: _bucket(key))
    _precondition(found, "key not found")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3281)
    return self.key(at: i.offset)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3285)
  }

  @_versioned
  @inline(__always)
  internal func maybeGet(_ key: Key) -> Value? {
    if count == 0 {
      // Fast path that avoids computing the hash of the key.
      return nil
    }

    let (i, found) = _find(key, startBucket: _bucket(key))
    if found {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3298)
      return self.key(at: i.offset)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3302)
    }
    return nil
  }

  @discardableResult
  internal func updateValue(_ value: Value, forKey key: Key) -> Value? {
    _sanityCheckFailure(
      "don't call mutating methods on _NativeSetBuffer")
  }

  @discardableResult
  internal func insert(
    _ value: Value, forKey key: Key
  ) -> (inserted: Bool, memberAfterInsert: Value) {
    _sanityCheckFailure(
      "don't call mutating methods on _NativeSetBuffer")
  }

  @discardableResult
  internal func remove(at index: Index) -> SequenceElement {
    _sanityCheckFailure(
      "don't call mutating methods on _NativeSetBuffer")
  }

  @discardableResult
  internal func removeValue(forKey key: Key) -> Value? {
    _sanityCheckFailure(
      "don't call mutating methods on _NativeSetBuffer")
  }

  internal func removeAll(keepingCapacity keepCapacity: Bool) {
    _sanityCheckFailure(
      "don't call mutating methods on _NativeSetBuffer")
  }

  internal static func fromArray(_ elements: [SequenceElementWithoutLabels])
    -> Buffer 
  {
    if elements.isEmpty {
      return Buffer()
    }

    let requiredCapacity =
      Buffer.minimumCapacity(
        minimumCount: elements.count,
        maxLoadFactorInverse: _hashContainerDefaultMaxLoadFactorInverse)
    var nativeBuffer = Buffer(minimumCapacity: requiredCapacity)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3351)

    var count = 0
    for key in elements {
      let (i, found) =
        nativeBuffer._find(key, startBucket: nativeBuffer._bucket(key))
      if found {
        continue
      }
      nativeBuffer.initializeKey(key, at: i.offset)
      count += 1
    }
    nativeBuffer.count = count

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3375)

    return nativeBuffer
  }
}

#if _runtime(_ObjC)
/// An NSEnumerator that works with any NativeSetBuffer of
/// verbatim bridgeable elements. Used by the various NSSet impls.
final internal class _NativeSetNSEnumerator<Element>
  : _SwiftNativeNSEnumerator, _NSEnumerator {

  internal typealias Buffer = _NativeSetBuffer<Element>
  internal typealias Index = _NativeSetIndex<Element>

  internal override required init() {
    _sanityCheckFailure("don't call this designated initializer")
  }

  internal init(_ buffer: Buffer) {
    self.buffer = buffer
    nextIndex = buffer.startIndex
    endIndex = buffer.endIndex
  }

  internal var buffer: Buffer
  internal var nextIndex: Index
  internal var endIndex: Index

  //
  // NSEnumerator implementation.
  //
  // Do not call any of these methods from the standard library!
  //

  @objc
  internal func nextObject() -> AnyObject? {
    if nextIndex == endIndex {
      return nil
    }
    let key = buffer.bridgedKey(at: nextIndex)
    buffer.formIndex(after: &nextIndex)
    return key
  }

  @objc(countByEnumeratingWithState:objects:count:)
  internal func countByEnumerating(
    with state: UnsafeMutablePointer<_SwiftNSFastEnumerationState>,
    objects: UnsafeMutablePointer<AnyObject>,
    count: Int
  ) -> Int {
    var theState = state.pointee
    if theState.state == 0 {
      theState.state = 1 // Arbitrary non-zero value.
      theState.itemsPtr = AutoreleasingUnsafeMutablePointer(objects)
      theState.mutationsPtr = _fastEnumerationStorageMutationsPtr
    }

    if nextIndex == endIndex {
      state.pointee = theState
      return 0
    }

    // Return only a single element so that code can start iterating via fast
    // enumeration, terminate it, and continue via NSEnumerator.
    let key = buffer.bridgedKey(at: nextIndex)
    buffer.formIndex(after: &nextIndex)

    let unmanagedObjects = _UnmanagedAnyObjectArray(objects)
    unmanagedObjects[0] = key
    state.pointee = theState
    return 1
  }
}
#endif

#if _runtime(_ObjC)
/// This class exists for Objective-C bridging. It holds a reference to a
/// NativeSetBuffer, and can be upcast to NSSelf when bridging is necessary.
/// This is the fallback implementation for situations where toll-free bridging
/// isn't possible. On first access, a NativeSetBuffer of AnyObject will be
/// constructed containing all the bridged elements.
final internal class _SwiftDeferredNSSet<Element : Hashable>
  : _SwiftNativeNSSet, _NSSetCore {

  internal typealias NativeBuffer = _NativeSetBuffer<Element>
  internal typealias BridgedBuffer = _NativeSetBuffer<AnyObject>
  internal typealias NativeIndex = _NativeSetIndex<Element>
  internal typealias BridgedIndex = _NativeSetIndex<AnyObject>

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3465)
  internal typealias Key = Element
  internal typealias Value = Element
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3468)

  internal init(minimumCapacity: Int = 2) {
    nativeBuffer = NativeBuffer(minimumCapacity: minimumCapacity)
    super.init()
  }

  internal init(nativeBuffer: NativeBuffer) {
    self.nativeBuffer = nativeBuffer
    super.init()
  }

  // This stored property should be stored at offset zero.  We perform atomic
  // operations on it.
  //
  // Do not access this property directly.
  internal var _heapStorageBridged_DoNotUse: AnyObject?

  /// The unbridged elements.
  internal var nativeBuffer: NativeBuffer

  @objc(copyWithZone:)
  internal func copy(with zone: _SwiftNSZone?) -> AnyObject {
    // Instances of this class should be visible outside of standard library as
    // having `NSSet` type, which is immutable.
    return self
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3496)

  //
  // NSSet implementation.
  //
  // Do not call any of these methods from the standard library!  Use only
  // `nativeBuffer`.
  //

  @objc
  internal required init(objects: UnsafePointer<AnyObject?>, count: Int) {
    _sanityCheckFailure("don't call this designated initializer")
  }

  @objc
  internal func member(_ object: AnyObject) -> AnyObject? {
    return bridgingObjectForKey(object)
  }

  @objc
  internal func objectEnumerator() -> _NSEnumerator {
    return enumerator()
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3554)

  /// Returns the pointer to the stored property, which contains bridged
  /// Set elements.
  internal var _heapStorageBridgedPtr: UnsafeMutablePointer<AnyObject?> {
    return _getUnsafePointerToStoredProperties(self).assumingMemoryBound(
      to: Optional<AnyObject>.self)
  }

  /// The buffer for bridged Set elements, if present.
  internal var _bridgedStorage:
    BridgedBuffer.RawStorage? {
    get {
      if let ref = _stdlib_atomicLoadARCRef(object: _heapStorageBridgedPtr) {
        return unsafeDowncast(ref, to: BridgedBuffer.RawStorage.self)
      }
      return nil
    }
  }

  /// Attach a buffer for bridged Set elements.
  internal func _initializeHeapStorageBridged(_ newStorage: AnyObject) {
    _stdlib_atomicInitializeARCRef(
      object: _heapStorageBridgedPtr, desired: newStorage)
  }

  /// Returns the bridged Set values.
  internal var bridgedBuffer: BridgedBuffer {
    return BridgedBuffer(_storage: _bridgedStorage!)
  }

  internal func bridgeEverything() {
    if _fastPath(_bridgedStorage != nil) {
      return
    }

    // FIXME: rdar://problem/19486139 (split bridged buffers for keys and values)
    // We bridge keys and values unconditionally here, even if one of them
    // actually is verbatim bridgeable (e.g. Dictionary<Int, AnyObject>).
    // Investigate only allocating the buffer for a Set in this case.

    // Create buffer for bridged data.
    let bridged = BridgedBuffer(capacity: nativeBuffer.capacity, unhashable: ())

    // Bridge everything.
    for i in 0..<nativeBuffer.capacity {
      if nativeBuffer.isInitializedEntry(at: i) {
        let key = _bridgeAnythingToObjectiveC(nativeBuffer.key(at: i))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3602)
        bridged.initializeKey(key, at: i)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3607)
      }
    }

    // Atomically put the bridged elements in place.
    _initializeHeapStorageBridged(bridged._storage)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3660)

  @objc
  internal var count: Int {
    return nativeBuffer.count
  }

  internal func bridgingObjectForKey(_ aKey: AnyObject)
    -> AnyObject? {
    guard let nativeKey = _conditionallyBridgeFromObjectiveC(aKey, Key.self)
    else { return nil }

    let (i, found) = nativeBuffer._find(
      nativeKey, startBucket: nativeBuffer._bucket(nativeKey))
    if found {
      bridgeEverything()
      return bridgedBuffer.value(at: i.offset)
    }
    return nil
  }

  internal func enumerator() -> _NSEnumerator {
    bridgeEverything()
    return _NativeSetNSEnumerator<AnyObject>(bridgedBuffer)
  }

  @objc(countByEnumeratingWithState:objects:count:)
  internal func countByEnumerating(
    with state: UnsafeMutablePointer<_SwiftNSFastEnumerationState>,
    objects: UnsafeMutablePointer<AnyObject>?,
    count: Int
  ) -> Int {
    var theState = state.pointee
    if theState.state == 0 {
      theState.state = 1 // Arbitrary non-zero value.
      theState.itemsPtr = AutoreleasingUnsafeMutablePointer(objects)
      theState.mutationsPtr = _fastEnumerationStorageMutationsPtr
      theState.extra.0 = CUnsignedLong(nativeBuffer.startIndex.offset)
    }

    // Test 'objects' rather than 'count' because (a) this is very rare anyway,
    // and (b) the optimizer should then be able to optimize away the
    // unwrapping check below.
    if _slowPath(objects == nil) {
      return 0
    }

    let unmanagedObjects = _UnmanagedAnyObjectArray(objects!)
    var currIndex = _NativeSetIndex<Element>(
        offset: Int(theState.extra.0))
    let endIndex = nativeBuffer.endIndex
    var stored = 0

    // Only need to bridge once, so we can hoist it out of the loop.
    if (currIndex != endIndex) {
      bridgeEverything()
    }
    
    for i in 0..<count {
      if (currIndex == endIndex) {
        break
      }

      let bridgedKey = bridgedBuffer.key(at: currIndex.offset)
      unmanagedObjects[i] = bridgedKey
      stored += 1
      nativeBuffer.formIndex(after: &currIndex)
    }
    theState.extra.0 = CUnsignedLong(currIndex.offset)
    state.pointee = theState
    return stored
  }
}
#else
final internal class _SwiftDeferredNSSet<Element : Hashable> { }
#endif

#if _runtime(_ObjC)
@_versioned
@_fixed_layout
internal struct _CocoaSetBuffer : _HashBuffer {
  @_versioned
  internal var cocoaSet: _NSSet

  internal typealias Index = _CocoaSetIndex
  internal typealias SequenceElement = AnyObject
  internal typealias SequenceElementWithoutLabels = AnyObject

  internal typealias Key = AnyObject
  internal typealias Value = AnyObject

  internal var startIndex: Index {
    return Index(cocoaSet, startIndex: ())
  }

  internal var endIndex: Index {
    return Index(cocoaSet, endIndex: ())
  }

  @_versioned
  internal func index(after i: Index) -> Index {
    return i.successor()
  }

  internal func formIndex(after i: inout Index) {
    // FIXME: swift-3-indexing-model: optimize if possible.
    i = i.successor()
  }

  @_versioned
  internal func index(forKey key: Key) -> Index? {
    // Fast path that does not involve creating an array of all keys.  In case
    // the key is present, this lookup is a penalty for the slow path, but the
    // potential savings are significant: we could skip a memory allocation and
    // a linear search.
    if maybeGet(key) == nil {
      return nil
    }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3779)
    let allKeys = _stdlib_NSSet_allObjects(cocoaSet)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3783)
    var keyIndex = -1
    for i in 0..<allKeys.value {
      if _stdlib_NSObject_isEqual(key, allKeys[i]) {
        keyIndex = i
        break
      }
    }
    _sanityCheck(keyIndex >= 0,
        "key was found in fast path, but not found later?")
    return Index(cocoaSet, allKeys, keyIndex)
  }

  internal func assertingGet(_ i: Index) -> SequenceElement {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3797)
    let value: Value? = i.allKeys[i.currentKeyIndex]
    _sanityCheck(value != nil, "item not found in underlying NSSet")
    return value!
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3805)

  }

  internal func assertingGet(_ key: Key) -> Value {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3810)
    let value: Value? = cocoaSet.member(key)
    _precondition(value != nil, "member not found in underlying NSSet")
    return value!
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3818)
  }

  @inline(__always)
  internal func maybeGet(_ key: Key) -> Value? {

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3824)
  return cocoaSet.member(key)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3828)

  }

  @discardableResult
  internal mutating func updateValue(_ value: Value, forKey key: Key) -> Value? {
    _sanityCheckFailure("cannot mutate NSSet")
  }

  @discardableResult
  internal mutating func insert(
    _ value: Value, forKey key: Key
  ) -> (inserted: Bool, memberAfterInsert: Value) {
    _sanityCheckFailure("cannot mutate NSSet")
  }

  @discardableResult
  internal mutating func remove(at index: Index) -> SequenceElement {
    _sanityCheckFailure("cannot mutate NSSet")
  }

  @discardableResult
  internal mutating func removeValue(forKey key: Key) -> Value? {
    _sanityCheckFailure("cannot mutate NSSet")
  }

  internal mutating func removeAll(keepingCapacity keepCapacity: Bool) {
    _sanityCheckFailure("cannot mutate NSSet")
  }

  internal var count: Int {
    return cocoaSet.count
  }

  internal static func fromArray(_ elements: [SequenceElementWithoutLabels])
    -> _CocoaSetBuffer {

    _sanityCheckFailure("this function should never be called")
  }
}
#else
@_versioned
@_fixed_layout
internal struct _CocoaSetBuffer {}
#endif

@_versioned
@_fixed_layout
internal enum _VariantSetBuffer<Element : Hashable> : _HashBuffer {

  internal typealias NativeBuffer = _NativeSetBuffer<Element>
  internal typealias NativeIndex = _NativeSetIndex<Element>
  internal typealias CocoaBuffer = _CocoaSetBuffer
  internal typealias SequenceElement = Element
  internal typealias SequenceElementWithoutLabels = Element
  internal typealias SelfType = _VariantSetBuffer

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3885)
  internal typealias Key = Element
  internal typealias Value = Element
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3888)

  case native(NativeBuffer)
  case cocoa(CocoaBuffer)

  @_versioned
  @_transparent
  internal var guaranteedNative: Bool {
    return _canBeClass(Key.self) == 0 || _canBeClass(Value.self) == 0
  }

  internal mutating func isUniquelyReferenced() -> Bool {
    // Note that &self drills down through .native(NativeBuffer) to the first
    // property in NativeBuffer, which is the reference to the storage.
    if _fastPath(guaranteedNative) {
      return _isUnique_native(&self)
    }

    switch self {
    case .native:
      return _isUnique_native(&self)
    case .cocoa:
      // Don't consider Cocoa buffer mutable, even if it is mutable and is
      // uniquely referenced.
      return false
    }
  }

  @_versioned
  internal var asNative: NativeBuffer {
    get {
      switch self {
      case .native(let buffer):
        return buffer
      case .cocoa:
        _sanityCheckFailure("internal error: not backed by native buffer")
      }
    }
    set {
      self = .native(newValue)
    }
  }

#if _runtime(_ObjC)
  internal var asCocoa: CocoaBuffer {
    switch self {
    case .native:
      _sanityCheckFailure("internal error: not backed by NSSet")
    case .cocoa(let cocoaBuffer):
      return cocoaBuffer
    }
  }
#endif

  /// Ensure this we hold a unique reference to a native buffer
  /// having at least `minimumCapacity` elements.
  internal mutating func ensureUniqueNativeBuffer(_ minimumCapacity: Int)
    -> (reallocated: Bool, capacityChanged: Bool) {
    switch self {
    case .native:
      let oldCapacity = asNative.capacity
      if isUniquelyReferenced() && oldCapacity >= minimumCapacity {
        return (reallocated: false, capacityChanged: false)
      }

      let oldNativeBuffer = asNative
      var newNativeBuffer = NativeBuffer(minimumCapacity: minimumCapacity)
      let newCapacity = newNativeBuffer.capacity
      for i in 0..<oldCapacity {
        if oldNativeBuffer.isInitializedEntry(at: i) {
          if oldCapacity == newCapacity {
            let key = oldNativeBuffer.key(at: i)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3960)
            newNativeBuffer.initializeKey(key, at: i)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3965)
          } else {
            let key = oldNativeBuffer.key(at: i)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3968)
            newNativeBuffer.unsafeAddNew(key: key)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3974)
          }
        }
      }
      newNativeBuffer.count = oldNativeBuffer.count

      self = .native(newNativeBuffer)
      return (reallocated: true,
              capacityChanged: oldCapacity != newNativeBuffer.capacity)

    case .cocoa(let cocoaBuffer):
#if _runtime(_ObjC)
      let cocoaSet = cocoaBuffer.cocoaSet
      var newNativeBuffer = NativeBuffer(minimumCapacity: minimumCapacity)
      let oldCocoaIterator = _CocoaSetIterator(cocoaSet)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3989)
      while let key = oldCocoaIterator.next() {
        newNativeBuffer.unsafeAddNew(
            key: _forceBridgeFromObjectiveC(key, Value.self))
      }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4003)
      newNativeBuffer.count = cocoaSet.count

      self = .native(newNativeBuffer)
      return (reallocated: true, capacityChanged: true)
#else
      _sanityCheckFailure("internal error: unexpected cocoa Set")
#endif
    }
  }

#if _runtime(_ObjC)
  @inline(never)
  internal mutating func migrateDataToNativeBuffer(
    _ cocoaBuffer: _CocoaSetBuffer
  ) {
    let minCapacity = NativeBuffer.minimumCapacity(
      minimumCount: cocoaBuffer.count,
      maxLoadFactorInverse: _hashContainerDefaultMaxLoadFactorInverse)
    let allocated = ensureUniqueNativeBuffer(minCapacity).reallocated
    _sanityCheck(allocated, "failed to allocate native Set buffer")
  }
#endif

  //
  // _HashBuffer conformance
  //

  internal typealias Index = SetIndex<Element>

  internal var startIndex: Index {
    if _fastPath(guaranteedNative) {
      return ._native(asNative.startIndex)
    }

    switch self {
    case .native:
      return ._native(asNative.startIndex)
    case .cocoa(let cocoaBuffer):
#if _runtime(_ObjC)
      return ._cocoa(cocoaBuffer.startIndex)
#else
      _sanityCheckFailure("internal error: unexpected cocoa Set")
#endif
    }
  }

  internal var endIndex: Index {
    if _fastPath(guaranteedNative) {
      return ._native(asNative.endIndex)
    }

    switch self {
    case .native:
      return ._native(asNative.endIndex)
    case .cocoa(let cocoaBuffer):
#if _runtime(_ObjC)
      return ._cocoa(cocoaBuffer.endIndex)
#else
      _sanityCheckFailure("internal error: unexpected cocoa Set")
#endif
    }
  }

  @_versioned
  func index(after i: Index) -> Index {
    if _fastPath(guaranteedNative) {
      return ._native(asNative.index(after: i._nativeIndex))
    }

    switch self {
    case .native:
      return ._native(asNative.index(after: i._nativeIndex))
    case .cocoa(let cocoaBuffer):
#if _runtime(_ObjC)
      return ._cocoa(cocoaBuffer.index(after: i._cocoaIndex))
#else
      _sanityCheckFailure("internal error: unexpected cocoa Set")
#endif
    }
  }

  internal func formIndex(after i: inout Index) {
    // FIXME: swift-3-indexing-model: optimize if possible.
    i = index(after: i)
  }

  @_versioned
  @inline(__always)
  internal func index(forKey key: Key) -> Index? {
    if _fastPath(guaranteedNative) {
      if let nativeIndex = asNative.index(forKey: key) {
        return ._native(nativeIndex)
      }
      return nil
    }

    switch self {
    case .native:
      if let nativeIndex = asNative.index(forKey: key) {
        return ._native(nativeIndex)
      }
      return nil
    case .cocoa(let cocoaBuffer):
#if _runtime(_ObjC)
      let anyObjectKey: AnyObject = _bridgeAnythingToObjectiveC(key)
      if let cocoaIndex = cocoaBuffer.index(forKey: anyObjectKey) {
        return ._cocoa(cocoaIndex)
      }
      return nil
#else
      _sanityCheckFailure("internal error: unexpected cocoa Set")
#endif
    }
  }

  internal func assertingGet(_ i: Index) -> SequenceElement {
    if _fastPath(guaranteedNative) {
      return asNative.assertingGet(i._nativeIndex)
    }

    switch self {
    case .native:
      return asNative.assertingGet(i._nativeIndex)
    case .cocoa(let cocoaBuffer):
#if _runtime(_ObjC)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4129)
      let anyObjectValue: AnyObject = cocoaBuffer.assertingGet(i._cocoaIndex)
      let nativeValue = _forceBridgeFromObjectiveC(anyObjectValue, Value.self)
      return nativeValue
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4139)
#else
      _sanityCheckFailure("internal error: unexpected cocoa Set")
#endif
    }
  }

  internal func assertingGet(_ key: Key) -> Value {
    if _fastPath(guaranteedNative) {
      return asNative.assertingGet(key)
    }

    switch self {
    case .native:
      return asNative.assertingGet(key)
    case .cocoa(let cocoaBuffer):
#if _runtime(_ObjC)
      // FIXME: This assumes that Key and Value are bridged verbatim.
      let anyObjectKey: AnyObject = _bridgeAnythingToObjectiveC(key)
      let anyObjectValue: AnyObject = cocoaBuffer.assertingGet(anyObjectKey)
      return _forceBridgeFromObjectiveC(anyObjectValue, Value.self)
#else
      _sanityCheckFailure("internal error: unexpected cocoa Set")
#endif
    }
  }

#if _runtime(_ObjC)
  @_versioned
  @inline(never)
  internal static func maybeGetFromCocoaBuffer(
    _ cocoaBuffer : CocoaBuffer, forKey key: Key
  ) -> Value? {
    let anyObjectKey: AnyObject = _bridgeAnythingToObjectiveC(key)
    if let anyObjectValue = cocoaBuffer.maybeGet(anyObjectKey) {
      return _forceBridgeFromObjectiveC(anyObjectValue, Value.self)
    }
    return nil
  }
#endif

  @_versioned
  @inline(__always)
  internal func maybeGet(_ key: Key) -> Value? {
    if _fastPath(guaranteedNative) {
      return asNative.maybeGet(key)
    }

    switch self {
    case .native:
      return asNative.maybeGet(key)
    case .cocoa(let cocoaBuffer):
#if _runtime(_ObjC)
      return SelfType.maybeGetFromCocoaBuffer(cocoaBuffer, forKey: key)
#else
      _sanityCheckFailure("internal error: unexpected cocoa Set")
#endif
    }
  }

  internal mutating func nativeUpdateValue(
    _ value: Value, forKey key: Key
  ) -> Value? {
    var (i, found) = asNative._find(key, startBucket: asNative._bucket(key))

    let minCapacity = found
      ? asNative.capacity
      : NativeBuffer.minimumCapacity(
          minimumCount: asNative.count + 1,
          maxLoadFactorInverse: _hashContainerDefaultMaxLoadFactorInverse)

    let (_, capacityChanged) = ensureUniqueNativeBuffer(minCapacity)
    if capacityChanged {
      i = asNative._find(key, startBucket: asNative._bucket(key)).pos
    }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4215)
    let oldValue: Value? = found ? asNative.key(at: i.offset) : nil
    if found {
      asNative.setKey(key, at: i.offset)
    } else {
      asNative.initializeKey(key, at: i.offset)
      asNative.count += 1
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4231)

    return oldValue
  }

  @discardableResult
  internal mutating func updateValue(
    _ value: Value, forKey key: Key
  ) -> Value? {

    if _fastPath(guaranteedNative) {
      return nativeUpdateValue(value, forKey: key)
    }

    switch self {
    case .native:
      return nativeUpdateValue(value, forKey: key)
    case .cocoa(let cocoaBuffer):
#if _runtime(_ObjC)
      migrateDataToNativeBuffer(cocoaBuffer)
      return nativeUpdateValue(value, forKey: key)
#else
      _sanityCheckFailure("internal error: unexpected cocoa Set")
#endif
    }
  }

  internal mutating func nativeInsert(
    _ value: Value, forKey key: Key
  ) -> (inserted: Bool, memberAfterInsert: Value) {

    var (i, found) = asNative._find(key, startBucket: asNative._bucket(key))
    if found {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4264)
      return (inserted: false, memberAfterInsert: asNative.key(at: i.offset))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4268)
    }

    let minCapacity = NativeBuffer.minimumCapacity(
      minimumCount: asNative.count + 1,
      maxLoadFactorInverse: _hashContainerDefaultMaxLoadFactorInverse)

    let (_, capacityChanged) = ensureUniqueNativeBuffer(minCapacity)

    if capacityChanged {
      i = asNative._find(key, startBucket: asNative._bucket(key)).pos
    }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4281)
    asNative.initializeKey(key, at: i.offset)
    asNative.count += 1
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4287)

    return (inserted: true, memberAfterInsert: value)
  }

  @discardableResult
  internal mutating func insert(
    _ value: Value, forKey key: Key
  ) -> (inserted: Bool, memberAfterInsert: Value) {

    if _fastPath(guaranteedNative) {
      return nativeInsert(value, forKey: key)
    }

    switch self {
    case .native:
      return nativeInsert(value, forKey: key)
    case .cocoa(let cocoaBuffer):
#if _runtime(_ObjC)
      migrateDataToNativeBuffer(cocoaBuffer)
      return nativeInsert(value, forKey: key)
#else
      _sanityCheckFailure("internal error: unexpected cocoa Set")
#endif
    }
  }

  /// - parameter idealBucket: The ideal bucket for the element being deleted.
  /// - parameter offset: The offset of the element that will be deleted.
  /// Precondition: there should be an initialized entry at offset.
  internal mutating func nativeDelete(
    _ nativeBuffer: NativeBuffer, idealBucket: Int, offset: Int
  ) {
    _sanityCheck(
        nativeBuffer.isInitializedEntry(at: offset), "expected initialized entry")

    var nativeBuffer = nativeBuffer

    // remove the element
    nativeBuffer.destroyEntry(at: offset)
    nativeBuffer.count -= 1

    // If we've put a hole in a chain of contiguous elements, some
    // element after the hole may belong where the new hole is.
    var hole = offset

    // Find the first bucket in the contiguous chain
    var start = idealBucket
    while nativeBuffer.isInitializedEntry(at: nativeBuffer._prev(start)) {
      start = nativeBuffer._prev(start)
    }

    // Find the last bucket in the contiguous chain
    var lastInChain = hole
    var b = nativeBuffer._index(after: lastInChain)
    while nativeBuffer.isInitializedEntry(at: b) {
      lastInChain = b
      b = nativeBuffer._index(after: b)
    }

    // Relocate out-of-place elements in the chain, repeating until
    // none are found.
    while hole != lastInChain {
      // Walk backwards from the end of the chain looking for
      // something out-of-place.
      var b = lastInChain
      while b != hole {
        let idealBucket = nativeBuffer._bucket(nativeBuffer.key(at: b))

        // Does this element belong between start and hole?  We need
        // two separate tests depending on whether [start, hole] wraps
        // around the end of the storage
        let c0 = idealBucket >= start
        let c1 = idealBucket <= hole
        if start <= hole ? (c0 && c1) : (c0 || c1) {
          break // Found it
        }
        b = nativeBuffer._prev(b)
      }

      if b == hole { // No out-of-place elements found; we're done adjusting
        break
      }

      // Move the found element into the hole
      nativeBuffer.moveInitializeEntry(
        from: nativeBuffer,
        at: b,
        toEntryAt: hole)
      hole = b
    }
  }

  internal mutating func nativeRemoveObject(forKey key: Key) -> Value? {
    var idealBucket = asNative._bucket(key)
    var (index, found) = asNative._find(key, startBucket: idealBucket)

    // Fast path: if the key is not present, we will not mutate the set,
    // so don't force unique buffer.
    if !found {
      return nil
    }

    let (_, capacityChanged) =
      ensureUniqueNativeBuffer(asNative.capacity)
    let nativeBuffer = asNative
    if capacityChanged {
      idealBucket = nativeBuffer._bucket(key)
      (index, found) = nativeBuffer._find(key, startBucket: idealBucket)
      _sanityCheck(found, "key was lost during buffer migration")
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4398)
    let oldValue = nativeBuffer.key(at: index.offset)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4402)
    nativeDelete(nativeBuffer, idealBucket: idealBucket,
      offset: index.offset)
    return oldValue
  }

  internal mutating func nativeRemove(
    at nativeIndex: NativeIndex
  ) -> SequenceElement {

    // The provided index should be valid, so we will always mutating the
    // set buffer.  Request unique buffer.
    _ = ensureUniqueNativeBuffer(asNative.capacity)
    let nativeBuffer = asNative

    let result = nativeBuffer.assertingGet(nativeIndex)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4418)
    let key = result
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4422)

    nativeDelete(nativeBuffer, idealBucket: nativeBuffer._bucket(key),
        offset: nativeIndex.offset)
    return result
  }

  @discardableResult
  internal mutating func remove(at index: Index) -> SequenceElement {
    if _fastPath(guaranteedNative) {
      return nativeRemove(at: index._nativeIndex)
    }

    switch self {
    case .native:
      return nativeRemove(at: index._nativeIndex)
    case .cocoa(let cocoaBuffer):
#if _runtime(_ObjC)
      // We have to migrate the data first.  But after we do so, the Cocoa
      // index becomes useless, so get the key first.
      //
      // FIXME(performance): fuse data migration and element deletion into one
      // operation.
      let index = index._cocoaIndex
      let anyObjectKey: AnyObject = index.allKeys[index.currentKeyIndex]
      migrateDataToNativeBuffer(cocoaBuffer)
      let key = _forceBridgeFromObjectiveC(anyObjectKey, Key.self)
      let value = nativeRemoveObject(forKey: key)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4451)
      _sanityCheck(key == value, "bridging did not preserve equality")
      return key
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4456)
#else
      _sanityCheckFailure("internal error: unexpected cocoa Set")
#endif
    }
  }

  @discardableResult
  internal mutating func removeValue(forKey key: Key) -> Value? {
    if _fastPath(guaranteedNative) {
      return nativeRemoveObject(forKey: key)
    }

    switch self {
    case .native:
      return nativeRemoveObject(forKey: key)
    case .cocoa(let cocoaBuffer):
#if _runtime(_ObjC)
      let anyObjectKey: AnyObject = _bridgeAnythingToObjectiveC(key)
      if cocoaBuffer.maybeGet(anyObjectKey) == nil {
        return nil
      }
      migrateDataToNativeBuffer(cocoaBuffer)
      return nativeRemoveObject(forKey: key)
#else
      _sanityCheckFailure("internal error: unexpected cocoa Set")
#endif
    }
  }

  internal mutating func nativeRemoveAll() {
    if !isUniquelyReferenced() {
        asNative = NativeBuffer(minimumCapacity: asNative.capacity)
        return
    }

    // We have already checked for the empty dictionary case and unique
    // reference, so we will always mutate the dictionary buffer.
    var nativeBuffer = asNative

    for b in 0..<nativeBuffer.capacity {
      if nativeBuffer.isInitializedEntry(at: b) {
        nativeBuffer.destroyEntry(at: b)
      }
    }
    nativeBuffer.count = 0
  }

  internal mutating func removeAll(keepingCapacity keepCapacity: Bool) {
    if count == 0 {
      return
    }

    if !keepCapacity {
      self = .native(NativeBuffer(minimumCapacity: 2))
      return
    }

    if _fastPath(guaranteedNative) {
      nativeRemoveAll()
      return
    }

    switch self {
    case .native:
      nativeRemoveAll()
    case .cocoa(let cocoaBuffer):
#if _runtime(_ObjC)
      self = .native(NativeBuffer(minimumCapacity: cocoaBuffer.count))
#else
      _sanityCheckFailure("internal error: unexpected cocoa Set")
#endif
    }
  }

  internal var count: Int {
    if _fastPath(guaranteedNative) {
      return asNative.count
    }

    switch self {
    case .native:
      return asNative.count
    case .cocoa(let cocoaBuffer):
#if _runtime(_ObjC)
      return cocoaBuffer.count
#else
      _sanityCheckFailure("internal error: unexpected cocoa Set")
#endif
    }
  }

  /// Returns an iterator over the `(Key, Value)` pairs.
  ///
  /// - Complexity: O(1).
  @_versioned
  @inline(__always)
  internal func makeIterator() -> SetIterator<Element> {
    switch self {
    case .native(let buffer):
      return ._native(
        start: asNative.startIndex, end: asNative.endIndex, buffer: buffer)
    case .cocoa(let cocoaBuffer):
#if _runtime(_ObjC)
      return ._cocoa(_CocoaSetIterator(cocoaBuffer.cocoaSet))
#else
      _sanityCheckFailure("internal error: unexpected cocoa Set")
#endif
    }
  }

  internal static func fromArray(_ elements: [SequenceElement])
    -> _VariantSetBuffer<Element> {

    _sanityCheckFailure("this function should never be called")
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4576)

@_versioned
internal struct _NativeSetIndex<Element> : Comparable {
  @_versioned
  internal var offset: Int

  @_versioned
  internal init(offset: Int) {
    self.offset = offset
  }
}

extension _NativeSetIndex {

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4591)
  internal static func < (
    lhs: _NativeSetIndex<Element>,
    rhs: _NativeSetIndex<Element>
  ) -> Bool {
    return lhs.offset < rhs.offset
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4591)
  internal static func <= (
    lhs: _NativeSetIndex<Element>,
    rhs: _NativeSetIndex<Element>
  ) -> Bool {
    return lhs.offset <= rhs.offset
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4591)
  internal static func > (
    lhs: _NativeSetIndex<Element>,
    rhs: _NativeSetIndex<Element>
  ) -> Bool {
    return lhs.offset > rhs.offset
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4591)
  internal static func >= (
    lhs: _NativeSetIndex<Element>,
    rhs: _NativeSetIndex<Element>
  ) -> Bool {
    return lhs.offset >= rhs.offset
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4591)
  internal static func == (
    lhs: _NativeSetIndex<Element>,
    rhs: _NativeSetIndex<Element>
  ) -> Bool {
    return lhs.offset == rhs.offset
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4598)

}


#if _runtime(_ObjC)
@_versioned
internal struct _CocoaSetIndex : Comparable {
  // Assumption: we rely on NSDictionary.getObjects when being
  // repeatedly called on the same NSDictionary, returning items in the same
  // order every time.
  // Similarly, the same assumption holds for NSSet.allObjects.

  /// A reference to the NSSet, which owns members in `allObjects`,
  /// or `allKeys`, for NSSet and NSDictionary respectively.
  internal let cocoaSet: _NSSet
  // FIXME: swift-3-indexing-model: try to remove the cocoa reference, but make
  // sure that we have a safety check for accessing `allKeys`.  Maybe move both
  // into the dictionary/set itself.

  /// An unowned array of keys.
  internal var allKeys: _HeapBuffer<Int, AnyObject>

  /// Index into `allKeys`
  internal var currentKeyIndex: Int

  internal init(_ cocoaSet: _NSSet, startIndex: ()) {
    self.cocoaSet = cocoaSet
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4626)
    self.allKeys = _stdlib_NSSet_allObjects(cocoaSet)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4630)
    self.currentKeyIndex = 0
  }

  internal init(_ cocoaSet: _NSSet, endIndex: ()) {
    self.cocoaSet = cocoaSet
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4636)
    self.allKeys = _stdlib_NSSet_allObjects(cocoaSet)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4640)
    self.currentKeyIndex = allKeys.value
  }

  internal init(_ cocoaSet: _NSSet,
    _ allKeys: _HeapBuffer<Int, AnyObject>,
    _ currentKeyIndex: Int
  ) {
    self.cocoaSet = cocoaSet
    self.allKeys = allKeys
    self.currentKeyIndex = currentKeyIndex
  }

  /// Returns the next consecutive value after `self`.
  ///
  /// - Precondition: The next value is representable.
  internal func successor() -> _CocoaSetIndex {
    // FIXME: swift-3-indexing-model: remove this method.
    _precondition(
      currentKeyIndex < allKeys.value, "cannot increment endIndex")
    return _CocoaSetIndex(cocoaSet, allKeys, currentKeyIndex + 1)
  }
}

extension _CocoaSetIndex {

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4666)
  internal static func < (
    lhs: _CocoaSetIndex,
    rhs: _CocoaSetIndex
  ) -> Bool {
    return lhs.currentKeyIndex < rhs.currentKeyIndex
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4666)
  internal static func <= (
    lhs: _CocoaSetIndex,
    rhs: _CocoaSetIndex
  ) -> Bool {
    return lhs.currentKeyIndex <= rhs.currentKeyIndex
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4666)
  internal static func > (
    lhs: _CocoaSetIndex,
    rhs: _CocoaSetIndex
  ) -> Bool {
    return lhs.currentKeyIndex > rhs.currentKeyIndex
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4666)
  internal static func >= (
    lhs: _CocoaSetIndex,
    rhs: _CocoaSetIndex
  ) -> Bool {
    return lhs.currentKeyIndex >= rhs.currentKeyIndex
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4666)
  internal static func == (
    lhs: _CocoaSetIndex,
    rhs: _CocoaSetIndex
  ) -> Bool {
    return lhs.currentKeyIndex == rhs.currentKeyIndex
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4673)

}
#else
internal struct _CocoaSetIndex {}
#endif

internal enum SetIndexRepresentation<Element : Hashable> {
  typealias _Index = SetIndex<Element>
  typealias _NativeIndex = _Index._NativeIndex
  typealias _CocoaIndex = _Index._CocoaIndex

  case _native(_NativeIndex)
  case _cocoa(_CocoaIndex)
}

extension Set {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4708)

/// Used to access the members in an instance of `Set<Element>`.
public struct Index : Comparable {
  // Index for native buffer is efficient.  Index for bridged NSSet is
  // not, because neither NSEnumerator nor fast enumeration support moving
  // backwards.  Even if they did, there is another issue: NSEnumerator does
  // not support NSCopying, and fast enumeration does not document that it is
  // safe to copy the state.  So, we cannot implement Index that is a value
  // type for bridged NSSet in terms of Cocoa enumeration facilities.

  internal typealias _NativeIndex = _NativeSetIndex<Element>
  internal typealias _CocoaIndex = _CocoaSetIndex

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4722)
  internal typealias Key = Element
  internal typealias Value = Element
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4725)

  internal var _value: SetIndexRepresentation<Element>

  @_versioned
  internal static func _native(_ index: _NativeIndex) -> Index {
    return SetIndex(_value: ._native(index))
  }
#if _runtime(_ObjC)
  @_versioned
  internal static func _cocoa(_ index: _CocoaIndex) -> Index {
    return SetIndex(_value: ._cocoa(index))
  }
#endif

  @_versioned
  @_transparent
  internal var _guaranteedNative: Bool {
    return _canBeClass(Key.self) == 0 && _canBeClass(Value.self) == 0
  }

  @_transparent
  internal var _nativeIndex: _NativeIndex {
    switch _value {
    case ._native(let nativeIndex):
      return nativeIndex
    case ._cocoa:
      _sanityCheckFailure("internal error: does not contain a native index")
    }
  }

#if _runtime(_ObjC)
  @_transparent
  internal var _cocoaIndex: _CocoaIndex {
    switch _value {
    case ._native:
      _sanityCheckFailure("internal error: does not contain a Cocoa index")
    case ._cocoa(let cocoaIndex):
      return cocoaIndex
    }
  }
#endif
}

}

public typealias SetIndex<Element : Hashable> =
    Set<Element>.Index

extension Set.Index {
  public static func == (
    lhs: Set<Element>.Index,
    rhs: Set<Element>.Index
  ) -> Bool {
    if _fastPath(lhs._guaranteedNative) {
      return lhs._nativeIndex == rhs._nativeIndex
    }

    switch (lhs._value, rhs._value) {
    case (._native(let lhsNative), ._native(let rhsNative)):
      return lhsNative == rhsNative
    case (._cocoa(let lhsCocoa), ._cocoa(let rhsCocoa)):
  #if _runtime(_ObjC)
      return lhsCocoa == rhsCocoa
  #else
      _sanityCheckFailure("internal error: unexpected cocoa Set")
  #endif
    default:
      _preconditionFailure("comparing indexes from different sets")
    }
  }

  public static func < (
    lhs: Set<Element>.Index,
    rhs: Set<Element>.Index
  ) -> Bool {
    if _fastPath(lhs._guaranteedNative) {
      return lhs._nativeIndex < rhs._nativeIndex
    }

    switch (lhs._value, rhs._value) {
    case (._native(let lhsNative), ._native(let rhsNative)):
      return lhsNative < rhsNative
    case (._cocoa(let lhsCocoa), ._cocoa(let rhsCocoa)):
  #if _runtime(_ObjC)
      return lhsCocoa < rhsCocoa
  #else
      _sanityCheckFailure("internal error: unexpected cocoa Set")
  #endif
    default:
      _preconditionFailure("comparing indexes from different sets")
    }
  }
}

#if _runtime(_ObjC)
@_versioned
final internal class _CocoaSetIterator : IteratorProtocol {
  internal typealias Element = AnyObject

  // Cocoa Set iterator has to be a class, otherwise we cannot
  // guarantee that the fast enumeration struct is pinned to a certain memory
  // location.

  // This stored property should be stored at offset zero.  There's code below
  // relying on this.
  internal var _fastEnumerationState: _SwiftNSFastEnumerationState =
    _makeSwiftNSFastEnumerationState()

  // This stored property should be stored right after `_fastEnumerationState`.
  // There's code below relying on this.
  internal var _fastEnumerationStackBuf = _CocoaFastEnumerationStackBuf()

  internal let cocoaSet: _NSSet

  internal var _fastEnumerationStatePtr:
    UnsafeMutablePointer<_SwiftNSFastEnumerationState> {
    return _getUnsafePointerToStoredProperties(self).assumingMemoryBound(
      to: _SwiftNSFastEnumerationState.self)
  }

  internal var _fastEnumerationStackBufPtr:
    UnsafeMutablePointer<_CocoaFastEnumerationStackBuf> {
    return UnsafeMutableRawPointer(_fastEnumerationStatePtr + 1)
      .assumingMemoryBound(to: _CocoaFastEnumerationStackBuf.self)
  }

  // These members have to be word-sized integers, they cannot be limited to
  // Int8 just because our storage holds 16 elements: fast enumeration is
  // allowed to return inner pointers to the container, which can be much
  // larger.
  internal var itemIndex: Int = 0
  internal var itemCount: Int = 0

  @_versioned
  internal init(_ cocoaSet: _NSSet) {
    self.cocoaSet = cocoaSet
  }

  @_versioned
  internal func next() -> Element? {
    if itemIndex < 0 {
      return nil
    }
    let cocoaSet = self.cocoaSet
    if itemIndex == itemCount {
      let stackBufCount = _fastEnumerationStackBuf.count
      // We can't use `withUnsafeMutablePointer` here to get pointers to
      // properties, because doing so might introduce a writeback storage, but
      // fast enumeration relies on the pointer identity of the enumeration
      // state struct.
      itemCount = cocoaSet.countByEnumerating(
        with: _fastEnumerationStatePtr,
        objects: UnsafeMutableRawPointer(_fastEnumerationStackBufPtr)
          .assumingMemoryBound(to: AnyObject.self),
        count: stackBufCount)
      if itemCount == 0 {
        itemIndex = -1
        return nil
      }
      itemIndex = 0
    }
    let itemsPtrUP =
    UnsafeMutableRawPointer(_fastEnumerationState.itemsPtr!)
      .assumingMemoryBound(to: AnyObject.self)
    let itemsPtr = _UnmanagedAnyObjectArray(itemsPtrUP)
    let key: AnyObject = itemsPtr[itemIndex]
    itemIndex += 1
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4893)
    return key
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4898)
  }
}
#else
final internal class _CocoaSetIterator {}
#endif

@_versioned
internal enum SetIteratorRepresentation<Element : Hashable> {
  internal typealias _Iterator = SetIterator<Element>
  internal typealias _NativeBuffer =
    _NativeSetBuffer<Element>
  internal typealias _NativeIndex = _Iterator._NativeIndex

  // For native buffer, we keep two indices to keep track of the iteration
  // progress and the buffer owner to make the buffer non-uniquely
  // referenced.
  //
  // Iterator is iterating over a frozen view of the collection
  // state, so it should keep its own reference to the buffer.
  case _native(
    start: _NativeIndex, end: _NativeIndex, buffer: _NativeBuffer)
  case _cocoa(_CocoaSetIterator)
}

/// An iterator over the members of a `Set<Element>`.
public struct SetIterator<Element : Hashable> : IteratorProtocol {
  // Set has a separate IteratorProtocol and Index because of efficiency
  // and implementability reasons.
  //
  // Index for native buffer is efficient.  Index for bridged NSSet is
  // not.
  //
  // Even though fast enumeration is not suitable for implementing
  // Index, which is multi-pass, it is suitable for implementing a
  // IteratorProtocol, which is being consumed as iteration proceeds.

  internal typealias _NativeBuffer =
    _NativeSetBuffer<Element>
  internal typealias _NativeIndex = _NativeSetIndex<Element>

  @_versioned
  internal var _state: SetIteratorRepresentation<Element>

  @_versioned
  internal static func _native(
    start: _NativeIndex, end: _NativeIndex, buffer: _NativeBuffer
  ) -> SetIterator {
    return SetIterator(
      _state: ._native(start: start, end: end, buffer: buffer))
  }
#if _runtime(_ObjC)
  @_versioned
  internal static func _cocoa(
    _ iterator: _CocoaSetIterator
  ) -> SetIterator{
    return SetIterator(_state: ._cocoa(iterator))
  }
#endif

  @_versioned
  @_transparent
  internal var _guaranteedNative: Bool {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4961)
    return _canBeClass(Element.self) == 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4965)
  }

  @_versioned
  internal mutating func _nativeNext() -> Element? {
    switch _state {
    case ._native(let startIndex, let endIndex, let buffer):
      if startIndex == endIndex {
        return nil
      }
      let result = buffer.assertingGet(startIndex)
      _state =
        ._native(start: buffer.index(after: startIndex), end: endIndex, buffer: buffer)
      return result
    case ._cocoa:
      _sanityCheckFailure("internal error: not backed by NSSet")
    }
  }

  /// Advances to the next element and returns it, or `nil` if no next element
  /// exists.
  ///
  /// Once `nil` has been returned, all subsequent calls return `nil`.
  @inline(__always)
  public mutating func next() -> Element? {
    if _fastPath(_guaranteedNative) {
      return _nativeNext()
    }

    switch _state {
    case ._native:
      return _nativeNext()
    case ._cocoa(let cocoaIterator):
#if _runtime(_ObjC)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4999)
      if let anyObjectElement = cocoaIterator.next() {
        return _forceBridgeFromObjectiveC(anyObjectElement, Element.self)
      }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 5009)
      return nil
#else
      _sanityCheckFailure("internal error: unexpected cocoa Set")
#endif
    }
  }
}

extension SetIterator : CustomReflectable {
  /// A mirror that reflects the iterator.
  public var customMirror: Mirror {
    return Mirror(
      self,
      children: EmptyCollection<(label: String?, value: Any)>())
  }
}

extension Set : CustomReflectable {
  /// A mirror that reflects the set.
  public var customMirror: Mirror {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 5030)
    let style = Mirror.DisplayStyle.`set`
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 5034)
    return Mirror(self, unlabeledChildren: self, displayStyle: style)
  }
}

/// Initializes a `Set` from unique members.
///
/// Using a builder can be faster than inserting members into an empty
/// `Set`.
public struct _SetBuilder<Element : Hashable> {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 5044)
  public typealias Key = Element
  public typealias Value = Element
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 5047)

  internal var _result: Set<Element>
  internal var _nativeBuffer: _NativeSetBuffer<Element>
  internal let _requestedCount: Int
  internal var _actualCount: Int

  public init(count: Int) {
    let requiredCapacity =
      _NativeSetBuffer<Element>.minimumCapacity(
        minimumCount: count,
        maxLoadFactorInverse: _hashContainerDefaultMaxLoadFactorInverse)
    _result = Set<Element>(minimumCapacity: requiredCapacity)
    _nativeBuffer = _result._variantBuffer.asNative
    _requestedCount = count
    _actualCount = 0
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 5065)
  public mutating func add(member newKey: Key) {
    _nativeBuffer.unsafeAddNew(key: newKey)
    _actualCount += 1
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 5075)

  public mutating func take() -> Set<Element> {
    _precondition(_actualCount >= 0,
      "cannot take the result twice")
    _precondition(_actualCount == _requestedCount,
      "the number of members added does not match the promised count")

    // Finish building the `Set`.
    _nativeBuffer.count = _requestedCount

    // Prevent taking the result twice.
    _actualCount = -1
    return _result
  }
}

extension Set {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 5093)
  /// Removes and returns the first element of the set.
  ///
  /// Because a set is not an ordered collection, the "first" element may not
  /// be the first element that was added to the set.
  ///
  /// - Returns: A member of the set. If the set is empty, returns `nil`.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 5111)
  public mutating func popFirst() -> Element? {
    guard !isEmpty else { return nil }
    return remove(at: startIndex)
  }
}

//===--- Bridging ---------------------------------------------------------===//

#if _runtime(_ObjC)
extension Set {
  public func _bridgeToObjectiveCImpl() -> _NSSetCore {
    switch _variantBuffer {
    case _VariantSetBuffer.native(let buffer):
      return buffer.bridged()
    case _VariantSetBuffer.cocoa(let cocoaBuffer):
      return cocoaBuffer.cocoaSet
    }
  }

  /// Returns the native Dictionary hidden inside this NSDictionary;
  /// returns nil otherwise.
  public static func _bridgeFromObjectiveCAdoptingNativeStorageOf(
    _ s: AnyObject
  ) -> Set<Element>? {

    // Try all three NSSet impls that we currently provide.

    if let deferredBuffer = s as? _SwiftDeferredNSSet<Element> {
      return Set(_nativeBuffer: deferredBuffer.nativeBuffer)
    }

    if let nativeStorage = s as? _HashableTypedNativeSetStorage<Element> {
      return Set(_nativeBuffer: 
          _NativeSetBuffer(_storage: nativeStorage))
    }

    if s === _RawNativeSetStorage.empty {
      return Set()
    }
    
    // FIXME: what if `s` is native storage, but for different key/value type?
    return nil
  }
}
#endif

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2470)

/// An instance of this class has all `Dictionary` data tail-allocated.
/// Enough bytes are allocated to hold the bitmap for marking valid entries,
/// keys, and values. The data layout starts with the bitmap, followed by the
/// keys, followed by the values.
//
// See the docs at the top of the file for more details on this type
//
// NOTE: The precise layout of this type is relied on in the runtime
// to provide a statically allocated empty singleton. 
// See stdlib/public/stubs/GlobalObjects.cpp for details.
@objc_non_lazy_realization
internal class _RawNativeDictionaryStorage:
  _SwiftNativeNSDictionary, _NSDictionaryCore
{
  internal typealias RawStorage = _RawNativeDictionaryStorage
  
  internal final var capacity: Int
  internal final var count: Int

  internal final var initializedEntries: _UnsafeBitMap
  internal final var keys: UnsafeMutableRawPointer
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2493)
  internal final var values: UnsafeMutableRawPointer
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2495)

  // This API is unsafe and needs a `_fixLifetime` in the caller.
  internal final
  var _initializedHashtableEntriesBitMapBuffer: UnsafeMutablePointer<UInt> {
    return UnsafeMutablePointer(Builtin.projectTailElems(self, UInt.self))
  }

  /// The empty singleton that is used for every single Dictionary that is
  /// created without any elements. The contents of the storage should never
  /// be mutated.
  internal static var empty: RawStorage {
    return Builtin.bridgeFromRawPointer(
      Builtin.addressof(&_swiftEmptyDictionaryStorage))
  }

  // This type is made with allocWithTailElems, so no init is ever called.
  // But we still need to have an init to satisfy the compiler.
  internal init(_doNotCallMe: ()) {
    _sanityCheckFailure("Only create this by using the `empty` singleton")
  }

#if _runtime(_ObjC)
  //
  // NSDictionary implementation, assuming Self is the empty singleton
  //

  /// Get the NSEnumerator implementation for self.
  /// _HashableTypedNativeDictionaryStorage overloads this to give 
  /// _NativeSelfNSEnumerator proper type parameters.
  func enumerator() -> _NSEnumerator {
    return _NativeDictionaryNSEnumerator<AnyObject, AnyObject>(
        _NativeDictionaryBuffer(_storage: self))
  }

  @objc(copyWithZone:)
  func copy(with zone: _SwiftNSZone?) -> AnyObject {
    return self
  }

  @objc(countByEnumeratingWithState:objects:count:)
  func countByEnumerating(
    with state: UnsafeMutablePointer<_SwiftNSFastEnumerationState>,
    objects: UnsafeMutablePointer<AnyObject>?, count: Int
  ) -> Int {
    // Even though we never do anything in here, we need to update the
    // state so that callers know we actually ran.
    
    var theState = state.pointee
    if theState.state == 0 {
      theState.state = 1 // Arbitrary non-zero value.
      theState.itemsPtr = AutoreleasingUnsafeMutablePointer(objects)
      theState.mutationsPtr = _fastEnumerationStorageMutationsPtr
    }
    state.pointee = theState
    
    return 0
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2571)

  @objc
  internal required init(
    objects: UnsafePointer<AnyObject?>,
    forKeys: UnsafeRawPointer,
    count: Int
  ) {
    _sanityCheckFailure("don't call this designated initializer")
  }

  @objc(objectForKey:)
  func objectFor(_ aKey: AnyObject) -> AnyObject? {
    return nil
  }

  func keyEnumerator() -> _NSEnumerator {
    return enumerator()
  }

  func getObjects(_ objects: UnsafeMutablePointer<AnyObject>?,
    andKeys keys: UnsafeMutablePointer<AnyObject>?) {
    // Do nothing, we're empty
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2596)
#endif
}

// See the docs at the top of this file for a description of this type
@_versioned
internal class _TypedNativeDictionaryStorage<Key, Value> :
  _RawNativeDictionaryStorage {

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2608)

  deinit {
    let keys = self.keys.assumingMemoryBound(to: Key.self)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2612)
    let values = self.values.assumingMemoryBound(to: Value.self)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2614)

    if !_isPOD(Key.self) {
      for i in 0 ..< capacity {
        if initializedEntries[i] {
          (keys+i).deinitialize()
        }
      }
    }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2624)
    if !_isPOD(Value.self) {
      for i in 0 ..< capacity {
        if initializedEntries[i] {
          (values+i).deinitialize()
        }
      }
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2632)
    _fixLifetime(self)
  }

  // This type is made with allocWithTailElems, so no init is ever called.
  // But we still need to have an init to satisfy the compiler.
  override internal init(_doNotCallMe: ()) {
    _sanityCheckFailure("Only create this by calling Buffer's inits")
  }

#if _runtime(_ObjC)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2648)
  @objc
  internal required init(
    objects: UnsafePointer<AnyObject?>,
    forKeys: UnsafeRawPointer,
    count: Int
  ) {
    _sanityCheckFailure("don't call this designated initializer")
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2657)
#endif
}


// See the docs at the top of this file for a description of this type
@_versioned
final internal class _HashableTypedNativeDictionaryStorage<Key : Hashable, Value> :
  _TypedNativeDictionaryStorage<Key, Value> {

  internal typealias FullContainer = Dictionary<Key, Value>
  internal typealias Buffer = _NativeDictionaryBuffer<Key, Value>

  // This type is made with allocWithTailElems, so no init is ever called.
  // But we still need to have an init to satisfy the compiler.
  override internal init(_doNotCallMe: ()) {
    _sanityCheckFailure("Only create this by calling Buffer's inits'")
  }

  
#if _runtime(_ObjC)
  // NSDictionary bridging:

  // All actual functionality comes from buffer/full, which are
  // just wrappers around a RawNativeDictionaryStorage.
  
  var buffer: Buffer {
    return Buffer(_storage: self)
  }

  var full: FullContainer {
    return FullContainer(_nativeBuffer: buffer)
  }

  override func enumerator() -> _NSEnumerator {
    return _NativeDictionaryNSEnumerator<Key, Value>(
        Buffer(_storage: self))
  }

  @objc(countByEnumeratingWithState:objects:count:)
  override func countByEnumerating(
    with state: UnsafeMutablePointer<_SwiftNSFastEnumerationState>,
    objects: UnsafeMutablePointer<AnyObject>?, count: Int
  ) -> Int {
    var theState = state.pointee
    if theState.state == 0 {
      theState.state = 1 // Arbitrary non-zero value.
      theState.itemsPtr = AutoreleasingUnsafeMutablePointer(objects)
      theState.mutationsPtr = _fastEnumerationStorageMutationsPtr
      theState.extra.0 = CUnsignedLong(full.startIndex._nativeIndex.offset)
    }

    // Test 'objects' rather than 'count' because (a) this is very rare anyway,
    // and (b) the optimizer should then be able to optimize away the
    // unwrapping check below.
    if _slowPath(objects == nil) {
      return 0
    }

    let unmanagedObjects = _UnmanagedAnyObjectArray(objects!)
    var currIndex = _NativeDictionaryIndex<Key, Value>(
        offset: Int(theState.extra.0))
    let endIndex = buffer.endIndex
    var stored = 0
    for i in 0..<count {
      if (currIndex == endIndex) {
        break
      }

      unmanagedObjects[i] = buffer.bridgedKey(at: currIndex)
      
      stored += 1
      buffer.formIndex(after: &currIndex)
    }
    theState.extra.0 = CUnsignedLong(currIndex.offset)
    state.pointee = theState
    return stored
  }

  internal func getObjectFor(_ aKey: AnyObject) -> AnyObject? {
    guard let nativeKey = _conditionallyBridgeFromObjectiveC(aKey, Key.self)
    else { return nil }

    let (i, found) = buffer._find(nativeKey, 
        startBucket: buffer._bucket(nativeKey))

    if found {
      return buffer.bridgedValue(at: i)
    }
    return nil
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2761)
  
  @objc
  internal required init(
    objects: UnsafePointer<AnyObject?>,
    forKeys: UnsafeRawPointer,
    count: Int
  ) {
    _sanityCheckFailure("don't call this designated initializer")
  }

  @objc(objectForKey:)
  override func objectFor(_ aKey: AnyObject) -> AnyObject? {
    return getObjectFor(aKey)
  }

  // We also override the following methods for efficiency.
  @objc
  override func getObjects(_ objects: UnsafeMutablePointer<AnyObject>?,
    andKeys keys: UnsafeMutablePointer<AnyObject>?) {
    // The user is expected to provide a storage of the correct size
    if let unmanagedKeys = _UnmanagedAnyObjectArray(keys) {
      if let unmanagedObjects = _UnmanagedAnyObjectArray(objects) {
        // keys nonnull, objects nonnull
        for (offset: i, element: (key: key, value: val)) in full.enumerated() {
          unmanagedObjects[i] = _bridgeAnythingToObjectiveC(val)
          unmanagedKeys[i] = _bridgeAnythingToObjectiveC(key)
        }
      } else {
        // keys nonnull, objects null
        for (offset: i, element: (key: key, value: _)) in full.enumerated() {
          unmanagedKeys[i] = _bridgeAnythingToObjectiveC(key)
        }
      }
    } else {
      if let unmanagedObjects = _UnmanagedAnyObjectArray(objects) {
        // keys null, objects nonnull
        for (offset: i, element: (key: _, value: val)) in full.enumerated() {
          unmanagedObjects[i] = _bridgeAnythingToObjectiveC(val)
        }
      } else {
        // do nothing, both are null
      }
    }
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2806)
#endif
}


/// A wrapper around _RawNativeDictionaryStorage that provides most of the 
/// implementation of Dictionary.
///
/// This type and most of its functionality doesn't require Hashable at all.
/// The reason for this is to support storing AnyObject for bridging
/// with _SwiftDeferredNSDictionary. What functionality actually relies on
/// Hashable can be found in an extension.
@_versioned
@_fixed_layout
internal struct _NativeDictionaryBuffer<Key, Value> {

  internal typealias RawStorage = _RawNativeDictionaryStorage
  internal typealias TypedStorage = _TypedNativeDictionaryStorage<Key, Value>
  internal typealias Buffer = _NativeDictionaryBuffer<Key, Value>
  internal typealias Index = _NativeDictionaryIndex<Key, Value>

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2831)
  internal typealias SequenceElementWithoutLabels = (Key, Value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2833)

  /// See this comments on _RawNativeDictionaryStorage and its subclasses to
  /// understand why we store an untyped storage here.
  internal var _storage: RawStorage

  /// Creates a Buffer with a storage that is typed, but doesn't understand
  /// Hashing. Mostly for bridging; prefer `init(capacity:)`.
  internal init(capacity: Int, unhashable: ()) {
    let numWordsForBitmap = _UnsafeBitMap.sizeInWords(forSizeInBits: capacity)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2843)
    let storage = Builtin.allocWithTailElems_3(TypedStorage.self,
        numWordsForBitmap._builtinWordValue, UInt.self,
        capacity._builtinWordValue, Key.self,
        capacity._builtinWordValue, Value.self)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2852)
    self.init(capacity: capacity, storage: storage)
  }

  /// Given a capacity and uninitialized RawStorage, completes the 
  /// initialization and returns a Buffer.  
  internal init(capacity: Int, storage: RawStorage) {
    storage.capacity = capacity
    storage.count = 0
    
    self.init(_storage: storage)

    let initializedEntries = _UnsafeBitMap(
        storage: _initializedHashtableEntriesBitMapBuffer,
        bitCount: capacity)
    initializedEntries.initializeToZero()

    // Compute all the array offsets now, so we don't have to later
    let bitmapAddr = Builtin.projectTailElems(_storage, UInt.self)
    let numWordsForBitmap = _UnsafeBitMap.sizeInWords(forSizeInBits: capacity)
    let keysAddr = Builtin.getTailAddr_Word(bitmapAddr,
           numWordsForBitmap._builtinWordValue, UInt.self, Key.self)

    // Initialize header
    _storage.initializedEntries = initializedEntries
    _storage.keys = UnsafeMutableRawPointer(keysAddr)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2878)
    let valuesAddr = Builtin.getTailAddr_Word(keysAddr,
        capacity._builtinWordValue, Key.self, Value.self)
    _storage.values = UnsafeMutableRawPointer(valuesAddr)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2882)
  }

  // Forwarding the individual fields of the storage in various forms

  @_versioned
  internal var capacity: Int {
    return _assumeNonNegative(_storage.capacity)
  }

  @_versioned
  internal var count: Int {
    set {
      _storage.count = newValue
    }
    get {
      return _assumeNonNegative(_storage.count)
    }
  }

  internal
  var _initializedHashtableEntriesBitMapBuffer: UnsafeMutablePointer<UInt> {
    return _storage._initializedHashtableEntriesBitMapBuffer
  }

  // This API is unsafe and needs a `_fixLifetime` in the caller.
  @_versioned
  internal var keys: UnsafeMutablePointer<Key> {
    return _storage.keys.assumingMemoryBound(to: Key.self)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2913)
  // This API is unsafe and needs a `_fixLifetime` in the caller.
  @_versioned
  internal var values: UnsafeMutablePointer<Value> {
    return _storage.values.assumingMemoryBound(to: Value.self)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2919)

  /// Constructs a buffer adopting the given storage.
  init(_storage: RawStorage) {
    self._storage = _storage
  }

  /// Constructs an instance from the empty singleton.
  init() {
    self._storage = RawStorage.empty
  }



  // Most of the implementation of the _HashBuffer protocol,
  // but only the parts that don't actually rely on hashing.

  @_versioned
  @inline(__always)
  internal func key(at i: Int) -> Key {
    _sanityCheck(i >= 0 && i < capacity)
    _sanityCheck(isInitializedEntry(at: i))
    defer { _fixLifetime(self) }

    let res = (keys + i).pointee
    return res
  }

#if _runtime(_ObjC)
  /// Returns the key at the given Index, bridged.
  ///
  /// Intended for use with verbatim bridgeable keys.
  internal func bridgedKey(at index: Index) -> AnyObject {
    let k = key(at: index.offset)
    return _bridgeAnythingToObjectiveC(k)
  }

  /// Returns the value at the given Index, bridged.
  ///
  /// Intended for use with verbatim bridgeable keys.
  internal func bridgedValue(at index: Index) -> AnyObject {
    let v = value(at: index.offset)
    return _bridgeAnythingToObjectiveC(v)
  }
#endif

  @_versioned
  internal func isInitializedEntry(at i: Int) -> Bool {
    _sanityCheck(i >= 0 && i < capacity)
    defer { _fixLifetime(self) }

    return _storage.initializedEntries[i]
  }

  @_transparent
  internal func destroyEntry(at i: Int) {
    _sanityCheck(isInitializedEntry(at: i))
    defer { _fixLifetime(self) }

    (keys + i).deinitialize()
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2979)
    (values + i).deinitialize()
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 2981)
    _storage.initializedEntries[i] = false
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3021)
  @_transparent
  internal func initializeKey(_ k: Key, value v: Value, at i: Int) {
    _sanityCheck(!isInitializedEntry(at: i))
    defer { _fixLifetime(self) }

    (keys + i).initialize(to: k)
    (values + i).initialize(to: v)
    _storage.initializedEntries[i] = true
  }

  @_transparent
  internal func moveInitializeEntry(from: Buffer, at: Int, toEntryAt: Int) {
    _sanityCheck(!isInitializedEntry(at: toEntryAt))
    defer { _fixLifetime(self) }

    (keys + toEntryAt).initialize(to: (from.keys + at).move())
    (values + toEntryAt).initialize(to: (from.values + at).move())
    from._storage.initializedEntries[at] = false
    _storage.initializedEntries[toEntryAt] = true
  }

  @_versioned
  @_transparent
  internal func value(at i: Int) -> Value {
    _sanityCheck(isInitializedEntry(at: i))
    defer { _fixLifetime(self) }

    return (values + i).pointee
  }

  @_transparent
  internal func setKey(_ key: Key, value: Value, at i: Int) {
    _sanityCheck(isInitializedEntry(at: i))
    defer { _fixLifetime(self) }

    (keys + i).pointee = key
    (values + i).pointee = value
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3061)

  @_versioned
  internal var startIndex: Index {
    // We start at "index after -1" instead of "0" because we need to find the
    // first occupied slot.
    return index(after: Index(offset: -1))
  }

  @_versioned
  internal var endIndex: Index {
    return Index(offset: capacity)
  }

  @_versioned
  internal func index(after i: Index) -> Index {
    _precondition(i != endIndex)
    var idx = i.offset + 1
    while idx < capacity && !isInitializedEntry(at: idx) {
      idx += 1
    }

    return Index(offset: idx)
  }

  @_versioned
  internal func formIndex(after i: inout Index) {
    i = index(after: i)
  }

  
  internal func assertingGet(_ i: Index) -> SequenceElement {
    _precondition(i.offset >= 0 && i.offset < capacity)
    _precondition(
      isInitializedEntry(at: i.offset),
      "attempting to access Dictionary elements using an invalid Index")
    let key = self.key(at: i.offset)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3100)
    return (key, self.value(at: i.offset))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3102)

  }
}

extension _NativeDictionaryBuffer 
  where Key : Hashable
{
  internal typealias HashTypedStorage = 
    _HashableTypedNativeDictionaryStorage<Key, Value>
  internal typealias SequenceElement = (key: Key, value: Value)

  @inline(__always)
  internal init(minimumCapacity: Int) {
    // Make sure there's a representable power of 2 >= minimumCapacity
    _sanityCheck(minimumCapacity <= (Int.max >> 1) + 1)
    var capacity = 2
    while capacity < minimumCapacity {
      capacity <<= 1
    }
    self.init(capacity: capacity)
  }

  /// Create a buffer instance with room for at least 'capacity'
  /// entries and all entries marked invalid.
  internal init(capacity: Int) {
    let numWordsForBitmap = _UnsafeBitMap.sizeInWords(forSizeInBits: capacity)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3129)
    let storage = Builtin.allocWithTailElems_3(HashTypedStorage.self,
        numWordsForBitmap._builtinWordValue, UInt.self,
        capacity._builtinWordValue, Key.self,
        capacity._builtinWordValue, Value.self)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3138)
    self.init(capacity: capacity, storage: storage)
  }

#if _runtime(_ObjC)
  func bridged() -> _NSDictionary {
    // We can zero-cost bridge if our keys are verbatim
    // or if we're the empty singleton.

    // Temporary var for SOME type safety before a cast.
    let nsSet: _NSDictionaryCore

    if (_isBridgedVerbatimToObjectiveC(Key.self) &&
        _isBridgedVerbatimToObjectiveC(Value.self)) ||
        self._storage === RawStorage.empty {
      nsSet = self._storage
    } else {
      nsSet = _SwiftDeferredNSDictionary(nativeBuffer: self)
    }

    // Cast from "minimal NSDictionary" to "NSDictionary"
    // Note that if you actually ask Swift for this cast, it will fail.
    // Never trust a shadow protocol!
    return unsafeBitCast(nsSet, to: _NSDictionary.self)
  }
#endif

  /// A textual representation of `self`.
  var description: String {
    var result = ""
#if INTERNAL_CHECKS_ENABLED
    for i in 0..<capacity {
      if isInitializedEntry(at: i) {
        let key = self.key(at: i)
        result += "bucket \(i), ideal bucket = \(_bucket(key)), key = \(key)\n"
      } else {
        result += "bucket \(i), empty\n"
      }
    }
#endif
    return result
  }

  internal var _bucketMask: Int {
    // The capacity is not negative, therefore subtracting 1 will not overflow.
    return capacity &- 1
  }

  @_versioned
  @inline(__always) // For performance reasons.
  internal func _bucket(_ k: Key) -> Int {
    return _squeezeHashValue(k.hashValue, capacity)
  }

  @_versioned
  internal func _index(after bucket: Int) -> Int {
    // Bucket is within 0 and capacity. Therefore adding 1 does not overflow.
    return (bucket &+ 1) & _bucketMask
  }

  internal func _prev(_ bucket: Int) -> Int {
    // Bucket is not negative. Therefore subtracting 1 does not overflow.
    return (bucket &- 1) & _bucketMask
  }

  /// Search for a given key starting from the specified bucket.
  ///
  /// If the key is not present, returns the position where it could be
  /// inserted.
  @_versioned
  @inline(__always)
  internal func _find(_ key: Key, startBucket: Int)
    -> (pos: Index, found: Bool) {

    var bucket = startBucket

    // The invariant guarantees there's always a hole, so we just loop
    // until we find one
    while true {
      let isHole = !isInitializedEntry(at: bucket)
      if isHole {
        return (Index(offset: bucket), false)
      }
      if self.key(at: bucket) == key {
        return (Index(offset: bucket), true)
      }
      bucket = _index(after: bucket)
    }
  }

  @_transparent
  internal static func minimumCapacity(
    minimumCount: Int,
    maxLoadFactorInverse: Double
  ) -> Int {
    // `minimumCount + 1` below ensures that we don't fill in the last hole
    return max(Int(Double(minimumCount) * maxLoadFactorInverse),
               minimumCount + 1)
  }

  /// Buffer should be uniquely referenced.
  /// The `key` should not be present in the Dictionary.
  /// This function does *not* update `count`.

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3251)

  internal func unsafeAddNew(key newKey: Key, value: Value) {
    let (i, found) = _find(newKey, startBucket: _bucket(newKey))
    _sanityCheck(
      !found, "unsafeAddNew was called, but the key is already present")
    initializeKey(newKey, value: value, at: i.offset)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3260)

  //
  // _HashBuffer conformance
  //

  @_versioned
  @inline(__always)
  internal func index(forKey key: Key) -> Index? {
    if count == 0 {
      // Fast path that avoids computing the hash of the key.
      return nil
    }
    let (i, found) = _find(key, startBucket: _bucket(key))
    return found ? i : nil
  }


  internal func assertingGet(_ key: Key) -> Value {
    let (i, found) = _find(key, startBucket: _bucket(key))
    _precondition(found, "key not found")
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3283)
    return self.value(at: i.offset)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3285)
  }

  @_versioned
  @inline(__always)
  internal func maybeGet(_ key: Key) -> Value? {
    if count == 0 {
      // Fast path that avoids computing the hash of the key.
      return nil
    }

    let (i, found) = _find(key, startBucket: _bucket(key))
    if found {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3300)
      return self.value(at: i.offset)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3302)
    }
    return nil
  }

  @discardableResult
  internal func updateValue(_ value: Value, forKey key: Key) -> Value? {
    _sanityCheckFailure(
      "don't call mutating methods on _NativeDictionaryBuffer")
  }

  @discardableResult
  internal func insert(
    _ value: Value, forKey key: Key
  ) -> (inserted: Bool, memberAfterInsert: Value) {
    _sanityCheckFailure(
      "don't call mutating methods on _NativeDictionaryBuffer")
  }

  @discardableResult
  internal func remove(at index: Index) -> SequenceElement {
    _sanityCheckFailure(
      "don't call mutating methods on _NativeDictionaryBuffer")
  }

  @discardableResult
  internal func removeValue(forKey key: Key) -> Value? {
    _sanityCheckFailure(
      "don't call mutating methods on _NativeDictionaryBuffer")
  }

  internal func removeAll(keepingCapacity keepCapacity: Bool) {
    _sanityCheckFailure(
      "don't call mutating methods on _NativeDictionaryBuffer")
  }

  internal static func fromArray(_ elements: [SequenceElementWithoutLabels])
    -> Buffer 
  {
    if elements.isEmpty {
      return Buffer()
    }

    let requiredCapacity =
      Buffer.minimumCapacity(
        minimumCount: elements.count,
        maxLoadFactorInverse: _hashContainerDefaultMaxLoadFactorInverse)
    var nativeBuffer = Buffer(minimumCapacity: requiredCapacity)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3365)

    for (key, value) in elements {
      let (i, found) =
        nativeBuffer._find(key, startBucket: nativeBuffer._bucket(key))
      _precondition(!found, "Dictionary literal contains duplicate keys")
      nativeBuffer.initializeKey(key, value: value, at: i.offset)
    }
    nativeBuffer.count = elements.count

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3375)

    return nativeBuffer
  }
}

#if _runtime(_ObjC)
/// An NSEnumerator that works with any NativeDictionaryBuffer of
/// verbatim bridgeable elements. Used by the various NSDictionary impls.
final internal class _NativeDictionaryNSEnumerator<Key, Value>
  : _SwiftNativeNSEnumerator, _NSEnumerator {

  internal typealias Buffer = _NativeDictionaryBuffer<Key, Value>
  internal typealias Index = _NativeDictionaryIndex<Key, Value>

  internal override required init() {
    _sanityCheckFailure("don't call this designated initializer")
  }

  internal init(_ buffer: Buffer) {
    self.buffer = buffer
    nextIndex = buffer.startIndex
    endIndex = buffer.endIndex
  }

  internal var buffer: Buffer
  internal var nextIndex: Index
  internal var endIndex: Index

  //
  // NSEnumerator implementation.
  //
  // Do not call any of these methods from the standard library!
  //

  @objc
  internal func nextObject() -> AnyObject? {
    if nextIndex == endIndex {
      return nil
    }
    let key = buffer.bridgedKey(at: nextIndex)
    buffer.formIndex(after: &nextIndex)
    return key
  }

  @objc(countByEnumeratingWithState:objects:count:)
  internal func countByEnumerating(
    with state: UnsafeMutablePointer<_SwiftNSFastEnumerationState>,
    objects: UnsafeMutablePointer<AnyObject>,
    count: Int
  ) -> Int {
    var theState = state.pointee
    if theState.state == 0 {
      theState.state = 1 // Arbitrary non-zero value.
      theState.itemsPtr = AutoreleasingUnsafeMutablePointer(objects)
      theState.mutationsPtr = _fastEnumerationStorageMutationsPtr
    }

    if nextIndex == endIndex {
      state.pointee = theState
      return 0
    }

    // Return only a single element so that code can start iterating via fast
    // enumeration, terminate it, and continue via NSEnumerator.
    let key = buffer.bridgedKey(at: nextIndex)
    buffer.formIndex(after: &nextIndex)

    let unmanagedObjects = _UnmanagedAnyObjectArray(objects)
    unmanagedObjects[0] = key
    state.pointee = theState
    return 1
  }
}
#endif

#if _runtime(_ObjC)
/// This class exists for Objective-C bridging. It holds a reference to a
/// NativeDictionaryBuffer, and can be upcast to NSSelf when bridging is necessary.
/// This is the fallback implementation for situations where toll-free bridging
/// isn't possible. On first access, a NativeDictionaryBuffer of AnyObject will be
/// constructed containing all the bridged elements.
final internal class _SwiftDeferredNSDictionary<Key : Hashable, Value>
  : _SwiftNativeNSDictionary, _NSDictionaryCore {

  internal typealias NativeBuffer = _NativeDictionaryBuffer<Key, Value>
  internal typealias BridgedBuffer = _NativeDictionaryBuffer<AnyObject, AnyObject>
  internal typealias NativeIndex = _NativeDictionaryIndex<Key, Value>
  internal typealias BridgedIndex = _NativeDictionaryIndex<AnyObject, AnyObject>

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3468)

  internal init(minimumCapacity: Int = 2) {
    nativeBuffer = NativeBuffer(minimumCapacity: minimumCapacity)
    super.init()
  }

  internal init(nativeBuffer: NativeBuffer) {
    self.nativeBuffer = nativeBuffer
    super.init()
  }

  // This stored property should be stored at offset zero.  We perform atomic
  // operations on it.
  //
  // Do not access this property directly.
  internal var _heapStorageBridged_DoNotUse: AnyObject?

  /// The unbridged elements.
  internal var nativeBuffer: NativeBuffer

  @objc(copyWithZone:)
  internal func copy(with zone: _SwiftNSZone?) -> AnyObject {
    // Instances of this class should be visible outside of standard library as
    // having `NSDictionary` type, which is immutable.
    return self
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3520)
  //
  // NSDictionary implementation.
  //
  // Do not call any of these methods from the standard library!  Use only
  // `nativeBuffer`.
  //

  @objc
  internal required init(
    objects: UnsafePointer<AnyObject?>,
    forKeys: UnsafeRawPointer,
    count: Int
  ) {
    _sanityCheckFailure("don't call this designated initializer")
  }

  @objc(objectForKey:)
  internal func objectFor(_ aKey: AnyObject) -> AnyObject? {
    return bridgingObjectForKey(aKey)
  }

  @objc
  internal func keyEnumerator() -> _NSEnumerator {
    return enumerator()
  }

  @objc
  internal func getObjects(
    _ objects: UnsafeMutablePointer<AnyObject>?,
    andKeys keys: UnsafeMutablePointer<AnyObject>?
  ) {
    bridgedAllKeysAndValues(objects, keys)
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3554)

  /// Returns the pointer to the stored property, which contains bridged
  /// Dictionary elements.
  internal var _heapStorageBridgedPtr: UnsafeMutablePointer<AnyObject?> {
    return _getUnsafePointerToStoredProperties(self).assumingMemoryBound(
      to: Optional<AnyObject>.self)
  }

  /// The buffer for bridged Dictionary elements, if present.
  internal var _bridgedStorage:
    BridgedBuffer.RawStorage? {
    get {
      if let ref = _stdlib_atomicLoadARCRef(object: _heapStorageBridgedPtr) {
        return unsafeDowncast(ref, to: BridgedBuffer.RawStorage.self)
      }
      return nil
    }
  }

  /// Attach a buffer for bridged Dictionary elements.
  internal func _initializeHeapStorageBridged(_ newStorage: AnyObject) {
    _stdlib_atomicInitializeARCRef(
      object: _heapStorageBridgedPtr, desired: newStorage)
  }

  /// Returns the bridged Dictionary values.
  internal var bridgedBuffer: BridgedBuffer {
    return BridgedBuffer(_storage: _bridgedStorage!)
  }

  internal func bridgeEverything() {
    if _fastPath(_bridgedStorage != nil) {
      return
    }

    // FIXME: rdar://problem/19486139 (split bridged buffers for keys and values)
    // We bridge keys and values unconditionally here, even if one of them
    // actually is verbatim bridgeable (e.g. Dictionary<Int, AnyObject>).
    // Investigate only allocating the buffer for a Set in this case.

    // Create buffer for bridged data.
    let bridged = BridgedBuffer(capacity: nativeBuffer.capacity, unhashable: ())

    // Bridge everything.
    for i in 0..<nativeBuffer.capacity {
      if nativeBuffer.isInitializedEntry(at: i) {
        let key = _bridgeAnythingToObjectiveC(nativeBuffer.key(at: i))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3604)
        let val = _bridgeAnythingToObjectiveC(nativeBuffer.value(at: i))
        bridged.initializeKey(key, value: val, at: i)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3607)
      }
    }

    // Atomically put the bridged elements in place.
    _initializeHeapStorageBridged(bridged._storage)
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3615)

  internal func bridgedAllKeysAndValues(
    _ objects: UnsafeMutablePointer<AnyObject>?,
    _ keys: UnsafeMutablePointer<AnyObject>?
  ) {
    bridgeEverything()
    // The user is expected to provide a storage of the correct size
    var i = 0 // Position in the input storage
    let capacity = nativeBuffer.capacity

    if let unmanagedKeys = _UnmanagedAnyObjectArray(keys) {
      if let unmanagedObjects = _UnmanagedAnyObjectArray(objects) {
        // keys nonnull, objects nonnull
        for position in 0..<capacity {
          if bridgedBuffer.isInitializedEntry(at: position) {
            unmanagedObjects[i] = bridgedBuffer.value(at: position)
            unmanagedKeys[i] = bridgedBuffer.key(at: position)
            i += 1
          }
        }
      } else {
        // keys nonnull, objects null
        for position in 0..<capacity {
          if bridgedBuffer.isInitializedEntry(at: position) {
            unmanagedKeys[i] = bridgedBuffer.key(at: position)
            i += 1
          }
        }
      }
    } else {
      if let unmanagedObjects = _UnmanagedAnyObjectArray(objects) {
        // keys null, objects nonnull
        for position in 0..<capacity {
          if bridgedBuffer.isInitializedEntry(at: position) {
            unmanagedObjects[i] = bridgedBuffer.value(at: position)
            i += 1
          }
        }
      } else {
        // do nothing, both are null
      }
    }
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3660)

  @objc
  internal var count: Int {
    return nativeBuffer.count
  }

  internal func bridgingObjectForKey(_ aKey: AnyObject)
    -> AnyObject? {
    guard let nativeKey = _conditionallyBridgeFromObjectiveC(aKey, Key.self)
    else { return nil }

    let (i, found) = nativeBuffer._find(
      nativeKey, startBucket: nativeBuffer._bucket(nativeKey))
    if found {
      bridgeEverything()
      return bridgedBuffer.value(at: i.offset)
    }
    return nil
  }

  internal func enumerator() -> _NSEnumerator {
    bridgeEverything()
    return _NativeDictionaryNSEnumerator<AnyObject, AnyObject>(bridgedBuffer)
  }

  @objc(countByEnumeratingWithState:objects:count:)
  internal func countByEnumerating(
    with state: UnsafeMutablePointer<_SwiftNSFastEnumerationState>,
    objects: UnsafeMutablePointer<AnyObject>?,
    count: Int
  ) -> Int {
    var theState = state.pointee
    if theState.state == 0 {
      theState.state = 1 // Arbitrary non-zero value.
      theState.itemsPtr = AutoreleasingUnsafeMutablePointer(objects)
      theState.mutationsPtr = _fastEnumerationStorageMutationsPtr
      theState.extra.0 = CUnsignedLong(nativeBuffer.startIndex.offset)
    }

    // Test 'objects' rather than 'count' because (a) this is very rare anyway,
    // and (b) the optimizer should then be able to optimize away the
    // unwrapping check below.
    if _slowPath(objects == nil) {
      return 0
    }

    let unmanagedObjects = _UnmanagedAnyObjectArray(objects!)
    var currIndex = _NativeDictionaryIndex<Key, Value>(
        offset: Int(theState.extra.0))
    let endIndex = nativeBuffer.endIndex
    var stored = 0

    // Only need to bridge once, so we can hoist it out of the loop.
    if (currIndex != endIndex) {
      bridgeEverything()
    }
    
    for i in 0..<count {
      if (currIndex == endIndex) {
        break
      }

      let bridgedKey = bridgedBuffer.key(at: currIndex.offset)
      unmanagedObjects[i] = bridgedKey
      stored += 1
      nativeBuffer.formIndex(after: &currIndex)
    }
    theState.extra.0 = CUnsignedLong(currIndex.offset)
    state.pointee = theState
    return stored
  }
}
#else
final internal class _SwiftDeferredNSDictionary<Key : Hashable, Value> { }
#endif

#if _runtime(_ObjC)
@_versioned
@_fixed_layout
internal struct _CocoaDictionaryBuffer : _HashBuffer {
  @_versioned
  internal var cocoaDictionary: _NSDictionary

  internal typealias Index = _CocoaDictionaryIndex
  internal typealias SequenceElement = (AnyObject, AnyObject)
  internal typealias SequenceElementWithoutLabels = (AnyObject, AnyObject)

  internal typealias Key = AnyObject
  internal typealias Value = AnyObject

  internal var startIndex: Index {
    return Index(cocoaDictionary, startIndex: ())
  }

  internal var endIndex: Index {
    return Index(cocoaDictionary, endIndex: ())
  }

  @_versioned
  internal func index(after i: Index) -> Index {
    return i.successor()
  }

  internal func formIndex(after i: inout Index) {
    // FIXME: swift-3-indexing-model: optimize if possible.
    i = i.successor()
  }

  @_versioned
  internal func index(forKey key: Key) -> Index? {
    // Fast path that does not involve creating an array of all keys.  In case
    // the key is present, this lookup is a penalty for the slow path, but the
    // potential savings are significant: we could skip a memory allocation and
    // a linear search.
    if maybeGet(key) == nil {
      return nil
    }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3781)
    let allKeys = _stdlib_NSDictionary_allKeys(cocoaDictionary)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3783)
    var keyIndex = -1
    for i in 0..<allKeys.value {
      if _stdlib_NSObject_isEqual(key, allKeys[i]) {
        keyIndex = i
        break
      }
    }
    _sanityCheck(keyIndex >= 0,
        "key was found in fast path, but not found later?")
    return Index(cocoaDictionary, allKeys, keyIndex)
  }

  internal func assertingGet(_ i: Index) -> SequenceElement {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3801)
    let key: Key = i.allKeys[i.currentKeyIndex]
    let value: Value = i.cocoaDictionary.objectFor(key)!
    return (key, value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3805)

  }

  internal func assertingGet(_ key: Key) -> Value {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3814)
    let value: Value? = cocoaDictionary.objectFor(key)
    _precondition(value != nil, "key not found in underlying NSDictionary")
    return value!
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3818)
  }

  @inline(__always)
  internal func maybeGet(_ key: Key) -> Value? {

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3826)
  return cocoaDictionary.objectFor(key)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3828)

  }

  @discardableResult
  internal mutating func updateValue(_ value: Value, forKey key: Key) -> Value? {
    _sanityCheckFailure("cannot mutate NSDictionary")
  }

  @discardableResult
  internal mutating func insert(
    _ value: Value, forKey key: Key
  ) -> (inserted: Bool, memberAfterInsert: Value) {
    _sanityCheckFailure("cannot mutate NSDictionary")
  }

  @discardableResult
  internal mutating func remove(at index: Index) -> SequenceElement {
    _sanityCheckFailure("cannot mutate NSDictionary")
  }

  @discardableResult
  internal mutating func removeValue(forKey key: Key) -> Value? {
    _sanityCheckFailure("cannot mutate NSDictionary")
  }

  internal mutating func removeAll(keepingCapacity keepCapacity: Bool) {
    _sanityCheckFailure("cannot mutate NSDictionary")
  }

  internal var count: Int {
    return cocoaDictionary.count
  }

  internal static func fromArray(_ elements: [SequenceElementWithoutLabels])
    -> _CocoaDictionaryBuffer {

    _sanityCheckFailure("this function should never be called")
  }
}
#else
@_versioned
@_fixed_layout
internal struct _CocoaDictionaryBuffer {}
#endif

@_versioned
@_fixed_layout
internal enum _VariantDictionaryBuffer<Key : Hashable, Value> : _HashBuffer {

  internal typealias NativeBuffer = _NativeDictionaryBuffer<Key, Value>
  internal typealias NativeIndex = _NativeDictionaryIndex<Key, Value>
  internal typealias CocoaBuffer = _CocoaDictionaryBuffer
  internal typealias SequenceElement = (key: Key, value: Value)
  internal typealias SequenceElementWithoutLabels = (key: Key, value: Value)
  internal typealias SelfType = _VariantDictionaryBuffer

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3888)

  case native(NativeBuffer)
  case cocoa(CocoaBuffer)

  @_versioned
  @_transparent
  internal var guaranteedNative: Bool {
    return _canBeClass(Key.self) == 0 || _canBeClass(Value.self) == 0
  }

  internal mutating func isUniquelyReferenced() -> Bool {
    // Note that &self drills down through .native(NativeBuffer) to the first
    // property in NativeBuffer, which is the reference to the storage.
    if _fastPath(guaranteedNative) {
      return _isUnique_native(&self)
    }

    switch self {
    case .native:
      return _isUnique_native(&self)
    case .cocoa:
      // Don't consider Cocoa buffer mutable, even if it is mutable and is
      // uniquely referenced.
      return false
    }
  }

  @_versioned
  internal var asNative: NativeBuffer {
    get {
      switch self {
      case .native(let buffer):
        return buffer
      case .cocoa:
        _sanityCheckFailure("internal error: not backed by native buffer")
      }
    }
    set {
      self = .native(newValue)
    }
  }

#if _runtime(_ObjC)
  internal var asCocoa: CocoaBuffer {
    switch self {
    case .native:
      _sanityCheckFailure("internal error: not backed by NSDictionary")
    case .cocoa(let cocoaBuffer):
      return cocoaBuffer
    }
  }
#endif

  /// Ensure this we hold a unique reference to a native buffer
  /// having at least `minimumCapacity` elements.
  internal mutating func ensureUniqueNativeBuffer(_ minimumCapacity: Int)
    -> (reallocated: Bool, capacityChanged: Bool) {
    switch self {
    case .native:
      let oldCapacity = asNative.capacity
      if isUniquelyReferenced() && oldCapacity >= minimumCapacity {
        return (reallocated: false, capacityChanged: false)
      }

      let oldNativeBuffer = asNative
      var newNativeBuffer = NativeBuffer(minimumCapacity: minimumCapacity)
      let newCapacity = newNativeBuffer.capacity
      for i in 0..<oldCapacity {
        if oldNativeBuffer.isInitializedEntry(at: i) {
          if oldCapacity == newCapacity {
            let key = oldNativeBuffer.key(at: i)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3962)
            let value = oldNativeBuffer.value(at: i)
            newNativeBuffer.initializeKey(key, value: value , at: i)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3965)
          } else {
            let key = oldNativeBuffer.key(at: i)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3970)
            newNativeBuffer.unsafeAddNew(
              key: key,
              value: oldNativeBuffer.value(at: i))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3974)
          }
        }
      }
      newNativeBuffer.count = oldNativeBuffer.count

      self = .native(newNativeBuffer)
      return (reallocated: true,
              capacityChanged: oldCapacity != newNativeBuffer.capacity)

    case .cocoa(let cocoaBuffer):
#if _runtime(_ObjC)
      let cocoaDictionary = cocoaBuffer.cocoaDictionary
      var newNativeBuffer = NativeBuffer(minimumCapacity: minimumCapacity)
      let oldCocoaIterator = _CocoaDictionaryIterator(cocoaDictionary)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 3995)

      while let (key, value) = oldCocoaIterator.next() {
        newNativeBuffer.unsafeAddNew(
          key: _forceBridgeFromObjectiveC(key, Key.self),
          value: _forceBridgeFromObjectiveC(value, Value.self))
      }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4003)
      newNativeBuffer.count = cocoaDictionary.count

      self = .native(newNativeBuffer)
      return (reallocated: true, capacityChanged: true)
#else
      _sanityCheckFailure("internal error: unexpected cocoa Dictionary")
#endif
    }
  }

#if _runtime(_ObjC)
  @inline(never)
  internal mutating func migrateDataToNativeBuffer(
    _ cocoaBuffer: _CocoaDictionaryBuffer
  ) {
    let minCapacity = NativeBuffer.minimumCapacity(
      minimumCount: cocoaBuffer.count,
      maxLoadFactorInverse: _hashContainerDefaultMaxLoadFactorInverse)
    let allocated = ensureUniqueNativeBuffer(minCapacity).reallocated
    _sanityCheck(allocated, "failed to allocate native Dictionary buffer")
  }
#endif

  //
  // _HashBuffer conformance
  //

  internal typealias Index = DictionaryIndex<Key, Value>

  internal var startIndex: Index {
    if _fastPath(guaranteedNative) {
      return ._native(asNative.startIndex)
    }

    switch self {
    case .native:
      return ._native(asNative.startIndex)
    case .cocoa(let cocoaBuffer):
#if _runtime(_ObjC)
      return ._cocoa(cocoaBuffer.startIndex)
#else
      _sanityCheckFailure("internal error: unexpected cocoa Dictionary")
#endif
    }
  }

  internal var endIndex: Index {
    if _fastPath(guaranteedNative) {
      return ._native(asNative.endIndex)
    }

    switch self {
    case .native:
      return ._native(asNative.endIndex)
    case .cocoa(let cocoaBuffer):
#if _runtime(_ObjC)
      return ._cocoa(cocoaBuffer.endIndex)
#else
      _sanityCheckFailure("internal error: unexpected cocoa Dictionary")
#endif
    }
  }

  @_versioned
  func index(after i: Index) -> Index {
    if _fastPath(guaranteedNative) {
      return ._native(asNative.index(after: i._nativeIndex))
    }

    switch self {
    case .native:
      return ._native(asNative.index(after: i._nativeIndex))
    case .cocoa(let cocoaBuffer):
#if _runtime(_ObjC)
      return ._cocoa(cocoaBuffer.index(after: i._cocoaIndex))
#else
      _sanityCheckFailure("internal error: unexpected cocoa Dictionary")
#endif
    }
  }

  internal func formIndex(after i: inout Index) {
    // FIXME: swift-3-indexing-model: optimize if possible.
    i = index(after: i)
  }

  @_versioned
  @inline(__always)
  internal func index(forKey key: Key) -> Index? {
    if _fastPath(guaranteedNative) {
      if let nativeIndex = asNative.index(forKey: key) {
        return ._native(nativeIndex)
      }
      return nil
    }

    switch self {
    case .native:
      if let nativeIndex = asNative.index(forKey: key) {
        return ._native(nativeIndex)
      }
      return nil
    case .cocoa(let cocoaBuffer):
#if _runtime(_ObjC)
      let anyObjectKey: AnyObject = _bridgeAnythingToObjectiveC(key)
      if let cocoaIndex = cocoaBuffer.index(forKey: anyObjectKey) {
        return ._cocoa(cocoaIndex)
      }
      return nil
#else
      _sanityCheckFailure("internal error: unexpected cocoa Dictionary")
#endif
    }
  }

  internal func assertingGet(_ i: Index) -> SequenceElement {
    if _fastPath(guaranteedNative) {
      return asNative.assertingGet(i._nativeIndex)
    }

    switch self {
    case .native:
      return asNative.assertingGet(i._nativeIndex)
    case .cocoa(let cocoaBuffer):
#if _runtime(_ObjC)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4133)
      let (anyObjectKey, anyObjectValue) =
          cocoaBuffer.assertingGet(i._cocoaIndex)
      let nativeKey = _forceBridgeFromObjectiveC(anyObjectKey, Key.self)
      let nativeValue = _forceBridgeFromObjectiveC(anyObjectValue, Value.self)
      return (nativeKey, nativeValue)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4139)
#else
      _sanityCheckFailure("internal error: unexpected cocoa Dictionary")
#endif
    }
  }

  internal func assertingGet(_ key: Key) -> Value {
    if _fastPath(guaranteedNative) {
      return asNative.assertingGet(key)
    }

    switch self {
    case .native:
      return asNative.assertingGet(key)
    case .cocoa(let cocoaBuffer):
#if _runtime(_ObjC)
      // FIXME: This assumes that Key and Value are bridged verbatim.
      let anyObjectKey: AnyObject = _bridgeAnythingToObjectiveC(key)
      let anyObjectValue: AnyObject = cocoaBuffer.assertingGet(anyObjectKey)
      return _forceBridgeFromObjectiveC(anyObjectValue, Value.self)
#else
      _sanityCheckFailure("internal error: unexpected cocoa Dictionary")
#endif
    }
  }

#if _runtime(_ObjC)
  @_versioned
  @inline(never)
  internal static func maybeGetFromCocoaBuffer(
    _ cocoaBuffer : CocoaBuffer, forKey key: Key
  ) -> Value? {
    let anyObjectKey: AnyObject = _bridgeAnythingToObjectiveC(key)
    if let anyObjectValue = cocoaBuffer.maybeGet(anyObjectKey) {
      return _forceBridgeFromObjectiveC(anyObjectValue, Value.self)
    }
    return nil
  }
#endif

  @_versioned
  @inline(__always)
  internal func maybeGet(_ key: Key) -> Value? {
    if _fastPath(guaranteedNative) {
      return asNative.maybeGet(key)
    }

    switch self {
    case .native:
      return asNative.maybeGet(key)
    case .cocoa(let cocoaBuffer):
#if _runtime(_ObjC)
      return SelfType.maybeGetFromCocoaBuffer(cocoaBuffer, forKey: key)
#else
      _sanityCheckFailure("internal error: unexpected cocoa Dictionary")
#endif
    }
  }

  internal mutating func nativeUpdateValue(
    _ value: Value, forKey key: Key
  ) -> Value? {
    var (i, found) = asNative._find(key, startBucket: asNative._bucket(key))

    let minCapacity = found
      ? asNative.capacity
      : NativeBuffer.minimumCapacity(
          minimumCount: asNative.count + 1,
          maxLoadFactorInverse: _hashContainerDefaultMaxLoadFactorInverse)

    let (_, capacityChanged) = ensureUniqueNativeBuffer(minCapacity)
    if capacityChanged {
      i = asNative._find(key, startBucket: asNative._bucket(key)).pos
    }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4223)
    let oldValue: Value? = found ? asNative.value(at: i.offset) : nil
    if found {
      asNative.setKey(key, value: value, at: i.offset)
    } else {
      asNative.initializeKey(key, value: value, at: i.offset)
      asNative.count += 1
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4231)

    return oldValue
  }

  @discardableResult
  internal mutating func updateValue(
    _ value: Value, forKey key: Key
  ) -> Value? {

    if _fastPath(guaranteedNative) {
      return nativeUpdateValue(value, forKey: key)
    }

    switch self {
    case .native:
      return nativeUpdateValue(value, forKey: key)
    case .cocoa(let cocoaBuffer):
#if _runtime(_ObjC)
      migrateDataToNativeBuffer(cocoaBuffer)
      return nativeUpdateValue(value, forKey: key)
#else
      _sanityCheckFailure("internal error: unexpected cocoa Dictionary")
#endif
    }
  }

  internal mutating func nativeInsert(
    _ value: Value, forKey key: Key
  ) -> (inserted: Bool, memberAfterInsert: Value) {

    var (i, found) = asNative._find(key, startBucket: asNative._bucket(key))
    if found {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4266)
      return (inserted: false, memberAfterInsert: asNative.value(at: i.offset))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4268)
    }

    let minCapacity = NativeBuffer.minimumCapacity(
      minimumCount: asNative.count + 1,
      maxLoadFactorInverse: _hashContainerDefaultMaxLoadFactorInverse)

    let (_, capacityChanged) = ensureUniqueNativeBuffer(minCapacity)

    if capacityChanged {
      i = asNative._find(key, startBucket: asNative._bucket(key)).pos
    }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4284)
    asNative.initializeKey(key, value: value, at: i.offset)
    asNative.count += 1
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4287)

    return (inserted: true, memberAfterInsert: value)
  }

  @discardableResult
  internal mutating func insert(
    _ value: Value, forKey key: Key
  ) -> (inserted: Bool, memberAfterInsert: Value) {

    if _fastPath(guaranteedNative) {
      return nativeInsert(value, forKey: key)
    }

    switch self {
    case .native:
      return nativeInsert(value, forKey: key)
    case .cocoa(let cocoaBuffer):
#if _runtime(_ObjC)
      migrateDataToNativeBuffer(cocoaBuffer)
      return nativeInsert(value, forKey: key)
#else
      _sanityCheckFailure("internal error: unexpected cocoa Dictionary")
#endif
    }
  }

  /// - parameter idealBucket: The ideal bucket for the element being deleted.
  /// - parameter offset: The offset of the element that will be deleted.
  /// Precondition: there should be an initialized entry at offset.
  internal mutating func nativeDelete(
    _ nativeBuffer: NativeBuffer, idealBucket: Int, offset: Int
  ) {
    _sanityCheck(
        nativeBuffer.isInitializedEntry(at: offset), "expected initialized entry")

    var nativeBuffer = nativeBuffer

    // remove the element
    nativeBuffer.destroyEntry(at: offset)
    nativeBuffer.count -= 1

    // If we've put a hole in a chain of contiguous elements, some
    // element after the hole may belong where the new hole is.
    var hole = offset

    // Find the first bucket in the contiguous chain
    var start = idealBucket
    while nativeBuffer.isInitializedEntry(at: nativeBuffer._prev(start)) {
      start = nativeBuffer._prev(start)
    }

    // Find the last bucket in the contiguous chain
    var lastInChain = hole
    var b = nativeBuffer._index(after: lastInChain)
    while nativeBuffer.isInitializedEntry(at: b) {
      lastInChain = b
      b = nativeBuffer._index(after: b)
    }

    // Relocate out-of-place elements in the chain, repeating until
    // none are found.
    while hole != lastInChain {
      // Walk backwards from the end of the chain looking for
      // something out-of-place.
      var b = lastInChain
      while b != hole {
        let idealBucket = nativeBuffer._bucket(nativeBuffer.key(at: b))

        // Does this element belong between start and hole?  We need
        // two separate tests depending on whether [start, hole] wraps
        // around the end of the storage
        let c0 = idealBucket >= start
        let c1 = idealBucket <= hole
        if start <= hole ? (c0 && c1) : (c0 || c1) {
          break // Found it
        }
        b = nativeBuffer._prev(b)
      }

      if b == hole { // No out-of-place elements found; we're done adjusting
        break
      }

      // Move the found element into the hole
      nativeBuffer.moveInitializeEntry(
        from: nativeBuffer,
        at: b,
        toEntryAt: hole)
      hole = b
    }
  }

  internal mutating func nativeRemoveObject(forKey key: Key) -> Value? {
    var idealBucket = asNative._bucket(key)
    var (index, found) = asNative._find(key, startBucket: idealBucket)

    // Fast path: if the key is not present, we will not mutate the set,
    // so don't force unique buffer.
    if !found {
      return nil
    }

    let (_, capacityChanged) =
      ensureUniqueNativeBuffer(asNative.capacity)
    let nativeBuffer = asNative
    if capacityChanged {
      idealBucket = nativeBuffer._bucket(key)
      (index, found) = nativeBuffer._find(key, startBucket: idealBucket)
      _sanityCheck(found, "key was lost during buffer migration")
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4400)
    let oldValue = nativeBuffer.value(at: index.offset)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4402)
    nativeDelete(nativeBuffer, idealBucket: idealBucket,
      offset: index.offset)
    return oldValue
  }

  internal mutating func nativeRemove(
    at nativeIndex: NativeIndex
  ) -> SequenceElement {

    // The provided index should be valid, so we will always mutating the
    // set buffer.  Request unique buffer.
    _ = ensureUniqueNativeBuffer(asNative.capacity)
    let nativeBuffer = asNative

    let result = nativeBuffer.assertingGet(nativeIndex)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4420)
    let key = result.0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4422)

    nativeDelete(nativeBuffer, idealBucket: nativeBuffer._bucket(key),
        offset: nativeIndex.offset)
    return result
  }

  @discardableResult
  internal mutating func remove(at index: Index) -> SequenceElement {
    if _fastPath(guaranteedNative) {
      return nativeRemove(at: index._nativeIndex)
    }

    switch self {
    case .native:
      return nativeRemove(at: index._nativeIndex)
    case .cocoa(let cocoaBuffer):
#if _runtime(_ObjC)
      // We have to migrate the data first.  But after we do so, the Cocoa
      // index becomes useless, so get the key first.
      //
      // FIXME(performance): fuse data migration and element deletion into one
      // operation.
      let index = index._cocoaIndex
      let anyObjectKey: AnyObject = index.allKeys[index.currentKeyIndex]
      migrateDataToNativeBuffer(cocoaBuffer)
      let key = _forceBridgeFromObjectiveC(anyObjectKey, Key.self)
      let value = nativeRemoveObject(forKey: key)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4454)
      return (key, value._unsafelyUnwrappedUnchecked)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4456)
#else
      _sanityCheckFailure("internal error: unexpected cocoa Dictionary")
#endif
    }
  }

  @discardableResult
  internal mutating func removeValue(forKey key: Key) -> Value? {
    if _fastPath(guaranteedNative) {
      return nativeRemoveObject(forKey: key)
    }

    switch self {
    case .native:
      return nativeRemoveObject(forKey: key)
    case .cocoa(let cocoaBuffer):
#if _runtime(_ObjC)
      let anyObjectKey: AnyObject = _bridgeAnythingToObjectiveC(key)
      if cocoaBuffer.maybeGet(anyObjectKey) == nil {
        return nil
      }
      migrateDataToNativeBuffer(cocoaBuffer)
      return nativeRemoveObject(forKey: key)
#else
      _sanityCheckFailure("internal error: unexpected cocoa Dictionary")
#endif
    }
  }

  internal mutating func nativeRemoveAll() {
    if !isUniquelyReferenced() {
        asNative = NativeBuffer(minimumCapacity: asNative.capacity)
        return
    }

    // We have already checked for the empty dictionary case and unique
    // reference, so we will always mutate the dictionary buffer.
    var nativeBuffer = asNative

    for b in 0..<nativeBuffer.capacity {
      if nativeBuffer.isInitializedEntry(at: b) {
        nativeBuffer.destroyEntry(at: b)
      }
    }
    nativeBuffer.count = 0
  }

  internal mutating func removeAll(keepingCapacity keepCapacity: Bool) {
    if count == 0 {
      return
    }

    if !keepCapacity {
      self = .native(NativeBuffer(minimumCapacity: 2))
      return
    }

    if _fastPath(guaranteedNative) {
      nativeRemoveAll()
      return
    }

    switch self {
    case .native:
      nativeRemoveAll()
    case .cocoa(let cocoaBuffer):
#if _runtime(_ObjC)
      self = .native(NativeBuffer(minimumCapacity: cocoaBuffer.count))
#else
      _sanityCheckFailure("internal error: unexpected cocoa Dictionary")
#endif
    }
  }

  internal var count: Int {
    if _fastPath(guaranteedNative) {
      return asNative.count
    }

    switch self {
    case .native:
      return asNative.count
    case .cocoa(let cocoaBuffer):
#if _runtime(_ObjC)
      return cocoaBuffer.count
#else
      _sanityCheckFailure("internal error: unexpected cocoa Dictionary")
#endif
    }
  }

  /// Returns an iterator over the `(Key, Value)` pairs.
  ///
  /// - Complexity: O(1).
  @_versioned
  @inline(__always)
  internal func makeIterator() -> DictionaryIterator<Key, Value> {
    switch self {
    case .native(let buffer):
      return ._native(
        start: asNative.startIndex, end: asNative.endIndex, buffer: buffer)
    case .cocoa(let cocoaBuffer):
#if _runtime(_ObjC)
      return ._cocoa(_CocoaDictionaryIterator(cocoaBuffer.cocoaDictionary))
#else
      _sanityCheckFailure("internal error: unexpected cocoa Dictionary")
#endif
    }
  }

  internal static func fromArray(_ elements: [SequenceElement])
    -> _VariantDictionaryBuffer<Key, Value> {

    _sanityCheckFailure("this function should never be called")
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4576)

@_versioned
internal struct _NativeDictionaryIndex<Key, Value> : Comparable {
  @_versioned
  internal var offset: Int

  @_versioned
  internal init(offset: Int) {
    self.offset = offset
  }
}

extension _NativeDictionaryIndex {

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4591)
  internal static func < (
    lhs: _NativeDictionaryIndex<Key, Value>,
    rhs: _NativeDictionaryIndex<Key, Value>
  ) -> Bool {
    return lhs.offset < rhs.offset
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4591)
  internal static func <= (
    lhs: _NativeDictionaryIndex<Key, Value>,
    rhs: _NativeDictionaryIndex<Key, Value>
  ) -> Bool {
    return lhs.offset <= rhs.offset
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4591)
  internal static func > (
    lhs: _NativeDictionaryIndex<Key, Value>,
    rhs: _NativeDictionaryIndex<Key, Value>
  ) -> Bool {
    return lhs.offset > rhs.offset
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4591)
  internal static func >= (
    lhs: _NativeDictionaryIndex<Key, Value>,
    rhs: _NativeDictionaryIndex<Key, Value>
  ) -> Bool {
    return lhs.offset >= rhs.offset
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4591)
  internal static func == (
    lhs: _NativeDictionaryIndex<Key, Value>,
    rhs: _NativeDictionaryIndex<Key, Value>
  ) -> Bool {
    return lhs.offset == rhs.offset
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4598)

}


#if _runtime(_ObjC)
@_versioned
internal struct _CocoaDictionaryIndex : Comparable {
  // Assumption: we rely on NSDictionary.getObjects when being
  // repeatedly called on the same NSDictionary, returning items in the same
  // order every time.
  // Similarly, the same assumption holds for NSSet.allObjects.

  /// A reference to the NSDictionary, which owns members in `allObjects`,
  /// or `allKeys`, for NSSet and NSDictionary respectively.
  internal let cocoaDictionary: _NSDictionary
  // FIXME: swift-3-indexing-model: try to remove the cocoa reference, but make
  // sure that we have a safety check for accessing `allKeys`.  Maybe move both
  // into the dictionary/set itself.

  /// An unowned array of keys.
  internal var allKeys: _HeapBuffer<Int, AnyObject>

  /// Index into `allKeys`
  internal var currentKeyIndex: Int

  internal init(_ cocoaDictionary: _NSDictionary, startIndex: ()) {
    self.cocoaDictionary = cocoaDictionary
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4628)
    self.allKeys = _stdlib_NSDictionary_allKeys(cocoaDictionary)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4630)
    self.currentKeyIndex = 0
  }

  internal init(_ cocoaDictionary: _NSDictionary, endIndex: ()) {
    self.cocoaDictionary = cocoaDictionary
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4638)
    self.allKeys = _stdlib_NSDictionary_allKeys(cocoaDictionary)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4640)
    self.currentKeyIndex = allKeys.value
  }

  internal init(_ cocoaDictionary: _NSDictionary,
    _ allKeys: _HeapBuffer<Int, AnyObject>,
    _ currentKeyIndex: Int
  ) {
    self.cocoaDictionary = cocoaDictionary
    self.allKeys = allKeys
    self.currentKeyIndex = currentKeyIndex
  }

  /// Returns the next consecutive value after `self`.
  ///
  /// - Precondition: The next value is representable.
  internal func successor() -> _CocoaDictionaryIndex {
    // FIXME: swift-3-indexing-model: remove this method.
    _precondition(
      currentKeyIndex < allKeys.value, "cannot increment endIndex")
    return _CocoaDictionaryIndex(cocoaDictionary, allKeys, currentKeyIndex + 1)
  }
}

extension _CocoaDictionaryIndex {

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4666)
  internal static func < (
    lhs: _CocoaDictionaryIndex,
    rhs: _CocoaDictionaryIndex
  ) -> Bool {
    return lhs.currentKeyIndex < rhs.currentKeyIndex
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4666)
  internal static func <= (
    lhs: _CocoaDictionaryIndex,
    rhs: _CocoaDictionaryIndex
  ) -> Bool {
    return lhs.currentKeyIndex <= rhs.currentKeyIndex
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4666)
  internal static func > (
    lhs: _CocoaDictionaryIndex,
    rhs: _CocoaDictionaryIndex
  ) -> Bool {
    return lhs.currentKeyIndex > rhs.currentKeyIndex
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4666)
  internal static func >= (
    lhs: _CocoaDictionaryIndex,
    rhs: _CocoaDictionaryIndex
  ) -> Bool {
    return lhs.currentKeyIndex >= rhs.currentKeyIndex
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4666)
  internal static func == (
    lhs: _CocoaDictionaryIndex,
    rhs: _CocoaDictionaryIndex
  ) -> Bool {
    return lhs.currentKeyIndex == rhs.currentKeyIndex
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4673)

}
#else
internal struct _CocoaDictionaryIndex {}
#endif

internal enum DictionaryIndexRepresentation<Key : Hashable, Value> {
  typealias _Index = DictionaryIndex<Key, Value>
  typealias _NativeIndex = _Index._NativeIndex
  typealias _CocoaIndex = _Index._CocoaIndex

  case _native(_NativeIndex)
  case _cocoa(_CocoaIndex)
}

extension Dictionary {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4708)

/// Used to access the key-value pairs in an instance of
/// `Dictionary<Key, Value>`.
///
/// Dictionary has two subscripting interfaces:
///
/// 1. Subscripting with a key, yielding an optional value:
///
///        v = d[k]!
///
/// 2. Subscripting with an index, yielding a key-value pair:
///
///        (k, v) = d[i]
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4709)
public struct Index : Comparable {
  // Index for native buffer is efficient.  Index for bridged NSDictionary is
  // not, because neither NSEnumerator nor fast enumeration support moving
  // backwards.  Even if they did, there is another issue: NSEnumerator does
  // not support NSCopying, and fast enumeration does not document that it is
  // safe to copy the state.  So, we cannot implement Index that is a value
  // type for bridged NSDictionary in terms of Cocoa enumeration facilities.

  internal typealias _NativeIndex = _NativeDictionaryIndex<Key, Value>
  internal typealias _CocoaIndex = _CocoaDictionaryIndex

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4725)

  internal var _value: DictionaryIndexRepresentation<Key, Value>

  @_versioned
  internal static func _native(_ index: _NativeIndex) -> Index {
    return DictionaryIndex(_value: ._native(index))
  }
#if _runtime(_ObjC)
  @_versioned
  internal static func _cocoa(_ index: _CocoaIndex) -> Index {
    return DictionaryIndex(_value: ._cocoa(index))
  }
#endif

  @_versioned
  @_transparent
  internal var _guaranteedNative: Bool {
    return _canBeClass(Key.self) == 0 && _canBeClass(Value.self) == 0
  }

  @_transparent
  internal var _nativeIndex: _NativeIndex {
    switch _value {
    case ._native(let nativeIndex):
      return nativeIndex
    case ._cocoa:
      _sanityCheckFailure("internal error: does not contain a native index")
    }
  }

#if _runtime(_ObjC)
  @_transparent
  internal var _cocoaIndex: _CocoaIndex {
    switch _value {
    case ._native:
      _sanityCheckFailure("internal error: does not contain a Cocoa index")
    case ._cocoa(let cocoaIndex):
      return cocoaIndex
    }
  }
#endif
}

}

public typealias DictionaryIndex<Key : Hashable, Value> =
    Dictionary<Key, Value>.Index

extension Dictionary.Index {
  public static func == (
    lhs: Dictionary<Key, Value>.Index,
    rhs: Dictionary<Key, Value>.Index
  ) -> Bool {
    if _fastPath(lhs._guaranteedNative) {
      return lhs._nativeIndex == rhs._nativeIndex
    }

    switch (lhs._value, rhs._value) {
    case (._native(let lhsNative), ._native(let rhsNative)):
      return lhsNative == rhsNative
    case (._cocoa(let lhsCocoa), ._cocoa(let rhsCocoa)):
  #if _runtime(_ObjC)
      return lhsCocoa == rhsCocoa
  #else
      _sanityCheckFailure("internal error: unexpected cocoa Dictionary")
  #endif
    default:
      _preconditionFailure("comparing indexes from different sets")
    }
  }

  public static func < (
    lhs: Dictionary<Key, Value>.Index,
    rhs: Dictionary<Key, Value>.Index
  ) -> Bool {
    if _fastPath(lhs._guaranteedNative) {
      return lhs._nativeIndex < rhs._nativeIndex
    }

    switch (lhs._value, rhs._value) {
    case (._native(let lhsNative), ._native(let rhsNative)):
      return lhsNative < rhsNative
    case (._cocoa(let lhsCocoa), ._cocoa(let rhsCocoa)):
  #if _runtime(_ObjC)
      return lhsCocoa < rhsCocoa
  #else
      _sanityCheckFailure("internal error: unexpected cocoa Dictionary")
  #endif
    default:
      _preconditionFailure("comparing indexes from different sets")
    }
  }
}

#if _runtime(_ObjC)
@_versioned
final internal class _CocoaDictionaryIterator : IteratorProtocol {
  internal typealias Element = (AnyObject, AnyObject)

  // Cocoa Dictionary iterator has to be a class, otherwise we cannot
  // guarantee that the fast enumeration struct is pinned to a certain memory
  // location.

  // This stored property should be stored at offset zero.  There's code below
  // relying on this.
  internal var _fastEnumerationState: _SwiftNSFastEnumerationState =
    _makeSwiftNSFastEnumerationState()

  // This stored property should be stored right after `_fastEnumerationState`.
  // There's code below relying on this.
  internal var _fastEnumerationStackBuf = _CocoaFastEnumerationStackBuf()

  internal let cocoaDictionary: _NSDictionary

  internal var _fastEnumerationStatePtr:
    UnsafeMutablePointer<_SwiftNSFastEnumerationState> {
    return _getUnsafePointerToStoredProperties(self).assumingMemoryBound(
      to: _SwiftNSFastEnumerationState.self)
  }

  internal var _fastEnumerationStackBufPtr:
    UnsafeMutablePointer<_CocoaFastEnumerationStackBuf> {
    return UnsafeMutableRawPointer(_fastEnumerationStatePtr + 1)
      .assumingMemoryBound(to: _CocoaFastEnumerationStackBuf.self)
  }

  // These members have to be word-sized integers, they cannot be limited to
  // Int8 just because our storage holds 16 elements: fast enumeration is
  // allowed to return inner pointers to the container, which can be much
  // larger.
  internal var itemIndex: Int = 0
  internal var itemCount: Int = 0

  @_versioned
  internal init(_ cocoaDictionary: _NSDictionary) {
    self.cocoaDictionary = cocoaDictionary
  }

  @_versioned
  internal func next() -> Element? {
    if itemIndex < 0 {
      return nil
    }
    let cocoaDictionary = self.cocoaDictionary
    if itemIndex == itemCount {
      let stackBufCount = _fastEnumerationStackBuf.count
      // We can't use `withUnsafeMutablePointer` here to get pointers to
      // properties, because doing so might introduce a writeback storage, but
      // fast enumeration relies on the pointer identity of the enumeration
      // state struct.
      itemCount = cocoaDictionary.countByEnumerating(
        with: _fastEnumerationStatePtr,
        objects: UnsafeMutableRawPointer(_fastEnumerationStackBufPtr)
          .assumingMemoryBound(to: AnyObject.self),
        count: stackBufCount)
      if itemCount == 0 {
        itemIndex = -1
        return nil
      }
      itemIndex = 0
    }
    let itemsPtrUP =
    UnsafeMutableRawPointer(_fastEnumerationState.itemsPtr!)
      .assumingMemoryBound(to: AnyObject.self)
    let itemsPtr = _UnmanagedAnyObjectArray(itemsPtrUP)
    let key: AnyObject = itemsPtr[itemIndex]
    itemIndex += 1
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4895)
    let value: AnyObject = cocoaDictionary.objectFor(key)!
    return (key, value)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4898)
  }
}
#else
final internal class _CocoaDictionaryIterator {}
#endif

@_versioned
internal enum DictionaryIteratorRepresentation<Key : Hashable, Value> {
  internal typealias _Iterator = DictionaryIterator<Key, Value>
  internal typealias _NativeBuffer =
    _NativeDictionaryBuffer<Key, Value>
  internal typealias _NativeIndex = _Iterator._NativeIndex

  // For native buffer, we keep two indices to keep track of the iteration
  // progress and the buffer owner to make the buffer non-uniquely
  // referenced.
  //
  // Iterator is iterating over a frozen view of the collection
  // state, so it should keep its own reference to the buffer.
  case _native(
    start: _NativeIndex, end: _NativeIndex, buffer: _NativeBuffer)
  case _cocoa(_CocoaDictionaryIterator)
}

/// An iterator over the members of a `Dictionary<Key, Value>`.
public struct DictionaryIterator<Key : Hashable, Value> : IteratorProtocol {
  // Dictionary has a separate IteratorProtocol and Index because of efficiency
  // and implementability reasons.
  //
  // Index for native buffer is efficient.  Index for bridged NSDictionary is
  // not.
  //
  // Even though fast enumeration is not suitable for implementing
  // Index, which is multi-pass, it is suitable for implementing a
  // IteratorProtocol, which is being consumed as iteration proceeds.

  internal typealias _NativeBuffer =
    _NativeDictionaryBuffer<Key, Value>
  internal typealias _NativeIndex = _NativeDictionaryIndex<Key, Value>

  @_versioned
  internal var _state: DictionaryIteratorRepresentation<Key, Value>

  @_versioned
  internal static func _native(
    start: _NativeIndex, end: _NativeIndex, buffer: _NativeBuffer
  ) -> DictionaryIterator {
    return DictionaryIterator(
      _state: ._native(start: start, end: end, buffer: buffer))
  }
#if _runtime(_ObjC)
  @_versioned
  internal static func _cocoa(
    _ iterator: _CocoaDictionaryIterator
  ) -> DictionaryIterator{
    return DictionaryIterator(_state: ._cocoa(iterator))
  }
#endif

  @_versioned
  @_transparent
  internal var _guaranteedNative: Bool {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4963)
    return _canBeClass(Key.self) == 0 || _canBeClass(Value.self) == 0
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 4965)
  }

  @_versioned
  internal mutating func _nativeNext() -> (key: Key, value: Value)? {
    switch _state {
    case ._native(let startIndex, let endIndex, let buffer):
      if startIndex == endIndex {
        return nil
      }
      let result = buffer.assertingGet(startIndex)
      _state =
        ._native(start: buffer.index(after: startIndex), end: endIndex, buffer: buffer)
      return result
    case ._cocoa:
      _sanityCheckFailure("internal error: not backed by NSDictionary")
    }
  }

  /// Advances to the next element and returns it, or `nil` if no next element
  /// exists.
  ///
  /// Once `nil` has been returned, all subsequent calls return `nil`.
  @inline(__always)
  public mutating func next() -> (key: Key, value: Value)? {
    if _fastPath(_guaranteedNative) {
      return _nativeNext()
    }

    switch _state {
    case ._native:
      return _nativeNext()
    case ._cocoa(let cocoaIterator):
#if _runtime(_ObjC)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 5003)
      if let (anyObjectKey, anyObjectValue) = cocoaIterator.next() {
        let nativeKey = _forceBridgeFromObjectiveC(anyObjectKey, Key.self)
        let nativeValue = _forceBridgeFromObjectiveC(anyObjectValue, Value.self)
        return (nativeKey, nativeValue)
      }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 5009)
      return nil
#else
      _sanityCheckFailure("internal error: unexpected cocoa Dictionary")
#endif
    }
  }
}

extension DictionaryIterator : CustomReflectable {
  /// A mirror that reflects the iterator.
  public var customMirror: Mirror {
    return Mirror(
      self,
      children: EmptyCollection<(label: String?, value: Any)>())
  }
}

extension Dictionary : CustomReflectable {
  /// A mirror that reflects the dictionary.
  public var customMirror: Mirror {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 5032)
    let style = Mirror.DisplayStyle.dictionary
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 5034)
    return Mirror(self, unlabeledChildren: self, displayStyle: style)
  }
}

/// Initializes a `Dictionary` from unique members.
///
/// Using a builder can be faster than inserting members into an empty
/// `Dictionary`.
public struct _DictionaryBuilder<Key : Hashable, Value> {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 5047)

  internal var _result: Dictionary<Key, Value>
  internal var _nativeBuffer: _NativeDictionaryBuffer<Key, Value>
  internal let _requestedCount: Int
  internal var _actualCount: Int

  public init(count: Int) {
    let requiredCapacity =
      _NativeDictionaryBuffer<Key, Value>.minimumCapacity(
        minimumCount: count,
        maxLoadFactorInverse: _hashContainerDefaultMaxLoadFactorInverse)
    _result = Dictionary<Key, Value>(minimumCapacity: requiredCapacity)
    _nativeBuffer = _result._variantBuffer.asNative
    _requestedCount = count
    _actualCount = 0
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 5070)
  public mutating func add(key newKey: Key, value: Value) {
    _nativeBuffer.unsafeAddNew(key: newKey, value: value)
    _actualCount += 1
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 5075)

  public mutating func take() -> Dictionary<Key, Value> {
    _precondition(_actualCount >= 0,
      "cannot take the result twice")
    _precondition(_actualCount == _requestedCount,
      "the number of members added does not match the promised count")

    // Finish building the `Dictionary`.
    _nativeBuffer.count = _requestedCount

    // Prevent taking the result twice.
    _actualCount = -1
    return _result
  }
}

extension Dictionary {
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 5100)
  /// Removes and returns the first key-value pair of the dictionary if the
  /// dictionary isn't empty.
  ///
  /// The first element of the dictionary is not necessarily the first element
  /// added. Don't expect any particular ordering of key-value pairs.
  ///
  /// - Returns: The first key-value pair of the dictionary if the dictionary
  ///   is not empty; otherwise, `nil`.
  ///
  /// - Complexity: Averages to O(1) over many calls to `popFirst()`.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 5111)
  public mutating func popFirst() -> Element? {
    guard !isEmpty else { return nil }
    return remove(at: startIndex)
  }
}

//===--- Bridging ---------------------------------------------------------===//

#if _runtime(_ObjC)
extension Dictionary {
  public func _bridgeToObjectiveCImpl() -> _NSDictionaryCore {
    switch _variantBuffer {
    case _VariantDictionaryBuffer.native(let buffer):
      return buffer.bridged()
    case _VariantDictionaryBuffer.cocoa(let cocoaBuffer):
      return cocoaBuffer.cocoaDictionary
    }
  }

  /// Returns the native Dictionary hidden inside this NSDictionary;
  /// returns nil otherwise.
  public static func _bridgeFromObjectiveCAdoptingNativeStorageOf(
    _ s: AnyObject
  ) -> Dictionary<Key, Value>? {

    // Try all three NSDictionary impls that we currently provide.

    if let deferredBuffer = s as? _SwiftDeferredNSDictionary<Key, Value> {
      return Dictionary(_nativeBuffer: deferredBuffer.nativeBuffer)
    }

    if let nativeStorage = s as? _HashableTypedNativeDictionaryStorage<Key, Value> {
      return Dictionary(_nativeBuffer: 
          _NativeDictionaryBuffer(_storage: nativeStorage))
    }

    if s === _RawNativeDictionaryStorage.empty {
      return Dictionary()
    }
    
    // FIXME: what if `s` is native storage, but for different key/value type?
    return nil
  }
}
#endif

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollections.swift.gyb", line: 5158)

extension Set {
  /// Removes the elements of the given set from this set.
  ///
  /// In the following example, the elements of the `employees` set that are
  /// also members of the `neighbors` set are removed. In particular, the
  /// names `"Bethany"` and `"Eric"` are removed from `employees`.
  ///
  ///     var employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
  ///     let neighbors: Set = ["Bethany", "Eric", "Forlani", "Greta"]
  ///     employees.subtract(neighbors)
  ///     print(employees)
  ///     // Prints "["Diana", "Chris", "Alicia"]"
  ///
  /// - Parameter other: Another set.
  public mutating func subtract(_ other: Set<Element>) {
    _subtract(other)
  }

  /// Returns a Boolean value that indicates whether this set is a subset of
  /// the given set.
  ///
  /// Set *A* is a subset of another set *B* if every member of *A* is also a
  /// member of *B*.
  ///
  ///     let employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
  ///     let attendees: Set = ["Alicia", "Bethany", "Diana"]
  ///     print(attendees.isSubset(of: employees))
  ///     // Prints "true"
  ///
  /// - Parameter other: Another set.
  /// - Returns: `true` if the set is a subset of `other`; otherwise, `false`.
  public func isSubset(of other: Set<Element>) -> Bool {
    let (isSubset, isEqual) = _compareSets(self, other)
    return isSubset || isEqual
  }

  /// Returns a Boolean value that indicates whether this set is a superset of
  /// the given set.
  ///
  /// Set *A* is a superset of another set *B* if every member of *B* is also a
  /// member of *A*.
  ///
  ///     let employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
  ///     let attendees: Set = ["Alicia", "Bethany", "Diana"]
  ///     print(employees.isSuperset(of: attendees))
  ///     // Prints "true"
  ///
  /// - Parameter other: Another set.
  /// - Returns: `true` if the set is a superset of `other`; otherwise,
  ///   `false`.
  public func isSuperset(of other: Set<Element>) -> Bool {
    return other.isSubset(of: self)
  }

  /// Returns a Boolean value that indicates whether this set has no members in
  /// common with the given set.
  ///
  /// In the following example, the `employees` set is disjoint with the
  /// `visitors` set because no name appears in both sets.
  ///
  ///     let employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
  ///     let visitors: Set = ["Marcia", "Nathaniel", "Olivia"]
  ///     print(employees.isDisjoint(with: visitors))
  ///     // Prints "true"
  ///
  /// - Parameter other: Another set.
  /// - Returns: `true` if the set has no elements in common with `other`;
  ///   otherwise, `false`.
  public func isDisjoint(with other: Set<Element>) -> Bool {
    for member in self {
      if other.contains(member) {
        return false
      }
    }
    return true
  }

  /// Returns a new set containing the elements of this set that do not occur
  /// in the given set.
  ///
  /// In the following example, the `nonNeighbors` set is made up of the
  /// elements of the `employees` set that are not elements of `neighbors`:
  ///
  ///     let employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
  ///     let neighbors: Set = ["Bethany", "Eric", "Forlani", "Greta"]
  ///     let nonNeighbors = employees.subtracting(neighbors)
  ///     print(nonNeighbors)
  ///     // Prints "["Diana", "Chris", "Alicia"]"
  ///
  /// - Parameter other: Another set.
  /// - Returns: A new set.
  public func subtracting(_ other: Set<Element>) -> Set<Element> {
    return self._subtracting(other)
  }

  /// Returns a Boolean value that indicates whether the set is a strict
  /// superset of the given sequence.
  ///
  /// Set *A* is a strict superset of another set *B* if every member of *B* is
  /// also a member of *A* and *A* contains at least one element that is *not*
  /// a member of *B*.
  ///
  ///     let employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
  ///     let attendees: Set = ["Alicia", "Bethany", "Diana"]
  ///     print(employees.isStrictSuperset(of: attendees))
  ///     // Prints "true"
  ///     print(employees.isStrictSuperset(of: employees))
  ///     // Prints "false"
  ///
  /// - Parameter other: Another set.
  /// - Returns: `true` if the set is a strict superset of
  ///   `other`; otherwise, `false`.
  public func isStrictSuperset(of other: Set<Element>) -> Bool {
    return self.isSuperset(of: other) && self != other
  }

  /// Returns a Boolean value that indicates whether the set is a strict subset
  /// of the given sequence.
  ///
  /// Set *A* is a strict subset of another set *B* if every member of *A* is
  /// also a member of *B* and *B* contains at least one element that is not a
  /// member of *A*.
  ///
  ///     let employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
  ///     let attendees: Set = ["Alicia", "Bethany", "Diana"]
  ///     print(attendees.isStrictSubset(of: employees))
  ///     // Prints "true"
  ///
  ///     // A set is never a strict subset of itself:
  ///     print(attendees.isStrictSubset(of: attendees))
  ///     // Prints "false"
  ///
  /// - Parameter other: Another set.
  /// - Returns: `true` if the set is a strict subset of
  ///   `other`; otherwise, `false`.
  public func isStrictSubset(of other: Set<Element>) -> Bool {
    return other.isStrictSuperset(of: self)
  }

  /// Returns a new set with the elements that are common to both this set and
  /// the given sequence.
  ///
  /// In the following example, the `bothNeighborsAndEmployees` set is made up
  /// of the elements that are in *both* the `employees` and `neighbors` sets.
  /// Elements that are in only one or the other are left out of the result of
  /// the intersection.
  ///
  ///     let employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
  ///     let neighbors: Set = ["Bethany", "Eric", "Forlani", "Greta"]
  ///     let bothNeighborsAndEmployees = employees.intersection(neighbors)
  ///     print(bothNeighborsAndEmployees)
  ///     // Prints "["Bethany", "Eric"]"
  ///
  /// - Parameter other: Another set.
  /// - Returns: A new set.
  public func intersection(_ other: Set<Element>) -> Set<Element> {
    var newSet = Set<Element>()
    for member in self {
      if other.contains(member) {
        newSet.insert(member)
      }
    }
    return newSet
  }

  /// Removes the elements of the set that are also in the given sequence and
  /// adds the members of the sequence that are not already in the set.
  ///
  /// In the following example, the elements of the `employees` set that are
  /// also members of `neighbors` are removed from `employees`, while the
  /// elements of `neighbors` that are not members of `employees` are added to
  /// `employees`. In particular, the names `"Alicia"`, `"Chris"`, and
  /// `"Diana"` are removed from `employees` while the names `"Forlani"` and
  /// `"Greta"` are added.
  ///
  ///     var employees: Set = ["Alicia", "Bethany", "Chris", "Diana", "Eric"]
  ///     let neighbors: Set = ["Bethany", "Eric", "Forlani", "Greta"]
  ///     employees.formSymmetricDifference(neighbors)
  ///     print(employees)
  ///     // Prints "["Diana", "Chris", "Forlani", "Alicia", "Greta"]"
  ///
  /// - Parameter other: Another set.
  public mutating func formSymmetricDifference(_ other: Set<Element>) {
    for member in other {
      if contains(member) {
        remove(member)
      } else {
        insert(member)
      }
    }
  }
}

extension Set {
  @available(*, unavailable, renamed: "remove(at:)")
  public mutating func removeAtIndex(_ index: Index) -> Element {
    Builtin.unreachable()
  }

  @available(*, unavailable, renamed: "makeIterator()")
  public func generate() -> SetIterator<Element> {
    Builtin.unreachable()
  }

  @available(*, unavailable, renamed: "index(of:)")
  public func indexOf(_ member: Element) -> Index? {
    Builtin.unreachable()
  }
}

extension Dictionary {
  @available(*, unavailable, renamed: "remove(at:)")
  public mutating func removeAtIndex(_ index: Index) -> Element {
    Builtin.unreachable()
  }

  @available(*, unavailable, renamed: "index(forKey:)")
  public func indexForKey(_ key: Key) -> Index? {
    Builtin.unreachable()
  }

  @available(*, unavailable, renamed: "removeValue(forKey:)")
  public mutating func removeValueForKey(_ key: Key) -> Value? {
    Builtin.unreachable()
  }

  @available(*, unavailable, renamed: "makeIterator()")
  public func generate() -> DictionaryIterator<Key, Value> {
    Builtin.unreachable()
  }
}
