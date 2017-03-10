// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Mirrors.swift.gyb", line: 1)
//===--- Mirrors.swift.gyb - Common _Mirror implementations ---*- swift -*-===//
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

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Mirrors.swift.gyb", line: 37)

// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Mirrors.swift.gyb", line: 39)

extension Float : CustomReflectable {
  /// A mirror that reflects the `Float` instance.
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: EmptyCollection<Void>())
  }
}

extension Float : CustomPlaygroundQuickLookable {
  public var customPlaygroundQuickLook: PlaygroundQuickLook {
    return .float(self)
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Mirrors.swift.gyb", line: 39)

extension Double : CustomReflectable {
  /// A mirror that reflects the `Double` instance.
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: EmptyCollection<Void>())
  }
}

extension Double : CustomPlaygroundQuickLookable {
  public var customPlaygroundQuickLook: PlaygroundQuickLook {
    return .double(self)
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Mirrors.swift.gyb", line: 39)

extension Bool : CustomReflectable {
  /// A mirror that reflects the `Bool` instance.
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: EmptyCollection<Void>())
  }
}

extension Bool : CustomPlaygroundQuickLookable {
  public var customPlaygroundQuickLook: PlaygroundQuickLook {
    return .bool(self)
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Mirrors.swift.gyb", line: 39)

extension String : CustomReflectable {
  /// A mirror that reflects the `String` instance.
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: EmptyCollection<Void>())
  }
}

extension String : CustomPlaygroundQuickLookable {
  public var customPlaygroundQuickLook: PlaygroundQuickLook {
    return .text(self)
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Mirrors.swift.gyb", line: 39)

extension Character : CustomReflectable {
  /// A mirror that reflects the `Character` instance.
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: EmptyCollection<Void>())
  }
}

extension Character : CustomPlaygroundQuickLookable {
  public var customPlaygroundQuickLook: PlaygroundQuickLook {
    return .text(String(self))
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Mirrors.swift.gyb", line: 39)

extension UnicodeScalar : CustomReflectable {
  /// A mirror that reflects the `UnicodeScalar` instance.
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: EmptyCollection<Void>())
  }
}

extension UnicodeScalar : CustomPlaygroundQuickLookable {
  public var customPlaygroundQuickLook: PlaygroundQuickLook {
    return .uInt(UInt64(self))
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Mirrors.swift.gyb", line: 39)

extension UInt8 : CustomReflectable {
  /// A mirror that reflects the `UInt8` instance.
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: EmptyCollection<Void>())
  }
}

extension UInt8 : CustomPlaygroundQuickLookable {
  public var customPlaygroundQuickLook: PlaygroundQuickLook {
    return .uInt(UInt64(self))
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Mirrors.swift.gyb", line: 39)

extension Int8 : CustomReflectable {
  /// A mirror that reflects the `Int8` instance.
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: EmptyCollection<Void>())
  }
}

extension Int8 : CustomPlaygroundQuickLookable {
  public var customPlaygroundQuickLook: PlaygroundQuickLook {
    return .int(Int64(self))
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Mirrors.swift.gyb", line: 39)

extension UInt16 : CustomReflectable {
  /// A mirror that reflects the `UInt16` instance.
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: EmptyCollection<Void>())
  }
}

extension UInt16 : CustomPlaygroundQuickLookable {
  public var customPlaygroundQuickLook: PlaygroundQuickLook {
    return .uInt(UInt64(self))
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Mirrors.swift.gyb", line: 39)

extension Int16 : CustomReflectable {
  /// A mirror that reflects the `Int16` instance.
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: EmptyCollection<Void>())
  }
}

extension Int16 : CustomPlaygroundQuickLookable {
  public var customPlaygroundQuickLook: PlaygroundQuickLook {
    return .int(Int64(self))
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Mirrors.swift.gyb", line: 39)

extension UInt32 : CustomReflectable {
  /// A mirror that reflects the `UInt32` instance.
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: EmptyCollection<Void>())
  }
}

extension UInt32 : CustomPlaygroundQuickLookable {
  public var customPlaygroundQuickLook: PlaygroundQuickLook {
    return .uInt(UInt64(self))
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Mirrors.swift.gyb", line: 39)

extension Int32 : CustomReflectable {
  /// A mirror that reflects the `Int32` instance.
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: EmptyCollection<Void>())
  }
}

extension Int32 : CustomPlaygroundQuickLookable {
  public var customPlaygroundQuickLook: PlaygroundQuickLook {
    return .int(Int64(self))
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Mirrors.swift.gyb", line: 39)

extension UInt64 : CustomReflectable {
  /// A mirror that reflects the `UInt64` instance.
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: EmptyCollection<Void>())
  }
}

extension UInt64 : CustomPlaygroundQuickLookable {
  public var customPlaygroundQuickLook: PlaygroundQuickLook {
    return .uInt(UInt64(self))
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Mirrors.swift.gyb", line: 39)

extension Int64 : CustomReflectable {
  /// A mirror that reflects the `Int64` instance.
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: EmptyCollection<Void>())
  }
}

extension Int64 : CustomPlaygroundQuickLookable {
  public var customPlaygroundQuickLook: PlaygroundQuickLook {
    return .int(Int64(self))
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Mirrors.swift.gyb", line: 39)

extension UInt : CustomReflectable {
  /// A mirror that reflects the `UInt` instance.
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: EmptyCollection<Void>())
  }
}

extension UInt : CustomPlaygroundQuickLookable {
  public var customPlaygroundQuickLook: PlaygroundQuickLook {
    return .uInt(UInt64(self))
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Mirrors.swift.gyb", line: 39)

extension Int : CustomReflectable {
  /// A mirror that reflects the `Int` instance.
  public var customMirror: Mirror {
    return Mirror(self, unlabeledChildren: EmptyCollection<Void>())
  }
}

extension Int : CustomPlaygroundQuickLookable {
  public var customPlaygroundQuickLook: PlaygroundQuickLook {
    return .int(Int64(self))
  }
}
// ###sourceLocation(file: "/home/felix/Desktop/NativeSetup/swift-linuxSetup/native_install/swift/stdlib/public/core/Mirrors.swift.gyb", line: 53)

// Local Variables:
// eval: (read-only-mode 1)
// End:
