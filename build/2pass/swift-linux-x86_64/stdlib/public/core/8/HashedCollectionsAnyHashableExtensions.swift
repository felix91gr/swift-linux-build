// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/HashedCollectionsAnyHashableExtensions.swift.gyb", line: 1)
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

//===----------------------------------------------------------------------===//
// Convenience APIs for Set<AnyHashable>
//===----------------------------------------------------------------------===//

extension Set where Element == AnyHashable {
  public mutating func insert<ConcreteElement : Hashable>(
    _ newMember: ConcreteElement
  ) -> (inserted: Bool, memberAfterInsert: ConcreteElement) {
    let (inserted, memberAfterInsert) =
      insert(AnyHashable(newMember))
    return (
      inserted: inserted,
      memberAfterInsert: memberAfterInsert.base as! ConcreteElement)
  }

  @discardableResult
  public mutating func update<ConcreteElement : Hashable>(
    with newMember: ConcreteElement
  ) -> ConcreteElement? {
    return update(with: AnyHashable(newMember))
      .map { $0.base as! ConcreteElement }
  }

  @discardableResult
  public mutating func remove<ConcreteElement : Hashable>(
    _ member: ConcreteElement
  ) -> ConcreteElement? {
    return remove(AnyHashable(member))
      .map { $0.base as! ConcreteElement }
  }
}

//===----------------------------------------------------------------------===//
// Convenience APIs for Dictionary<AnyHashable, *>
//===----------------------------------------------------------------------===//

extension Dictionary where Key == AnyHashable {
  public subscript(_ key: _Hashable) -> Value? {
    // FIXME(ABI)#40 (Generic subscripts): replace this API with a
    // generic subscript.
    get {
      return self[key._toAnyHashable()]
    }
    set {
      self[key._toAnyHashable()] = newValue
    }
  }

  @discardableResult
  public mutating func updateValue<ConcreteKey : Hashable>(
    _ value: Value, forKey key: ConcreteKey
  ) -> Value? {
    return updateValue(value, forKey: AnyHashable(key))
  }

  @discardableResult
  public mutating func removeValue<ConcreteKey : Hashable>(
    forKey key: ConcreteKey
  ) -> Value? {
    return removeValue(forKey: AnyHashable(key))
  }
}

