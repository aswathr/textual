import Foundation

/// Sets a tracking value attribute.
@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct TrackingProperty: TextProperty {
  private let tracking: CGFloat

  /// Creates a tracking property.
  public init(_ tracking: CGFloat) {
    self.tracking = tracking
  }

  public func apply(
    in attributes: inout AttributeContainer,
    environment _: TextEnvironmentValues
  ) {
    attributes.tracking = tracking
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension TextProperty where Self == TrackingProperty {
  /// Sets the tracking value.
  public static func tracking(_ tracking: CGFloat) -> Self {
    TrackingProperty(tracking)
  }
}
