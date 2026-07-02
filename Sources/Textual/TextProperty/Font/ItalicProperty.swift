import SwiftUI

/// Applies an italic font trait.
@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct ItalicProperty: TextProperty {
  /// Creates an italic property.
  public init() {}

  public func apply(in attributes: inout AttributeContainer, environment: TextEnvironmentValues) {
    let font = attributes.font ?? environment.font ?? .body
    attributes.font = font.italic()
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension TextProperty where Self == ItalicProperty {
  /// Applies an italic font trait.
  public static var italic: Self { .init() }
}
