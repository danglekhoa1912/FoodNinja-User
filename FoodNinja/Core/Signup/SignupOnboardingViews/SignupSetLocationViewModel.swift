//
//  SignupSetLocationViewModel.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 22/09/2024.
//

import Foundation
import SwiftUICore

struct Location {
    var lat: Double
    var long: Double
}

final class SignupSetLocationViewModel: ObservableObject {
    private var locationManager = LocationManager()
    private let tomTomService = TomTomService()
    @Published var address = ""
    
    var signupViewModel: SignupMainViewModel!

    func getAddress() {
        if let location = locationManager.location {
            fetchAddress(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        } else {
            locationManager.requestLocation()
        }
    }
    
    private func fetchAddress(latitude: Double, longitude: Double) {
        tomTomService.getLocation(fromLatitude: latitude, longitude: longitude) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let address):
                    self.address = address
                case .failure(let error):
                    self.locationManager.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func handleSubmit() {
        signupViewModel.signupData.address = address
        signupViewModel.signupData.lat = locationManager.location?.coordinate.latitude ?? 0
        signupViewModel.signupData.long = locationManager.location?.coordinate.longitude ?? 0
        signupViewModel.submitRegistration {_ in
            self.signupViewModel.currentStep += 1
        }
    }
}
