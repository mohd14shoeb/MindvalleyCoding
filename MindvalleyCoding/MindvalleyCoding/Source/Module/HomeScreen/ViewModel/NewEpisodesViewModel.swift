//
//  NewEpisodesViewModel.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 03/12/23.
//

import Foundation

import Combine
import SwiftUI

class NewEpisodesViewModel: ObservableObject {
    
    // MARK: Private properties
    private let networkManager: HomeServiceable
    private let group = DispatchGroup()
    private var validStringChecker: AnyCancellable?
    
    @Published var newApisodesArray: [Media]?
    @Published var isLoadingShowing = false
    
     var gridItemLayout: [GridItem] =
        Array(repeating: .init(.flexible(), spacing: 13), count: 6)
   
    // MARK: Initilize property
    init(networkManager: HomeServiceable,
         validStringChecker: AnyCancellable? = nil,
         newApisodesArray: [Media]? = nil) {
        self.networkManager = networkManager
        self.validStringChecker = validStringChecker
        self.newApisodesArray = newApisodesArray
    }
    
    func getNewEpisodesList() {
        DispatchQueue.global().async {
            self.networkManager.getAPI(decodabel: NewEpisodesResponse.self,
                                       homeApi: .getNewEpisodesList) { [weak self] (response, error) in
                
                if error != nil {
                    print(error ?? "")
                } else {
                    DispatchQueue.main.async {
                        self?.newApisodesArray = response?.data.media
                        // print(response)
                    }
                }
            }
        }
    }
    
}
