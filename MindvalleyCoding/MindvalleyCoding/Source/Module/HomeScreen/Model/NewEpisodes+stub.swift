//
//  NewEpisodes+stub.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 02/12/23.
//

import Foundation
import SwiftUI

extension NewEpisodesResponse {
    
    static var stubedNewEpisodes: [Media] {
        let response: NewEpisodesResponse? = try? Bundle.main.loadAndDecodeJSON(filename: "NewEpisodes")
        return (response?.data.media) ?? []
    }
    static var stubNewEpisode: Media {
        return stubedNewEpisodes.first!
    }
    
    static var stubNewEpisodeURL: String {
        return stubNewEpisode.coverAsset?.url ?? ""
    }
    
   static var gridItemLayout: [GridItem] {
        Array(repeating: .init(.flexible(), spacing: 13), count: 6)
    }
}


