//
//  NewEpisodesViewModel.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 03/12/23.
//

import Foundation

import Combine
import SwiftUI

@Observable
class NewEpisodesViewModel: ObservableObject {
    
    // MARK: Private properties
    private let networkManager: HomeServiceable
    var newApisodesArray: [Media]?
    var isLoadingShowing = true
    var error = ""
    
    
    
    // MARK: Initilize property
    init(networkManager: HomeServiceable = HomeServiceManager()) {
        self.networkManager = networkManager
    }
    
    func getNewEpisodesList() {
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

