import SwiftUI

/// Applies a bold font trait.
@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct BoldProperty: TextProperty {
  /// Creates a bold property.
  public init() {}

  public func apply(in attributes: inout AttributeContainer, environment: TextEnvironmentValues) {
    let font = attributes.font ?? environment.font ?? .body
    attributes.font = font.bold()
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension TextProperty where Self == BoldProperty {
  /// Applies a bold font trait.
  public static var bold: Self { .init() }
}
