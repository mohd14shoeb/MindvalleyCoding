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
//    private let group = DispatchGroup()
//    private var validStringChecker: AnyCancellable?
    
    @Published var newApisodesArray: [Media]?
    @Published var isLoadingShowing = true
    @Published var error = ""
    
     
   
    // MARK: Initilize property
    init(networkManager: HomeServiceable = HomeServiceManager()) {
        self.networkManager = networkManager
    }
    
    func getNewEpisodesList() {
        DispatchQueue.global().async {
            self.networkManager.getAPI(decodabel: NewEpisodesResponse.self,
                                       homeApi: .getNewEpisodesList, isCacheEnable: true) { [weak self] (response, error) in
                DispatchQueue.main.async {
                self?.isLoadingShowing = false
                if let error = error, !error.isEmpty {
                    self?.error = error
                } else {
                        self?.newApisodesArray = response?.data.media
                    }
                }
            }
        }
    }
    
}

