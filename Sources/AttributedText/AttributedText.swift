//
//  AttributedText.swift
//
//
//  Created by Christian Beer on 12.06.24.
//

import SwiftUI

/// View like SwiftUIs Text that renders an NSAttributedString into SwiftUI Text supporting image and other attachments.
public struct AttributedText: View {
    
    public typealias AttachmentImageFactory = (NSTextAttachment) -> Image?
    
    /// the underlying NSAttributedString
    let text: NSAttributedString
    
    /// Image factory generates images for supported NSTextAttachment or returns nil if not supported, leading to empty Text
    let imageFactory: (AttachmentImageFactory)
    
    /// Creates an attributed text view that presents the given text.
    /// - Parameters:
    ///   - text: NSAttributedString to show
    ///   - imageFactory: Optional image factory that generates images from NSTextAttachment
    public init(text: NSAttributedString, imageFactory: AttachmentImageFactory? = nil) {
        self.text = text
        self.imageFactory = imageFactory ?? AttributedText.defaultAttachmentImageFactory
    }
    
    public var body: some View {
        VStack {
            text.runs.reduce(Text("")) { text, run in
                switch run.content {
                case .text(let string): return text + Text(AttributedString(string))
                case .attachment(let attachment):
                    if let image = imageFactory(attachment) {
                        return text + Text(image)
                    } else {
                        return text
                    }
                }
            }
        }
    }
    
    /// Returns the image in the NSTextAttachment if available. Should be called as default handler in your custom imageFactory.
    public static func defaultAttachmentImageFactory(for attachment: NSTextAttachment) -> Image? {
        if let image = attachment.image {
#if canImport(AppKit)
            return Image(nsImage: image)
#else
            return Image(uiImage: image)
#endif
        } else {
            return nil
        }
    }
}

let previewText: NSAttributedString =  {
    let attr = NSMutableAttributedString()
    
    let imgAttachment = NSTextAttachment(image: UIImage(systemName: "clock")!)
    
    attr.append(NSAttributedString(string: "It's 10 o"))
    attr.append(NSAttributedString(attachment: imgAttachment))
    attr.append(NSAttributedString(string: " in the afternoon"))
    
    return attr
}()

#Preview {
    AttributedText(text: previewText)
}

