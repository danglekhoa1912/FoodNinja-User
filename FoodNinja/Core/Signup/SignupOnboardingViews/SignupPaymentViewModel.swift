//
//  SignupPaymentViewModel.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 07/09/2024.
//

import Foundation
import SwiftUICore

struct PaymentMethod: Equatable {
    let id =  UUID().uuidString
    let name: String
    let image: ImageName
}

final class SignupPaymentViewModel: ObservableObject {
    @Published var paymentMethods: [PaymentMethod] = [
        .init(name: "Paypal", image: .paypal),
        .init(name: "Visa", image: .visa),
        .init(name: "Payoneer", image: .payoneer)
    ]
    @Published var selectedPaymentMethod: PaymentMethod?
    
    var signupViewModel: SignupMainViewModel!

    func handleNextStep() {
        signupViewModel.signupData.paymentMethod = selectedPaymentMethod?.name ?? ""
        signupViewModel.currentStep += 1
    }
}
