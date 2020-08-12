//
//  UIColor.swift
//  Locla
//
//  Created by Rizal Hidayat on 12/08/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

extension UIColor {
    public convenience init?(hex: String, alpha: CGFloat = 1.0) {
        let r, g, b: CGFloat
        
        let scanner = Scanner(string: hex)
        var hexNumber: UInt64 = 0
        
        if scanner.scanHexInt64(&hexNumber) {
            r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
            g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
            b = CGFloat((hexNumber & 0x0000ff)) / 255
            self.init(red: r, green: g, blue: b, alpha: alpha)
            return
        }
        return nil
    }
}
