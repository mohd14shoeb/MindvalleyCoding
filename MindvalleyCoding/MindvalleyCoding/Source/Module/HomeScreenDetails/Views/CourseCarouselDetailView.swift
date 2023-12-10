//
//  CourseCarouselDetailView.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 10/12/23.
//

import SwiftUI

struct CourseCarouselDetailView: View {
    private let latestMedia: LatestMedia?
    
    init(latestMedia: LatestMedia?) {
        self.latestMedia = latestMedia
    }
    
    var body: some View {
        ZStack {
            Color.homeScreenBackGroundColor
                .ignoresSafeArea()
            VStack {
                CourseDesignCard(media: latestMedia, imageWidth: 340, imageHeight: 290)
                Spacer()
            }
        }
    }
}

#Preview {
    CourseCarouselDetailView(latestMedia: ChannelsResponse.stubMedia)
}
