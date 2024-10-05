//
//  SignupBioViewModel.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 05/10/2024.
//

import Foundation
import SwiftUICore

final class SignupBioViewModel: ObservableObject {
    
    var signupViewModel: SignupMainViewModel!

    func handleNextStep() {
        signupViewModel.currentStep += 1
    }
}
