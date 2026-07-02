import SwiftUI

/// Applies an uppercase small caps font variant.
@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct UppercaseSmallCapsProperty: TextProperty {
  /// Creates an uppercase small caps property.
  public init() {}

  public func apply(in attributes: inout AttributeContainer, environment: TextEnvironmentValues) {
    let font = attributes.font ?? environment.font ?? .body
    attributes.font = font.uppercaseSmallCaps()
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension TextProperty where Self == UppercaseSmallCapsProperty {
  /// Applies an uppercase small caps font variant.
  public static var uppercaseSmallCaps: Self { .init() }
}
