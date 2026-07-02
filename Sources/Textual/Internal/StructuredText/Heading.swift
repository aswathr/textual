import SwiftUI

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension StructuredText {
  struct Heading: View {
    @Environment(\.headingStyle) private var headingStyle

    private let content: AttributedSubstring
    private let level: Int

    init(_ content: AttributedSubstring, level: Int) {
      self.content = content
      self.level = level
    }

    var body: some View {
      let configuration = HeadingStyleConfiguration(
        label: .init(label),
        indentationLevel: indentationLevel,
        headingLevel: level
      )
      let resolvedStyle = headingStyle.resolve(configuration: configuration)

      AnyView(resolvedStyle)
        .id(content.slugified())
    }

    private var label: some View {
      WithInlineStyle(AttributedString(content)) {
        TextFragment($0)
      }
    }

    private var indentationLevel: Int {
      content.presentationIntent?.indentationLevel ?? 0
    }
  }
}
