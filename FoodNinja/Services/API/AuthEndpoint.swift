//
//  AuthEndpoint.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 13/10/2024.
//

import Foundation

enum AuthEndpoint {
    case login
    case register

    private var endpoint: String {
        return "auth"
    }

    var url: String? {
        switch self {
        case .login:
            return "\(endpoint)/login"
        case .register:
            return "\(endpoint)/register"
        }
    }
}

//struct RegisterRequest: Codable {
//    let email: String
//    let password: String
//    let avatar: String?
//    let firstName: String
//    let lastName: String
//    let paymentMethod: Int
//    let phone: String
//    let latitude: Double
//    let longitude: Double
//}
//
//struct RegisterResponse: Codable {
//    let access_token: String
//}

struct LoginRequest: Codable {
    let email: String
    let password: String
}

struct LoginResponse: Codable {
    let access_token: String
}
