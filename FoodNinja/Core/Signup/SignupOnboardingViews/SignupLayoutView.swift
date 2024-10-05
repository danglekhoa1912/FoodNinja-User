//
//  SignupLayoutView.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 07/09/2024.
//

import SwiftUI

struct SignupLayoutView<Content: View>: View {
    @ObservedObject var signupViewModel: SignupMainViewModel
    var title: String = ""
    var subTitle: String = ""
    var nextAction: () -> Void
    @ViewBuilder let content: Content
    var body: some View {
        GeometryReader { reader in
            ZStack {
                Image(name: .splash)
                    .ignoresSafeArea()
                ScrollView {
                    VStack {
                        VStack(spacing: 20) {
                            Text(title)
                                .font(.system(size: 25, weight: .bold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top)
                            Text(subTitle)
                                .font(.system(size: 12, weight: .regular))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.bottom, 20)
                        VStack(spacing: 20) {
                            content
                        }
                        Spacer()
                        FNButton(config: FNButtonConfig(text: "Next", action: {
                            nextAction()
                        }))
                            .frame(width: 140)
                            .padding(.bottom)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: reader.size.height)
                }
                .padding(.horizontal)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: backButton)
            }
        }
    }
    private var backButton: some View {
        Button {
            signupViewModel.currentStep -= 1
        } label: {
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 45, height: 45)
                    .background(Color("NeutralWeaker").opacity(0.1))
                    .cornerRadius(16)
                Image(systemName: "chevron.backward")
                    .foregroundColor(Color("NeutralStronger"))
            }
        }
    }
}

#Preview {
    SignupLayoutView(signupViewModel: SignupMainViewModel(), title: "Fill in your bio to get \nstarted", subTitle: "This data will be displayed in your account profile for security", nextAction: {}) {
        Text("Check")
    }
}
