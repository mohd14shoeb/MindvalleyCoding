//
//  NewEpisodesGridLayoutView.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 07/12/23.
//

import SwiftUI

struct NewEpisodesGridLayoutView: View {
    private let title: String
    private let movies: [Media]
    private let gridItemLayout: [GridItem]
    
    init(title: String, movies: [Media], 
         gridItemLayout: [GridItem]) {
        self.title = title
        self.movies = movies
        self.gridItemLayout = gridItemLayout
    }
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            Text(title)
                .font(.custom("Gilroy-Bold", size: 20))
                .foregroundColor(Color.newApisodesTitleColor)
                .padding(.all, 14)
        }
        ScrollView(.horizontal, showsIndicators: false) {
            LazyVGrid(columns: gridItemLayout, spacing: 4) {
                ForEach(movies) { movie in
                    NewEpisodesCard(imageURL: movie.mediaURL, 
                                    footerTitle: movie.mediaTitle,
                                    footerSubTitle: movie.channelTitle,
                                    imageWidth: 174, imageHeight: 420)
                }
            }
             .padding([.leading, .trailing], 14)
        }
        DividerView(height: 1.0, color: Color.dividerColor, padding: 16)
    }
    
}

#Preview {
    NewEpisodesGridLayoutView(title: "hello india", movies: NewEpisodesResponse.stubedNewEpisodes, gridItemLayout: NewEpisodesResponse.gridItemLayout)
        .background(Color.homeScreenBackGroundColor)
}


