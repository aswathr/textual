import SwiftUI

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension StructuredText {
  /// The default table cell style used by ``StructuredText/DefaultStyle``.
  public struct DefaultTableCellStyle: TableCellStyle {
    /// Creates the default table cell style.
    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
      configuration.label
        .fontWeight(configuration.row == 0 ? .semibold : .regular)
        .textual.lineSpacing(.fontScaled(0.471))
        .textual.padding(.fontScaled(0.588))
    }
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension StructuredText.TableCellStyle where Self == StructuredText.DefaultTableCellStyle {
  /// The default table cell style.
  public static var `default`: Self {
    .init()
  }
}
