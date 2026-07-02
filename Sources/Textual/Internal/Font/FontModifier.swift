import SwiftUI

protocol FontModifier: Sendable, Hashable {
  func modify(_ font: inout Font)
  func modify(_ size: inout CGFloat)
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension FontModifier {
  func modify(_ size: inout CGFloat) {
    // do nothing
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
struct WeightFontModifier: FontModifier {
  var weight: Font.Weight

  func modify(_ font: inout Font) {
    font = font.weight(weight)
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
struct WidthFontModifier: FontModifier {
  var width: Font.Width

  func modify(_ font: inout Font) {
    font = font.width(width)
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
struct LeadingFontModifier: FontModifier {
  var leading: Font.Leading

  func modify(_ font: inout Font) {
    font = font.leading(leading)
  }
}

#if compiler(>=6.2)
  @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
  struct ScaleFontModifier: FontModifier {
    var scaleFactor: CGFloat

    func modify(_ font: inout Font) {
      font = font.scaled(by: scaleFactor)
    }

    // NB: Modify both font and size so that measurements match rendering.
    //     FontProvider.size(in:) must return the actual rendered size.
    func modify(_ size: inout CGFloat) {
      size *= scaleFactor
    }
  }
#endif

// MARK: - Static font modifiers

protocol StaticFontModifier: FontModifier {
  init()
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
struct BoldFontModifier: StaticFontModifier {
  func modify(_ font: inout Font) {
    font = font.bold()
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
struct ItalicFontModifier: StaticFontModifier {
  func modify(_ font: inout Font) {
    font = font.italic()
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
struct MonospacedFontModifier: StaticFontModifier {
  func modify(_ font: inout Font) {
    font = font.monospaced()
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
struct MonospacedDigitFontModifier: StaticFontModifier {
  func modify(_ font: inout Font) {
    font = font.monospacedDigit()
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
struct LowercaseSmallCapsFontModifier: StaticFontModifier {
  func modify(_ font: inout Font) {
    font = font.lowercaseSmallCaps()
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
struct UppercaseSmallCapsFontModifier: StaticFontModifier {
  func modify(_ font: inout Font) {
    font = font.uppercaseSmallCaps()
  }
}
