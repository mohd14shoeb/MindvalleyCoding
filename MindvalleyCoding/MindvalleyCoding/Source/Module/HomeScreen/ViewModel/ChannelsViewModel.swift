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
    private let group = DispatchGroup()
    private var validStringChecker: AnyCancellable?
    
    @Published var channelsArray: [Channels]?
    @Published var isLoadingShowing = false
    
    
    // MARK: Initilize property
    init(networkManager: HomeServiceable,
         validStringChecker: AnyCancellable? = nil,
         channelsArray: [Channels]? = nil) {
        self.networkManager = networkManager
        self.validStringChecker = validStringChecker
        self.channelsArray = channelsArray
    }
    
    func getChannelSeriesAndCourseList() {
        DispatchQueue.global().async {
            self.networkManager.getAPI(decodabel: ChannelsResponse.self,
                                       homeApi: .getChannels) { [weak self] (response, error) in
                
                if error != nil {
                    print(error)
                } else {
                    DispatchQueue.main.async {
                        self?.channelsArray = response?.data.channels
                        print(response)
                    }
                }
            }
        }
    }
    
}
