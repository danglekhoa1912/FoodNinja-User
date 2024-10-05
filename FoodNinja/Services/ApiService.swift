//
//  ApiService.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 23/09/2024.
//

import Foundation
import Combine


final class ApiService {
    static let shared = ApiService() // Singleton instance
    
    private init() {}
    
    // Function to make a GET request
    func request<T: Decodable>(
        url: URL,
        responseType: T.Type,
        requiresAuth: Bool = false,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // If the request requires authentication, add token to headers
        if requiresAuth {
            if let token = getToken() {
                request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            } else {
                completion(.failure(NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey: "No token available"])))
                return
            }
        }
        // Log the request
        print("Request URL: \(request.url?.absoluteString ?? "")")
        print("Request Headers: \(request.allHTTPHeaderFields ?? [:])")
        print("Request Method: \(request.httpMethod ?? "")")
        
        // Perform network request
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            // Log the response
            if let httpResponse = response as? HTTPURLResponse {
                print("Response Status Code: \(httpResponse.statusCode)")
                print("Response Headers: \(httpResponse.allHeaderFields)")
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: 500, userInfo: [NSLocalizedDescriptionKey: "No data returned"])))
                return
            }
            // Log the response data (you might want to print it as a string)
            if let dataString = String(data: data, encoding: .utf8) {
                print("Response Data: \(dataString)")
            }
            
            // Decode the response into the expected type
            do {
                let decodedResponse = try JSONDecoder().decode(responseType, from: data)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    // Function to retrieve the token (if available)
    private func getToken() -> String? {
        // Retrieve the token from a secure place (e.g., Keychain, UserDefaults)
        // This is just a sample, implement your token retrieval logic here
        return "your-token"
    }
}
