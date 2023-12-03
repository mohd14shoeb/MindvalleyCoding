//
//  NewEpisodesCard.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 02/12/23.
//

import SwiftUI
import CachedAsyncImage

struct NewEpisodesCard: View {
    private let imageURL: String
    private let footerTitle: String?
    private let footerSubTitle: String?
    private let imageWidth: Double
    private let imageHeight: Double
    
    init(imageURL: String, 
         footerTitle: String,
         footerSubTitle: String,
         imageWidth: Double,
         imageHeight: Double) {
        self.imageURL = imageURL
        self.footerTitle = footerTitle
        self.footerSubTitle = footerSubTitle
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
    }
    var body: some View {
        VStack {
            ImageCardView(imageURL: imageURL,
                          imageWidth: 174, imageHeight: 280)
                .padding(.bottom, 8)
            Text(footerTitle ?? "")
                .frame(maxWidth:.infinity, alignment: .topLeading)
                .foregroundColor(Color.listSectionTitleColor)
                .font(.custom("Gilroy-Regular", size: 17))
                .padding(.bottom, 8)
            Text(footerSubTitle ?? "")
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
    NewEpisodesCard(imageURL: NewEpisodesResponse.stubNewEpisode.mediaURL, 
                    footerTitle: NewEpisodesResponse.stubNewEpisode.mediaTitle,
                    footerSubTitle: NewEpisodesResponse.stubNewEpisode.channelTitle,
                    imageWidth: 174, imageHeight: 380)
}
