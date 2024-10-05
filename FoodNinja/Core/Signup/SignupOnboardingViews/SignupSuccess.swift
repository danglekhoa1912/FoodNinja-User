//
//  SignupSuccess.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 05/10/2024.
//

import SwiftUI

struct SignupSuccess: View {
    @EnvironmentObject private var navigationStore: NavigationStore
    var body: some View {
        ZStack {
            Image(name: .splash)
                .ignoresSafeArea()
            VStack {
                Spacer()
                VStack(spacing: 30) {
                    Image(name: .success)
                    VStack(spacing: 12) {
                        Text("Congrats!")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(Color("PrimaryColor"))
                            .padding(.top)
                        Text("Your Profile Is Ready To Use")
                            .font(.system(size: 23, weight: .bold))
                    }
                }
                Spacer()
                FNButton(config: FNButtonConfig(text: "Try Order", action: {
                    navigationStore.replace(to: .home)
                }))
                .frame(width: 140)
                .padding(.bottom, 60)
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    SignupSuccess()
}
