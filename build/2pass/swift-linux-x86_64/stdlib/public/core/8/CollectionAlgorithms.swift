// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 1)
//===--- CollectionAlgorithms.swift.gyb -----------------------*- swift -*-===//
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

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 20)

//===----------------------------------------------------------------------===//
// last
//===----------------------------------------------------------------------===//

extension BidirectionalCollection {
  /// The last element of the collection.
  ///
  /// If the collection is empty, the value of this property is `nil`.
  ///
  ///     let numbers = [10, 20, 30, 40, 50]
  ///     if let lastNumber = numbers.last {
  ///         print(lastNumber)
  ///     }
  ///     // Prints "50"
  public var last: Iterator.Element? {
    return isEmpty ? nil : self[index(before: endIndex)]
  }
}

//===----------------------------------------------------------------------===//
// index(of:)/index(where:)
//===----------------------------------------------------------------------===//

extension Collection where Iterator.Element : Equatable {
  /// Returns the first index where the specified value appears in the
  /// collection.
  ///
  /// After using `index(of:)` to find the position of a particular element in
  /// a collection, you can use it to access the element by subscripting. This
  /// example shows how you can modify one of the names in an array of
  /// students.
  ///
  ///     var students = ["Ben", "Ivy", "Jordell", "Maxime"]
  ///     if let i = students.index(of: "Maxime") {
  ///         students[i] = "Max"
  ///     }
  ///     print(students)
  ///     // Prints "["Ben", "Ivy", "Jordell", "Max"]"
  ///
  /// - Parameter element: An element to search for in the collection.
  /// - Returns: The first index where `element` is found. If `element` is not
  ///   found in the collection, returns `nil`.
  ///
  /// - SeeAlso: `index(where:)`
  public func index(of element: Iterator.Element) -> Index? {
    if let result = _customIndexOfEquatableElement(element) {
      return result
    }

    var i = self.startIndex
    while i != self.endIndex {
      if self[i] == element {
        return i
      }
      self.formIndex(after: &i)
    }
    return nil
  }
}

extension Collection {
  /// Returns the first index in which an element of the collection satisfies
  /// the given predicate.
  ///
  /// You can use the predicate to find an element of a type that doesn't
  /// conform to the `Equatable` protocol or to find an element that matches
  /// particular criteria. Here's an example that finds a student name that
  /// begins with the letter "A":
  ///
  ///     let students = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]
  ///     if let i = students.index(where: { $0.hasPrefix("A") }) {
  ///         print("\(students[i]) starts with 'A'!")
  ///     }
  ///     // Prints "Abena starts with 'A'!"
  ///
  /// - Parameter predicate: A closure that takes an element as its argument
  ///   and returns a Boolean value that indicates whether the passed element
  ///   represents a match.
  /// - Returns: The index of the first element for which `predicate` returns
  ///   `true`. If no elements in the collection satisfy the given predicate,
  ///   returns `nil`.
  ///
  /// - SeeAlso: `index(of:)`
  public func index(
    where predicate: (Iterator.Element) throws -> Bool
  ) rethrows -> Index? {
    var i = self.startIndex
    while i != self.endIndex {
      if try predicate(self[i]) {
        return i
      }
      self.formIndex(after: &i)
    }
    return nil
  }
}

//===----------------------------------------------------------------------===//
// MutableCollection
//===----------------------------------------------------------------------===//

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 140)

//===----------------------------------------------------------------------===//
// partition()
//===----------------------------------------------------------------------===//

extension MutableCollection {
  public mutating func partition(
    by belongsInSecondPartition: (Iterator.Element) throws -> Bool
  ) rethrows -> Index {

    var pivot = startIndex
    while true {
      if pivot == endIndex {
        return pivot
      }
      if try belongsInSecondPartition(self[pivot]) {
        break
      }
      formIndex(after: &pivot)
    }

    var i = index(after: pivot)
    while i < endIndex {
      if try !belongsInSecondPartition(self[i]) {
        swap(&self[i], &self[pivot])
        formIndex(after: &pivot)
      }
      formIndex(after: &i)
    }
    return pivot
  }
}

extension MutableCollection where Self : BidirectionalCollection {
  public mutating func partition(
    by belongsInSecondPartition: (Iterator.Element) throws -> Bool
  ) rethrows -> Index {
    let maybeOffset = try _withUnsafeMutableBufferPointerIfSupported {
      (baseAddress, count) -> Int in
      var bufferPointer =
        UnsafeMutableBufferPointer(start: baseAddress, count: count)
      let unsafeBufferPivot = try bufferPointer.partition(
        by: belongsInSecondPartition)
      return unsafeBufferPivot - bufferPointer.startIndex
    }
    if let offset = maybeOffset {
      return index(startIndex, offsetBy: numericCast(offset))
    }

    var lo = startIndex
    var hi = endIndex

    // 'Loop' invariants (at start of Loop, all are true):
    // * lo < hi
    // * predicate(self[i]) == false, for i in startIndex ..< lo
    // * predicate(self[i]) == true, for i in hi ..< endIndex

    Loop: while true {
      FindLo: repeat {
        while lo < hi {
          if try belongsInSecondPartition(self[lo]) { break FindLo }
          formIndex(after: &lo)
        }
        break Loop
      } while false

      FindHi: repeat {
        formIndex(before: &hi)
        while lo < hi {
          if try !belongsInSecondPartition(self[hi]) { break FindHi }
          formIndex(before: &hi)
        }
        break Loop
      } while false

      swap(&self[lo], &self[hi])
      formIndex(after: &lo)
    }

    return lo
  }
}

//===----------------------------------------------------------------------===//
// sorted()
//===----------------------------------------------------------------------===//

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 228)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 230)

extension Sequence where Self.Iterator.Element : Comparable {
  /// Returns the elements of the sequence, sorted.
  ///
  /// You can sort any sequence of elements that conform to the
  /// `Comparable` protocol by calling this method. Elements are sorted in
  /// ascending order.
  ///
  /// The sorting algorithm is not stable. A nonstable sort may change the
  /// relative order of elements that compare equal.
  ///
  /// Here's an example of sorting a list of students' names. Strings in Swift
  /// conform to the `Comparable` protocol, so the names are sorted in
  /// ascending order according to the less-than operator (`<`).
  ///
  ///     let students: Set = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]
  ///     let sortedStudents = students.sorted()
  ///     print(sortedStudents)
  ///     // Prints "["Abena", "Akosua", "Kofi", "Kweku", "Peter"]"
  ///
  /// To sort the elements of your sequence in descending order, pass the
  /// greater-than operator (`>`) to the `sorted(by:)` method.
  ///
  ///     let descendingStudents = students.sorted(by: >)
  ///     print(descendingStudents)
  ///     // Prints "["Peter", "Kweku", "Kofi", "Akosua", "Abena"]"
  ///
  /// - Returns: A sorted array of the sequence's elements.
  ///
  /// - SeeAlso: `sorted(by:)`
  /// 
  public func sorted() -> [Iterator.Element] {
    var result = ContiguousArray(self)
    result.sort()
    return Array(result)
  }
}

extension Sequence {
  /// Returns the elements of the sequence, sorted using the given
  /// predicate as the comparison between elements.
  ///
  /// When you want to sort a sequence of elements that don't conform to
  /// the `Comparable` protocol, pass a predicate to this method that returns
  /// `true` when the first element passed should be ordered before the
  /// second. The elements of the resulting array are ordered according to the
  /// given predicate.
  ///
  /// The predicate must be a *strict weak ordering* over the elements. That
  /// is, for any elements `a`, `b`, and `c`, the following conditions must
  /// hold:
  ///
  /// - `areInIncreasingOrder(a, a)` is always `false`. (Irreflexivity)
  /// - If `areInIncreasingOrder(a, b)` and `areInIncreasingOrder(b, c)` are
  ///   both `true`, then `areInIncreasingOrder(a, c)` is also `true`.
  ///   (Transitive comparability)
  /// - Two elements are *incomparable* if neither is ordered before the other
  ///   according to the predicate. If `a` and `b` are incomparable, and `b`
  ///   and `c` are incomparable, then `a` and `c` are also incomparable.
  ///   (Transitive incomparability)
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 278)
  /// The sorting algorithm is not stable. A nonstable sort may change the
  /// relative order of elements for which `areInIncreasingOrder` does not
  /// establish an order.
  ///
  /// In the following example, the predicate provides an ordering for an array
  /// of a custom `HTTPResponse` type. The predicate orders errors before
  /// successes and sorts the error responses by their error code.
  ///
  ///     enum HTTPResponse {
  ///         case ok
  ///         case error(Int)
  ///     }
  ///
  ///     let responses: [HTTPResponse] = [.error(500), .ok, .ok, .error(404), .error(403)]
  ///     let sortedResponses = responses.sorted {
  ///         switch ($0, $1) {
  ///         // Order errors by code
  ///         case let (.error(aCode), .error(bCode)):
  ///             return aCode < bCode
  ///
  ///         // All successes are equivalent, so none is before any other
  ///         case (.ok, .ok): return false
  ///
  ///         // Order errors before successes
  ///         case (.error, .ok): return true
  ///         case (.ok, .error): return false
  ///         }
  ///     }
  ///     print(sortedResponses)
  ///     // Prints "[.error(403), .error(404), .error(500), .ok, .ok]"
  ///
  /// You also use this method to sort elements that conform to the
  /// `Comparable` protocol in descending order. To sort your sequence
  /// in descending order, pass the greater-than operator (`>`) as the
  /// `areInIncreasingOrder` parameter.
  ///
  ///     let students: Set = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]
  ///     let descendingStudents = students.sorted(by: >)
  ///     print(descendingStudents)
  ///     // Prints "["Peter", "Kweku", "Kofi", "Akosua", "Abena"]"
  ///
  /// Calling the related `sorted()` method is equivalent to calling this
  /// method and passing the less-than operator (`<`) as the predicate.
  ///
  ///     print(students.sorted())
  ///     // Prints "["Abena", "Akosua", "Kofi", "Kweku", "Peter"]"
  ///     print(students.sorted(by: <))
  ///     // Prints "["Abena", "Akosua", "Kofi", "Kweku", "Peter"]"
  ///
  /// - Parameter areInIncreasingOrder: A predicate that returns `true` if its first
  ///   argument should be ordered before its second argument; otherwise,
  ///   `false`.
  /// - Returns: A sorted array of the sequence's elements.
  ///
  /// - SeeAlso: `sorted()`
  /// 
  public func sorted(
    by areInIncreasingOrder:
      (Iterator.Element, Iterator.Element) -> Bool
  ) -> [Iterator.Element] {
    var result = ContiguousArray(self)
    result.sort(by: areInIncreasingOrder)
    return Array(result)
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 228)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 230)

extension MutableCollection where Self.Iterator.Element : Comparable {
  /// Returns the elements of the collection, sorted.
  ///
  /// You can sort any collection of elements that conform to the
  /// `Comparable` protocol by calling this method. Elements are sorted in
  /// ascending order.
  ///
  /// The sorting algorithm is not stable. A nonstable sort may change the
  /// relative order of elements that compare equal.
  ///
  /// Here's an example of sorting a list of students' names. Strings in Swift
  /// conform to the `Comparable` protocol, so the names are sorted in
  /// ascending order according to the less-than operator (`<`).
  ///
  ///     let students: Set = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]
  ///     let sortedStudents = students.sorted()
  ///     print(sortedStudents)
  ///     // Prints "["Abena", "Akosua", "Kofi", "Kweku", "Peter"]"
  ///
  /// To sort the elements of your collection in descending order, pass the
  /// greater-than operator (`>`) to the `sorted(by:)` method.
  ///
  ///     let descendingStudents = students.sorted(by: >)
  ///     print(descendingStudents)
  ///     // Prints "["Peter", "Kweku", "Kofi", "Akosua", "Abena"]"
  ///
  /// - Returns: A sorted array of the collection's elements.
  ///
  /// - SeeAlso: `sorted(by:)`
  /// - MutatingVariant: sort
  public func sorted() -> [Iterator.Element] {
    var result = ContiguousArray(self)
    result.sort()
    return Array(result)
  }
}

extension MutableCollection {
  /// Returns the elements of the collection, sorted using the given
  /// predicate as the comparison between elements.
  ///
  /// When you want to sort a collection of elements that don't conform to
  /// the `Comparable` protocol, pass a predicate to this method that returns
  /// `true` when the first element passed should be ordered before the
  /// second. The elements of the resulting array are ordered according to the
  /// given predicate.
  ///
  /// The predicate must be a *strict weak ordering* over the elements. That
  /// is, for any elements `a`, `b`, and `c`, the following conditions must
  /// hold:
  ///
  /// - `areInIncreasingOrder(a, a)` is always `false`. (Irreflexivity)
  /// - If `areInIncreasingOrder(a, b)` and `areInIncreasingOrder(b, c)` are
  ///   both `true`, then `areInIncreasingOrder(a, c)` is also `true`.
  ///   (Transitive comparability)
  /// - Two elements are *incomparable* if neither is ordered before the other
  ///   according to the predicate. If `a` and `b` are incomparable, and `b`
  ///   and `c` are incomparable, then `a` and `c` are also incomparable.
  ///   (Transitive incomparability)
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 278)
  /// The sorting algorithm is not stable. A nonstable sort may change the
  /// relative order of elements for which `areInIncreasingOrder` does not
  /// establish an order.
  ///
  /// In the following example, the predicate provides an ordering for an array
  /// of a custom `HTTPResponse` type. The predicate orders errors before
  /// successes and sorts the error responses by their error code.
  ///
  ///     enum HTTPResponse {
  ///         case ok
  ///         case error(Int)
  ///     }
  ///
  ///     let responses: [HTTPResponse] = [.error(500), .ok, .ok, .error(404), .error(403)]
  ///     let sortedResponses = responses.sorted {
  ///         switch ($0, $1) {
  ///         // Order errors by code
  ///         case let (.error(aCode), .error(bCode)):
  ///             return aCode < bCode
  ///
  ///         // All successes are equivalent, so none is before any other
  ///         case (.ok, .ok): return false
  ///
  ///         // Order errors before successes
  ///         case (.error, .ok): return true
  ///         case (.ok, .error): return false
  ///         }
  ///     }
  ///     print(sortedResponses)
  ///     // Prints "[.error(403), .error(404), .error(500), .ok, .ok]"
  ///
  /// You also use this method to sort elements that conform to the
  /// `Comparable` protocol in descending order. To sort your collection
  /// in descending order, pass the greater-than operator (`>`) as the
  /// `areInIncreasingOrder` parameter.
  ///
  ///     let students: Set = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]
  ///     let descendingStudents = students.sorted(by: >)
  ///     print(descendingStudents)
  ///     // Prints "["Peter", "Kweku", "Kofi", "Akosua", "Abena"]"
  ///
  /// Calling the related `sorted()` method is equivalent to calling this
  /// method and passing the less-than operator (`<`) as the predicate.
  ///
  ///     print(students.sorted())
  ///     // Prints "["Abena", "Akosua", "Kofi", "Kweku", "Peter"]"
  ///     print(students.sorted(by: <))
  ///     // Prints "["Abena", "Akosua", "Kofi", "Kweku", "Peter"]"
  ///
  /// - Parameter areInIncreasingOrder: A predicate that returns `true` if its first
  ///   argument should be ordered before its second argument; otherwise,
  ///   `false`.
  /// - Returns: A sorted array of the collection's elements.
  ///
  /// - SeeAlso: `sorted()`
  /// - MutatingVariant: sort
  public func sorted(
    by areInIncreasingOrder:
      (Iterator.Element, Iterator.Element) -> Bool
  ) -> [Iterator.Element] {
    var result = ContiguousArray(self)
    result.sort(by: areInIncreasingOrder)
    return Array(result)
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 346)

extension MutableCollection
  where
  Self : RandomAccessCollection,
  Self.Iterator.Element : Comparable {

  /// Sorts the collection in place.
  ///
  /// You can sort any mutable collection of elements that conform to the
  /// `Comparable` protocol by calling this method. Elements are sorted in
  /// ascending order.
  ///
  /// The sorting algorithm is not stable. A nonstable sort may change the
  /// relative order of elements that compare equal.
  ///
  /// Here's an example of sorting a list of students' names. Strings in Swift
  /// conform to the `Comparable` protocol, so the names are sorted in
  /// ascending order according to the less-than operator (`<`).
  ///
  ///     var students = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]
  ///     students.sort()
  ///     print(students)
  ///     // Prints "["Abena", "Akosua", "Kofi", "Kweku", "Peter"]"
  ///
  /// To sort the elements of your collection in descending order, pass the
  /// greater-than operator (`>`) to the `sort(by:)` method.
  ///
  ///     students.sort(by: >)
  ///     print(students)
  ///     // Prints "["Peter", "Kweku", "Kofi", "Akosua", "Abena"]"
  public mutating func sort() {
    let didSortUnsafeBuffer: Void? =
      _withUnsafeMutableBufferPointerIfSupported {
      (baseAddress, count) -> Void in
      var bufferPointer =
        UnsafeMutableBufferPointer(start: baseAddress, count: count)
      bufferPointer.sort()
      return ()
    }
    if didSortUnsafeBuffer == nil {
      _introSort(&self, subRange: startIndex..<endIndex)
    }
  }
}

extension MutableCollection where Self : RandomAccessCollection {
  /// Sorts the collection in place, using the given predicate as the
  /// comparison between elements.
  ///
  /// When you want to sort a collection of elements that doesn't conform to
  /// the `Comparable` protocol, pass a closure to this method that returns
  /// `true` when the first element passed should be ordered before the
  /// second.
  ///
  /// The predicate must be a *strict weak ordering* over the elements. That
  /// is, for any elements `a`, `b`, and `c`, the following conditions must
  /// hold:
  ///
  /// - `areInIncreasingOrder(a, a)` is always `false`. (Irreflexivity)
  /// - If `areInIncreasingOrder(a, b)` and `areInIncreasingOrder(b, c)` are
  ///   both `true`, then `areInIncreasingOrder(a, c)` is also `true`.
  ///   (Transitive comparability)
  /// - Two elements are *incomparable* if neither is ordered before the other
  ///   according to the predicate. If `a` and `b` are incomparable, and `b`
  ///   and `c` are incomparable, then `a` and `c` are also incomparable.
  ///   (Transitive incomparability)
  ///
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 400)
  /// The sorting algorithm is not stable. A nonstable sort may change the
  /// relative order of elements for which `areInIncreasingOrder` does not
  /// establish an order.
  ///
  /// In the following example, the closure provides an ordering for an array
  /// of a custom enumeration that describes an HTTP response. The predicate
  /// orders errors before successes and sorts the error responses by their
  /// error code.
  ///
  ///     enum HTTPResponse {
  ///         case ok
  ///         case error(Int)
  ///     }
  ///
  ///     var responses: [HTTPResponse] = [.error(500), .ok, .ok, .error(404), .error(403)]
  ///     responses.sort {
  ///         switch ($0, $1) {
  ///         // Order errors by code
  ///         case let (.error(aCode), .error(bCode)):
  ///             return aCode < bCode
  ///
  ///         // All successes are equivalent, so none is before any other
  ///         case (.ok, .ok): return false
  ///
  ///         // Order errors before successes
  ///         case (.error, .ok): return true
  ///         case (.ok, .error): return false
  ///         }
  ///     }
  ///     print(responses)
  ///     // Prints "[.error(403), .error(404), .error(500), .ok, .ok]"
  ///
  /// Alternatively, use this method to sort a collection of elements that do
  /// conform to `Comparable` when you want the sort to be descending instead
  /// of ascending. Pass the greater-than operator (`>`) operator as the
  /// predicate.
  ///
  ///     var students = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]
  ///     students.sort(by: >)
  ///     print(students)
  ///     // Prints "["Peter", "Kweku", "Kofi", "Akosua", "Abena"]"
  ///
  /// - Parameter areInIncreasingOrder: A predicate that returns `true` if its first
  ///   argument should be ordered before its second argument; otherwise,
  ///   `false`.
  public mutating func sort(
    by areInIncreasingOrder:
      (Iterator.Element, Iterator.Element) -> Bool
  ) {

    let didSortUnsafeBuffer: Void? =
      _withUnsafeMutableBufferPointerIfSupported {
      (baseAddress, count) -> Void in
      var bufferPointer =
        UnsafeMutableBufferPointer(start: baseAddress, count: count)
      bufferPointer.sort(by: areInIncreasingOrder)
      return ()
    }
    if didSortUnsafeBuffer == nil {
      _introSort(
        &self,
        subRange: startIndex..<endIndex,
        by: areInIncreasingOrder)
    }
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 504)
// FIXME(ABI)#180 (Type checker)
// WORKAROUND rdar://25214066 - should be on Collection
extension _Indexable {
  /// Accesses a contiguous subrange of the collection's elements.
  ///
  /// The accessed slice uses the same indices for the same elements as the
  /// original collection. Always use the slice's `startIndex` property
  /// instead of assuming that its indices start at a particular value.
  ///
  /// This example demonstrates getting a slice of an array of strings, finding
  /// the index of one of the strings in the slice, and then using that index
  /// in the original array.
  ///
  ///     let streets = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]
  ///     let streetsSlice = streets[2 ..< streets.endIndex]
  ///     print(streetsSlice)
  ///     // Prints "["Channing", "Douglas", "Evarts"]"
  ///
  ///     let index = streetsSlice.index(of: "Evarts")    // 4
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 507)
  ///     print(streets[index!])
  ///     // Prints "Evarts"
  ///
  /// - Parameter bounds: A range of the collection's indices. The bounds of
  ///   the range must be valid indices of the collection.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 509)
  public subscript(bounds: ClosedRange<Index>) -> SubSequence {
    get {
      return self[
        Range(
          uncheckedBounds: (
            lower: bounds.lowerBound,
            upper: index(after: bounds.upperBound)))
      ]
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 529)
  }
}

// FIXME(ABI)#180 (Type checker)
// WORKAROUND rdar://25214066 - should be on Collection
extension _Indexable where Index : Strideable, Index.Stride : SignedInteger {
  /// Accesses a contiguous subrange of the collection's elements.
  ///
  /// The accessed slice uses the same indices for the same elements as the
  /// original collection. Always use the slice's `startIndex` property
  /// instead of assuming that its indices start at a particular value.
  ///
  /// This example demonstrates getting a slice of an array of strings, finding
  /// the index of one of the strings in the slice, and then using that index
  /// in the original array.
  ///
  ///     let streets = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]
  ///     let streetsSlice = streets[2 ..< streets.endIndex]
  ///     print(streetsSlice)
  ///     // Prints "["Channing", "Douglas", "Evarts"]"
  ///
  ///     let index = streetsSlice.index(of: "Evarts")    // 4
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 535)
  ///     print(streets[index!])
  ///     // Prints "Evarts"
  ///
  /// - Parameter bounds: A range of the collection's indices. The bounds of
  ///   the range must be valid indices of the collection.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 537)
  public subscript(bounds: CountableRange<Index>) -> SubSequence {
    get {
      return self[Range(bounds)]
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 547)
  }

  /// Accesses a contiguous subrange of the collection's elements.
  ///
  /// The accessed slice uses the same indices for the same elements as the
  /// original collection. Always use the slice's `startIndex` property
  /// instead of assuming that its indices start at a particular value.
  ///
  /// This example demonstrates getting a slice of an array of strings, finding
  /// the index of one of the strings in the slice, and then using that index
  /// in the original array.
  ///
  ///     let streets = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]
  ///     let streetsSlice = streets[2 ..< streets.endIndex]
  ///     print(streetsSlice)
  ///     // Prints "["Channing", "Douglas", "Evarts"]"
  ///
  ///     let index = streetsSlice.index(of: "Evarts")    // 4
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 549)
  ///     print(streets[index!])
  ///     // Prints "Evarts"
  ///
  /// - Parameter bounds: A range of the collection's indices. The bounds of
  ///   the range must be valid indices of the collection.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 551)
  public subscript(bounds: CountableClosedRange<Index>) -> SubSequence {
    get {
      return self[ClosedRange(bounds)]
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 561)
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 504)
// FIXME(ABI)#180 (Type checker)
// WORKAROUND rdar://25214066 - should be on Collection
extension _MutableIndexable {
  /// Accesses a contiguous subrange of the collection's elements.
  ///
  /// The accessed slice uses the same indices for the same elements as the
  /// original collection. Always use the slice's `startIndex` property
  /// instead of assuming that its indices start at a particular value.
  ///
  /// This example demonstrates getting a slice of an array of strings, finding
  /// the index of one of the strings in the slice, and then using that index
  /// in the original array.
  ///
  ///     let streets = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]
  ///     let streetsSlice = streets[2 ..< streets.endIndex]
  ///     print(streetsSlice)
  ///     // Prints "["Channing", "Douglas", "Evarts"]"
  ///
  ///     let index = streetsSlice.index(of: "Evarts")    // 4
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 507)
  ///     streets[index!] = "Eustace"
  ///     print(streets[index!])
  ///     // Prints "Eustace"
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 508)
  ///
  /// - Parameter bounds: A range of the collection's indices. The bounds of
  ///   the range must be valid indices of the collection.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 509)
  public subscript(bounds: ClosedRange<Index>) -> SubSequence {
    get {
      return self[
        Range(
          uncheckedBounds: (
            lower: bounds.lowerBound,
            upper: index(after: bounds.upperBound)))
      ]
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 520)
    set {
      self[
        Range(
          uncheckedBounds: (
            lower: bounds.lowerBound,
            upper: index(after: bounds.upperBound)))
      ] = newValue
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 529)
  }
}

// FIXME(ABI)#180 (Type checker)
// WORKAROUND rdar://25214066 - should be on Collection
extension _MutableIndexable where Index : Strideable, Index.Stride : SignedInteger {
  /// Accesses a contiguous subrange of the collection's elements.
  ///
  /// The accessed slice uses the same indices for the same elements as the
  /// original collection. Always use the slice's `startIndex` property
  /// instead of assuming that its indices start at a particular value.
  ///
  /// This example demonstrates getting a slice of an array of strings, finding
  /// the index of one of the strings in the slice, and then using that index
  /// in the original array.
  ///
  ///     let streets = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]
  ///     let streetsSlice = streets[2 ..< streets.endIndex]
  ///     print(streetsSlice)
  ///     // Prints "["Channing", "Douglas", "Evarts"]"
  ///
  ///     let index = streetsSlice.index(of: "Evarts")    // 4
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 535)
  ///     streets[index!] = "Eustace"
  ///     print(streets[index!])
  ///     // Prints "Eustace"
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 536)
  ///
  /// - Parameter bounds: A range of the collection's indices. The bounds of
  ///   the range must be valid indices of the collection.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 537)
  public subscript(bounds: CountableRange<Index>) -> SubSequence {
    get {
      return self[Range(bounds)]
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 543)
    set {
      self[Range(bounds)] = newValue
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 547)
  }

  /// Accesses a contiguous subrange of the collection's elements.
  ///
  /// The accessed slice uses the same indices for the same elements as the
  /// original collection. Always use the slice's `startIndex` property
  /// instead of assuming that its indices start at a particular value.
  ///
  /// This example demonstrates getting a slice of an array of strings, finding
  /// the index of one of the strings in the slice, and then using that index
  /// in the original array.
  ///
  ///     let streets = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]
  ///     let streetsSlice = streets[2 ..< streets.endIndex]
  ///     print(streetsSlice)
  ///     // Prints "["Channing", "Douglas", "Evarts"]"
  ///
  ///     let index = streetsSlice.index(of: "Evarts")    // 4
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 549)
  ///     streets[index!] = "Eustace"
  ///     print(streets[index!])
  ///     // Prints "Eustace"
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 550)
  ///
  /// - Parameter bounds: A range of the collection's indices. The bounds of
  ///   the range must be valid indices of the collection.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 551)
  public subscript(bounds: CountableClosedRange<Index>) -> SubSequence {
    get {
      return self[ClosedRange(bounds)]
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 557)
    set {
      self[ClosedRange(bounds)] = newValue
    }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 561)
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/CollectionAlgorithms.swift.gyb", line: 564)

//===--- Unavailable stuff ------------------------------------------------===//

extension MutableCollection where Self : RandomAccessCollection {
  @available(*, unavailable, message: "call partition(by:)")
  public mutating func partition(
    isOrderedBefore: (Iterator.Element, Iterator.Element) -> Bool
  ) -> Index {
    Builtin.unreachable()
  }

  @available(*, unavailable, message: "slice the collection using the range, and call partition(by:)")
  public mutating func partition(
    _ range: Range<Index>,
    isOrderedBefore: (Iterator.Element, Iterator.Element) -> Bool
  ) -> Index {
    Builtin.unreachable()
  }
}

extension MutableCollection
  where Self : RandomAccessCollection, Iterator.Element : Comparable {

  @available(*, unavailable, message: "call partition(by:)")
  public mutating func partition() -> Index {
    Builtin.unreachable()
  }

  @available(*, unavailable, message: "slice the collection using the range, and call partition(by:)")
  public mutating func partition(_ range: Range<Index>) -> Index {
    Builtin.unreachable()
  }
}

extension Sequence {
  @available(*, unavailable, renamed: "sorted(by:)")
  public func sort(
    _ isOrderedBefore: (Iterator.Element, Iterator.Element) -> Bool
  ) -> [Iterator.Element] {
    Builtin.unreachable()
  }
}

extension Sequence where Iterator.Element : Comparable {
  @available(*, unavailable, renamed: "sorted()")
  public func sort() -> [Iterator.Element] {
    Builtin.unreachable()
  }
}

extension MutableCollection
  where
  Self : RandomAccessCollection,
  Self.Iterator.Element : Comparable {

  @available(*, unavailable, renamed: "sort()")
  public mutating func sortInPlace() {
    Builtin.unreachable()
  }
}

extension MutableCollection where Self : RandomAccessCollection {
  @available(*, unavailable, renamed: "sort(by:)")
  public mutating func sortInPlace(
    _ isOrderedBefore: (Iterator.Element, Iterator.Element) -> Bool
  ) {
    Builtin.unreachable()
  }
}

extension Collection where Iterator.Element : Equatable {
  @available(*, unavailable, renamed: "index(of:)")
  public func indexOf(_ element: Iterator.Element) -> Index? {
    Builtin.unreachable()
  }
}

extension Collection {
  @available(*, unavailable, renamed: "index(where:)")
  public func indexOf(
    _ predicate: (Iterator.Element) throws -> Bool
  ) rethrows -> Index? {
    Builtin.unreachable()
  }
}
