import SwiftUI

/// Replaces the font attribute.
///
/// Pass `nil` to clear any explicit font and let the surrounding style decide.
@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct FontProperty: TextProperty {
  private let font: Font?

  /// Creates a font property.
  public init(_ font: Font?) {
    self.font = font
  }

  public func apply(
    in attributes: inout AttributeContainer,
    environment _: TextEnvironmentValues
  ) {
    attributes.font = font
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension TextProperty where Self == FontProperty {
  /// Sets the font attribute.
  public static func font(_ font: Font?) -> Self {
    FontProperty(font)
  }
}
