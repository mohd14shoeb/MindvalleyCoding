//
//  ImageCardView.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 03/12/23.
//

import SwiftUI
import CachedAsyncImage

struct ImageCardView: View {
    private let imageURL: String
    private let imageWidth: Double
    private let imageHeight: Double
    
    init(imageURL: String,
         imageWidth: Double,
         imageHeight: Double) {
        self.imageURL = imageURL
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
    }

        var body: some View {
            VStack {
                CachedAsyncImage(
                    url: self.imageURL,
                    placeholder: {
                        ZStack {
                            Color.yellow.opacity(0.8)
                            ProgressView()
                        }
                    },
                    image: {
                        Image(uiImage: $0)
                            .resizable()
                            .scaledToFill()
                    }
                )
            }
            .frame(width: self.imageWidth, height: self.imageHeight)
            .clipped()
            .cornerRadius(10)
            .shadow(radius: 10)
        }
}

#Preview {
    ImageCardView(imageURL: NewEpisodesResponse.stubNewEpisodeURL,
             imageWidth: 197.0,
                  imageHeight: 320.0).background(Color.homeScreenBackGroundColor)
}
