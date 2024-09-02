//
//  SplashView.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 14/07/2024.
//

import SwiftUI

struct SplashView: View {
    @State var isActive = false
    var body: some View {
                ZStack {
                    Image(name: .splash)
                        .resizable()
                        .ignoresSafeArea()
                    VStack {
                        Image(name: .logo)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 175, height: 139)
                        Text("FoodNinja")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color("PrimaryColor"))
                        Text("Deliever Favorite Food")
                            .font(.system(size: 13, weight: .semibold))
                    }
                }
            }
        }


#Preview {
    SplashView()
}
