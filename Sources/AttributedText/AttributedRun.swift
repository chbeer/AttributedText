//
//  AttributedRun.swift
//
//
//  Created by Christian Beer on 13.06.24.
//

import Foundation
import SwiftUI

public struct AttributedRun: Identifiable {
    
    public enum Content {
        case text(NSAttributedString), attachment(NSTextAttachment)
    }
    
    public let id: Int
    public let range: NSRange
    public let content: Content
    
    public static func text(_ string: NSAttributedString, range: NSRange) -> AttributedRun {
        .init(id: range.location,
              range: range,
              content: .text(string))
    }
    public static func attachment(_ attachment: NSTextAttachment, range: NSRange) -> AttributedRun {
        .init(id: range.location,
              range: range,
              content: .attachment(attachment))
    }
}

