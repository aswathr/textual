#if TEXTUAL_ENABLE_TEXT_SELECTION
  import SwiftUI

  @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
  struct EmptyTextLayoutCollection: TextLayoutCollection {
    var layouts: [any TextLayout] {
      []
    }

    func isEqual(to other: any TextLayoutCollection) -> Bool {
      other.layouts.isEmpty
    }

    func needsPositionReconciliation(with other: any TextLayoutCollection) -> Bool {
      false
    }

    func index(of layout: Text.Layout) -> Int? {
      nil
    }
  }
#endif
