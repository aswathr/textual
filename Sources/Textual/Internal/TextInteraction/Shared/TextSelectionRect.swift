#if TEXTUAL_ENABLE_TEXT_SELECTION
  import SwiftUI

  @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
  struct TextSelectionRect: Hashable, CustomStringConvertible {
    var rect: CGRect

    let layoutDirection: LayoutDirection
    var containsStart: Bool
    var containsEnd: Bool

    var description: String {
      "(\(rect.logDescription), \(layoutDirection == .leftToRight ? "LTR" : "RTL"))"
    }

    init(
      rect: CGRect,
      layoutDirection: LayoutDirection,
      containsStart: Bool = false,
      containsEnd: Bool = false
    ) {
      self.rect = rect
      self.layoutDirection = layoutDirection
      self.containsStart = containsStart
      self.containsEnd = containsEnd
    }

    func offsetBy(dx: CGFloat, dy: CGFloat) -> TextSelectionRect {
      .init(
        rect: rect.offsetBy(dx: dx, dy: dy),
        layoutDirection: layoutDirection,
        containsStart: containsStart,
        containsEnd: containsEnd
      )
    }
  }
#endif
