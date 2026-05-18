//
//  NewEpisodes.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 02/12/23.
//

import Foundation

// MARK: - Welcome
struct NewEpisodesResponse: Codable {
    let data: NewEpisodesData
}

// MARK: - DataClass
struct NewEpisodesData: Codable {
    let media: [Media]?
}

// MARK: - Media
struct Media: Codable, Identifiable {

    let type, title: String?
    let coverAsset: CoverAsset?
    let channel: Channel?
    
    var id: String {
        title ?? ""
    }
    var mediaURL: String {
        coverAsset?.url ?? ""
    }
    var mediaTitle: String {
        title ?? ""
    }
    var channelTitle: String {
        channel?.title ?? ""
    }
}

// MARK: - Channel
struct Channel: Codable {
    let title: String?
    
}


extension NewEpisodesResponse {
    static let newEpisodeTitle =  "New Episodes"
}
