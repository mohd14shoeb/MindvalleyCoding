//
//  NewEpisodesCard.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 02/12/23.
//

import SwiftUI
import CachedAsyncImage

struct NewEpisodesCard: View {
    private let media: Media
    private let imageWidth: Double
    private let imageHeight: Double
    
    init(media: Media, 
         imageWidth: Double,
         imageHeight: Double) {
        self.media = media
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
    }
    var body: some View {
        VStack {
            ImageCardView(imageURL: media.mediaURL,
                          imageWidth: 174, imageHeight: 280)
                .padding(.bottom, 8)
            Text(media.title ?? "")
                .frame(maxWidth:.infinity, alignment: .topLeading)
                .foregroundColor(Color.listSectionTitleColor)
                .font(.custom("Gilroy-Regular", size: 17))
                .padding(.bottom, 8)
            Text(media.channel?.title ?? "")
                .frame(maxWidth:.infinity, alignment: .topLeading)
                .foregroundColor(Color.newApisodesTitleColor)
                .font(.custom("Gilroy-Regular", size: 13))
                .padding(.bottom, 8)
            Spacer()
        }
        .frame(width: self.imageWidth, height:  self.imageHeight)
    }
}

#Preview {
    NewEpisodesCard(media: NewEpisodesResponse.stubNewEpisode,
                    imageWidth: 174, imageHeight: 380)
}
