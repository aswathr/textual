import SwiftUI

/// Applies a strikethrough style attribute.
@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct StrikethroughStyleProperty: TextProperty {
  private let style: Text.LineStyle

  /// Creates a strikethrough style property.
  public init(_ style: Text.LineStyle) {
    self.style = style
  }

  public func apply(
    in attributes: inout AttributeContainer,
    environment _: TextEnvironmentValues
  ) {
    attributes.strikethroughStyle = style
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension TextProperty where Self == StrikethroughStyleProperty {
  /// Strikes through text using the given line style.
  public static func strikethroughStyle(_ style: Text.LineStyle) -> Self {
    StrikethroughStyleProperty(style)
  }
}
