import SwiftUI

/// Sets a background color attribute.
@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct BackgroundColorProperty: TextProperty {
  private let color: DynamicColor

  /// Creates a background color property using a dynamic color.
  public init(_ color: DynamicColor) {
    self.color = color
  }

  public func apply(
    in attributes: inout AttributeContainer,
    environment: TextEnvironmentValues
  ) {
    attributes.backgroundColor = color.bestMatch(for: environment.colorEnvironment)
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension TextProperty where Self == BackgroundColorProperty {
  /// Sets the background color using a dynamic color.
  public static func backgroundColor(_ color: DynamicColor) -> Self {
    BackgroundColorProperty(color)
  }

  /// Sets the background color using a fixed SwiftUI color.
  public static func backgroundColor(_ color: Color) -> Self {
    BackgroundColorProperty(DynamicColor(color))
  }
}
