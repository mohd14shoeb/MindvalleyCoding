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
    private let group = DispatchGroup()
    private var validStringChecker: AnyCancellable?
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    @Published var categorySectionArray: [Category]?
    @Published var isLoadingShowing = false
    
    
    // MARK: Initilize property
    init(networkManager: HomeServiceable,
         validStringChecker: AnyCancellable? = nil,
         categorySectionArray: [Category]? = nil) {
        self.networkManager = networkManager
        self.validStringChecker = validStringChecker
        self.categorySectionArray = categorySectionArray
    }
    
    func getCategoryList() {
        self.networkManager.getAPI(decodabel: CategoriesResponse.self,
                                   homeApi: .Categories) { [weak self] (response, error) in
            
            if error != nil {
                print(error ?? "")
            } else {
                DispatchQueue.main.async {
                    self?.categorySectionArray = response?.data?.categories
                    //print(response)
                }
            }
        }
    }
    
}
