//
//  SignupBioView.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 07/09/2024.
//

import SwiftUI

struct SignupBioView: View {
    
    @ObservedObject var signupViewModel: SignupMainViewModel
    @StateObject private var viewModel = SignupBioViewModel()
    
    var body: some View {
        SignupLayoutView(signupViewModel: signupViewModel, title: "Fill in your bio to get \nstarted", subTitle: "This data will be displayed in your account \nprofile for security", nextAction: {
            viewModel.handleNextStep()
        }, content: {
            FNTextField(placeholder: "First Name", value: $signupViewModel.signupData.firstName)
                FNTextField(placeholder: "Last Name", value: $signupViewModel.signupData.lastName)
                FNTextField(placeholder: "Mobile Number", value: $signupViewModel.signupData.phoneNumber)
        })
        .onAppear {
            viewModel.signupViewModel = signupViewModel
        }
    }
}

#Preview {
    SignupBioView(signupViewModel: SignupMainViewModel())
}
