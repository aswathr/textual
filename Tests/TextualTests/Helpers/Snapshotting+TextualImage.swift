#if os(iOS) && !targetEnvironment(macCatalyst)
  import SnapshotTesting
  import SwiftUI

  @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
  extension Snapshotting where Value: SwiftUI.View, Format == UIImage {
    @MainActor
    static func textualImage(layout: SwiftUISnapshotLayout) -> Snapshotting {
      .image(
        precision: 0.995,
        perceptualPrecision: 0.98,
        layout: layout
      )
    }
  }
#endif
