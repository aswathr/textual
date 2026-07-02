import SwiftUI

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
struct NamedFontProvider {
  var name: String
  var size: CGFloat
  var textStyle: Font.TextStyle?
  var scale: CGFloat = 1
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension NamedFontProvider: FontProvider {
  func size(in environment: TextEnvironmentValues) -> CGFloat {
    #if canImport(AppKit)
      return size * scale
    #elseif canImport(UIKit)
      guard let textStyle else { return size * scale }

      return PlatformFont.custom(
        name,
        size: size,
        relativeTo: textStyle,
        in: environment
      ).pointSize * scale
    #endif
  }

  func resolve(in _: TextEnvironmentValues) -> Font {
    if let textStyle {
      return .custom(name, size: size * scale, relativeTo: textStyle)
    } else {
      return .custom(name, fixedSize: size * scale)
    }
  }
}
