#if TEXTUAL_ENABLE_TEXT_SELECTION && canImport(UIKit)
  import SwiftUI

  // MARK: - Overview
  //
  // `UIKitTextSelectionInteraction` presents the platform-specific text selection overlay for iOS.
  //
  // The modifier receives a `TextSelectionModel` from `TextSelectionInteraction` and overlays
  // `UIKitTextInteractionOverlay`, which wraps a `UIView` that handles selection gestures and
  // integrates with system edit actions (copy/share). SwiftUI continues to render the text while
  // UIKit manages the selection interaction.

  @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
  typealias PlatformTextSelectionInteraction = UIKitTextSelectionInteraction

  @available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
  struct UIKitTextSelectionInteraction: ViewModifier {
    private let model: TextSelectionModel

    init(model: TextSelectionModel) {
      self.model = model
    }

    func body(content: Content) -> some View {
      content.overlayPreferenceValue(OverflowFrameKey.self) { frames in
        UIKitTextInteractionOverlay(model: model, overflowFrames: frames)
      }
    }
  }
#endif
