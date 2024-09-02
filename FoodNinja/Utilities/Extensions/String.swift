//
//  String.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 14/07/2024.
//

import Foundation

enum LocalizeString {
    //Onboarding
    case OnboardingNext, OnboardingTitle1, OnboardingTitle2, OnboardingDescription1, OnboardingDescription2
    func l10n() -> String {
        let caseName = "\(self)"
        return caseName.l10nFormat()
    }
}

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    func localized(arguments: CVarArg...) -> String {
        return String(format: self.localized, arguments: arguments)
    }
    func l10nFormat() -> String {
        let firstCharacter = self.prefix(1)
        let remainingCharacters = self.dropFirst()
        let formattedString = remainingCharacters.replacingOccurrences(of: "([A-Z])", with: " $1", options: .regularExpression, range: nil)
        return firstCharacter + formattedString.lowercased().replacingOccurrences(of: " ", with: ".")
    }
}
