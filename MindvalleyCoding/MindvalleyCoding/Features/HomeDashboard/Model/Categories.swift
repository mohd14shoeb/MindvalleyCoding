//
//  Categories.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 02/12/23.
//

import Foundation

// MARK: - CategoriesResponse
struct CategoriesResponse: Codable {
    let data: CategoriesData?
}

// MARK: - DataClass
struct CategoriesData: Codable {
    let categories: [Category]?
}

// MARK: - Category
struct Category: Codable, Identifiable {
    var id: String {
        name ?? ""
    }
    let name: String?
}

extension CategoriesResponse {
    
    static let categoryTitle = "Browse by categories"
}
