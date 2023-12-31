//
//  NewEpisodesCarouselView.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 02/12/23.
//

import SwiftUI

struct NewEpisodesCarouselView: View {
   private let title: String
   private let movies: [Media]?
    
    init(title: String, movies: [Media]?) {
        self.title = title
        self.movies = movies
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if let movies = self.movies, !movies.isEmpty {
                Text(title)
                    .foregroundColor(Color.newApisodesTitleColor)
                    .font(.custom("Gilroy-Bold", size: 20))
                    .padding(.horizontal)
                    .padding(.bottom, 14)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(content: {
                        ForEach(movies) { movie in
                            NewEpisodesCard(imageURL: movie.mediaURL, footerTitle: movie.mediaTitle,
                                            footerSubTitle: movie.channelTitle,
                                            imageWidth: 174, imageHeight: 390)
                            .padding(.leading, movie.id == self.movies?.first?.id ? 16 : 0)
                            .padding(.trailing, movie.id == self.movies?.last?.id ? 16 : 0)
                        }
                    })
                }
                DividerView(height: 1.0, color: Color.dividerColor, padding: 16)
            }
        }
        
    }
}

#Preview {
    NewEpisodesCarouselView(title: "New Episodes", 
                            movies: NewEpisodesResponse.stubedNewEpisodes)
    .background(Color.homeScreenBackGroundColor)
}
