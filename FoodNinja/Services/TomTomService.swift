import Foundation

class TomTomService {
    private let baseUrl = Environment.tomtomURL
    let apiKey = Environment.tomtomAPIKey
    static let shared = TomTomService()
    
    // Function to make a request to get a location from coordinates
    func getLocation(fromLatitude latitude: Double, longitude: Double, completion: @escaping (Result<String, Error>) -> Void) {

        let urlString = "\(baseUrl)/search/2/reverseGeocode/\(latitude),\(longitude).json?key=\(apiKey)"
        guard let url = URL(string: urlString) else {
            completion(.failure(TomTomServiceError.invalidURL))
            return
        }

        // Create URL request and print it
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        print("Request URL: \(url)")
        print("Request: \(request)")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }

            // Print response and data
            if let response = response as? HTTPURLResponse {
                print("Response Code: \(response.statusCode)")
            }

            if let data = data {
                print("Response Data: \(String(data: data, encoding: .utf8) ?? "No readable data")")
            } else {
                print("No Data Received")
                completion(.failure(TomTomServiceError.noData))
                return
            }

            do {
                let response = try JSONDecoder().decode(TomTomReverseGeocodeResponse.self, from: data!)
                if let address = response.addresses.first?.address.freeformAddress {
                    completion(.success(address))
                } else {
                    completion(.failure(TomTomServiceError.noAddressFound))
                }
            } catch {
                print("Decoding Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }

        task.resume()
    }
}

// Define possible errors
enum TomTomServiceError: Error {
    case invalidURL
    case noData
    case noAddressFound
}

// Model for TomTom reverse geocode response
struct TomTomReverseGeocodeResponse: Codable {
    let addresses: [AddressWrapper]
    
    struct AddressWrapper: Codable {
        let address: Address
    }
    
    struct Address: Codable {
        let freeformAddress: String
    }
}
