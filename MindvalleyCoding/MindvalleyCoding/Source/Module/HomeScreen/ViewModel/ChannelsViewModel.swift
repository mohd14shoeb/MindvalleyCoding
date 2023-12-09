//
//  ChannelsViewModel.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 03/12/23.
//

import Foundation
import Combine

@Observable
class ChannelsViewModel: ObservableObject {
    
    // MARK: Private properties
    private let networkManager: HomeServiceable
    var channelsArray: [Channels]?
    var isLoadingShowing = false
    var error = ""
    
    // MARK: Initilize property
    init(networkManager: HomeServiceable = HomeServiceManager()) {
        self.networkManager = networkManager
    }
    
    func getChannelSeriesAndCourseList() {
        self.networkManager.getAPI(decodabel: ChannelsResponse.self,
                                   homeApi: .getChannels, isCacheEnable: true) { [weak self] (response, error) in
            DispatchQueue.main.async {
                self?.isLoadingShowing = false
                if let error = error, !error.isEmpty {
                    self?.error = error
                } else {
                    self?.channelsArray = response?.data.channels
                }
            }
        }
    }
    
}
