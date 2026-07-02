import SwiftUI

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension StructuredText {
  struct BlockSpacingKey: PreferenceKey, LayoutValueKey {
    static let defaultValue = BlockSpacing()

    static func reduce(value: inout BlockSpacing, nextValue: () -> BlockSpacing) {
      value = value.union(nextValue())
    }
  }
}
