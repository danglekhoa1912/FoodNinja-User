//
//  NavigationStore.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 03/09/2024.
//

import SwiftUI

enum NavigationDestination: Hashable {
    case login, signup, home
    @ViewBuilder
    var view: some View {
        switch self {
        case .login:
            LoginView()
        case .signup:
            SignupMainView()
        case .home:
            HomeView()
        }
    }
}

final class NavigationStore: ObservableObject {
    @Published var path: [NavigationDestination] = []

    func popToRoot() {
        path.removeAll()
    }

    func popView() {
        path.removeLast()
    }

    func push(to view: NavigationDestination) {
        path.append(view)
    }
    
    func replace(to view: NavigationDestination) {
        path[path.count - 1] = view
    }
}
