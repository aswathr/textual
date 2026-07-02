import SwiftUI

/// Applies a font weight.
@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct FontWeightProperty: TextProperty {
  private let weight: Font.Weight

  /// Creates a font weight property.
  public init(_ weight: Font.Weight) {
    self.weight = weight
  }

  public func apply(in attributes: inout AttributeContainer, environment: TextEnvironmentValues) {
    let font = attributes.font ?? environment.font ?? .body
    attributes.font = font.weight(weight)
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension TextProperty where Self == FontWeightProperty {
  /// Applies the given weight to the font.
  public static func fontWeight(_ weight: Font.Weight) -> Self {
    FontWeightProperty(weight)
  }
}
