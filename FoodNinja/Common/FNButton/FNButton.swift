//
//  FNButton.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 02/09/2024.
//

import SwiftUI

struct FNButtonConfig {
    let text: String
    let action: () -> Void
    var textColor: Color = .white
    var fontSize: CGFloat = 16
    var backgroundColor: Color = Color("PrimaryColor")
    var leadingIcon: ImageName?
}

struct FNButton: View {
    let config: FNButtonConfig
    var body: some View {
        Button {
            config.action()
        } label: {
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(height: 57)
                    .background(config.backgroundColor)
                    .cornerRadius(14)
                HStack(spacing: 12) {
                    if let leadingIcon = config.leadingIcon {
                        Image(name: leadingIcon)
                            .frame(width: 25, height: 25)
                    }
                    Text(config.text.localized())
                        .font(.system(size: config.fontSize, weight: .bold))
                        .foregroundColor(config.textColor)
                }
            }
        }
    }
}

#Preview {
    FNButton(config: FNButtonConfig(text: "Next", action: {
    }, leadingIcon: .facebook))
}
