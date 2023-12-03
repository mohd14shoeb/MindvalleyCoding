//
//  Channels.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 02/12/23.
//

import Foundation


// MARK: - Welcome
struct ChannelsResponse: Codable {
    let data: ChannelsData
}

// MARK: - DataClass
struct ChannelsData: Codable {
    let channels: [Channels]?
}

// MARK: - Channel
struct Channels: Codable {
    let title: String?
    let series: [Series]?
    let mediaCount: Int?
    let latestMedia: [LatestMedia]?
    let id: String?
    let iconAsset: IconAsset?
    let coverAsset: CoverAsset?
    let slug: String?
    
    var coverAssetURL: String {
        coverAsset?.url ?? ""
    }
}

// MARK: - CoverAsset
struct CoverAsset: Codable {
    let url: String?
    
    
}

// MARK: - IconAsset
struct IconAsset: Codable {
    let thumbnailURL: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case thumbnailURL = "thumbnailUrl"
        case url
    }
}

// MARK: - LatestMedia
struct LatestMedia: Codable {
    let type: TypeEnum
    let title: String
    let coverAsset: CoverAsset?
}

enum TypeEnum: String, Codable {
    case course = "course"
    case video = "video"
}

// MARK: - Series
struct Series: Codable, Identifiable {
    let title: String?
    let coverAsset: CoverAsset?
    var id: String {
        title ?? ""
    }
    var coverAssetURL: String {
        coverAsset?.url ?? ""
    }
}
