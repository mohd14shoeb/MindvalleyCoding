//
//  HomeServiceable.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 02/12/23.
//

import Foundation

// MARK: protocol HomeServiceable
protocol HomeServiceable {
    func getAPI<T: Decodable>(decodabel: T.Type,
                              homeApi: HomeApiEndPoints,
                              completion: @escaping (_ response: T?,
                                                    _ error: String?) -> Void)
}
