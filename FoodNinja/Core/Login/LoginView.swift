//
//  LoginView.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 03/09/2024.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject private var viewModel = LoginViewModel()
    @EnvironmentObject private var navigationStore: NavigationStore
    var body: some View {
        ZStack {
            Image(name: .splash)
                .ignoresSafeArea()
            VStack {
                Image(name: .logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 175, height: 139)
                    .padding(.top, 60)
                Text("Login To Your Account")
                    .font(.system(size: 20, weight: .bold))
                    .padding(.top, 50)
                VStack(spacing: 12) {
                    FNTextField(placeholder: "Email", value: $viewModel.email)
                    FNTextField(placeholder: "Password", type: .password, value: $viewModel.password)
                }
                .padding(.top, 40)
                VStack(spacing: 20) {
                    Text("Or Continue With")
                        .font(.system(size: 12, weight: .bold))
                        .padding(.top)
                    HStack(spacing: 20) {
                        socialLoginButton(text: "Facebook", icon: .facebook)
                        socialLoginButton(text: "Google", icon: .google)
                    }
                    Button {
                    } label: {
                        Text("Forgot Your Password?")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundStyle(Color(.primary))
                    }
                }
                Spacer()
                VStack(spacing: 20) {
                    FNButton(config: FNButtonConfig(text: "Login", action: {
                        viewModel.login()
                    }))
                        .frame(width: 140)
                        .padding(.top, 36)
                    Button {
                        navigationStore.push(to: .signup)
                    } label: {
                        Text("Don't have an account, Signup here")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundStyle(Color(.primary))
                    }
                }
                .padding(.bottom)
            }
            .padding(.horizontal)
        }
    }
    private func socialLoginButton(text: String, icon: ImageName) -> some View {
        FNButton(config: FNButtonConfig(text: text, action: {}, textColor: .black, backgroundColor: .white, leadingIcon: icon))
            .font(.system(size: 40, weight: .light))
            .frame(width: 152)
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
            )
    }
}

#Preview {
    LoginView()
}
