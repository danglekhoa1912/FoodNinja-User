//
//  Color.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 14/07/2024.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
    static let primary = Color("PrimaryColor")
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet(charactersIn: "#"))
        let rgbValue = UInt32(hex, radix: 16)
        let r = Double((rgbValue! & 0xFF0000) >> 16) / 255
        let g = Double((rgbValue! & 0x00FF00) >> 8) / 255
        let b = Double(rgbValue! & 0x0000FF) / 255
        self.init(red: r, green: g, blue: b)
    }
}

struct ColorTheme {
    let backgroundColor = Color("BackgroundColor")
    let secondaryBgColor = Color("SecondaryBgColor")
}
