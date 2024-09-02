//
//  OnboardingView.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 02/09/2024.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel = OnboardingViewModel()
    @State var selectedIndex = 0
    @EnvironmentObject var appState: AppState
    var body: some View {
        ZStack {
            TabView(selection: $selectedIndex) {
                ForEach(0..<viewModel.onboardingPage.count) {
                    index in OnboardingContent(page: viewModel.onboardingPage[index])
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            if selectedIndex == viewModel.onboardingPage.count - 1 {
                let configButton = FNButtonConfig(text: LocalizeString.OnboardingNext.l10n(), action: {
                    appState.isOnboardingDone = true
                })
                FNButton(config: configButton)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .frame(width: 160)
                    .padding(.bottom)
            }
        }
    }
}

#Preview {
    OnboardingView()
}
