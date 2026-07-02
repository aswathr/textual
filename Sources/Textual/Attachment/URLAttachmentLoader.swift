import SwiftUI

/// An attachment loader that fetches images from URLs.
///
/// `URLAttachmentLoader` resolves URLs relative to an optional base URL, loads the image, and
/// builds an attachment value from it.
///
/// You can’t create `URLAttachmentLoader` directly. Use ``AttachmentLoader/image(relativeTo:)``
/// and ``AttachmentLoader/emoji(relativeTo:)`` instead.
@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct URLAttachmentLoader<Content: Attachment>: AttachmentLoader {
  private let baseURL: URL?
  private let content: @Sendable (Image, String) -> Content

  fileprivate init(baseURL: URL?, content: @Sendable @escaping (Image, String) -> Content) {
    self.baseURL = baseURL
    self.content = content
  }

  public func attachment(
    for url: URL,
    text: String,
    environment: ColorEnvironmentValues
  ) async throws -> some Attachment {
    let imageURL = URL(string: url.absoluteString, relativeTo: baseURL) ?? url
    let image = try await ImageLoader.shared.image(for: imageURL)

    return content(image, text)
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension AttachmentLoader where Self == URLAttachmentLoader<ImageAttachment> {
  /// Loads images referenced by URLs.
  ///
  /// - Parameter baseURL: The base URL used to resolve relative URLs.
  public static func image(relativeTo baseURL: URL? = nil) -> Self {
    .init(baseURL: baseURL, content: ImageAttachment.init(image:text:))
  }
}

@available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension AttachmentLoader where Self == URLAttachmentLoader<EmojiAttachment> {
  /// Loads custom emoji referenced by URL.
  ///
  /// - Parameter baseURL: The base URL used to resolve relative URLs.
  public static func emoji(relativeTo baseURL: URL? = nil) -> Self {
    .init(baseURL: baseURL, content: EmojiAttachment.init(image:text:))
  }
}
