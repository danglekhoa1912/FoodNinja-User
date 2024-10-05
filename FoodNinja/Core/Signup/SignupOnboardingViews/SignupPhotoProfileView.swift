//
//  SignupPhotoProfileView.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 07/09/2024.
//
import PhotosUI
import SwiftUI

struct SignupPhotoProfileView: View {
    @ObservedObject var signupViewModel: SignupMainViewModel
    @StateObject private var viewModel = SignupPhotoProfileViewModel()

    var body: some View {
        SignupLayoutView(signupViewModel: signupViewModel, title: "Upload Your Photo \nProfile", subTitle: "This data will be displayed in your account \nprofile for security", nextAction: {
            viewModel.handleNextStep()
        }, content: {
            VStack(spacing: 20) {
                if let avatarImage = viewModel.image {
                    ZStack(alignment: .topTrailing) {
                        Image(uiImage: avatarImage)
                            .resizable()
                            .cornerRadius(16)
                            .frame(width: 245, height: 245)
                        Button {
                            viewModel.image = nil
                        } label: {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 30, height: 30)
                                    .background(Color(.white).opacity(0.4))
                                    .cornerRadius(30)
                                Image(systemName: "xmark")
                                    .foregroundColor(.white)
                            }
                        }
                        .padding(10)
                    }
                } else {
                    ForEach(viewModel.uploadTypes, id: \.id) {
                        method in
                        SelectPhotoButton(item: method)
                            .onTapGesture {
                                viewModel.shouldPresentImagePicker = true
                            }
                            .sheet(isPresented: $viewModel.shouldPresentImagePicker, content: {
                                FNImagePicker(sourceType: method.type, image: $viewModel.image, isPresented: $viewModel.shouldPresentImagePicker)
                            })
                    }
                }
            }
        })
        .onAppear {
            viewModel.signupViewModel = signupViewModel
        }
    }
    struct SelectPhotoButton: View {
        var item: UploadType
        var body: some View {
            VStack(spacing: 10) {
                Image(name: item.image)
                Text(item.name)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.black)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 130)
            .background(.white)
            .cornerRadius(22)
            .overlay(RoundedRectangle(cornerRadius: 22).stroke(.gray.opacity(0.2), lineWidth: 1.4)
                .padding(.horizontal, 10))
        }
    }
}

#Preview {
    SignupPhotoProfileView(signupViewModel: SignupMainViewModel())
}
