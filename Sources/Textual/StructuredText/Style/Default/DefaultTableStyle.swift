import SwiftUI

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension StructuredText {
  /// The default table style used by ``StructuredText/DefaultStyle``.
  public struct DefaultTableStyle: TableStyle {
    private static let borderWidth: CGFloat = 1

    /// Creates the default table style.
    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
      configuration.label
        .textual.tableCellSpacing(horizontal: Self.borderWidth, vertical: Self.borderWidth)
        .textual.blockSpacing(.fontScaled(top: 1.6, bottom: 1.6))
        .textual.tableOverlay { layout in
          Canvas { context, _ in
            for divider in layout.dividers() {
              context.fill(
                Path(divider),
                with: .style(DynamicColor.grayTertiary)
              )
            }
          }
        }
        .padding(Self.borderWidth)
    }
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension StructuredText.TableStyle where Self == StructuredText.DefaultTableStyle {
  /// The default table style.
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
      The sky above the port was the color of television, tuned to a dead channel.

      Sloth speed  | Description                          
      ------------ | ------------------------------------- 
      `slow`       | Moves slightly faster than a snail  
      `medium`     | Moves at an average speed           
      `fast`       | Moves faster than a hare            
      `supersonic` | Moves faster than the speed of sound

      It was a bright cold day in April, and the clocks were striking thirteen.
      """
  )
  .padding()
  .textual.textSelection(.enabled)
}
