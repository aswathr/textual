import SwiftUI

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension StructuredText {
  // NB: Enables environment resolution in `OrderedListMarker`
  struct ResolvedOrderedListMarker<M: OrderedListMarker>: View {
    private let marker: M
    private let configuration: M.Configuration

    init(_ marker: M, configuration: M.Configuration) {
      self.marker = marker
      self.configuration = configuration
    }

    var body: M.Body {
      marker.makeBody(configuration: configuration)
    }
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension StructuredText.OrderedListMarker {
  @MainActor func resolve(configuration: Configuration) -> some View {
    StructuredText.ResolvedOrderedListMarker(self, configuration: configuration)
  }
}
