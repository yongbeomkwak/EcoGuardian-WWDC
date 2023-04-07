//
//  File.swift
//
//
//  Created by yongbeomkwak on 2023/04/03.
//
import Foundation
import SwiftUI

extension Color {
    
    init(hex: UInt, alpha: Double = 1){
            self.init(.sRGB, red: Double((hex >> 16) & 0xff) / 255, green: Double((hex >> 08) & 0xff) / 255, blue: Double((hex >> 00) & 0xff) / 255, opacity: alpha
            )
        }
    
    
    static let heroColor = Color(hex: 0x9A9B63)
    static let villonColor = Color(hex: 0x668473)
    static let villonTextBgColor = Color(hex:0xFFFFFF,alpha: 0.76)
    static let heroTextBgColor = Color(hex: 0xD7FF73,alpha: 0.4)
    
}
