import SwiftUI

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension StructuredText {
  /// The default set of styles for structured text.
  ///
  /// Apply this style with ``TextualNamespace/structuredTextStyle(_:)``.
  public struct DefaultStyle: Style {
    public let inlineStyle: InlineStyle = .default
    public let headingStyle: DefaultHeadingStyle = .default
    public let paragraphStyle: DefaultParagraphStyle = .default
    public let blockQuoteStyle: DefaultBlockQuoteStyle = .default
    public let codeBlockStyle: DefaultCodeBlockStyle = .default
    public let listItemStyle: DefaultListItemStyle = .default
    public let unorderedListMarker: SymbolListMarker = .disc
    public let orderedListMarker: DecimalListMarker = .decimal
    public let tableStyle: DefaultTableStyle = .default
    public let tableCellStyle: DefaultTableCellStyle = .default
    public let thematicBreakStyle: DividerThematicBreakStyle = .divider

    public init() {}
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension StructuredText.Style where Self == StructuredText.DefaultStyle {
  /// The default structured text style.
  public static var `default`: Self {
    .init()
  }
}
