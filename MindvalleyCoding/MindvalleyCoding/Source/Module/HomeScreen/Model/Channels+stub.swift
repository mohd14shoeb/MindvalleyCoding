//
//  Channels+stub.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 02/12/23.
//

import Foundation

extension ChannelsResponse {
    
    static var stubChannels: [Channels] {
        let response: ChannelsResponse? = try? Bundle.main.loadAndDecodeJSON(filename: "Channels")
        return (response?.data.channels) ?? []
    }
    static var stubChannel: Channels? {
        return stubChannels.last
    }
    
    static var stubSeries: [Series]? {
        return stubChannel?.series
    }
    
    static var stubSerie: Series? {
        return stubSeries?.first
    }
}
