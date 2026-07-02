import SwiftUI
import Testing

@testable import Textual

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
struct InlineStyleTests {
  @Test
  @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
  func equality() {
    #expect(InlineStyle() == InlineStyle())
    #expect(
      InlineStyle().code(.monospaced, .fontScale(0.8))
        == InlineStyle().code(.monospaced, .fontScale(0.8))
    )
    #expect(
      InlineStyle().code(.monospaced, .fontScale(0.8))
        != InlineStyle().code(.monospaced, .fontScale(1.2))
    )
  }

  @Test
  @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
  func hashability() {
    #expect(InlineStyle().hashValue == InlineStyle().hashValue)
    #expect(
      InlineStyle().emphasis(.italic, .underlineStyle(.single)).hashValue
        == InlineStyle().emphasis(.italic, .underlineStyle(.single)).hashValue
    )
    #expect(InlineStyle().hashValue != InlineStyle().code(.monospaced, .fontScale(0.8)).hashValue)
  }
}
