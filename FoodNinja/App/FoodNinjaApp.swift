//
//  FoodNinjaApp.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 14/07/2024.
//

import SwiftUI

@main
struct FoodNinjaApp: App {
    @State var endSplash = true
    @ObservedObject private var appState = AppState()
    var body: some Scene {
        WindowGroup {
            VStack {
                if endSplash {
                    SplashView()
                } else if appState.isOnboardingDone {
                    LoginView()
                } else {
                    OnboardingView().environmentObject(appState)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        endSplash = false
                    }
                }
            }
        }
    }
}
