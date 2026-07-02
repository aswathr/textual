import SwiftUI

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
struct SystemFontProvider {
  var size: CGFloat
  var weight: Font.Weight?
  var design: Font.Design?
  var scale: CGFloat = 1
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension SystemFontProvider: FontProvider {
  func size(in _: TextEnvironmentValues) -> CGFloat {
    size * scale
  }

  func resolve(in _: TextEnvironmentValues) -> Font {
    Font.system(size: size * scale, weight: weight, design: design)
  }
}
