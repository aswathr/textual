import SwiftUI

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension StructuredText {
  /// A style that controls how `StructuredText` renders paragraphs.
  ///
  /// You can set a paragraph style using the ``TextualNamespace/paragraphStyle(_:)`` modifier
  /// or through a bundled ``StructuredText/Style``.
  public protocol ParagraphStyle: DynamicProperty {
    associatedtype Body: View

    /// Creates a view that represents a paragraph.
    @MainActor @ViewBuilder func makeBody(configuration: Self.Configuration) -> Self.Body

    typealias Configuration = BlockStyleConfiguration
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension EnvironmentValues {
  @usableFromInline
  @Entry var paragraphStyle: any StructuredText.ParagraphStyle = .default
}
