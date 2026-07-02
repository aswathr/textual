import SwiftUI

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
struct WithFontScaledValue<Value, Content>: View where Value: FontScalable, Content: View {
  @Environment(\.textEnvironment) private var environment

  private let value: FontScaled<Value>
  private let content: (Value) -> Content

  init(_ value: FontScaled<Value>, @ViewBuilder content: @escaping (Value) -> Content) {
    self.value = value
    self.content = content
  }

  var body: some View {
    content(value.resolve(in: environment))
  }
}
