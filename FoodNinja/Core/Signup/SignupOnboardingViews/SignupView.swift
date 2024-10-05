//
//  SignupView.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 03/09/2024.
//

import SwiftUI

struct SignupView: View {
    @EnvironmentObject private var navigationStore: NavigationStore
    @ObservedObject var signupViewModel: SignupMainViewModel

    var body: some View {
        ZStack {
            Image(name: .splash)
                .ignoresSafeArea()
            VStack {
                VStack {
                    Image(name: .logo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 175, height: 139)
                        .padding(.top, 60)
                    Text("Sign Up For Free")
                        .font(.system(size: 20, weight: .bold))
                        .padding(.top, 50)
                }
                .padding(.bottom, 40)
                VStack(spacing: 12) {
                    FNTextField(placeholder: "User name", leadingIcon: "person", value: $signupViewModel.signupData.userName)
                    FNTextField(placeholder: "Email", leadingIcon: "envelope", value: $signupViewModel.signupData.email)
                    FNTextField(placeholder: "Password", leadingIcon: "lock", type: .password, value: $signupViewModel.signupData.password)
                }
                VStack {
                    FNCheckBox(value: $signupViewModel.signupData.keepSignedIn, label: "Keep Me Signed In")
                }
                .padding(.top, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                VStack(spacing: 20) {
                    FNButton(config: FNButtonConfig(text: "Create Account", action: {
                        signupViewModel.currentStep += 1
                    }))
                        .frame(width: 180)
                        .padding(.top, 36)
                    Button {
                        navigationStore.popToRoot()
                    } label: {
                        Text("already have an account?")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundStyle(Color(.primary))
                    }
                }
                .padding(.bottom)
            }
            .padding(.horizontal)
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    SignupView(signupViewModel: SignupMainViewModel())
}
