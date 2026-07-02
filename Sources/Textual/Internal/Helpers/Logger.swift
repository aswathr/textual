import Foundation
import os

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension Logger {
  enum Textual {
    struct Category: RawRepresentable, Hashable {
      let rawValue: String

      init(rawValue: String) {
        self.rawValue = rawValue
      }
    }
  }

  private enum Constants {
    static let subsystem = "com.github.gonzalezreal.Textual"
    static let defaultsKey = "\(subsystem).Debug"
  }

  init(category: Textual.Category) {
    if UserDefaults.standard.bool(forKey: Constants.defaultsKey) {
      self.init(subsystem: Constants.subsystem, category: category.rawValue)
    } else {
      self.init(.disabled)
    }
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension CGPoint {
  var logDescription: String {
    "(\(String(format: "%.1f", x)), \(String(format: "%.1f", y)))"
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension CGRect {
  var logDescription: String {
    "(" + "\(String(format: "%.1f", origin.x)), " + "\(String(format: "%.1f", origin.y)), "
      + "\(String(format: "%.1f", size.width)), " + "\(String(format: "%.1f", size.height))" + ")"
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension NSAttributedString {
  var logDescription: String {
    self.string.replacingOccurrences(of: "\n", with: "\\n")
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension Optional where Wrapped: CustomStringConvertible {
  var logDescription: String {
    self?.description ?? "nil"
  }
}
