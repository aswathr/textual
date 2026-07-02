import Foundation

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension Range where Bound == Int {
  func offset(by amount: Int) -> Range<Int> {
    (lowerBound + amount)..<(upperBound + amount)
  }
}
