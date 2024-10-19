//
//  ApiService.swift
//  FoodNinja
//
//  Created by Dang Khoa Dang Le on 23/09/2024.
//

import Combine
import Foundation
import UIKit

enum APIError: Error {
    case badURL
    case decodingError
    case serverError(String)
}

class APIService {
    private let baseUrl = Environment.baseURL
    private var cancellables = Set<AnyCancellable>()

    static let shared = APIService()  // Singleton instance

    // Consolidated function to handle all API requests with logging
    func request<T: Encodable, U: Decodable>(
        _ endpoint: String,
        method: String = "GET",
        body: T? = nil,
        completion: @escaping (Result<U, Error>) -> Void
    ) {
        guard let url = URL(string: "\(baseUrl)\(endpoint)") else {
            completion(.failure(APIError.badURL))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = method

        // Log the request details
        print("Request:")
        print("URL: \(url)")
        print("Method: \(method)")
        if let body = body {
            request.setValue(
                "application/json", forHTTPHeaderField: "Content-Type")
            do {
                request.httpBody = try JSONEncoder().encode(body)
                print(
                    "Body: \(String(data: request.httpBody!, encoding: .utf8) ?? "")"
                )
            } catch {
                completion(.failure(APIError.decodingError))
                return
            }
        }

        // Using dataTaskPublisher to get response and data
        URLSession.shared.dataTaskPublisher(for: request)
            .handleEvents(receiveOutput: { output in
                // Log the response details
                if let httpResponse = output.response as? HTTPURLResponse {
                    print("Response:")
                    print("Status Code: \(httpResponse.statusCode)")
                    print(
                        "Data: \(String(data: output.data, encoding: .utf8) ?? "")"
                    )
                }
            })
            .map(\.data)
            .decode(type: U.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink(
                receiveCompletion: { completionHandler in
                    switch completionHandler {
                    case .finished:
                        break  // Handle successful completion if needed
                    case .failure(let error):
                        completion(.failure(error))
                    }
                },
                receiveValue: { response in
                    completion(.success(response))
                }
            )
            .store(in: &cancellables)
    }

    func uploadImage(image: Data) async throws -> UploadResponse {
        guard let url = URL(string: "\(baseUrl)upload") else {
            throw APIError.badURL
        }
        
        let boundary = "Boundary-\(UUID().uuidString)"
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue(
            "multipart/form-data; boundary=\(boundary)",
            forHTTPHeaderField: "Content-Type"
        )

        // Create multipart/form-data body
        var body = Data()

        // Append image data
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append(
            "Content-Disposition: form-data; name=\"file\"; filename=\"image.jpg\"\r\n"
                .data(using: .utf8)!
        )
        body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
        body.append(image)
        body.append("\r\n".data(using: .utf8)!)
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)

        request.httpBody = body

        // Logging the request details
        print("Request URL: \(request.url?.absoluteString ?? "")")
        print("Request Method: \(request.httpMethod ?? "")")
        if let headers = request.allHTTPHeaderFields {
            print("Request Headers: \(headers)")
        }
        if let bodyData = request.httpBody,
           let bodyString = String(data: bodyData, encoding: .utf8) {
            print("Request Body: \(bodyString)")
        }

        // Send the request using async/await
        let (data, response) = try await URLSession.shared.upload(for: request, from: body)

        // Logging the response details
        if let httpResponse = response as? HTTPURLResponse {
            print("Response Status Code: \(httpResponse.statusCode)")
            print("Response Headers: \(httpResponse.allHeaderFields)")
        }

        // Handle the response
        do {
            let uploadResponse = try JSONDecoder().decode(UploadResponse.self, from: data)
            print("Parsed Response: \(uploadResponse)")
            return uploadResponse
        } catch {
            print("Decoding error: \(error)")
            throw error
        }
    }

}
