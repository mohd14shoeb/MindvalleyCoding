//
//  ChannelsViewModel.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 03/12/23.
//

import Foundation
import Combine

class ChannelsViewModel: ObservableObject {
    
    // MARK: Private properties
    private let networkManager: HomeServiceable
//    private let group = DispatchGroup()
//    private var validStringChecker: AnyCancellable?
    
    @Published var channelsArray: [Channels]?
    @Published var isLoadingShowing = false
    @Published var error = ""
    
    // MARK: Initilize property
    init(networkManager: HomeServiceable = HomeServiceManager()) {
        self.networkManager = networkManager
    }
    
    func getChannelSeriesAndCourseList() {
        DispatchQueue.global().async {
            self.networkManager.getAPI(decodabel: ChannelsResponse.self,
                                       homeApi: .getChannels) { [weak self] (response, error) in
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
    
}
