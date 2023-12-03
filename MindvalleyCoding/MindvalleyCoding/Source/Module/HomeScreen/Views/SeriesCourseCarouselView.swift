//
//  SeriesCourseCarouselView.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 03/12/23.
//

import SwiftUI

struct SeriesCourseCarouselView: View {
    @StateObject private var channelViewModel = ChannelsViewModel(networkManager: HomeServiceManager())
    
    var body: some View {
        VStack() {
            if let channels = channelViewModel.channelsArray, !channels.isEmpty {
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 16) {
                        ForEach(channels) { channel in
                            if let series = channel.series, !series.isEmpty {
                                SeriesCarouselView(channels: channel)
                            } else {
                                CourseCarouselView(latestMedias: channel)
                            }
                        }
                    }
                }
            }
        }.task {
            self.channelViewModel.getChannelSeriesAndCourseList()
        }
    }
}

#Preview {
    SeriesCourseCarouselView().background(Color.homeScreenBackGroundColor)
}
