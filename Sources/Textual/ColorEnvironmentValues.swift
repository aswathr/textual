import SwiftUI

/// A small set of environment values used for resolving dynamic colors.
@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct ColorEnvironmentValues: Hashable, Sendable {
  /// The current color scheme.
  public var colorScheme: ColorScheme

  /// The current color scheme contrast.
  public var colorSchemeContrast: ColorSchemeContrast

  init(
    colorScheme: ColorScheme,
    colorSchemeContrast: ColorSchemeContrast
  ) {
    self.colorScheme = colorScheme
    self.colorSchemeContrast = colorSchemeContrast
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension EnvironmentValues {
  var colorEnvironment: ColorEnvironmentValues {
    .init(
      colorScheme: colorScheme,
      colorSchemeContrast: colorSchemeContrast
    )
  }
}
