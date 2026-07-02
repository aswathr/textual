import SwiftUI

/// Uses monospaced digits.
@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct MonospacedDigitProperty: TextProperty {
  /// Creates a monospaced digit property.
  public init() {}

  public func apply(in attributes: inout AttributeContainer, environment: TextEnvironmentValues) {
    let font = attributes.font ?? environment.font ?? .body
    attributes.font = font.monospacedDigit()
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension TextProperty where Self == MonospacedDigitProperty {
  /// Uses monospaced digits.
  public static var monospacedDigit: Self { .init() }
}
