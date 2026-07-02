import Foundation
import SwiftUI
import Testing

@testable import Textual

struct PlainTextFormatterTests {
  @Test
  @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
  func simpleParagraph() throws {
    // given
    let formatter = try Formatter(
      NSAttributedString(markdown: "This is a simple paragraph.")
    )

    // when
    let result = formatter.plainText()

    // then
    #expect(result == "This is a simple paragraph.")
  }

  @Test
  @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
  func multipleParagraphs() throws {
    // given
    let formatter = try Formatter(
      NSAttributedString(
        markdown: """
          First paragraph.

          Second paragraph.

          Third paragraph.
          """
      )
    )

    // when
    let result = formatter.plainText()

    // then
    #expect(result == "First paragraph.\n\nSecond paragraph.\n\nThird paragraph.")
  }

  @Test
  @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
  func headings() throws {
    // given
    let formatter = try Formatter(
      NSAttributedString(
        markdown: """
          # Heading 1

          ## Heading 2

          ### Heading 3
          """
      )
    )

    // when
    let result = formatter.plainText()

    // then
    #expect(result == "Heading 1\n\nHeading 2\n\nHeading 3")
  }

  @Test
  @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
  func unorderedList() throws {
    // given
    let formatter = try Formatter(
      NSAttributedString(
        markdown: """
          * First item
          * Second item
          * Third item
          """
      )
    )

    // when
    let result = formatter.plainText()

    // then
    #expect(result == "  • First item\n  • Second item\n  • Third item")
  }

  @Test
  @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
  func orderedList() throws {
    // given
    let formatter = try Formatter(
      NSAttributedString(
        markdown: """
          1. First item
          2. Second item
          3. Third item
          """
      )
    )

    // when
    let result = formatter.plainText()

    // then
    #expect(result == "  1. First item\n  2. Second item\n  3. Third item")
  }

  @Test
  @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
  func nestedUnorderedList() throws {
    // given
    let formatter = try Formatter(
      NSAttributedString(
        markdown: """
          - First item
            - Nested item 1
            - Nested item 2
          - Second item
          """
      )
    )

    // when
    let result = formatter.plainText()

    // then
    #expect(
      result
        == "  • First item\n    • Nested item 1\n    • Nested item 2\n  • Second item"
    )
  }

  @Test
  @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
  func nestedOrderedList() throws {
    // given
    let formatter = try Formatter(
      NSAttributedString(
        markdown: """
          1. First item
             1. Nested item 1
             2. Nested item 2
          2. Second item
          """
      )
    )

    // when
    let result = formatter.plainText()

    // then
    #expect(
      result
        == "  1. First item\n    1. Nested item 1\n    2. Nested item 2\n  2. Second item"
    )
  }

  @Test
  @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
  func mixedNestedList() throws {
    // given
    let formatter = try Formatter(
      NSAttributedString(
        markdown: """
          1. Ordered first
             - Unordered nested
             - Another unordered
          2. Ordered second
          """
      )
    )

    // when
    let result = formatter.plainText()

    // then
    #expect(
      result
        == "  1. Ordered first\n    • Unordered nested\n    • Another unordered\n  2. Ordered second"
    )
  }

  @Test
  @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
  func simpleBlockQuote() throws {
    // given
    let formatter = try Formatter(
      NSAttributedString(
        markdown: """
          > This is a quote.
          """
      )
    )

    // when
    let result = formatter.plainText()

    // then
    #expect(result == "  This is a quote.")
  }

  @Test
  @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
  func blockQuoteWithParagraphs() throws {
    // given
    let formatter = try Formatter(
      NSAttributedString(
        markdown: """
          Before quote.

          > This is a quote.

          After quote.
          """
      )
    )

    // when
    let result = formatter.plainText()

    // then
    #expect(result == "Before quote.\n\n  This is a quote.\n\nAfter quote.")
  }

  // MARK: - Code Blocks

  @Test
  @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
  func codeBlock() throws {
    // given
    let formatter = try Formatter(
      NSAttributedString(
        markdown: """
          ```swift
          func hello() {
              print("Hello")
          }
          ```
          """
      )
    )

    // when
    let result = formatter.plainText()

    // then
    #expect(result == "func hello() {\n    print(\"Hello\")\n}\n")
  }

  @Test
  @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
  func codeBlockWithSurroundingText() throws {
    // given
    let formatter = try Formatter(
      NSAttributedString(
        markdown: """
          Before code.

          ```
          code line 1
          code line 2
          ```

          After code.
          """
      )
    )

    // when
    let result = formatter.plainText()

    // then
    #expect(result == "Before code.\n\ncode line 1\ncode line 2\n\n\nAfter code.")
  }

  @Test
  @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
  func simpleTable() throws {
    // given
    let formatter = try Formatter(
      NSAttributedString(
        markdown: """
          | Header 1 | Header 2 |
          | --- | --- |
          | Cell A1 | Cell A2 |
          | Cell B1 | Cell B2 |
          """
      )
    )
    let expected = """
      Header 1,Header 2
      Cell A1,Cell A2
      Cell B1,Cell B2
      """

    // when
    let result = formatter.plainText()

    // then
    #expect(result == expected)
  }

  @Test
  @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
  func complexMixedContent() throws {
    // given
    let formatter = try Formatter(
      NSAttributedString(
        markdown: """
          # Main Title

          Introduction paragraph.

          ## Section 1

          - First point
          - Second point
            - Nested point

          ## Section 2

          Some text before table.

          | Column A | Column B |
          | --- | --- |
          | Value 1 | Value 2 |

          ## Conclusion

          Final paragraph.
          """
      )
    )
    let expected = """
      Main Title

      Introduction paragraph.

      Section 1

        • First point
        • Second point
          • Nested point

      Section 2

      Some text before table.

      Column A,Column B
      Value 1,Value 2

      Conclusion

      Final paragraph.
      """

    // when
    let result = formatter.plainText()

    // then
    #expect(result == expected)
  }

  @Test
  @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
  func listAfterParagraph() throws {
    // given
    let formatter = try Formatter(
      NSAttributedString(
        markdown: """
          Here is a paragraph.

          - Item 1
          - Item 2
          """
      )
    )

    // when
    let result = formatter.plainText()

    // then
    #expect(result == "Here is a paragraph.\n\n  • Item 1\n  • Item 2")
  }

  @Test
  @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
  func emptyString() throws {
    // given
    let formatter = Formatter(NSAttributedString())

    // when
    let result = formatter.plainText()

    // then
    #expect(result == "")
  }
}
