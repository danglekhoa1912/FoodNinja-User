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
    @ObservedObject private var navigationStore = NavigationStore()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if endSplash {
                    SplashView()
                } else if !appState.token.isEmpty{
                    NavigationStack(path: $navigationStore.path) {
                        HomeView()
                            .environmentObject(navigationStore)
                            .navigationDestination(for: NavigationDestination.self) {
                                path in path.view.environmentObject(navigationStore)
                            }
                    }
                } else if appState.isOnboardingDone {
                    NavigationStack(path: $navigationStore.path) {
                        LoginView()
                            .environmentObject(navigationStore)
                            .navigationDestination(for: NavigationDestination.self) {
                                path in path.view.environmentObject(navigationStore)
                            }
                    }
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
