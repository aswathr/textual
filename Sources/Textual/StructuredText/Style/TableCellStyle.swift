import SwiftUI

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension StructuredText {
  /// The properties of a table cell passed to a `TableCellStyle`.
  public struct TableCellStyleConfiguration {
    /// A type-erased view that contains the cell content.
    public struct Label: View {
      init(_ label: some View) {
        self.body = AnyView(label)
      }
      public let body: AnyView
    }

    /// The cell content.
    public let label: Label
    /// The indentation level of the table within the document structure.
    public let indentationLevel: Int
    /// The row index of the cell.
    public let row: Int
    /// The column index of the cell.
    public let column: Int
  }

  /// A style that controls how `StructuredText` renders individual table cells.
  ///
  /// Apply a table cell style using the ``TextualNamespace/tableCellStyle(_:)`` modifier or
  /// through a bundled ``StructuredText/Style``.
  public protocol TableCellStyle: DynamicProperty {
    associatedtype Body: View

    /// Creates a view that represents a table cell.
    @MainActor @ViewBuilder func makeBody(configuration: Self.Configuration) -> Self.Body

    typealias Configuration = TableCellStyleConfiguration
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension EnvironmentValues {
  @usableFromInline
  @Entry var tableCellStyle: any StructuredText.TableCellStyle = .default
}
