//
//  NewEpisodesViewModel.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 03/12/23.
//

import Foundation
import Combine

protocol NewEpisodesViewModelProtocol {
    func getNewEpisodesList(completion: @escaping (_ isLoadingShowing: Bool?,
                                                   _ error: String?) -> Void?)
}

class NewEpisodesViewModel: ObservableObject {
    
    // MARK: Private properties
    private let networkManager: HomeServiceProtocol
    @Published  var newApisodesArray: [Media]?
    @Published var isLoadingShowing = true
    @Published var error = ""
    
    // MARK: Initilize property
    init(networkManager: HomeServiceProtocol = HomeServiceManager()) {
        self.networkManager = networkManager
    }
        
}

extension NewEpisodesViewModel: NewEpisodesViewModelProtocol {
    func getNewEpisodesList(completion: @escaping (_ isLoadingShowing: Bool?,
                                                   _ error: String?) -> Void?) {
        self.networkManager.getAPI(decodabel: NewEpisodesResponse.self,
                                   homeApi: .getNewEpisodesList, isCacheEnable: true) { [weak self] (response, error) in
            DispatchQueue.main.async {
                self?.isLoadingShowing = false
                if let error = error, !error.isEmpty {
                    self?.error = error
                } else {
                    self?.newApisodesArray = response?.data.media
                }
                completion(self?.isLoadingShowing, error)
            }
        }
    }
}
