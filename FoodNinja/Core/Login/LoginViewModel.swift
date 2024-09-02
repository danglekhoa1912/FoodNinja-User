//
//  LoginViewModel.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 03/09/2024.
//

import Foundation

final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
}
