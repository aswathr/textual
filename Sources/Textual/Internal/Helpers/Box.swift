import Foundation

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
final class Box<Value> {
  var wrappedValue: Value

  init(_ wrappedValue: Value) {
    self.wrappedValue = wrappedValue
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
struct WeakBox<Wrapped: AnyObject> {
  weak var wrapped: Wrapped?

  init(_ wrapped: Wrapped) {
    self.wrapped = wrapped
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
final class KeyBox<Value: Hashable>: NSObject {
  var wrappedValue: Value

  init(_ wrappedValue: Value) {
    self.wrappedValue = wrappedValue
  }

  override var hash: Int {
    var hasher = Hasher()
    hasher.combine(wrappedValue)
    return hasher.finalize()
  }

  override func isEqual(_ object: Any?) -> Bool {
    guard let other = object as? KeyBox<Value> else {
      return false
    }
    return wrappedValue == other.wrappedValue
  }
}
