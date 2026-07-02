import SwiftUI

/// Sets a foreground (text) color attribute.
@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct ForegroundColorProperty: TextProperty {
  private let color: DynamicColor

  /// Creates a foreground color property using a dynamic color.
  public init(_ color: DynamicColor) {
    self.color = color
  }

  public func apply(
    in attributes: inout AttributeContainer,
    environment: TextEnvironmentValues
  ) {
    attributes.foregroundColor = color.bestMatch(for: environment.colorEnvironment)
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension TextProperty where Self == ForegroundColorProperty {
  /// Sets the foreground color using a dynamic color.
  public static func foregroundColor(_ color: DynamicColor) -> Self {
    ForegroundColorProperty(color)
  }

  /// Sets the foreground color using a fixed SwiftUI color.
  public static func foregroundColor(_ color: Color) -> Self {
    ForegroundColorProperty(DynamicColor(color))
  }
}
