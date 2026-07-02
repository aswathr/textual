import SwiftUI

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension StructuredText {
  /// A GitHub-like set of styles for structured text.
  ///
  /// Apply this style with ``TextualNamespace/structuredTextStyle(_:)``.
  public struct GitHubStyle: Style {
    public let inlineStyle: InlineStyle = .gitHub
    public let headingStyle: GitHubHeadingStyle = .gitHub
    public let paragraphStyle: GitHubParagraphStyle = .gitHub
    public let blockQuoteStyle: GitHubBlockQuoteStyle = .gitHub
    public let codeBlockStyle: GitHubCodeBlockStyle = .gitHub
    public let listItemStyle: DefaultListItemStyle = .default
    public let unorderedListMarker: HierarchicalSymbolListMarker = .hierarchical(
      .disc, .circle, .square)
    public let orderedListMarker: DecimalListMarker = .decimal
    public let tableStyle: GitHubTableStyle = .gitHub
    public let tableCellStyle: GitHubTableCellStyle = .gitHub
    public let thematicBreakStyle: GitHubThematicBreakStyle = .gitHub

    public init() {}
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension StructuredText.Style where Self == StructuredText.GitHubStyle {
  /// A GitHub-like structured text style.
  public static var gitHub: Self {
    .init()
  }
}
