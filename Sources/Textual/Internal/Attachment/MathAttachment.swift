import SwiftUI
@_spi(Textual) private import SwiftUIMath

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
struct MathAttachment: Attachment {
  enum DisplayStyle: Sendable {
    case inline
    case block
  }

  var description: String {
    switch displayStyle {
    case .inline:
      return "$\(latex)$"
    case .block:
      return "$$\(latex)$$"
    }
  }

  var selectionStyle: AttachmentSelectionStyle {
    .text
  }

  let latex: String
  let displayStyle: DisplayStyle

  init(latex: String, style: DisplayStyle) {
    self.latex = latex
    self.displayStyle = style
  }

  var body: some View {
    MathView(latex: latex, style: displayStyle)
  }

  func baselineOffset(in environment: TextEnvironmentValues) -> CGFloat {
    -typographicBounds(in: environment).descent
  }

  func sizeThatFits(_ proposal: ProposedViewSize, in environment: TextEnvironmentValues) -> CGSize {
    typographicBounds(fitting: proposal, in: environment).size
  }

  private func typographicBounds(
    fitting proposal: ProposedViewSize = .unspecified,
    in environment: TextEnvironmentValues
  ) -> Math.TypographicBounds {
    Math.typographicBounds(
      for: latex,
      fitting: proposal,
      font: .init(
        name: .init(environment.mathProperties.fontName),
        size: FontScaled(environment.mathProperties.fontScale).resolve(in: environment)
      ),
      style: .init(displayStyle)
    )
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
private struct MathView: View {
  @Environment(\.textEnvironment) private var environment

  let latex: String
  let style: MathAttachment.DisplayStyle

  var body: some View {
    Math(latex)
      .mathFont(
        .init(
          name: .init(environment.mathProperties.fontName),
          size: FontScaled(environment.mathProperties.fontScale).resolve(in: environment)
        )
      )
      .mathTypesettingStyle(.init(style))
      .mathRenderingMode(.monochrome)
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension Math.Font.Name {
  fileprivate init(_ fontName: MathProperties.FontName) {
    self.init(rawValue: fontName.rawValue)
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension Math.TypesettingStyle {
  fileprivate init(_ style: MathAttachment.DisplayStyle) {
    switch style {
    case .inline:
      self = .text
    case .block:
      self = .display
    }
  }
}
