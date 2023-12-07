//
//  Categories+stub.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 02/12/23.
//

import Foundation
import SwiftUI

extension CategoriesResponse {
    
    static var stubbedCategorys: [Category] {
        let response: CategoriesResponse? = try? Bundle.main.loadAndDecodeJSON(filename: "Categories")
        return (response?.data?.categories) ?? []
    }
    static var stubCategory: Category? {
        return stubbedCategorys.first
    }
    
    static var gridItemLayout: [GridItem]  {
        Array(repeating: .init(.flexible(), spacing: 13), count: 2)
    }
}


