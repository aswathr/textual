import Foundation

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
struct Tuple<each V: Equatable>: Equatable {
  var values: (repeat each V)

  init(_ values: repeat each V) {
    self.values = (repeat each values)
  }

  static func == (lhs: Self, rhs: Self) -> Bool {
    for (left, right) in repeat (each lhs.values, each rhs.values) {
      guard left == right else { return false }
    }
    return true
  }
}
