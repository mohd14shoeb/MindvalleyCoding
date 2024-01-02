//
//  CourseDesignCard.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 03/12/23.
//

import SwiftUI

struct CourseDesignCard: View {
    private let media: LatestMedia?
    private let imageWidth: Double
    private let imageHeight: Double
    
    init(media: LatestMedia?, 
         imageWidth: Double,
         imageHeight: Double) {
        self.media = media
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
    }
    var body: some View {
        VStack {
            ImageCardView(imageURL: self.media?.coverAssetURL ?? "",
                          imageWidth: 340, imageHeight: 200)
                .padding(.bottom, 8)
            
            Text(self.media?.title ?? "")
                .frame(maxWidth:.infinity, alignment: .topLeading)
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.listSectionTitleColor)
                .font(.custom("Gilroy-Bold", size: 18))
                .padding([.leading, .trailing], 4)
                .padding(.bottom, 8)
            Spacer()
        }
        .frame(width: self.imageWidth, height:  self.imageHeight)
    }
}

#Preview {
    CourseDesignCard(media: ChannelsResponse.stubMedia,
                     imageWidth: 340, imageHeight: 180)
    .background(Color.homeScreenBackGroundColor)
}
