// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnavailableStringAPIs.swift.gyb", line: 1)
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

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnavailableStringAPIs.swift.gyb", line: 53)

extension String {

  /// Subscripting strings with integers is not available.
  ///
  /// The concept of "the `i`th character in a string" has
  /// different interpretations in different libraries and system
  /// components.  The correct interpretation should be selected
  /// according to the use case and the APIs involved, so `String`
  /// cannot be subscripted with an integer.
  ///
  /// Swift provides several different ways to access the character
  /// data stored inside strings.
  ///
  /// - `String.utf8` is a collection of UTF-8 code units in the
  ///   string. Use this API when converting the string to UTF-8.
  ///   Most POSIX APIs process strings in terms of UTF-8 code units.
  ///
  /// - `String.utf16` is a collection of UTF-16 code units in
  ///   string.  Most Cocoa and Cocoa touch APIs process strings in
  ///   terms of UTF-16 code units.  For example, instances of
  ///   `NSRange` used with `NSAttributedString` and
  ///   `NSRegularExpression` store substring offsets and lengths in
  ///   terms of UTF-16 code units.
  ///
  /// - `String.unicodeScalars` is a collection of Unicode scalars.
  ///   Use this API when you are performing low-level manipulation
  ///   of character data.
  ///
  /// - `String.characters` is a collection of extended grapheme
  ///   clusters, which are an approximation of user-perceived
  ///   characters.
  ///
  /// Note that when processing strings that contain human-readable
  /// text, character-by-character processing should be avoided to
  /// the largest extent possible.  Use high-level locale-sensitive
  /// Unicode algorithms instead, for example,
  /// `String.localizedStandardCompare()`,
  /// `String.localizedLowercaseString`,
  /// `String.localizedStandardRangeOfString()` etc.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnavailableStringAPIs.swift.gyb", line: 55)
  @available(
    *, unavailable,
    message: "cannot subscript String with an Int, see the documentation comment for discussion")
  public subscript(i: Int) -> Character {
    Builtin.unreachable()
  }

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnavailableStringAPIs.swift.gyb", line: 64)

  /// Subscripting strings with integers is not available.
  ///
  /// The concept of "the `i`th character in a string" has
  /// different interpretations in different libraries and system
  /// components.  The correct interpretation should be selected
  /// according to the use case and the APIs involved, so `String`
  /// cannot be subscripted with an integer.
  ///
  /// Swift provides several different ways to access the character
  /// data stored inside strings.
  ///
  /// - `String.utf8` is a collection of UTF-8 code units in the
  ///   string. Use this API when converting the string to UTF-8.
  ///   Most POSIX APIs process strings in terms of UTF-8 code units.
  ///
  /// - `String.utf16` is a collection of UTF-16 code units in
  ///   string.  Most Cocoa and Cocoa touch APIs process strings in
  ///   terms of UTF-16 code units.  For example, instances of
  ///   `NSRange` used with `NSAttributedString` and
  ///   `NSRegularExpression` store substring offsets and lengths in
  ///   terms of UTF-16 code units.
  ///
  /// - `String.unicodeScalars` is a collection of Unicode scalars.
  ///   Use this API when you are performing low-level manipulation
  ///   of character data.
  ///
  /// - `String.characters` is a collection of extended grapheme
  ///   clusters, which are an approximation of user-perceived
  ///   characters.
  ///
  /// Note that when processing strings that contain human-readable
  /// text, character-by-character processing should be avoided to
  /// the largest extent possible.  Use high-level locale-sensitive
  /// Unicode algorithms instead, for example,
  /// `String.localizedStandardCompare()`,
  /// `String.localizedLowercaseString`,
  /// `String.localizedStandardRangeOfString()` etc.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnavailableStringAPIs.swift.gyb", line: 64)
  @available(
    *, unavailable,
    message: "cannot subscript String with a Range<Int>, see the documentation comment for discussion")
  public subscript(bounds: Range<Int>) -> String {
    Builtin.unreachable()
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnavailableStringAPIs.swift.gyb", line: 64)

  /// Subscripting strings with integers is not available.
  ///
  /// The concept of "the `i`th character in a string" has
  /// different interpretations in different libraries and system
  /// components.  The correct interpretation should be selected
  /// according to the use case and the APIs involved, so `String`
  /// cannot be subscripted with an integer.
  ///
  /// Swift provides several different ways to access the character
  /// data stored inside strings.
  ///
  /// - `String.utf8` is a collection of UTF-8 code units in the
  ///   string. Use this API when converting the string to UTF-8.
  ///   Most POSIX APIs process strings in terms of UTF-8 code units.
  ///
  /// - `String.utf16` is a collection of UTF-16 code units in
  ///   string.  Most Cocoa and Cocoa touch APIs process strings in
  ///   terms of UTF-16 code units.  For example, instances of
  ///   `NSRange` used with `NSAttributedString` and
  ///   `NSRegularExpression` store substring offsets and lengths in
  ///   terms of UTF-16 code units.
  ///
  /// - `String.unicodeScalars` is a collection of Unicode scalars.
  ///   Use this API when you are performing low-level manipulation
  ///   of character data.
  ///
  /// - `String.characters` is a collection of extended grapheme
  ///   clusters, which are an approximation of user-perceived
  ///   characters.
  ///
  /// Note that when processing strings that contain human-readable
  /// text, character-by-character processing should be avoided to
  /// the largest extent possible.  Use high-level locale-sensitive
  /// Unicode algorithms instead, for example,
  /// `String.localizedStandardCompare()`,
  /// `String.localizedLowercaseString`,
  /// `String.localizedStandardRangeOfString()` etc.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnavailableStringAPIs.swift.gyb", line: 64)
  @available(
    *, unavailable,
    message: "cannot subscript String with a ClosedRange<Int>, see the documentation comment for discussion")
  public subscript(bounds: ClosedRange<Int>) -> String {
    Builtin.unreachable()
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnavailableStringAPIs.swift.gyb", line: 64)

  /// Subscripting strings with integers is not available.
  ///
  /// The concept of "the `i`th character in a string" has
  /// different interpretations in different libraries and system
  /// components.  The correct interpretation should be selected
  /// according to the use case and the APIs involved, so `String`
  /// cannot be subscripted with an integer.
  ///
  /// Swift provides several different ways to access the character
  /// data stored inside strings.
  ///
  /// - `String.utf8` is a collection of UTF-8 code units in the
  ///   string. Use this API when converting the string to UTF-8.
  ///   Most POSIX APIs process strings in terms of UTF-8 code units.
  ///
  /// - `String.utf16` is a collection of UTF-16 code units in
  ///   string.  Most Cocoa and Cocoa touch APIs process strings in
  ///   terms of UTF-16 code units.  For example, instances of
  ///   `NSRange` used with `NSAttributedString` and
  ///   `NSRegularExpression` store substring offsets and lengths in
  ///   terms of UTF-16 code units.
  ///
  /// - `String.unicodeScalars` is a collection of Unicode scalars.
  ///   Use this API when you are performing low-level manipulation
  ///   of character data.
  ///
  /// - `String.characters` is a collection of extended grapheme
  ///   clusters, which are an approximation of user-perceived
  ///   characters.
  ///
  /// Note that when processing strings that contain human-readable
  /// text, character-by-character processing should be avoided to
  /// the largest extent possible.  Use high-level locale-sensitive
  /// Unicode algorithms instead, for example,
  /// `String.localizedStandardCompare()`,
  /// `String.localizedLowercaseString`,
  /// `String.localizedStandardRangeOfString()` etc.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnavailableStringAPIs.swift.gyb", line: 64)
  @available(
    *, unavailable,
    message: "cannot subscript String with a CountableRange<Int>, see the documentation comment for discussion")
  public subscript(bounds: CountableRange<Int>) -> String {
    Builtin.unreachable()
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnavailableStringAPIs.swift.gyb", line: 64)

  /// Subscripting strings with integers is not available.
  ///
  /// The concept of "the `i`th character in a string" has
  /// different interpretations in different libraries and system
  /// components.  The correct interpretation should be selected
  /// according to the use case and the APIs involved, so `String`
  /// cannot be subscripted with an integer.
  ///
  /// Swift provides several different ways to access the character
  /// data stored inside strings.
  ///
  /// - `String.utf8` is a collection of UTF-8 code units in the
  ///   string. Use this API when converting the string to UTF-8.
  ///   Most POSIX APIs process strings in terms of UTF-8 code units.
  ///
  /// - `String.utf16` is a collection of UTF-16 code units in
  ///   string.  Most Cocoa and Cocoa touch APIs process strings in
  ///   terms of UTF-16 code units.  For example, instances of
  ///   `NSRange` used with `NSAttributedString` and
  ///   `NSRegularExpression` store substring offsets and lengths in
  ///   terms of UTF-16 code units.
  ///
  /// - `String.unicodeScalars` is a collection of Unicode scalars.
  ///   Use this API when you are performing low-level manipulation
  ///   of character data.
  ///
  /// - `String.characters` is a collection of extended grapheme
  ///   clusters, which are an approximation of user-perceived
  ///   characters.
  ///
  /// Note that when processing strings that contain human-readable
  /// text, character-by-character processing should be avoided to
  /// the largest extent possible.  Use high-level locale-sensitive
  /// Unicode algorithms instead, for example,
  /// `String.localizedStandardCompare()`,
  /// `String.localizedLowercaseString`,
  /// `String.localizedStandardRangeOfString()` etc.
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnavailableStringAPIs.swift.gyb", line: 64)
  @available(
    *, unavailable,
    message: "cannot subscript String with a CountableClosedRange<Int>, see the documentation comment for discussion")
  public subscript(bounds: CountableClosedRange<Int>) -> String {
    Builtin.unreachable()
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnavailableStringAPIs.swift.gyb", line: 72)
  /// The unavailable `String.count` API.
  ///
  /// The concept of "the number of characters in a string" has
  /// different interpretations in different libraries and system
  /// components.  The correct interpretation should be selected
  /// according to the use case and the APIs involved, so `String`
  /// does not have a `count` property, since there is no universal
  /// answer to the question about the number of characters in a
  /// given string.
  ///
  /// Swift provides several different ways to access the character
  /// data stored inside strings.  To access the number of data units
  /// in each representation you can use the following APIs.
  ///
  /// - `String.utf8.count` property returns the number of UTF-8 code
  ///   units in the string.  Use this API when converting the string
  ///   to UTF-8.  Most POSIX APIs process strings in terms of UTF-8
  ///   code units.
  ///
  /// - `String.utf16.count` property returns the number of UTF-16
  ///   code units in the string.  Most Cocoa and Cocoa touch APIs
  ///   process strings in terms of UTF-16 code units.  For example,
  ///   instances of `NSRange` used with `NSAttributedString` and
  ///   `NSRegularExpression` store substring offsets and lengths in
  ///   terms of UTF-16 code units.
  ///
  /// - `String.unicodeScalars.count` property returns the number of
  ///   Unicode scalars in the string.  Use this API when you are
  ///   performing low-level manipulation of character data.
  ///
  /// - `String.characters.count` property returns the number of
  ///   extended grapheme clusters.  Use this API to count the
  ///   number of user-perceived characters in the string.
  @available(
    *, unavailable,
    message: "there is no universally good answer, see the documentation comment for discussion")
  public var count: Int {
    Builtin.unreachable()
  }
}

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnavailableStringAPIs.swift.gyb", line: 116)
extension String.UTF8View.Index {
  @available(
    *, unavailable,
    message: "To get the next index call 'index(after:)' on the UTF8View instance that produced the index.")
  public func successor() -> String.UTF8View.Index {
    Builtin.unreachable()
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnavailableStringAPIs.swift.gyb", line: 131)
  @available(
    *, unavailable,
    message: "To advance an index by n steps call 'index(_:offsetBy:)' on the UTF8View instance that produced the index.")
  public func advancedBy(_ n: String.UTF8View.IndexDistance) -> String.UTF8View.Index {
    Builtin.unreachable()
  }
  @available(
    *, unavailable,
    message: "To advance an index by n steps stopping at a given limit call 'index(_:offsetBy:limitedBy:)' on UTF8View instance that produced the index.  Note that the Swift 3 API returns 'nil' when trying to advance past the limit; the Swift 2 API returned the limit.")
  public func advancedBy(_ n: String.UTF8View.IndexDistance, limit: String.UTF8View.Index) -> String.UTF8View.Index {
    Builtin.unreachable()
  }
  @available(
    *, unavailable,
    message: "To find the distance between two indices call 'distance(from:to:)' on the UTF8View instance that produced the index.")
  public func distanceTo(_ end: String.UTF8View.Index) -> String.UTF8View.IndexDistance {
    Builtin.unreachable()
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnavailableStringAPIs.swift.gyb", line: 116)
extension String.UTF16View.Index {
  @available(
    *, unavailable,
    message: "To get the next index call 'index(after:)' on the UTF16View instance that produced the index.")
  public func successor() -> String.UTF16View.Index {
    Builtin.unreachable()
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnavailableStringAPIs.swift.gyb", line: 124)
  @available(
    *, unavailable,
    message: "To get the previous index call 'index(before:)' on the UTF16View instance that produced the index.")
  public func predecessor() -> String.UTF16View.Index {
    Builtin.unreachable()
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnavailableStringAPIs.swift.gyb", line: 131)
  @available(
    *, unavailable,
    message: "To advance an index by n steps call 'index(_:offsetBy:)' on the UTF16View instance that produced the index.")
  public func advancedBy(_ n: String.UTF16View.IndexDistance) -> String.UTF16View.Index {
    Builtin.unreachable()
  }
  @available(
    *, unavailable,
    message: "To advance an index by n steps stopping at a given limit call 'index(_:offsetBy:limitedBy:)' on UTF16View instance that produced the index.  Note that the Swift 3 API returns 'nil' when trying to advance past the limit; the Swift 2 API returned the limit.")
  public func advancedBy(_ n: String.UTF16View.IndexDistance, limit: String.UTF16View.Index) -> String.UTF16View.Index {
    Builtin.unreachable()
  }
  @available(
    *, unavailable,
    message: "To find the distance between two indices call 'distance(from:to:)' on the UTF16View instance that produced the index.")
  public func distanceTo(_ end: String.UTF16View.Index) -> String.UTF16View.IndexDistance {
    Builtin.unreachable()
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnavailableStringAPIs.swift.gyb", line: 116)
extension String.UnicodeScalarView.Index {
  @available(
    *, unavailable,
    message: "To get the next index call 'index(after:)' on the UnicodeScalarView instance that produced the index.")
  public func successor() -> String.UnicodeScalarView.Index {
    Builtin.unreachable()
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnavailableStringAPIs.swift.gyb", line: 124)
  @available(
    *, unavailable,
    message: "To get the previous index call 'index(before:)' on the UnicodeScalarView instance that produced the index.")
  public func predecessor() -> String.UnicodeScalarView.Index {
    Builtin.unreachable()
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnavailableStringAPIs.swift.gyb", line: 131)
  @available(
    *, unavailable,
    message: "To advance an index by n steps call 'index(_:offsetBy:)' on the UnicodeScalarView instance that produced the index.")
  public func advancedBy(_ n: String.UnicodeScalarView.IndexDistance) -> String.UnicodeScalarView.Index {
    Builtin.unreachable()
  }
  @available(
    *, unavailable,
    message: "To advance an index by n steps stopping at a given limit call 'index(_:offsetBy:limitedBy:)' on UnicodeScalarView instance that produced the index.  Note that the Swift 3 API returns 'nil' when trying to advance past the limit; the Swift 2 API returned the limit.")
  public func advancedBy(_ n: String.UnicodeScalarView.IndexDistance, limit: String.UnicodeScalarView.Index) -> String.UnicodeScalarView.Index {
    Builtin.unreachable()
  }
  @available(
    *, unavailable,
    message: "To find the distance between two indices call 'distance(from:to:)' on the UnicodeScalarView instance that produced the index.")
  public func distanceTo(_ end: String.UnicodeScalarView.Index) -> String.UnicodeScalarView.IndexDistance {
    Builtin.unreachable()
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnavailableStringAPIs.swift.gyb", line: 116)
extension String.CharacterView.Index {
  @available(
    *, unavailable,
    message: "To get the next index call 'index(after:)' on the CharacterView instance that produced the index.")
  public func successor() -> String.CharacterView.Index {
    Builtin.unreachable()
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnavailableStringAPIs.swift.gyb", line: 124)
  @available(
    *, unavailable,
    message: "To get the previous index call 'index(before:)' on the CharacterView instance that produced the index.")
  public func predecessor() -> String.CharacterView.Index {
    Builtin.unreachable()
  }
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnavailableStringAPIs.swift.gyb", line: 131)
  @available(
    *, unavailable,
    message: "To advance an index by n steps call 'index(_:offsetBy:)' on the CharacterView instance that produced the index.")
  public func advancedBy(_ n: String.CharacterView.IndexDistance) -> String.CharacterView.Index {
    Builtin.unreachable()
  }
  @available(
    *, unavailable,
    message: "To advance an index by n steps stopping at a given limit call 'index(_:offsetBy:limitedBy:)' on CharacterView instance that produced the index.  Note that the Swift 3 API returns 'nil' when trying to advance past the limit; the Swift 2 API returned the limit.")
  public func advancedBy(_ n: String.CharacterView.IndexDistance, limit: String.CharacterView.Index) -> String.CharacterView.Index {
    Builtin.unreachable()
  }
  @available(
    *, unavailable,
    message: "To find the distance between two indices call 'distance(from:to:)' on the CharacterView instance that produced the index.")
  public func distanceTo(_ end: String.CharacterView.Index) -> String.CharacterView.IndexDistance {
    Builtin.unreachable()
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/UnavailableStringAPIs.swift.gyb", line: 151)

