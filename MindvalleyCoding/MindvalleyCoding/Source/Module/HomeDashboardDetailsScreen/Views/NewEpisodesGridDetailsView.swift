//
//  NewEpisodesGridDetailsView.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 10/12/23.
//

import SwiftUI

struct NewEpisodesGridDetailsView: View {
    
    private let media: Media?
    
    init(media: Media?) {
        self.media = media
    }
    
    var body: some View {
        ZStack {
            Color.homeScreenBackGroundColor
                .ignoresSafeArea()
            if let media = self.media {
                NewEpisodesCard(imageURL: media.mediaURL,
                                footerTitle: media.mediaTitle,
                                footerSubTitle: media.channelTitle,
                                imageWidth: 174, imageHeight: 420)
            }
        }
    }
}

#Preview {
    NewEpisodesGridDetailsView(media: NewEpisodesResponse.stubNewEpisode)
}
