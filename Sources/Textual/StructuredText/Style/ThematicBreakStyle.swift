import SwiftUI

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension StructuredText {
  /// A style that controls how `StructuredText` renders thematic breaks.
  ///
  /// You can apply a thematic break style using the ``TextualNamespace/thematicBreakStyle(_:)`` modifier
  /// or through a bundled ``StructuredText/Style``.
  public protocol ThematicBreakStyle: DynamicProperty {
    associatedtype Body: View

    /// Creates a view that represents a thematic break.
    @MainActor @ViewBuilder func makeBody(configuration: Self.Configuration) -> Self.Body

    typealias Configuration = BlockStyleConfiguration
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension EnvironmentValues {
  @usableFromInline
  @Entry var thematicBreakStyle: any StructuredText.ThematicBreakStyle = .divider
}
