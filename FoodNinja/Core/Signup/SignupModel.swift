//
//  SignupModel.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 05/10/2024.
//

import Foundation

struct SignupData: Codable {
    var userName: String = ""
    var email: String = ""
    var password: String = ""
    var keepSignedIn: Bool = false
    var firstName: String = ""
    var lastName: String = ""
    var phoneNumber: String = ""
    var paymentMethod: String = ""
    var avatar: String = ""
    var address: String = ""
    var lat: Double = 0.0
    var long: Double = 0.0
    
    var description: String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted // Optional: makes the JSON more readable
        if let jsonData = try? encoder.encode(self), let jsonString = String(data: jsonData, encoding: .utf8) {
            return jsonString
        } else {
            return "Failed to encode signup data"
        }
    }
}
