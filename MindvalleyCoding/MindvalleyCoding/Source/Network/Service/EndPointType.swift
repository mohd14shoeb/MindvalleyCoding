//
//  EndPointType.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 02/12/23.
//

import Foundation

// MARK: Protocol EndPointType
protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
    var body: Data? { get }
}

 extension EndPointType {
    var scheme: String { return "https" }
    var method: HTTPMethod { return .get }
    var headers: [String: String] { return [:] }
    var body: Data? { return nil }
}
