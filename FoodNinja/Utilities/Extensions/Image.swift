//
//  Image.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 02/09/2024.
//

import SwiftUI

enum ImageName: String {
    case splash, logo, facebook, google
    case onoarding1 = "onboarding-1"
    case onoarding2 = "onboarding-2"
}

extension Image {
    init(name: ImageName) {
        self.init(name.rawValue)
    }
}
