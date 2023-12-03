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
            if let latestMedias = self.channels?.latestMedia, !latestMedias.isEmpty {
                ChannelSectionHeaderView(channel: self.channels)
                    .padding(.horizontal, 10)
                    .padding(.bottom, 30)
                    .foregroundColor(Color.newApisodesTitleColor)
                    .font(.custom("Gilroy-Bold", size: 20))
                    .frame(maxWidth:.infinity, alignment: .topLeading)
                  
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 16) {
                        ForEach(latestMedias) { media in
                           CourseDesignCard(media: media, imageWidth: 340, imageHeight: 270)
                            .padding(.leading, media.id == latestMedias.first?.id ? 16 : 0)
                            .padding(.trailing, media.id == latestMedias.last?.id ? 16 : 0)
                        }
                    }
                }
                Divider()
                    .frame(height: 1)
                    .overlay(.gray)
                    .padding([.leading,.trailing], 16)
                
            }
            
        }
    }
}

#Preview {
    CourseCarouselView(latestMedias: ChannelsResponse.stubChannel)
        .background(Color.homeScreenBackGroundColor)
}
