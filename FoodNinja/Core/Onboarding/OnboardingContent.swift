//
//  Onboarding.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 02/09/2024.
//

import SwiftUI

struct OnboardingPage {
    let imageName: ImageName
    let title: String
    let description: String
}

struct OnboardingContent: View {
    let page: OnboardingPage
    @State var isAnimating = false
    var body: some View {
        VStack {
            Image(name: page.imageName)
                .resizable()
                .scaledToFit()
                .offset(y: isAnimating ? 45 : 0)
                .animation(.easeInOut(duration: 5) .repeatForever(autoreverses: true), value: isAnimating)
                .opacity(isAnimating ? 1 : 0)
            Text(page.title.localized())
                .font(.system(size: 24, weight: .semibold))
                .multilineTextAlignment(.center)
                .padding(.top)
                .padding(.horizontal)
                .opacity(isAnimating ? 1 : 0)
            Text(page.description.localized())
                .font(.system(size: 12))
                .multilineTextAlignment(.center)
                .padding(.top)
                .padding(.horizontal)
                .opacity(isAnimating ? 1 : 0)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .onAppear(perform: {
            withAnimation(.linear(duration: 0.5)){
                isAnimating = true
            }
        })
    }
}

#Preview {
    OnboardingContent(page: OnboardingPage(imageName: .onoarding1, title: "Find your  Comfort Food here", description: "Here You Can find a chef or dish for every taste and color. Enjoy!"))
}
