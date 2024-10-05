//
//  SignupSetLocation.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 22/09/2024.
//

import SwiftUI

struct SignupSetLocation: View {
    @StateObject private var viewModel = SignupSetLocationViewModel()
    @ObservedObject var signupViewModel: SignupMainViewModel
    
    var body: some View {
        SignupLayoutView(signupViewModel: signupViewModel, title: "Set Your Location", subTitle: "This data will be displayed in your account \nprofile for security", nextAction: {
            viewModel.handleSubmit()
        }, content: {
            VStack(alignment: .leading, spacing: 26) {
                HStack {
                    Image(name: .location)
                    Text(viewModel.address.isEmpty ? "Your Location" : viewModel.address)
                        .lineLimit(1)
                        .truncationMode(.tail)
                }
                FNButton(config: FNButtonConfig(text: "Set Location", action: {
                    viewModel.getAddress()
                }, textColor: .black, backgroundColor: Color(hex: "#F6F6F6")))
                .frame(width: 322)
            }
            .padding(20)
            .frame(maxWidth: .infinity)
            .background(.white)
            .cornerRadius(22)
            .overlay(RoundedRectangle(cornerRadius: 22).stroke(.gray.opacity(0.2), lineWidth: 1.4)
                .padding(.horizontal, 10))
        })
        .onAppear {
            viewModel.signupViewModel = signupViewModel
        }
    }
}

#Preview {
    SignupSetLocation(signupViewModel: SignupMainViewModel())
}
