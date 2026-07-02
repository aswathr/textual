import Foundation

/// Sets a baseline offset attribute.
@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct BaselineOffsetProperty: TextProperty {
  private let offset: CGFloat

  /// Creates a baseline offset property.
  public init(_ offset: CGFloat) {
    self.offset = offset
  }

  public func apply(
    in attributes: inout AttributeContainer,
    environment _: TextEnvironmentValues
  ) {
    attributes.baselineOffset = offset
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension TextProperty where Self == BaselineOffsetProperty {
  /// Sets the baseline offset.
  public static func baselineOffset(_ offset: CGFloat) -> Self {
    BaselineOffsetProperty(offset)
  }
}
