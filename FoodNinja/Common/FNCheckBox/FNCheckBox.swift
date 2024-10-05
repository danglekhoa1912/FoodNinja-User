//
//  FNCheckBox.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 07/09/2024.
//

import SwiftUI

struct FNCheckBox: View {
    @Binding var value: Bool
    var label: String
    var body: some View {
        Label(label, systemImage: value ? "checkmark.circle.fill" : "checkmark.circle")
            .contentTransition(.symbolEffect(.replace))
            .foregroundColor(value ? Color("PrimaryColor") : .gray)
            .onTapGesture {
                value.toggle()
            }
    }
}

#Preview {
    FNCheckBox(value: .constant(false), label: "Check box")
}
