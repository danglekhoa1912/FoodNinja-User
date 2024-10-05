//
//  SignupMainView.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 05/10/2024.
//

import SwiftUI

struct SignupMainView: View {
    @StateObject var signupViewModel = SignupMainViewModel()

    var body: some View {
        VStack {
            switch signupViewModel.currentStep {
            case 0:
                SignupView(signupViewModel: signupViewModel)
            case 1:
                SignupBioView(signupViewModel: signupViewModel)
            case 2:
                SignupPaymentView(signupViewModel: signupViewModel)
            case 3:
                SignupPhotoProfileView(signupViewModel: signupViewModel)
            case 4:
                SignupSetLocation(signupViewModel: signupViewModel)
            case 5:
                SignupSuccess()
            default:
                Text("Error")
            }
        }
        .padding()
    }
}

#Preview {
    SignupMainView()
}
