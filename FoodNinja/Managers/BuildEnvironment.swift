//
//  Enviroment.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 06/10/2024.
//

import Foundation

enum BuildEnvironment: String {
    case dev, prod
}

enum Environment {
    static let environment: BuildEnvironment = {
        guard let rawEnvironment = Bundle.main.infoDictionary!["APP_ENVIRONMENT"] as? String,
              let environment = BuildEnvironment(rawValue: rawEnvironment) else {
            preconditionFailure("APP_ENVIRONMENT can be nil")
        }
        
        return environment
    }()
    
    static let baseURL: String = {
        guard let baseURL = Bundle.main.infoDictionary!["BASE_URL"] as? String else {
            preconditionFailure("BASE_URL can be nil")
        }
        
        return baseURL
    }()
    
    static let tomtomAPIKey: String = {
        guard let tomtomAPIKey = Bundle.main.infoDictionary!["TOMTOM_API_KEY"] as? String else {
            preconditionFailure("TOMTOM_API_KEY can be nil")
        }
        
        return tomtomAPIKey
    }()
    
    static let tomtomURL: String = {
        guard let tomtomURL = Bundle.main.infoDictionary!["TOMTOM_URL"] as? String else {
            preconditionFailure("TOMTOM_URL can be nil")
        }
        
        return tomtomURL
    }()
}
