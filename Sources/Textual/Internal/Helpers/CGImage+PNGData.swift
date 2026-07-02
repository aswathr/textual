import Foundation
import ImageIO
import UniformTypeIdentifiers

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension CGImage {
  func pngData() -> Data? {
    let data = NSMutableData()
    guard
      let destination = CGImageDestinationCreateWithData(
        data,
        UTType.png.identifier as CFString,
        1, nil
      )
    else {
      return nil
    }

    CGImageDestinationAddImage(destination, self, nil)
    CGImageDestinationFinalize(destination)

    return data as Data
  }
}
