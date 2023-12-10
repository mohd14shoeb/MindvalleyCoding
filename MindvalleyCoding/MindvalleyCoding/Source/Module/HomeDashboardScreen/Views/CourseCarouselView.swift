//
//  CourseCarouselView.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 03/12/23.
//

import SwiftUI

struct CourseCarouselView: View {
    
    private var channels: Channels?
    
    init(latestMedias: Channels?) {
        self.channels = latestMedias
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let latestMedias = self.channels?.latestMedia,
                !latestMedias.isEmpty {
                ChannelSectionHeaderView(channel: self.channels)
                    .padding(.horizontal, 10)
                    .padding([.top,.bottom], 20)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 16) {
                        ForEach(latestMedias) { media in
                            NavigationLink(destination: CourseCarouselDetailView(latestMedia: media)) {
                                CourseDesignCard(media: media, imageWidth: 340, imageHeight: 290)
                                    .padding(.leading, media.id == latestMedias.first?.id ? 16 : 0)
                                    .padding(.trailing, media.id == latestMedias.last?.id ? 16 : 0)
                            }
                        }
                    }
                }
                DividerView(height: 1.0, color: Color.dividerColor, padding: 16)
            }
            
        }
    }
}

#Preview {
    CourseCarouselView(latestMedias: ChannelsResponse.stubChannel)
        .background(Color.homeScreenBackGroundColor)
}
