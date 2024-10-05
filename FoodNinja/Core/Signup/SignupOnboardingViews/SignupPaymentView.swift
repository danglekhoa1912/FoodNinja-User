//
//  SignupPaymentView.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 07/09/2024.
//

import SwiftUI

struct SignupPaymentView: View {
    @ObservedObject var signupViewModel: SignupMainViewModel
    @StateObject private var viewModel = SignupPaymentViewModel()

    var body: some View {
        SignupLayoutView(signupViewModel: signupViewModel, title: "Payment Method", subTitle: "This data will be displayed in your account \nprofile for security", nextAction: {
            viewModel.handleNextStep()
        }, content: {
            VStack(spacing: 18) {
                ForEach(viewModel.paymentMethods, id: \.id) { method in
                    let isSelected = viewModel.selectedPaymentMethod?.id == method.id
                    HStack {
                        Image(name: method.image)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 70)
                    .background(.white)
                    .cornerRadius(22)
                    .overlay(RoundedRectangle(cornerRadius: 22).stroke(Color(isSelected ? .primary : .gray).opacity(isSelected ? 1 : 0.4), lineWidth: 1.4))
                    .padding(.horizontal, 10)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            viewModel.selectedPaymentMethod = method
                        }
                    }
                }
            }
        })
        .onAppear {
            viewModel.signupViewModel = signupViewModel
        }
    }
}

#Preview {
    SignupPaymentView(signupViewModel: SignupMainViewModel())
}
