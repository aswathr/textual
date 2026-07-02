import SwiftUI

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension VerticalAlignment {
  private enum FirstTextCenterAlignment: AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
      // Calculate the vertical center of the first line of text. The first line height is
      // the total height minus the distance between first and last baselines (which gives
      // the height of all lines except the first), then divide by 2 to get the center point.
      let firstLineHeight =
        context.height - (context[.lastTextBaseline] - context[.firstTextBaseline])
      return firstLineHeight / 2
    }
  }

  static let firstTextCenter = Self(FirstTextCenterAlignment.self)
}
