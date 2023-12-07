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
            Group {
                Text(footerTitle ?? "")
                    .foregroundColor(Color.listSectionTitleColor)
                    .font(.custom("Gilroy-Bold", size: 18))
                    .padding(.bottom, 6)
                Text(footerSubTitle?.uppercased() ?? "")
                    .foregroundColor(Color.newApisodesTitleColor)
                    .font(.custom("Gilroy-Bold", size: 14))
            }
            .frame(maxWidth:.infinity, alignment: .topLeading)
            .padding([.leading, .trailing], 4)
            .padding(.bottom, 6)
            Spacer()
        }
        .frame(width: self.imageWidth)
        .frame(minHeight: self.imageHeight, maxHeight: .infinity)
    }
}

#Preview {
    NewEpisodesCard(imageURL: NewEpisodesResponse.stubNewEpisode.mediaURL, 
                    footerTitle: NewEpisodesResponse.stubNewEpisode.mediaTitle,
                    footerSubTitle: NewEpisodesResponse.stubNewEpisode.channelTitle,
                    imageWidth: 174, imageHeight: 380)
    .background(Color.homeScreenBackGroundColor)
}
