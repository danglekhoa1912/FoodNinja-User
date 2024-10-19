//
//  LoginViewModel.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 03/09/2024.
//

import Foundation
import SwiftUICore

final class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    func login() {
        var body = LoginRequest(email: email, password: password)
        APIService.shared.request(AuthEndpoint.login.url!, method: "POST", body: body) {
            (result: Result<LoginResponse, Error>) in
            switch result {
            case .success(let data):
                print(data.access_token)
                LocalStorage.shared.setUserDefaultsValue(data.access_token, forKey: "token")
            case .failure(let error):
                print(error)
            }
        }
    }
}
