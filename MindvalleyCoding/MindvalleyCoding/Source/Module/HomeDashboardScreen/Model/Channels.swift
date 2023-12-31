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
struct Channels: Codable, Identifiable {
    let title: String?
    let series: [Series]?
    let mediaCount: Int?
    let latestMedia: [LatestMedia]?
    var id: String {
        title ?? ""
    }
    let iconAsset: IconAsset?
    let coverAsset: CoverAsset?
    let slug: String?
    
    var coverAssetURL: String {
        coverAsset?.url ?? ""
    }
    
    var getSerisEpisodeText: String {
        if (self.series?.count ?? 0) > 0 {
            if self.mediaCount ?? 0 > 0 {
                return String("\(self.mediaCount ?? 0 ) series")
            }
            return  ""
        } else {
            if self.mediaCount ?? 0 > 0 {
                return String("\(self.mediaCount ?? 0) episodes")
            }
            return ""
        }
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
struct LatestMedia: Codable, Identifiable {
    var id: String {
        title 
    }
    
    let type: TypeEnum
    let title: String
    let coverAsset: CoverAsset?
    
    var coverAssetURL: String {
        coverAsset?.url ?? ""
    }
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

extension Channels {
    
    static let thumbnailImage = "https://assets.mindvalley.com/api/v1/assets/eb493421-c048-492b-a471-bed7604e95d6.jpg?transform=w_1080123" //https://via.placeholder.com/150/0000FF/808080 ?Text=PAKAINFO.com"
}
