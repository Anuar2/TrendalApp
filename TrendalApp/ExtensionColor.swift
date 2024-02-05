//
//  ExtensionColor.swift
//  TrendalApp
//
//  Created by Anuar Orazbekov on 01.10.2023.
//

import Foundation
import SwiftUI

protocol AppColorsProtocol {
    associatedtype AppColor
    
    static func setColorWithHex(hex: String) -> AppColor
}

extension AppColorsProtocol {
    static func getRGBAndAlphaFromHex(hex: String) -> [Double] {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        let a, r, g, b: UInt64
        
        var int: UInt64 = 0
        
        Scanner(string: hex).scanHexInt64(&int)
        
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        return [
            Double(r) / 255,
            Double(g) / 255,
            Double(b) / 255,
            Double(a) / 255
        ]
    }
}

extension Color: AppColorsProtocol {
    static func setColorWithHex(hex: String) -> Color {
        var rgbaValues: [Double] { getRGBAndAlphaFromHex(hex: hex) }
        
        return .init(
            .sRGB,
            red: rgbaValues[0],
            green: rgbaValues[1],
            blue: rgbaValues[2],
            opacity: rgbaValues[3]
        )
    }
}


extension Color {
    static func fromHex(_ hex: String) -> Color {
        var hexWithoutPrefix = hex
        if hexWithoutPrefix.hasPrefix("#") {
            hexWithoutPrefix.removeFirst()
        }
        
        if let hexValue = Int(hexWithoutPrefix, radix: 16) {
            let red = Double((hexValue >> 16) & 0xFF) / 255.0
            let green = Double((hexValue >> 8) & 0xFF) / 255.0
            let blue = Double(hexValue & 0xFF) / 255.0
            return Color(red: red, green: green, blue: blue)
        }
        
        return .clear
    }
}
