//
//  NSTextAttachment.swift
//
//
//  Created by Christian Beer on 18.06.24.
//

import Foundation

#if canImport(AppKit)

import AppKit

extension NSTextAttachment {
    
    convenience init(image: NSImage) {
        self.init()
        self.image = image
    }
    
}

#endif
