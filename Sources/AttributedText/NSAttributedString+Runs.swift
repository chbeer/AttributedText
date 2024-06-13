//
//  NSAttributedString+Runs.swift
//
//
//  Created by Christian Beer on 13.06.24.
//

import SwiftUI
#if canImport(AppKit)
import AppKit
#else
import UIKit
#endif

extension NSAttributedString {
    
    /// Creates an array of AttributedRun by enumerating the attributes of the NSAttributedString
    var runs: [AttributedRun] {
        var runs: [AttributedRun] = []
        var index = 0
        var range = NSRange(location: 0, length: 0)
        repeat {
            let attr = attributes(at: index, effectiveRange: &range)
            
            if let attachment = attr[NSAttributedString.Key.attachment] as? NSTextAttachment {
                runs.append(AttributedRun.attachment(
                    attachment,
                    range: range
                ))
                
            } else {
                runs.append(AttributedRun.text(
                    attributedSubstring(from: range),
                    range: range
                ))
            }
            
            index = range.upperBound
        } while (index < string.count)
        return runs
    }
    
}
