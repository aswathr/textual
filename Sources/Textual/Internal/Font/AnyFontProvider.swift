import SwiftUI

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
struct AnyFontProvider {
  var base: any FontProvider

  init(_ base: some FontProvider) {
    if let base = base as? AnyFontProvider {
      self = base
    } else {
      self.base = base
    }
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension AnyFontProvider: FontProvider {
  var scale: CGFloat {
    get { base.scale }
    set { base.scale = newValue }
  }

  func size(in environment: TextEnvironmentValues) -> CGFloat {
    base.size(in: environment)
  }

  func resolve(in environment: TextEnvironmentValues) -> Font {
    base.resolve(in: environment)
  }

  static func == (lhs: Self, rhs: Self) -> Bool {
    AnyHashable(lhs.base) == AnyHashable(rhs.base)
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(base)
  }
}
