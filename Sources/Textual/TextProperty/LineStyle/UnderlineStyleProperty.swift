import SwiftUI

/// Applies an underline style attribute.
@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct UnderlineStyleProperty: TextProperty {
  private let style: Text.LineStyle

  /// Creates an underline style property.
  public init(_ style: Text.LineStyle) {
    self.style = style
  }

  public func apply(
    in attributes: inout AttributeContainer,
    environment _: TextEnvironmentValues
  ) {
    attributes.underlineStyle = style
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension TextProperty where Self == UnderlineStyleProperty {
  /// Underlines text using the given line style.
  public static func underlineStyle(_ style: Text.LineStyle) -> Self {
    UnderlineStyleProperty(style)
  }
}
