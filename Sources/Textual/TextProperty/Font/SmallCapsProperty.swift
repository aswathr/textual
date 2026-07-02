import SwiftUI

/// Applies a small caps font variant.
@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct SmallCapsProperty: TextProperty {
  /// Creates a small caps property.
  public init() {}

  public func apply(in attributes: inout AttributeContainer, environment: TextEnvironmentValues) {
    let font = attributes.font ?? environment.font ?? .body
    attributes.font = font.smallCaps()
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension TextProperty where Self == SmallCapsProperty {
  /// Applies a small caps font variant.
  public static var smallCaps: Self { .init() }
}
