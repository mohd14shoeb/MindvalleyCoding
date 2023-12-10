//
//  CategoriesSectionViewModel.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 02/12/23.
//

import Foundation
import Combine
import SwiftUI

class CategoriesSectionViewModel: ObservableObject {
    
    // MARK: Private properties
    private let networkManager: HomeServiceable
    
    @Published  var categories: [Category]?
    @Published  var isLoadingShowing = false
    @Published  var error = ""
    
    // MARK: Initilize property
    init(networkManager: HomeServiceable = HomeServiceManager()) {
        self.networkManager = networkManager
    }
    
    func getCategoryList(completion: @escaping (_ isLoadingShowing: Bool?,
                                                _ error: String?) -> Void?) {
        self.networkManager.getAPI(decodabel: CategoriesResponse.self,
                                   homeApi: .Categories, isCacheEnable: true) { [weak self] (response, error) in
            DispatchQueue.main.async {
                self?.isLoadingShowing = false
                if let error = error, !error.isEmpty {
                    self?.error = error
                } else {
                    self?.categories = response?.data?.categories
                }
                completion(self?.isLoadingShowing, error)
            }
        }
    }
}
