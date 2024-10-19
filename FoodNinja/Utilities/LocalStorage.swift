//
//  Storage.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 17/10/2024.
//

import Foundation
import KeychainSwift

class LocalStorage {
    
    // Singleton pattern để đảm bảo chỉ có một instance của LocalStorage được tạo ra
    static let shared = LocalStorage()
    
    private let userDefaults = UserDefaults.standard
    private let keychain = KeychainSwift()
    private init() {} // Khởi tạo private để đảm bảo chỉ có một instance
    
    // MARK: - UserDefaults Methods
    
    // Lưu dữ liệu vào UserDefaults
    func setUserDefaultsValue(_ value: Any?, forKey key: String) {
        userDefaults.set(value, forKey: key)
        userDefaults.synchronize()
    }
    
    // Lấy dữ liệu từ UserDefaults
    func getUserDefaultsValue(forKey key: String) -> Any? {
        return userDefaults.object(forKey: key)
    }
    
    // Xóa dữ liệu từ UserDefaults
    func removeUserDefaultsValue(forKey key: String) {
        userDefaults.removeObject(forKey: key)
        userDefaults.synchronize()
    }

    // MARK: - Keychain Methods
    
    // Lưu chuỗi vào Keychain
    func setKeychainValue(_ value: String, forKey key: String) {
        do {
            try keychain.set(value, forKey: key)
        } catch let error {
            print("Error saving to Keychain: \(error)")
        }
    }
    
    // Lấy chuỗi từ Keychain
    func getKeychainValue(forKey key: String) -> String? {
        do {
            return try keychain.get(key)
        } catch let error {
            print("Error retrieving from Keychain: \(error)")
            return nil
        }
    }
    
    // Xóa dữ liệu từ Keychain
    func removeKeychainValue(forKey key: String) {
        do {
            try keychain.delete(key)
        } catch let error {
            print("Error deleting from Keychain: \(error)")
        }
    }
}
