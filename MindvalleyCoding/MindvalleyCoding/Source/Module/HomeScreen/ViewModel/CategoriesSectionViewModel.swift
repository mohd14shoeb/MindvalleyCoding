//
//  CategoriesSectionViewModel.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 02/12/23.
//

import Foundation
import Combine
import SwiftUI

@Observable
class CategoriesSectionViewModel: ObservableObject {
    
    // MARK: Private properties
    private let networkManager: HomeServiceable
    
    var categories: [Category]?
    var isLoadingShowing = false
    var error = ""
    
    // MARK: Initilize property
    init(networkManager: HomeServiceable = HomeServiceManager()) {
        self.networkManager = networkManager
    }
    
    func getCategoryList() {
        self.networkManager.getAPI(decodabel: CategoriesResponse.self,
                                   homeApi: .Categories, isCacheEnable: true) { [weak self] (response, error) in
            DispatchQueue.main.async {
                self?.isLoadingShowing = false
                if let error = error, !error.isEmpty {
                    self?.error = error
                } else {
                    self?.categories = response?.data?.categories
                }
            }
        }
    }
}
