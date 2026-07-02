import SwiftUI

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension EnvironmentValues {
  @Entry var listItemSpacing: FontScaled<StructuredText.BlockSpacing> = .fontScaled(top: 0.25)
  @Entry var resolvedListItemSpacing: StructuredText.BlockSpacing = .init()
  @Entry var listItemSpacingEnabled: Bool = false
}
