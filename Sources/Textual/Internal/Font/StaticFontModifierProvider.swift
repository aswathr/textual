import SwiftUI

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
struct StaticFontModifierProvider<Base: FontProvider, Modifier: StaticFontModifier> {
  var base: Base

  init(_: Modifier.Type, base: Base) {
    self.base = base
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension StaticFontModifierProvider: FontProvider {
  var scale: CGFloat {
    get { base.scale }
    set { base.scale = newValue }
  }

  func size(in environment: TextEnvironmentValues) -> CGFloat {
    base.size(in: environment)
  }

  func resolve(in environment: TextEnvironmentValues) -> Font {
    var font = base.resolve(in: environment)
    Modifier().modify(&font)
    return font
  }
}
