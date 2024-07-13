//
//  String.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 14/07/2024.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    func localized(arguments: CVarArg...) -> String {
        return String(format: self.localized, arguments: arguments)
    }
}
