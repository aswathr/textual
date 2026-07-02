import Foundation
import SwiftUI

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension LayoutDirection {
  static func localeBased(locale: Locale = .current) -> LayoutDirection {
    switch locale.language.characterDirection {
    case .rightToLeft:
      return .rightToLeft
    case .leftToRight:
      return .leftToRight
    case .topToBottom, .bottomToTop, .unknown:
      return .leftToRight
    @unknown default:
      return .leftToRight
    }
  }
}
