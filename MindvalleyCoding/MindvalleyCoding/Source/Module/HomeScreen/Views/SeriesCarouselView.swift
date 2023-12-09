//
//  SeriesCarouselView.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 03/12/23.
//

import SwiftUI

struct SeriesCarouselView: View {
    
    private let channels: Channels?
    
    init(channels: Channels?) {
        self.channels = channels
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let series = self.channels?.series,
                !series.isEmpty {
                ChannelSectionHeaderView(channel: self.channels)
                    .padding(.horizontal, 10)
                    .padding([.top,.bottom], 20)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 16) {
                        ForEach(series) { serieModel in
                            NewEpisodesCard(imageURL: serieModel.coverAssetURL,
                                            footerTitle: serieModel.title ?? "", footerSubTitle: "",
                                            imageWidth: 174, imageHeight: 400)
                            .padding(.leading, serieModel.id == series.first?.id ? 16 : 0)
                            .padding(.trailing, serieModel.id == series.last?.id ? 16 : 0)
                        }
                    }
                }
                DividerView(height: 1.0, color: Color.dividerColor, padding: 16)
            }
        }
    }
}

#Preview {
    SeriesCarouselView(channels: ChannelsResponse.stubChannel)
    .background(Color.homeScreenBackGroundColor)
}
