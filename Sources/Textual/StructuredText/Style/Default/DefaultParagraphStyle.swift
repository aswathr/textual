import SwiftUI

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension StructuredText {
  /// The default paragraph style used by ``StructuredText/DefaultStyle``.
  public struct DefaultParagraphStyle: ParagraphStyle {
    /// Creates the default paragraph style.
    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
      configuration.label
        .textual.lineSpacing(.fontScaled(0.23))
        .textual.blockSpacing(.fontScaled(top: 0.8))
    }
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension StructuredText.ParagraphStyle where Self == StructuredText.DefaultParagraphStyle {
  /// The default paragraph style.
  public static var `default`: Self {
    .init()
  }
}

@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(macOS 15.0, iOS 18.0, visionOS 2.0, *)
#Preview {
  StructuredText(
    markdown: """
      The sky above the port was the color of television,
      tuned to a dead channel.

      It was a bright cold day in April, and the clocks were
      striking thirteen.
      """
  )
  .padding()
  .textual.textSelection(.enabled)
}
