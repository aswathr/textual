import SwiftUI

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension StructuredText {
  // NB: Enables environment resolution in `TableCellStyle`
  struct ResolvedTableCellStyle<S: TableCellStyle>: View {
    private let style: S
    private let configuration: S.Configuration

    init(_ style: S, configuration: S.Configuration) {
      self.style = style
      self.configuration = configuration
    }

    var body: S.Body {
      style.makeBody(configuration: configuration)
    }
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension StructuredText.TableCellStyle {
  @MainActor func resolve(configuration: Configuration) -> some View {
    StructuredText.ResolvedTableCellStyle(self, configuration: configuration)
  }
}
