import SwiftUI

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
struct LinkAttribute: TextAttribute {
  var url: URL

  init(_ url: URL) {
    self.url = url
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension Text.Layout.Run {
  var url: URL? {
    self[LinkAttribute.self]?.url
  }
}
