//
//  AppState.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 03/09/2024.
//

import SwiftUI

enum AppStorageKey: String {
    case isOnboardingDone, token
}

final class AppState: ObservableObject {
    @AppStorage(AppStorageKey.isOnboardingDone.rawValue) var isOnboardingDone: Bool = false
    @AppStorage(AppStorageKey.token.rawValue) var token: String = ""

}
