//
//  SeriesCourseCarouselView.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 03/12/23.
//

import SwiftUI

struct SeriesCourseCarouselView: View {
    private let channelsArray: [Channels]
    
    init(channelsArray: [Channels]) {
        self.channelsArray = channelsArray
    }
    
    var body: some View {
        VStack() {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 16) {
                        ForEach(self.channelsArray ) { channel in
                            if let series = channel.series, !series.isEmpty {
                                SeriesCarouselView(channels: channel)
                            } else {
                                CourseCarouselView(latestMedias: channel)
                            }
                        }
                    }
                }
        }
    }
}

#Preview {
    SeriesCourseCarouselView(channelsArray: ChannelsResponse.stubChannels).background(Color.homeScreenBackGroundColor)
}
