@preconcurrency import CoreText
import SwiftUI

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
struct PlatformFontProvider {
  var font: CTFont
  var scale: CGFloat = 1
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension PlatformFontProvider: FontProvider {
  func size(in _: TextEnvironmentValues) -> CGFloat {
    CTFontGetSize(font) * scale
  }

  func resolve(in _: TextEnvironmentValues) -> Font {
    guard scale != 1 else { return Font(font) }
    return Font(CTFont(CTFontCopyFontDescriptor(font), size: CTFontGetSize(font) * scale))
  }
}
