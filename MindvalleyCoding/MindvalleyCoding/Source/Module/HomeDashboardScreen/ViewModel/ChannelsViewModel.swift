//
//  ChannelsViewModel.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 03/12/23.
//

import Foundation
import Combine

protocol ChannelsViewModelProtocol {
    func getChannelSeriesAndCourseList(completion: @escaping (_ isLoadingShowing: Bool?,
                                                              _ error: String?) -> Void?)
}

class ChannelsViewModel: ObservableObject {
    
    // MARK: Private properties
    private let networkManager: HomeServiceProtocol
    @Published  var channelsArray: [Channels]?
    @Published var isLoadingShowing = false
    @Published var error = ""
    
    // MARK: Initilize property
    init(networkManager: HomeServiceProtocol) {
        self.networkManager = networkManager
    }
}

extension ChannelsViewModel: ChannelsViewModelProtocol {
    func getChannelSeriesAndCourseList(completion: @escaping (_ isLoadingShowing: Bool?,
                                                               _ error: String?) -> Void?) {
        self.networkManager.getAPI(decodabel: ChannelsResponse.self,
                                   homeApi: .getChannels, isCacheEnable: true) { [weak self] (response, error) in
            DispatchQueue.main.async {
                self?.isLoadingShowing = false
                if let error = error, !error.isEmpty {
                    self?.error = error
                } else {
                    self?.channelsArray = response?.data.channels
                }
                completion(self?.isLoadingShowing, error)
            }
        }
    }
}

