import SwiftUI

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
struct FontModifierProvider<Base: FontProvider, Modifier: FontModifier> {
  var base: Base
  var modifier: Modifier
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension FontModifierProvider: FontProvider {
  var scale: CGFloat {
    get { base.scale }
    set { base.scale = newValue }
  }

  func size(in environment: TextEnvironmentValues) -> CGFloat {
    var size = base.size(in: environment)
    modifier.modify(&size)
    return size
  }

  func resolve(in environment: TextEnvironmentValues) -> Font {
    var font = base.resolve(in: environment)
    modifier.modify(&font)
    return font
  }
}
