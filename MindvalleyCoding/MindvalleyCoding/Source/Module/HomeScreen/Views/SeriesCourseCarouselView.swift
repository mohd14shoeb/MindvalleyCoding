//
//  SeriesCourseCarouselView.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 03/12/23.
//

import SwiftUI

struct SeriesCourseCarouselView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        SeriesCarouselView(title: "Hello", series: ChannelsResponse.stubChannel?.series)
    }
}

#Preview {
    SeriesCourseCarouselView().background(Color.homeScreenBackGroundColor)
}
