//
//  SignupPhotoProfileViewModel.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 07/09/2024.
//

import Foundation
import PhotosUI
import _PhotosUI_SwiftUI
import SwiftUI

struct UploadType {
    let id: String = UUID().uuidString
    let name: String
    let image: ImageName
    let type: UIImagePickerController.SourceType
}

final class SignupPhotoProfileViewModel: ObservableObject {
    @Published var uploadTypes: [UploadType] = [
        .init(name: "From Gallery", image: .gallery, type: .photoLibrary),
        .init(name: "Take Photo", image: .camera, type: .camera)
    ]
    @Published var selectedItem: PhotosPickerItem?
    @Published var image: UIImage?
    @Published var shouldPresentImagePicker: Bool = false
    
    var signupViewModel: SignupMainViewModel!
    
    func handleNextStep() {
        signupViewModel.signupData.avatar = image?.description ?? ""
        signupViewModel.currentStep += 1
    }

}
