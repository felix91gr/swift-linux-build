// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/RangeReplaceableCollection.swift.gyb", line: 1)
//===--- RangeReplaceableCollection.swift.gyb -----------------*- swift -*-===//
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
//
// A Collection protocol with replaceSubrange.
//
//===----------------------------------------------------------------------===//

// FIXME: swift-3-indexing-model: synchronize _Indexable with the actual
// protocol.
/// A type that supports replacement of an arbitrary subrange of elements with
/// the elements of another collection.
///
/// In most cases, it's best to ignore this protocol and use the
/// `RangeReplaceableCollection` protocol instead, because it has a more
/// complete interface.
@available(*, deprecated, message: "it will be removed in Swift 4.0.  Please use 'RandomAccessCollection' instead")
public typealias RangeReplaceableIndexable = _RangeReplaceableIndexable
public protocol _RangeReplaceableIndexable : _Indexable {
  // FIXME(ABI)#58 (Recursive Protocol Constraints): there is no reason for this protocol
  // to exist apart from missing compiler features that we emulate with it.
  // rdar://problem/20531108
  //
  // This protocol is almost an implementation detail of the standard
  // library.

  /// Creates an empty instance.
  init()

  /// Creates a new collection containing the specified number of a single,
  /// repeated value.
  ///
  /// Here's an example of creating an array initialized with five strings
  /// containing the letter *Z*.
  ///
  ///     let fiveZs = Array(repeating: "Z", count: 5)
  ///     print(fiveZs)
  ///     // Prints "["Z", "Z", "Z", "Z", "Z"]"
  ///
  /// - Parameters:
  ///   - repeatedValue: The element to repeat.
  ///   - count: The number of times to repeat the value passed in the
  ///     `repeating` parameter. `count` must be zero or greater.
  init(repeating repeatedValue: _Element, count: Int)

  /// Creates a new instance of a collection containing the elements of a
  /// sequence.
  ///
  /// - Parameter elements: The sequence of elements for the new collection.
  ///   `elements` must be finite.
  init<S : Sequence>(_ elements: S) where S.Iterator.Element == _Element

  /// Replaces the specified subrange of elements with the given collection.
  ///
  /// This method has the effect of removing the specified range of elements
  /// from the collection and inserting the new elements at the same location.
  /// The number of new elements need not match the number of elements being
  /// removed.
  ///
  /// In this example, three elements in the middle of an array of integers are
  /// replaced by the five elements of a `Repeated<Int>` instance.
  ///
  ///      var nums = [10, 20, 30, 40, 50]
  ///      nums.replaceSubrange(1...3, with: repeatElement(1, count: 5))
  ///      print(nums)
  ///      // Prints "[10, 1, 1, 1, 1, 1, 50]"
  ///
  /// If you pass a zero-length range as the `subrange` parameter, this method
  /// inserts the elements of `newElements` at `subrange.startIndex`. Calling
  /// the `insert(contentsOf:at:)` method instead is preferred.
  ///
  /// Likewise, if you pass a zero-length collection as the `newElements`
  /// parameter, this method removes the elements in the given subrange
  /// without replacement. Calling the `removeSubrange(_:)` method instead is
  /// preferred.
  ///
  /// Calling this method may invalidate any existing indices for use with this
  /// collection.
  ///
  /// - Parameters:
  ///   - subrange: The subrange of the collection to replace. The bounds of
  ///     the range must be valid indices of the collection.
  ///   - newElements: The new elements to add to the collection.
  ///
  /// - Complexity: O(*m*), where *m* is the combined length of the collection
  ///   and `newElements`. If the call to `replaceSubrange` simply appends the
  ///   contents of `newElements` to the collection, the complexity is O(*n*),
  ///   where *n* is the length of `newElements`.
  mutating func replaceSubrange<C>(
    _ subrange: Range<Index>,
    with newElements: C
  ) where C : Collection, C.Iterator.Element == _Element

  /// Inserts a new element into the collection at the specified position.
  ///
  /// The new element is inserted before the element currently at the specified
  /// index. If you pass the collection's `endIndex` property as the `index`
  /// parameter, the new element is appended to the collection.
  ///
  ///     var numbers = [1, 2, 3, 4, 5]
  ///     numbers.insert(100, at: 3)
  ///     numbers.insert(200, at: numbers.endIndex)
  ///
  ///     print(numbers)
  ///     // Prints "[1, 2, 3, 100, 4, 5, 200]"
  ///
  /// Calling this method may invalidate any existing indices for use with this
  /// collection.
  ///
  /// - Parameters:
  ///   - newElement: The new element to insert into the collection.
  ///   - i: The position at which to insert the new element. `index` must be a
  ///     valid index into the collection.
  ///
  /// - Complexity: O(*n*), where *n* is the length of the collection.
  mutating func insert(_ newElement: _Element, at i: Index)

  /// Inserts the elements of a sequence into the collection at the specified
  /// position.
  ///
  /// The new elements are inserted before the element currently at the
  /// specified index. If you pass the collection's `endIndex` property as the
  /// `index` parameter, the new elements are appended to the collection.
  ///
  /// Here's an example of inserting a range of integers into an array of the
  /// same type:
  ///
  ///     var numbers = [1, 2, 3, 4, 5]
  ///     numbers.insert(contentsOf: 100...103, at: 3)
  ///     print(numbers)
  ///     // Prints "[1, 2, 3, 100, 101, 102, 103, 4, 5]"
  ///
  /// Calling this method may invalidate any existing indices for use with this
  /// collection.
  ///
  /// - Parameters:
  ///   - newElements: The new elements to insert into the collection.
  ///   - i: The position at which to insert the new elements. `index` must be
  ///     a valid index of the collection.
  ///
  /// - Complexity: O(*m*), where *m* is the combined length of the collection
  ///   and `newElements`. If `i` is equal to the collection's `endIndex`
  ///   property, the complexity is O(*n*), where *n* is the length of
  ///   `newElements`.
  mutating func insert<S : Collection>(
    contentsOf newElements: S, at i: Index
  ) where S.Iterator.Element == _Element

  /// Removes and returns the element at the specified position.
  ///
  /// All the elements following the specified position are moved to close the
  /// gap. This example removes the middle element from an array of
  /// measurements.
  ///
  ///     var measurements = [1.2, 1.5, 2.9, 1.2, 1.6]
  ///     let removed = measurements.remove(at: 2)
  ///     print(measurements)
  ///     // Prints "[1.2, 1.5, 1.2, 1.6]"
  ///
  /// Calling this method may invalidate any existing indices for use with this
  /// collection.
  ///
  /// - Parameter i: The position of the element to remove. `index` must be
  ///   a valid index of the collection that is not equal to the collection's
  ///   end index.
  /// - Returns: The removed element.
  ///
  /// - Complexity: O(*n*), where *n* is the length of the collection.
  @discardableResult
  mutating func remove(at i: Index) -> _Element

  /// Removes the specified subrange of elements from the collection.
  ///
  ///     var bugs = ["Aphid", "Bumblebee", "Cicada", "Damselfly", "Earwig"]
  ///     bugs.removeSubrange(1...3)
  ///     print(bugs)
  ///     // Prints "["Aphid", "Earwig"]"
  ///
  /// Calling this method may invalidate any existing indices for use with this
  /// collection.
  ///
  /// - Parameter bounds: The subrange of the collection to remove. The bounds
  ///   of the range must be valid indices of the collection.
  ///
  /// - Complexity: O(*n*), where *n* is the length of the collection.
  mutating func removeSubrange(_ bounds: Range<Index>)
}

/// A collection that supports replacement of an arbitrary subrange of elements
/// with the elements of another collection.
///
/// Range-replaceable collections provide operations that insert and remove
/// elements. For example, you can add elements to an array of strings by
/// calling any of the inserting or appending operations that the
/// `RangeReplaceableCollection` protocol defines.
///
///     var bugs = ["Aphid", "Damselfly"]
///     bugs.append("Earwig")
///     bugs.insert(contentsOf: ["Bumblebee", "Cicada"], at: 1)
///     print(bugs)
///     // Prints "["Aphid", "Bumblebee", "Cicada", "Damselfly", "Earwig"]"
///
/// Likewise, `RangeReplaceableCollection` types can remove one or more
/// elements using a single operation.
///
///     bugs.removeLast()
///     bugs.removeSubrange(1...2)
///     print(bugs)
///     // Prints "["Aphid", "Damselfly"]"
///
///     bugs.removeAll()
///     print(bugs)
///     // Prints "[]"
///
/// Lastly, use the eponymous `replaceSubrange(_:with:)` method to replace
/// a subrange of elements with the contents of another collection. Here,
/// three elements in the middle of an array of integers are replaced by the
/// five elements of a `Repeated<Int>` instance.
///
///      var nums = [10, 20, 30, 40, 50]
///      nums.replaceSubrange(1...3, with: repeatElement(1, count: 5))
///      print(nums)
///      // Prints "[10, 1, 1, 1, 1, 1, 50]"
///
/// Conforming to the RangeReplaceableCollection Protocol
/// =====================================================
///
/// To add `RangeReplaceableCollection` conformance to your custom collection,
/// add an empty initializer and the `replaceSubrange(_:with:)` method to your
/// custom type. `RangeReplaceableCollection` provides default implementations
/// of all its other methods using this initializer and method. For example,
/// the `removeSubrange` method is implemented by calling `replaceRange` with
/// an empty collection for the `newElements` parameter. You can override any
/// of the protocol's required methods to provide your own custom
/// implementation.
public protocol RangeReplaceableCollection
  : _RangeReplaceableIndexable, Collection
{
  // FIXME(ABI)#165 (Recursive Protocol Constraints): should require `RangeReplaceableCollection`.
  associatedtype SubSequence : _RangeReplaceableIndexable /*: RangeReplaceableCollection*/
    = RangeReplaceableSlice<Self>

  //===--- Fundamental Requirements ---------------------------------------===//

  /// Creates a new, empty collection.
  init()

  /// Replaces the specified subrange of elements with the given collection.
  ///
  /// This method has the effect of removing the specified range of elements
  /// from the collection and inserting the new elements at the same location.
  /// The number of new elements need not match the number of elements being
  /// removed.
  ///
  /// In this example, three elements in the middle of an array of integers are
  /// replaced by the five elements of a `Repeated<Int>` instance.
  ///
  ///      var nums = [10, 20, 30, 40, 50]
  ///      nums.replaceSubrange(1...3, with: repeatElement(1, count: 5))
  ///      print(nums)
  ///      // Prints "[10, 1, 1, 1, 1, 1, 50]"
  ///
  /// If you pass a zero-length range as the `subrange` parameter, this method
  /// inserts the elements of `newElements` at `subrange.startIndex`. Calling
  /// the `insert(contentsOf:at:)` method instead is preferred.
  ///
  /// Likewise, if you pass a zero-length collection as the `newElements`
  /// parameter, this method removes the elements in the given subrange
  /// without replacement. Calling the `removeSubrange(_:)` method instead is
  /// preferred.
  ///
  /// Calling this method may invalidate any existing indices for use with this
  /// collection.
  ///
  /// - Parameters:
  ///   - subrange: The subrange of the collection to replace. The bounds of
  ///     the range must be valid indices of the collection.
  ///   - newElements: The new elements to add to the collection.
  ///
  /// - Complexity: O(*m*), where *m* is the combined length of the collection
  ///   and `newElements`. If the call to `replaceSubrange` simply appends the
  ///   contents of `newElements` to the collection, the complexity is O(*n*),
  ///   where *n* is the length of `newElements`.
  mutating func replaceSubrange<C>(
    _ subrange: Range<Index>,
    with newElements: C
  ) where C : Collection, C.Iterator.Element == Iterator.Element

  /// Prepares the collection to store the specified number of elements, when
  /// doing so is appropriate for the underlying type.
  ///
  /// If you are adding a known number of elements to a collection, use this
  /// method to avoid multiple reallocations. A type that conforms to
  /// `RangeReplaceableCollection` can choose how to respond when this method
  /// is called. Depending on the type, it may make sense to allocate more or
  /// less storage than requested, or to take no action at all.
  ///
  /// - Parameter n: The requested number of elements to store.
  mutating func reserveCapacity(_ n: IndexDistance)

  //===--- Derivable Requirements -----------------------------------------===//

  /// Creates a new collection containing the specified number of a single,
  /// repeated value.
  ///
  /// The following example creates an array initialized with five strings
  /// containing the letter *Z*.
  ///
  ///     let fiveZs = Array(repeating: "Z", count: 5)
  ///     print(fiveZs)
  ///     // Prints "["Z", "Z", "Z", "Z", "Z"]"
  ///
  /// - Parameters:
  ///   - repeatedValue: The element to repeat.
  ///   - count: The number of times to repeat the value passed in the
  ///     `repeating` parameter. `count` must be zero or greater.
  init(repeating repeatedValue: Iterator.Element, count: Int)

  /// Creates a new instance of a collection containing the elements of a
  /// sequence.
  ///
  /// - Parameter elements: The sequence of elements for the new collection.
  ///   `elements` must be finite.
  init<S : Sequence>(_ elements: S)
    where S.Iterator.Element == Iterator.Element

  /// Adds an element to the end of the collection.
  ///
  /// If the collection does not have sufficient capacity for another element,
  /// additional storage is allocated before appending `newElement`. The
  /// following example adds a new number to an array of integers:
  ///
  ///     var numbers = [1, 2, 3, 4, 5]
  ///     numbers.append(100)
  ///
  ///     print(numbers)
  ///     // Prints "[1, 2, 3, 4, 5, 100]"
  ///
  /// - Parameter newElement: The element to append to the collection.
  ///
  /// - Complexity: O(1) on average, over many additions to the same
  ///   collection.
  mutating func append(_ newElement: Iterator.Element)

  /// Adds the elements of a sequence or collection to the end of this
  /// collection.
  ///
  /// The collection being appended to allocates any additional necessary
  /// storage to hold the new elements.
  ///
  /// The following example appends the elements of a `Range<Int>` instance to
  /// an array of integers:
  ///
  ///     var numbers = [1, 2, 3, 4, 5]
  ///     numbers.append(contentsOf: 10...15)
  ///     print(numbers)
  ///     // Prints "[1, 2, 3, 4, 5, 10, 11, 12, 13, 14, 15]"
  ///
  /// - Parameter newElements: The elements to append to the collection.
  ///
  /// - Complexity: O(*n*), where *n* is the length of the resulting
  ///   collection.
  // FIXME(ABI)#166 (Evolution): Consider replacing .append(contentsOf) with +=
  // suggestion in SE-91
  mutating func append<S : Sequence>(contentsOf newElements: S)
    where S.Iterator.Element == Iterator.Element

  /// Inserts a new element into the collection at the specified position.
  ///
  /// The new element is inserted before the element currently at the
  /// specified index. If you pass the collection's `endIndex` property as
  /// the `index` parameter, the new element is appended to the
  /// collection.
  ///
  ///     var numbers = [1, 2, 3, 4, 5]
  ///     numbers.insert(100, at: 3)
  ///     numbers.insert(200, at: numbers.endIndex)
  ///
  ///     print(numbers)
  ///     // Prints "[1, 2, 3, 100, 4, 5, 200]"
  ///
  /// Calling this method may invalidate any existing indices for use with this
  /// collection.
  ///
  /// - Parameter newElement: The new element to insert into the collection.
  /// - Parameter i: The position at which to insert the new element.
  ///   `index` must be a valid index into the collection.
  ///
  /// - Complexity: O(*n*), where *n* is the length of the collection.
  mutating func insert(_ newElement: Iterator.Element, at i: Index)

  /// Inserts the elements of a sequence into the collection at the specified
  /// position.
  ///
  /// The new elements are inserted before the element currently at the
  /// specified index. If you pass the collection's `endIndex` property as the
  /// `index` parameter, the new elements are appended to the collection.
  ///
  /// Here's an example of inserting a range of integers into an array of the
  /// same type:
  ///
  ///     var numbers = [1, 2, 3, 4, 5]
  ///     numbers.insert(contentsOf: 100...103, at: 3)
  ///     print(numbers)
  ///     // Prints "[1, 2, 3, 100, 101, 102, 103, 4, 5]"
  ///
  /// Calling this method may invalidate any existing indices for use with this
  /// collection.
  ///
  /// - Parameter newElements: The new elements to insert into the collection.
  /// - Parameter i: The position at which to insert the new elements. `index`
  ///   must be a valid index of the collection.
  ///
  /// - Complexity: O(*m*), where *m* is the combined length of the collection
  ///   and `newElements`. If `i` is equal to the collection's `endIndex`
  ///   property, the complexity is O(*n*), where *n* is the length of
  ///   `newElements`.
  mutating func insert<S : Collection>(contentsOf newElements: S, at i: Index)
    where S.Iterator.Element == Iterator.Element

  /// Removes and returns the element at the specified position.
  ///
  /// All the elements following the specified position are moved to close the
  /// gap. This example removes the middle element from an array of
  /// measurements.
  ///
  ///     var measurements = [1.2, 1.5, 2.9, 1.2, 1.6]
  ///     let removed = measurements.remove(at: 2)
  ///     print(measurements)
  ///     // Prints "[1.2, 1.5, 1.2, 1.6]"
  ///
  /// Calling this method may invalidate any existing indices for use with this
  /// collection.
  ///
  /// - Parameter i: The position of the element to remove. `index` must be
  ///   a valid index of the collection that is not equal to the collection's
  ///   end index.
  /// - Returns: The removed element.
  ///
  /// - Complexity: O(*n*), where *n* is the length of the collection.
  @discardableResult
  mutating func remove(at i: Index) -> Iterator.Element

  /// Customization point for `removeLast()`.  Implement this function if you
  /// want to replace the default implementation.
  ///
  /// - Returns: A non-nil value if the operation was performed.
  mutating func _customRemoveLast() -> Iterator.Element?

  /// Customization point for `removeLast(_:)`.  Implement this function if you
  /// want to replace the default implementation.
  ///
  /// - Returns: `true` if the operation was performed.
  mutating func _customRemoveLast(_ n: Int) -> Bool

  /// Removes and returns the first element of the collection.
  ///
  /// The collection must not be empty.
  ///
  ///     var bugs = ["Aphid", "Bumblebee", "Cicada", "Damselfly", "Earwig"]
  ///     bugs.removeFirst()
  ///     print(bugs)
  ///     // Prints "["Bumblebee", "Cicada", "Damselfly", "Earwig"]"
  ///
  /// Calling this method may invalidate any existing indices for use with this
  /// collection.
  ///
  /// - Returns: The removed element.
  ///
  /// - Complexity: O(*n*), where *n* is the length of the collection.
  @discardableResult
  mutating func removeFirst() -> Iterator.Element

  /// Removes the specified number of elements from the beginning of the
  /// collection.
  ///
  ///     var bugs = ["Aphid", "Bumblebee", "Cicada", "Damselfly", "Earwig"]
  ///     bugs.removeFirst(3)
  ///     print(bugs)
  ///     // Prints "["Damselfly", "Earwig"]"
  ///
  /// Calling this method may invalidate any existing indices for use with this
  /// collection.
  ///
  /// - Parameter n: The number of elements to remove from the collection.
  ///   `n` must be greater than or equal to zero and must not exceed the
  ///   number of elements in the collection.
  ///
  /// - Complexity: O(*n*), where *n* is the length of the collection.
  mutating func removeFirst(_ n: Int)

  /// Removes all elements from the collection.
  ///
  /// Calling this method may invalidate any existing indices for use with this
  /// collection.
  ///
  /// - Parameter keepCapacity: Pass `true` to request that the collection
  ///   avoid releasing its storage. Retaining the collection's storage can
  ///   be a useful optimization when you're planning to grow the collection
  ///   again. The default value is `false`.
  ///
  /// - Complexity: O(*n*), where *n* is the length of the collection.
  mutating func removeAll(keepingCapacity keepCapacity: Bool /*= false*/)
}

//===----------------------------------------------------------------------===//
// Default implementations for RangeReplaceableCollection
//===----------------------------------------------------------------------===//

extension RangeReplaceableCollection {
  public subscript(bounds: Range<Index>) -> RangeReplaceableSlice<Self> {
    return RangeReplaceableSlice(base: self, bounds: bounds)
  }

  /// Creates a new collection containing the specified number of a single,
  /// repeated value.
  ///
  /// Here's an example of creating an array initialized with five strings
  /// containing the letter *Z*.
  ///
  ///     let fiveZs = Array(repeating: "Z", count: 5)
  ///     print(fiveZs)
  ///     // Prints "["Z", "Z", "Z", "Z", "Z"]"
  ///
  /// - Parameters:
  ///   - repeatedValue: The element to repeat.
  ///   - count: The number of times to repeat the value passed in the
  ///     `repeating` parameter. `count` must be zero or greater.
  public init(repeating repeatedValue: Iterator.Element, count: Int) {
    self.init()
    if count != 0 {
      let elements = Repeated(_repeating: repeatedValue, count: count)
      append(contentsOf: elements)
    }
  }

  /// Creates a new instance of a collection containing the elements of a
  /// sequence.
  ///
  /// - Parameter elements: The sequence of elements for the new collection.
  public init<S : Sequence>(_ elements: S)
    where S.Iterator.Element == Iterator.Element {
    self.init()
    append(contentsOf: elements)
  }

  /// Adds an element to the end of the collection.
  ///
  /// If the collection does not have sufficient capacity for another element,
  /// additional storage is allocated before appending `newElement`. The
  /// following example adds a new number to an array of integers:
  ///
  ///     var numbers = [1, 2, 3, 4, 5]
  ///     numbers.append(100)
  ///
  ///     print(numbers)
  ///     // Prints "[1, 2, 3, 4, 5, 100]"
  ///
  /// - Parameter newElement: The element to append to the collection.
  ///
  /// - Complexity: O(1) on average, over many additions to the same
  ///   collection.
  public mutating func append(_ newElement: Iterator.Element) {
    insert(newElement, at: endIndex)
  }

  /// Adds the elements of a sequence or collection to the end of this
  /// collection.
  ///
  /// The collection being appended to allocates any additional necessary
  /// storage to hold the new elements.
  ///
  /// The following example appends the elements of a `Range<Int>` instance to
  /// an array of integers:
  ///
  ///     var numbers = [1, 2, 3, 4, 5]
  ///     numbers.append(contentsOf: 10...15)
  ///     print(numbers)
  ///     // Prints "[1, 2, 3, 4, 5, 10, 11, 12, 13, 14, 15]"
  ///
  /// - Parameter newElements: The elements to append to the collection.
  ///
  /// - Complexity: O(*n*), where *n* is the length of the resulting
  ///   collection.
  public mutating func append<S : Sequence>(contentsOf newElements: S)
    where S.Iterator.Element == Iterator.Element {

    let approximateCapacity = self.count +
      numericCast(newElements.underestimatedCount)
    self.reserveCapacity(approximateCapacity)
    for element in newElements {
      append(element)
    }
  }

  /// Inserts a new element into the collection at the specified position.
  ///
  /// The new element is inserted before the element currently at the
  /// specified index. If you pass the collection's `endIndex` property as
  /// the `index` parameter, the new element is appended to the
  /// collection.
  ///
  ///     var numbers = [1, 2, 3, 4, 5]
  ///     numbers.insert(100, at: 3)
  ///     numbers.insert(200, at: numbers.endIndex)
  ///
  ///     print(numbers)
  ///     // Prints "[1, 2, 3, 100, 4, 5, 200]"
  ///
  /// Calling this method may invalidate any existing indices for use with this
  /// collection.
  ///
  /// - Parameter newElement: The new element to insert into the collection.
  /// - Parameter i: The position at which to insert the new element.
  ///   `index` must be a valid index into the collection.
  ///
  /// - Complexity: O(*n*), where *n* is the length of the collection.
  public mutating func insert(
    _ newElement: Iterator.Element, at i: Index
  ) {
    replaceSubrange(i..<i, with: CollectionOfOne(newElement))
  }

  /// Inserts the elements of a sequence into the collection at the specified
  /// position.
  ///
  /// The new elements are inserted before the element currently at the
  /// specified index. If you pass the collection's `endIndex` property as the
  /// `index` parameter, the new elements are appended to the collection.
  ///
  /// Here's an example of inserting a range of integers into an array of the
  /// same type:
  ///
  ///     var numbers = [1, 2, 3, 4, 5]
  ///     numbers.insert(contentsOf: 100...103, at: 3)
  ///     print(numbers)
  ///     // Prints "[1, 2, 3, 100, 101, 102, 103, 4, 5]"
  ///
  /// Calling this method may invalidate any existing indices for use with this
  /// collection.
  ///
  /// - Parameter newElements: The new elements to insert into the collection.
  /// - Parameter i: The position at which to insert the new elements. `index`
  ///   must be a valid index of the collection.
  ///
  /// - Complexity: O(*m*), where *m* is the combined length of the collection
  ///   and `newElements`. If `i` is equal to the collection's `endIndex`
  ///   property, the complexity is O(*n*), where *n* is the length of
  ///   `newElements`.
  public mutating func insert<C : Collection>(
    contentsOf newElements: C, at i: Index
  ) where C.Iterator.Element == Iterator.Element {
    replaceSubrange(i..<i, with: newElements)
  }

  /// Removes and returns the element at the specified position.
  ///
  /// All the elements following the specified position are moved to close the
  /// gap. This example removes the middle element from an array of
  /// measurements.
  ///
  ///     var measurements = [1.2, 1.5, 2.9, 1.2, 1.6]
  ///     let removed = measurements.remove(at: 2)
  ///     print(measurements)
  ///     // Prints "[1.2, 1.5, 1.2, 1.6]"
  ///
  /// Calling this method may invalidate any existing indices for use with this
  /// collection.
  ///
  /// - Parameter position: The position of the element to remove. `position` must be
  ///   a valid index of the collection that is not equal to the collection's
  ///   end index.
  /// - Returns: The removed element.
  ///
  /// - Complexity: O(*n*), where *n* is the length of the collection.
  @discardableResult
  public mutating func remove(at position: Index) -> Iterator.Element {
    _precondition(!isEmpty, "can't remove from an empty collection")
    let result: Iterator.Element = self[position]
    replaceSubrange(position..<index(after: position), with: EmptyCollection())
    return result
  }

  /// Removes the elements in the specified subrange from the collection.
  ///
  /// All the elements following the specified position are moved to close the
  /// gap. This example removes two elements from the middle of an array of
  /// measurements.
  ///
  ///     var measurements = [1.2, 1.5, 2.9, 1.2, 1.5]
  ///     measurements.removeSubrange(1..<4)
  ///     print(measurements)
  ///     // Prints "[1.2, 1.5]"
  ///
  /// Calling this method may invalidate any existing indices for use with this
  /// collection.
  ///
  /// - Parameter bounds: The range of the collection to be removed. The
  ///   bounds of the range must be valid indices of the collection.
  ///
  /// - Complexity: O(*n*), where *n* is the length of the collection.
  public mutating func removeSubrange(_ bounds: Range<Index>) {
    replaceSubrange(bounds, with: EmptyCollection())
  }

  /// Removes the specified number of elements from the beginning of the
  /// collection.
  ///
  ///     var bugs = ["Aphid", "Bumblebee", "Cicada", "Damselfly", "Earwig"]
  ///     bugs.removeFirst(3)
  ///     print(bugs)
  ///     // Prints "["Damselfly", "Earwig"]"
  ///
  /// Calling this method may invalidate any existing indices for use with this
  /// collection.
  ///
  /// - Parameter n: The number of elements to remove from the collection.
  ///   `n` must be greater than or equal to zero and must not exceed the
  ///   number of elements in the collection.
  ///
  /// - Complexity: O(*n*), where *n* is the length of the collection.
  public mutating func removeFirst(_ n: Int) {
    if n == 0 { return }
    _precondition(n >= 0, "number of elements to remove should be non-negative")
    _precondition(count >= numericCast(n),
      "can't remove more items from a collection than it has")
    let end = index(startIndex, offsetBy: numericCast(n))
    removeSubrange(startIndex..<end)
  }

  /// Removes and returns the first element of the collection.
  ///
  /// The collection must not be empty.
  ///
  ///     var bugs = ["Aphid", "Bumblebee", "Cicada", "Damselfly", "Earwig"]
  ///     bugs.removeFirst()
  ///     print(bugs)
  ///     // Prints "["Bumblebee", "Cicada", "Damselfly", "Earwig"]"
  ///
  /// Calling this method may invalidate any existing indices for use with this
  /// collection.
  ///
  /// - Returns: The removed element.
  ///
  /// - Complexity: O(*n*), where *n* is the length of the collection.
  @discardableResult
  public mutating func removeFirst() -> Iterator.Element {
    _precondition(!isEmpty,
      "can't remove first element from an empty collection")
    let firstElement = first!
    removeFirst(1)
    return firstElement
  }

  /// Removes all elements from the collection.
  ///
  /// Calling this method may invalidate any existing indices for use with this
  /// collection.
  ///
  /// - Parameter keepCapacity: Pass `true` to request that the collection
  ///   avoid releasing its storage. Retaining the collection's storage can
  ///   be a useful optimization when you're planning to grow the collection
  ///   again. The default value is `false`.
  ///
  /// - Complexity: O(*n*), where *n* is the length of the collection.
  public mutating func removeAll(keepingCapacity keepCapacity: Bool = false) {
    if !keepCapacity {
      self = Self()
    }
    else {
      replaceSubrange(startIndex..<endIndex, with: EmptyCollection())
    }
  }

  /// Prepares the collection to store the specified number of elements, when
  /// doing so is appropriate for the underlying type.
  ///
  /// If you will be adding a known number of elements to a collection, use
  /// this method to avoid multiple reallocations. A type that conforms to
  /// `RangeReplaceableCollection` can choose how to respond when this method
  /// is called. Depending on the type, it may make sense to allocate more or
  /// less storage than requested or to take no action at all.
  ///
  /// - Parameter n: The requested number of elements to store.
  public mutating func reserveCapacity(_ n: IndexDistance) {}
}

// Offer the most specific slice type available for each possible combination of
// RangeReplaceable * (1 + Bidirectional + RandomAccess) * (1 + Mutable)
// collections.

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/RangeReplaceableCollection.swift.gyb", line: 811)

extension RangeReplaceableCollection where
  Self: MutableCollection,
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/RangeReplaceableCollection.swift.gyb", line: 817)
  Self.SubSequence == MutableRangeReplaceableSlice<Self>
{
  public subscript(bounds: Range<Index>)
      -> MutableRangeReplaceableSlice<Self> {
    get {
      _failEarlyRangeCheck(bounds, bounds: startIndex..<endIndex)
      return MutableRangeReplaceableSlice(base: self,
                                                       bounds: bounds)
    }
    set {
      _writeBackMutableSlice(&self, bounds: bounds, slice: newValue)
    }
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/RangeReplaceableCollection.swift.gyb", line: 802)
extension RangeReplaceableCollection where
    Self: BidirectionalCollection,
    Self.SubSequence == RangeReplaceableBidirectionalSlice<Self> {
  public subscript(bounds: Range<Index>)
      -> RangeReplaceableBidirectionalSlice<Self> {
    return RangeReplaceableBidirectionalSlice(base: self, bounds: bounds)
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/RangeReplaceableCollection.swift.gyb", line: 811)

extension RangeReplaceableCollection where
  Self: MutableCollection,
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/RangeReplaceableCollection.swift.gyb", line: 815)
  Self: BidirectionalCollection,
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/RangeReplaceableCollection.swift.gyb", line: 817)
  Self.SubSequence == MutableRangeReplaceableBidirectionalSlice<Self>
{
  public subscript(bounds: Range<Index>)
      -> MutableRangeReplaceableBidirectionalSlice<Self> {
    get {
      _failEarlyRangeCheck(bounds, bounds: startIndex..<endIndex)
      return MutableRangeReplaceableBidirectionalSlice(base: self,
                                                       bounds: bounds)
    }
    set {
      _writeBackMutableSlice(&self, bounds: bounds, slice: newValue)
    }
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/RangeReplaceableCollection.swift.gyb", line: 802)
extension RangeReplaceableCollection where
    Self: RandomAccessCollection,
    Self.SubSequence == RangeReplaceableRandomAccessSlice<Self> {
  public subscript(bounds: Range<Index>)
      -> RangeReplaceableRandomAccessSlice<Self> {
    return RangeReplaceableRandomAccessSlice(base: self, bounds: bounds)
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/RangeReplaceableCollection.swift.gyb", line: 811)

extension RangeReplaceableCollection where
  Self: MutableCollection,
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/RangeReplaceableCollection.swift.gyb", line: 815)
  Self: RandomAccessCollection,
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/RangeReplaceableCollection.swift.gyb", line: 817)
  Self.SubSequence == MutableRangeReplaceableRandomAccessSlice<Self>
{
  public subscript(bounds: Range<Index>)
      -> MutableRangeReplaceableRandomAccessSlice<Self> {
    get {
      _failEarlyRangeCheck(bounds, bounds: startIndex..<endIndex)
      return MutableRangeReplaceableRandomAccessSlice(base: self,
                                                       bounds: bounds)
    }
    set {
      _writeBackMutableSlice(&self, bounds: bounds, slice: newValue)
    }
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/RangeReplaceableCollection.swift.gyb", line: 832)

extension RangeReplaceableCollection where SubSequence == Self {
  /// Removes and returns the first element of the collection.
  ///
  /// The collection must not be empty.
  ///
  /// Calling this method may invalidate all saved indices of this
  /// collection. Do not rely on a previously stored index value after
  /// altering a collection with any operation that can change its length.
  ///
  /// - Returns: The first element of the collection.
  ///
  /// - Complexity: O(1)
  /// - Precondition: `!self.isEmpty`.
  @discardableResult
  public mutating func removeFirst() -> Iterator.Element {
    _precondition(!isEmpty, "can't remove items from an empty collection")
    let element = first!
    self = self[index(after: startIndex)..<endIndex]
    return element
  }

  /// Removes the specified number of elements from the beginning of the
  /// collection.
  ///
  /// Attempting to remove more elements than exist in the collection
  /// triggers a runtime error.
  ///
  /// Calling this method may invalidate all saved indices of this
  /// collection. Do not rely on a previously stored index value after
  /// altering a collection with any operation that can change its length.
  ///
  /// - Parameter n: The number of elements to remove from the collection.
  ///   `n` must be greater than or equal to zero and must not exceed the
  ///   number of elements in the collection.
  ///
  /// - Complexity: O(1)
  public mutating func removeFirst(_ n: Int) {
    if n == 0 { return }
    _precondition(n >= 0, "number of elements to remove should be non-negative")
    _precondition(count >= numericCast(n),
      "can't remove more items from a collection than it contains")
    self = self[index(startIndex, offsetBy: numericCast(n))..<endIndex]
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/RangeReplaceableCollection.swift.gyb", line: 879)
extension RangeReplaceableCollection
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/RangeReplaceableCollection.swift.gyb", line: 881)
  where
  Index : Strideable, Index.Stride : SignedInteger
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/RangeReplaceableCollection.swift.gyb", line: 884)
{
  /// Returns a half-open range denoting the same positions as `r`.
  internal func _makeHalfOpen(_ r: CountableRange<Index>) -> Range<Index> {
    // The upperBound of the result depends on whether `r` is a closed
    // range.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/RangeReplaceableCollection.swift.gyb", line: 894)
    return Range(r)
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/RangeReplaceableCollection.swift.gyb", line: 896)
  }

  /// Replaces the specified subrange of elements with the given collection.
  ///
  /// This method has the effect of removing the specified range of elements
  /// from the collection and inserting the new elements at the same location.
  /// The number of new elements need not match the number of elements being
  /// removed.
  ///
  /// In this example, three elements in the middle of an array of integers are
  /// replaced by the five elements of a `Repeated<Int>` instance.
  ///
  ///      var nums = [10, 20, 30, 40, 50]
  ///      nums.replaceSubrange(1...3, with: repeatElement(1, count: 5))
  ///      print(nums)
  ///      // Prints "[10, 1, 1, 1, 1, 1, 50]"
  ///
  /// If you pass a zero-length range as the `subrange` parameter, this method
  /// inserts the elements of `newElements` at `subrange.startIndex`. Calling
  /// the `insert(contentsOf:at:)` method instead is preferred.
  ///
  /// Likewise, if you pass a zero-length collection as the `newElements`
  /// parameter, this method removes the elements in the given subrange
  /// without replacement. Calling the `removeSubrange(_:)` method instead is
  /// preferred.
  ///
  /// Calling this method may invalidate any existing indices for use with this
  /// collection.
  ///
  /// - Parameters:
  ///   - subrange: The subrange of the collection to replace. The bounds of
  ///     the range must be valid indices of the collection.
  ///   - newElements: The new elements to add to the collection.
  ///
  /// - Complexity: O(*m*), where *m* is the combined length of the collection
  ///   and `newElements`. If the call to `replaceSubrange` simply appends the
  ///   contents of `newElements` to the collection, the complexity is O(*n*),
  ///   where *n* is the length of `newElements`.
  public mutating func replaceSubrange<C>(
    _ subrange: CountableRange<Index>,
    with newElements: C
  ) where C : Collection, C.Iterator.Element == Iterator.Element {
    self.replaceSubrange(_makeHalfOpen(subrange), with: newElements)
  }

  /// Removes the elements in the specified subrange from the collection.
  ///
  /// All the elements following the specified position are moved to close the
  /// gap. This example removes two elements from the middle of an array of
  /// measurements.
  ///
  ///     var measurements = [1.2, 1.5, 2.9, 1.2, 1.5]
  ///     measurements.removeSubrange(1..<4)
  ///     print(measurements)
  ///     // Prints "[1.2, 1.5]"
  ///
  /// Calling this method may invalidate any existing indices for use with this
  /// collection.
  ///
  /// - Parameter bounds: The range of the collection to be removed. The
  ///   bounds of the range must be valid indices of the collection.
  ///
  /// - Complexity: O(*n*), where *n* is the length of the collection.
  public mutating func removeSubrange(_ bounds: CountableRange<Index>) {
    removeSubrange(_makeHalfOpen(bounds))
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/RangeReplaceableCollection.swift.gyb", line: 879)
extension RangeReplaceableCollection
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/RangeReplaceableCollection.swift.gyb", line: 884)
{
  /// Returns a half-open range denoting the same positions as `r`.
  internal func _makeHalfOpen(_ r: ClosedRange<Index>) -> Range<Index> {
    // The upperBound of the result depends on whether `r` is a closed
    // range.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/RangeReplaceableCollection.swift.gyb", line: 890)
    return Range(uncheckedBounds: (
      lower: r.lowerBound,
      upper: index(after: r.upperBound)))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/RangeReplaceableCollection.swift.gyb", line: 896)
  }

  /// Replaces the specified subrange of elements with the given collection.
  ///
  /// This method has the effect of removing the specified range of elements
  /// from the collection and inserting the new elements at the same location.
  /// The number of new elements need not match the number of elements being
  /// removed.
  ///
  /// In this example, three elements in the middle of an array of integers are
  /// replaced by the five elements of a `Repeated<Int>` instance.
  ///
  ///      var nums = [10, 20, 30, 40, 50]
  ///      nums.replaceSubrange(1...3, with: repeatElement(1, count: 5))
  ///      print(nums)
  ///      // Prints "[10, 1, 1, 1, 1, 1, 50]"
  ///
  /// If you pass a zero-length range as the `subrange` parameter, this method
  /// inserts the elements of `newElements` at `subrange.startIndex`. Calling
  /// the `insert(contentsOf:at:)` method instead is preferred.
  ///
  /// Likewise, if you pass a zero-length collection as the `newElements`
  /// parameter, this method removes the elements in the given subrange
  /// without replacement. Calling the `removeSubrange(_:)` method instead is
  /// preferred.
  ///
  /// Calling this method may invalidate any existing indices for use with this
  /// collection.
  ///
  /// - Parameters:
  ///   - subrange: The subrange of the collection to replace. The bounds of
  ///     the range must be valid indices of the collection.
  ///   - newElements: The new elements to add to the collection.
  ///
  /// - Complexity: O(*m*), where *m* is the combined length of the collection
  ///   and `newElements`. If the call to `replaceSubrange` simply appends the
  ///   contents of `newElements` to the collection, the complexity is O(*n*),
  ///   where *n* is the length of `newElements`.
  public mutating func replaceSubrange<C>(
    _ subrange: ClosedRange<Index>,
    with newElements: C
  ) where C : Collection, C.Iterator.Element == Iterator.Element {
    self.replaceSubrange(_makeHalfOpen(subrange), with: newElements)
  }

  /// Removes the elements in the specified subrange from the collection.
  ///
  /// All the elements following the specified position are moved to close the
  /// gap. This example removes two elements from the middle of an array of
  /// measurements.
  ///
  ///     var measurements = [1.2, 1.5, 2.9, 1.2, 1.5]
  ///     measurements.removeSubrange(1..<4)
  ///     print(measurements)
  ///     // Prints "[1.2, 1.5]"
  ///
  /// Calling this method may invalidate any existing indices for use with this
  /// collection.
  ///
  /// - Parameter bounds: The range of the collection to be removed. The
  ///   bounds of the range must be valid indices of the collection.
  ///
  /// - Complexity: O(*n*), where *n* is the length of the collection.
  public mutating func removeSubrange(_ bounds: ClosedRange<Index>) {
    removeSubrange(_makeHalfOpen(bounds))
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/RangeReplaceableCollection.swift.gyb", line: 879)
extension RangeReplaceableCollection
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/RangeReplaceableCollection.swift.gyb", line: 881)
  where
  Index : Strideable, Index.Stride : SignedInteger
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/RangeReplaceableCollection.swift.gyb", line: 884)
{
  /// Returns a half-open range denoting the same positions as `r`.
  internal func _makeHalfOpen(_ r: CountableClosedRange<Index>) -> Range<Index> {
    // The upperBound of the result depends on whether `r` is a closed
    // range.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/RangeReplaceableCollection.swift.gyb", line: 890)
    return Range(uncheckedBounds: (
      lower: r.lowerBound,
      upper: index(after: r.upperBound)))
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/RangeReplaceableCollection.swift.gyb", line: 896)
  }

  /// Replaces the specified subrange of elements with the given collection.
  ///
  /// This method has the effect of removing the specified range of elements
  /// from the collection and inserting the new elements at the same location.
  /// The number of new elements need not match the number of elements being
  /// removed.
  ///
  /// In this example, three elements in the middle of an array of integers are
  /// replaced by the five elements of a `Repeated<Int>` instance.
  ///
  ///      var nums = [10, 20, 30, 40, 50]
  ///      nums.replaceSubrange(1...3, with: repeatElement(1, count: 5))
  ///      print(nums)
  ///      // Prints "[10, 1, 1, 1, 1, 1, 50]"
  ///
  /// If you pass a zero-length range as the `subrange` parameter, this method
  /// inserts the elements of `newElements` at `subrange.startIndex`. Calling
  /// the `insert(contentsOf:at:)` method instead is preferred.
  ///
  /// Likewise, if you pass a zero-length collection as the `newElements`
  /// parameter, this method removes the elements in the given subrange
  /// without replacement. Calling the `removeSubrange(_:)` method instead is
  /// preferred.
  ///
  /// Calling this method may invalidate any existing indices for use with this
  /// collection.
  ///
  /// - Parameters:
  ///   - subrange: The subrange of the collection to replace. The bounds of
  ///     the range must be valid indices of the collection.
  ///   - newElements: The new elements to add to the collection.
  ///
  /// - Complexity: O(*m*), where *m* is the combined length of the collection
  ///   and `newElements`. If the call to `replaceSubrange` simply appends the
  ///   contents of `newElements` to the collection, the complexity is O(*n*),
  ///   where *n* is the length of `newElements`.
  public mutating func replaceSubrange<C>(
    _ subrange: CountableClosedRange<Index>,
    with newElements: C
  ) where C : Collection, C.Iterator.Element == Iterator.Element {
    self.replaceSubrange(_makeHalfOpen(subrange), with: newElements)
  }

  /// Removes the elements in the specified subrange from the collection.
  ///
  /// All the elements following the specified position are moved to close the
  /// gap. This example removes two elements from the middle of an array of
  /// measurements.
  ///
  ///     var measurements = [1.2, 1.5, 2.9, 1.2, 1.5]
  ///     measurements.removeSubrange(1..<4)
  ///     print(measurements)
  ///     // Prints "[1.2, 1.5]"
  ///
  /// Calling this method may invalidate any existing indices for use with this
  /// collection.
  ///
  /// - Parameter bounds: The range of the collection to be removed. The
  ///   bounds of the range must be valid indices of the collection.
  ///
  /// - Complexity: O(*n*), where *n* is the length of the collection.
  public mutating func removeSubrange(_ bounds: CountableClosedRange<Index>) {
    removeSubrange(_makeHalfOpen(bounds))
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/RangeReplaceableCollection.swift.gyb", line: 964)

extension RangeReplaceableCollection {
  public mutating func _customRemoveLast() -> Iterator.Element? {
    return nil
  }

  public mutating func _customRemoveLast(_ n: Int) -> Bool {
    return false
  }
}

extension RangeReplaceableCollection
  where
  Self : BidirectionalCollection,
  SubSequence == Self {

  public mutating func _customRemoveLast() -> Iterator.Element? {
    let element = last!
    self = self[startIndex..<index(before: endIndex)]
    return element
  }

  public mutating func _customRemoveLast(_ n: Int) -> Bool {
    self = self[startIndex..<index(endIndex, offsetBy: numericCast(-n))]
    return true
  }
}

extension RangeReplaceableCollection where Self : BidirectionalCollection {
  /// Removes and returns the last element of the collection.
  ///
  /// The collection must not be empty.
  ///
  /// Calling this method may invalidate all saved indices of this
  /// collection. Do not rely on a previously stored index value after
  /// altering a collection with any operation that can change its length.
  ///
  /// - Returns: The last element of the collection.
  ///
  /// - Complexity: O(1)
  @discardableResult
  public mutating func removeLast() -> Iterator.Element {
    _precondition(!isEmpty, "can't remove last element from an empty collection")
    if let result = _customRemoveLast() {
      return result
    }
    return remove(at: index(before: endIndex))
  }

  /// Removes the specified number of elements from the end of the
  /// collection.
  ///
  /// Attempting to remove more elements than exist in the collection
  /// triggers a runtime error.
  ///
  /// Calling this method may invalidate all saved indices of this
  /// collection. Do not rely on a previously stored index value after
  /// altering a collection with any operation that can change its length.
  ///
  /// - Parameter n: The number of elements to remove from the collection.
  ///   `n` must be greater than or equal to zero and must not exceed the
  ///   number of elements in the collection.
  ///
  /// - Complexity: O(*n*), where *n* is the specified number of elements.
  public mutating func removeLast(_ n: Int) {
    if n == 0 { return }
    _precondition(n >= 0, "number of elements to remove should be non-negative")
    _precondition(count >= numericCast(n),
      "can't remove more items from a collection than it contains")
    if _customRemoveLast(n) {
      return
    }
    let end = endIndex
    removeSubrange(index(end, offsetBy: numericCast(-n))..<end)
  }
}

// FIXME: swift-3-indexing-model: file a bug for the compiler?
/// Ambiguity breakers.
extension RangeReplaceableCollection
  where
  Self : BidirectionalCollection,
  SubSequence == Self
{
  /// Removes and returns the last element of the collection.
  ///
  /// The collection must not be empty.
  ///
  /// Calling this method may invalidate all saved indices of this
  /// collection. Do not rely on a previously stored index value after
  /// altering a collection with any operation that can change its length.
  ///
  /// - Returns: The last element of the collection.
  ///
  /// - Complexity: O(1)
  @discardableResult
  public mutating func removeLast() -> Iterator.Element {
    _precondition(!isEmpty, "can't remove last element from an empty collection")
    if let result = _customRemoveLast() {
      return result
    }
    return remove(at: index(before: endIndex))
  }

  /// Removes the specified number of elements from the end of the
  /// collection.
  ///
  /// Attempting to remove more elements than exist in the collection
  /// triggers a runtime error.
  ///
  /// Calling this method may invalidate all saved indices of this
  /// collection. Do not rely on a previously stored index value after
  /// altering a collection with any operation that can change its length.
  ///
  /// - Parameter n: The number of elements to remove from the collection.
  ///   `n` must be greater than or equal to zero and must not exceed the
  ///   number of elements in the collection.
  ///
  /// - Complexity: O(*n*), where *n* is the specified number of elements.
  public mutating func removeLast(_ n: Int) {
    if n == 0 { return }
    _precondition(n >= 0, "number of elements to remove should be non-negative")
    _precondition(count >= numericCast(n),
      "can't remove more items from a collection than it contains")
    if _customRemoveLast(n) {
      return
    }
    let end = endIndex
    removeSubrange(index(end, offsetBy: numericCast(-n))..<end)
  }
}

/// Creates a new collection by concatenating the elements of a collection and
/// a sequence.
///
/// The two arguments must have the same `Element` type. For example, you can
/// concatenate the elements of an integer array and a `Range<Int>` instance.
///
///     let numbers = [1, 2, 3, 4]
///     let moreNumbers = numbers + 5...10
///     print(moreNumbers)
///     // Prints "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]"
///
/// The resulting collection has the type of the argument on the left-hand
/// side. In the example above, `moreNumbers` has the same type as `numbers`,
/// which is `[Int]`.
///
/// - Parameters:
///   - lhs: A range-replaceable collection.
///   - rhs: A collection or finite sequence.
public func + <C : RangeReplaceableCollection, S : Sequence>(lhs: C, rhs: S) -> C
  where S.Iterator.Element == C.Iterator.Element {

  var lhs = lhs
  // FIXME: what if lhs is a reference type?  This will mutate it.
  lhs.reserveCapacity(lhs.count + numericCast(rhs.underestimatedCount))
  lhs.append(contentsOf: rhs)
  return lhs
}

/// Creates a new collection by concatenating the elements of a sequence and a
/// collection.
///
/// The two arguments must have the same `Element` type. For example, you can
/// concatenate the elements of a `Range<Int>` instance and an integer array.
///
///     let numbers = [7, 8, 9, 10]
///     let moreNumbers = 1...6 + numbers
///     print(moreNumbers)
///     // Prints "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]"
///
/// The resulting collection has the type of argument on the right-hand side.
/// In the example above, `moreNumbers` has the same type as `numbers`, which
/// is `[Int]`.
///
/// - Parameters:
///   - lhs: A collection or finite sequence.
///   - rhs: A range-replaceable collection.
public func + <C : RangeReplaceableCollection, S : Sequence>(lhs: S, rhs: C) -> C
  where S.Iterator.Element == C.Iterator.Element {

  var result = C()
  result.reserveCapacity(rhs.count + numericCast(lhs.underestimatedCount))
  result.append(contentsOf: lhs)
  result.append(contentsOf: rhs)
  return result
}

/// Creates a new collection by concatenating the elements of two collections.
///
/// The two arguments must have the same `Element` type. For example, you can
/// concatenate the elements of two integer arrays.
///
///     let lowerNumbers = [1, 2, 3, 4]
///     let higherNumbers: ContiguousArray = [5, 6, 7, 8, 9, 10]
///     let allNumbers = lowerNumbers + higherNumbers
///     print(allNumbers)
///     // Prints "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]"
///
/// The resulting collection has the type of the argument on the left-hand
/// side. In the example above, `moreNumbers` has the same type as `numbers`,
/// which is `[Int]`.
///
/// - Parameters:
///   - lhs: A range-replaceable collection.
///   - rhs: Another range-replaceable collection.
public func +<
  RRC1 : RangeReplaceableCollection,
  RRC2 : RangeReplaceableCollection
>(lhs: RRC1, rhs: RRC2) -> RRC1
  where RRC1.Iterator.Element == RRC2.Iterator.Element {

  var lhs = lhs
  // FIXME: what if lhs is a reference type?  This will mutate it.
  lhs.reserveCapacity(lhs.count + numericCast(rhs.count))
  lhs.append(contentsOf: rhs)
  return lhs
}

/// Appends the elements of a sequence to a range-replaceable collection.
///
/// Use this operator to append the elements of a sequence to the end of
/// range-replaceable collection with same `Element` type. This example appends
/// the elements of a `Range<Int>` instance to an array of integers.
///
///     var numbers = [1, 2, 3, 4, 5]
///     numbers += 10...15
///     print(numbers)
///     // Prints "[1, 2, 3, 4, 5, 10, 11, 12, 13, 14, 15]"
///
/// - Parameters:
///   - lhs: The array to append to.
///   - rhs: A collection or finite sequence.
///
/// - Complexity: O(*n*), where *n* is the length of the resulting array.
public func += <
  R : RangeReplaceableCollection, S : Sequence
>(lhs: inout R, rhs: S) 
 where R.Iterator.Element == S.Iterator.Element {
  lhs.append(contentsOf: rhs)
}

@available(*, unavailable, renamed: "RangeReplaceableCollection")
public typealias RangeReplaceableCollectionType = RangeReplaceableCollection

extension RangeReplaceableCollection {
  @available(*, unavailable, renamed: "replaceSubrange(_:with:)")
  public mutating func replaceRange<C>(
    _ subrange: Range<Index>,
    with newElements: C
  ) where C : Collection, C.Iterator.Element == Iterator.Element {
    Builtin.unreachable()
  }

  @available(*, unavailable, renamed: "remove(at:)")
  public mutating func removeAtIndex(_ i: Index) -> Iterator.Element {
    Builtin.unreachable()
  }

  @available(*, unavailable, renamed: "removeSubrange")
  public mutating func removeRange(_ subrange: Range<Index>) {
  }

  @available(*, unavailable, renamed: "append(contentsOf:)")
  public mutating func appendContentsOf<S : Sequence>(_ newElements: S)
    where S.Iterator.Element == Iterator.Element {
    Builtin.unreachable()
  }

  @available(*, unavailable, renamed: "insert(contentsOf:at:)")
  public mutating func insertContentsOf<C : Collection>(
    _ newElements: C, at i: Index
  ) where C.Iterator.Element == Iterator.Element {
    Builtin.unreachable()
  }
}

