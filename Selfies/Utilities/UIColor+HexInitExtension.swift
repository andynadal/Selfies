//
//  UIColor+HexInitExtension.swift
//  Selfies
//
//  Created by Andy Nadal on 8/11/21.
//

import UIKit

extension UIColor {
    convenience init?(_ hex: String) {
        var chars = Array(hex.hasPrefix("#") ? hex.dropFirst() : hex[...])
        
        switch chars.count {
        case 3:
            chars = chars.flatMap { [$0, $0] }; fallthrough
        case 6:
            chars.append(contentsOf: ["F", "F"])
        case 8:
            break
        default:
            return nil
        }
        
        self.init(red: .init(strtoul(String(chars[0...1]), nil, 16)) / 255,
                  green: .init(strtoul(String(chars[2...3]), nil, 16)) / 255,
                  blue: .init(strtoul(String(chars[4...5]), nil, 16)) / 255,
                  alpha: 1.0)
    }
}
