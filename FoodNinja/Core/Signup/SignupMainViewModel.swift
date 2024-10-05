//
//  SignupViewModel.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 07/09/2024.
//

import Foundation

final class SignupMainViewModel: ObservableObject {
    @Published var signupData = SignupData()
    @Published var currentStep = 0

    func submitRegistration(completion: @escaping (Result<Void, Error>) -> Void) {
        print(signupData.description)
    }

}
