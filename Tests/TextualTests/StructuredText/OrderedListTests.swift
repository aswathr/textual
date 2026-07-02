#if os(iOS) && !targetEnvironment(macCatalyst)
  import SwiftUI
  import Testing
  import SnapshotTesting

  import Textual

  @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
  extension StructuredText {
    @MainActor
    struct OrderedListTests {
      private let layout = SwiftUISnapshotLayout.device(config: .iPhone8)

      @Test
      @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
      func  decimalList() {
        let view = StructuredText(
          markdown: """
            This is an incomplete list of headgear:

            1. Hats
            1. Caps
            1. Bonnets

            Some more:

            10. Helmets
            1. Hoods
            1. Headbands
               1. Headscarves
               1. Wimples

            A list with a high start:

            999. The sky above the port was the color of television, tuned to a dead channel.
            1. It was a bright cold day in April, and the clocks were striking thirteen.
            """
        )
        .background(Color.guide)
        .padding(.horizontal)

        // Need to use a lower precision for CI
        assertSnapshot(of: view, as: .image(precision: 0.85, layout: layout))
      }

      @Test
      @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
      func  lowerRomanList() {
        let view = StructuredText(
          markdown: """
            This is an incomplete list of headgear:

            1. Hats
            1. Caps
            1. Bonnets

            A list with a high start:

            999. The sky above the port was the color of television, tuned to a dead channel.
            1. It was a bright cold day in April, and the clocks were striking thirteen.
            """
        )
        .background(Color.guide)
        .padding(.horizontal)
        .textual.orderedListMarker(.lowerRoman)

        assertSnapshot(of: view, as: .textualImage(layout: layout))
      }

      @Test
      @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
      func  upperRomanList() {
        let view = StructuredText(
          markdown: """
            This is an incomplete list of headgear:

            1. Hats
            1. Caps
            1. Bonnets

            A list with a high start:

            999. The sky above the port was the color of television, tuned to a dead channel.
            1. It was a bright cold day in April, and the clocks were striking thirteen.
            """
        )
        .background(Color.guide)
        .padding(.horizontal)
        .textual.orderedListMarker(.upperRoman)

        assertSnapshot(of: view, as: .textualImage(layout: layout))
      }

      @Test
      @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
      func  lowerAlphaList() {
        let view = StructuredText(
          markdown: """
            This is an incomplete list of headgear:

            1. Hats
            1. Caps
            1. Bonnets

            A list with a high start:

            25. The sky above the port was the color of television, tuned to a dead channel.
            1. It was a bright cold day in April, and the clocks were striking thirteen.
            """
        )
        .background(Color.guide)
        .padding(.horizontal)
        .textual.orderedListMarker(.lowerAlpha)

        assertSnapshot(of: view, as: .textualImage(layout: layout))
      }

      @Test
      @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
      func  upperAlphaList() {
        let view = StructuredText(
          markdown: """
            This is an incomplete list of headgear:

            1. Hats
            1. Caps
            1. Bonnets

            A list with a high start:

            25. The sky above the port was the color of television, tuned to a dead channel.
            1. It was a bright cold day in April, and the clocks were striking thirteen.
            """
        )
        .background(Color.guide)
        .padding(.horizontal)
        .textual.orderedListMarker(.upperAlpha)

        assertSnapshot(of: view, as: .textualImage(layout: layout))
      }
    }
  }
#endif
