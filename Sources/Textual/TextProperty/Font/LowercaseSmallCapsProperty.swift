import SwiftUI

/// Applies a lowercase small caps font variant.
@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct LowercaseSmallCapsProperty: TextProperty {
  /// Creates a lowercase small caps property.
  public init() {}

  public func apply(in attributes: inout AttributeContainer, environment: TextEnvironmentValues) {
    let font = attributes.font ?? environment.font ?? .body
    attributes.font = font.lowercaseSmallCaps()
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension TextProperty where Self == LowercaseSmallCapsProperty {
  /// Applies a lowercase small caps font variant.
  public static var lowercaseSmallCaps: Self { .init() }
}
