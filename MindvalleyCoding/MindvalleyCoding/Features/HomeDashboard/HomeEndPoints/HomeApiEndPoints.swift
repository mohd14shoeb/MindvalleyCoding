//
//  HomeApiEndPoints.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 02/12/23.
//

import Foundation

// MARK: Enum EndPoints
public enum HomeApiEndPoints {
    case getNewEpisodesList
    case getChannels
    case Categories
    case checkData(parameter: [String: Any])
    case none
}

// MARK: Enum Extension
extension HomeApiEndPoints: EndPointType {

    // MARK: properties
    var environmentBaseURL: String {
        return String(NetworkEnvironment.baseURL)
    }
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.") }
        return url
    }
    var path: String {
        switch self {
        case .Categories:
            return "raw/A0CgArX3"
        case .getChannels:
            return "raw/Xt12uVhM"
        case .getNewEpisodesList:
            return "raw/z5AExTtw"
        default: return ""
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        case .getChannels, .getNewEpisodesList, .Categories:
            return .get
        case .checkData:
            return .post
        default: return .delete
        }
    }

    var task: HTTPTask {
        switch self {
        case .getChannels, .getNewEpisodesList, .Categories:
            return .request
        default: return .request
        }
    }

    var headers: HTTPHeaders? {
        switch self {
        case .getChannels, .getNewEpisodesList, .Categories,.checkData, .none:
            return nil
        }
    }
    
    var body: Data?  {
        switch self {
        case .getChannels, .getNewEpisodesList, .Categories, .none:
            return nil
        case .checkData(parameter: let parameter):
            return try? JSONSerialization.data(withJSONObject: parameter)
        }
    }
    
}

