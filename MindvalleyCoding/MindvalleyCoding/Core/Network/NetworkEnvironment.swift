//
//  NetworkEnvironment.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 02/12/23.
//

import Foundation

// MARK: Enum Environment
enum APIEnvironment {
    case qaEnv
    case production
    case staging
}

struct NetworkEnvironment {

    // MARK: static properties
    static let environment: APIEnvironment = .qaEnv
    static var baseURL: String {
        switch environment {
        case .production: return "https://pastebin.com/"
        case .qaEnv: return "https://pastebin.com/"
        case .staging: return "https://pastebin.com/"
        }
    }
}

