//
//  OnboardingViewModel.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 02/09/2024.
//

import Foundation

final class OnboardingViewModel: ObservableObject {
    @Published var onboardingPage: [OnboardingPage]

    init() {
        self.onboardingPage = [
            OnboardingPage(imageName: .onoarding1, title: LocalizeString.OnboardingTitle1.l10n(), description: LocalizeString.OnboardingDescription1.l10n()),
            OnboardingPage(imageName: .onoarding2, title: LocalizeString.OnboardingTitle2.l10n(), description: LocalizeString.OnboardingDescription2.l10n())
        ]
    }
}
