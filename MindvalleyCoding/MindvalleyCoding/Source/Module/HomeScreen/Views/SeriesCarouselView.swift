//
//  SeriesCarouselView.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 03/12/23.
//

import SwiftUI

struct SeriesCarouselView: View {
    private let title: String
    private var series: [Series]?
    
    init(title: String, series: [Series]?) {
        self.title = title
        self.series = series
    }
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let series = self.series, !series.isEmpty {
                Text(title)
                    .foregroundColor(Color.newApisodesTitleColor)
                    .font(.custom("Gilroy-Bold", size: 20))
                    .padding(.horizontal)
                    .padding(.bottom, 14)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 16) {
                        ForEach(series) { serie in
                            NewEpisodesCard(imageURL: serie.coverAssetURL,
                                            footerTitle: serie.id, footerSubTitle: "",
                                            imageWidth: 174, imageHeight: 380)
                            .padding(.leading, serie.id == self.series?.first?.id ? 16 : 0)
                            .padding(.trailing, serie.id == self.series?.last?.id ? 16 : 0)
                        }
                    }
                }
                Divider()
                    .frame(height: 5)
                    .overlay(.gray)
                    .padding([.leading,.trailing], 16)
                
            }
            
        }
    }
}

#Preview {
    SeriesCarouselView(title: "New Episodes", series: ChannelsResponse.stubSeries)
        .background(Color.homeScreenBackGroundColor)
}
