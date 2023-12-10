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
       if #available(iOS 17.0, *) {
        return Array(repeating: .init(.flexible(), spacing: 16), count: 6)
       } else {
           return [
                GridItem(.fixed(174), spacing: 16),
                GridItem(.fixed(174), spacing: 16),
                GridItem(.fixed(174), spacing: 16),
                GridItem(.fixed(174), spacing: 16),
                GridItem(.fixed(174), spacing: 16),
                GridItem(.fixed(174), spacing: 16)
            ]
       }
    }
    
}


