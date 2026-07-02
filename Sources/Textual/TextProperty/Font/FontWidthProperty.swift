import SwiftUI

/// Applies a font width (condensed/expanded).
@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct FontWidthProperty: TextProperty {
  private let width: Font.Width

  /// Creates a font width property.
  public init(_ width: Font.Width) {
    self.width = width
  }

  public func apply(in attributes: inout AttributeContainer, environment: TextEnvironmentValues) {
    let font = attributes.font ?? environment.font ?? .body
    attributes.font = font.width(width)
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension TextProperty where Self == FontWidthProperty {
  /// Applies the given width to the font.
  public static func fontWidth(_ width: Font.Width) -> Self {
    FontWidthProperty(width)
  }
}
