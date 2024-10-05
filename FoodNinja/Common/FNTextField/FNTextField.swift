//
//  FNInput.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 02/09/2024.
//

import SwiftUI

enum EFieldType {
    case text
    case password
}

struct FNTextField: View {
    let placeholder: String
    var leadingIcon: String?
    var trailingIcon: String?
    var type: EFieldType? = .text
    @Binding var value: String
    @State var isShowPassword = false
    var body: some View {
        VStack {
            HStack {
                if let leadingIcon = leadingIcon {
                    Image(systemName: leadingIcon)
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.gray)
                }
                if type == .password {
                    if isShowPassword {
                        TextField(placeholder, text: $value)
                    } else {
                        SecureField(placeholder, text: $value)
                    }
                    Image(systemName: isShowPassword ? "eye" : "eye.slash")
                        .contentTransition(.symbolEffect(.replace))
                        .scaledToFit()
                        .frame(height: 20)
                        .foregroundColor(.gray)
                        .onTapGesture {
                            isShowPassword.toggle()
                        }
                } else {
                    TextField(placeholder, text: $value)
                    if let trailingIcon = trailingIcon {
                        Image(systemName: trailingIcon)
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.gray)
                    }
                }
            }
            .frame(height: 52)
            .padding(.horizontal)
            .background(Color.white) 
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.5), lineWidth: 1))
        }
    }
}

#Preview {
    FNTextField(placeholder: "User name", leadingIcon: "person.circle", type: .password, value: .constant("Hello"))
}
