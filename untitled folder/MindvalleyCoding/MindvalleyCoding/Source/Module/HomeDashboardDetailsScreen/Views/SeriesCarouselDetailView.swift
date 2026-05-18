//
//  SeriesCarouselDetailView.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 10/12/23.
//

import SwiftUI

struct SeriesCarouselDetailView: View {
    private let seriesModel: Series?
    
    init(seriesModel: Series?) {
        self.seriesModel = seriesModel
    }
    
    var body: some View {
        ZStack {
            Color.homeScreenBackGroundColor
                .ignoresSafeArea()
            NewEpisodesCard(imageURL: seriesModel?.coverAssetURL ?? "",
                            footerTitle: seriesModel?.title ?? "", footerSubTitle: "",
                            imageWidth: 174, imageHeight: 400)
            Spacer()
        }
    }
}

#Preview {
    SeriesCarouselDetailView(seriesModel: ChannelsResponse.stubSerie)
}
