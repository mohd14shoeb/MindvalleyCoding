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
                    HStack(alignment: .top, spacing: 16) {
                        ForEach(movies) { movie in
                           // NewEpisodesCard(media: movie, imageWidth: 174, imageHeight: 390)
                            NewEpisodesCard(imageURL: movie.mediaURL, footerTitle: movie.mediaTitle,
                                            footerSubTitle: movie.channelTitle,
                                            imageWidth: 174, imageHeight: 390)
                                .padding(.leading, movie.id == self.movies?.first?.id ? 16 : 0)
                                .padding(.trailing, movie.id == self.movies?.last?.id ? 16 : 0)
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
    NewEpisodesCarouselView(title: "New Episodes", movies: NewEpisodesResponse.stubedNewEpisodes).background(Color.homeScreenBackGroundColor)
}
