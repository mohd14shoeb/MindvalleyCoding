//
//  Channels+stub.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 02/12/23.
//

import Foundation

extension ChannelsResponse {
    
    static var stubChannels: [Channels] {
        let response: ChannelsResponse? = try? Bundle.main.loadAndDecodeJSON(filename: "Categories")
        return (response?.data.channels) ?? []
    }
    static var stubChannel: Channels? {
        return stubChannels.first
    }
}
