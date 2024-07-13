//
//  ExampleView.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 14/07/2024.
//

import SwiftUI

struct ExampleView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("ContentView.WelcomeMessage".localized(arguments: "Peter"))
        }
        .padding()
    }
}

#Preview {
    ExampleView()
}
