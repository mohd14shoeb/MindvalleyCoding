//
//  HomeServiceManager.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 02/12/23.
//

import Foundation


// MARK: enum Error
enum NetworkResponse: String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

// MARK: enum Result
enum Result<String> {
    case success
    case failure(String)
}

struct HomeServiceManager: HomeServiceProtocol {

    // MARK: Private  Properties
    private let router = Router<HomeApiEndPoints>()

    // MARK: Genric get API
    func getAPI<T>(decodabel: T.Type,
                   homeApi: HomeApiEndPoints, isCacheEnable: Bool = false,
                   completion: @escaping (T?, String?) -> Void) where T: Decodable {
        router.request(homeApi, isCacheEnable: isCacheEnable) { data, response, error in
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode(T.self, from: responseData)
                        completion(apiResponse, nil)
                    } catch {
                        print(error)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            } else {
                completion(nil, error?.localizedDescription.description)
            }
        }
    }

    // MARK: Handle Network Response
    private func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
