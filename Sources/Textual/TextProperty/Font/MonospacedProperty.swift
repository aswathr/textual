import SwiftUI

/// Uses a monospaced font design.
@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct MonospacedProperty: TextProperty {
  /// Creates a monospaced property.
  public init() {}

  public func apply(in attributes: inout AttributeContainer, environment: TextEnvironmentValues) {
    let font = attributes.font ?? environment.font ?? .body
    attributes.font = font.monospaced()
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension TextProperty where Self == MonospacedProperty {
  /// Uses a monospaced font design.
  public static var monospaced: Self { .init() }
}
