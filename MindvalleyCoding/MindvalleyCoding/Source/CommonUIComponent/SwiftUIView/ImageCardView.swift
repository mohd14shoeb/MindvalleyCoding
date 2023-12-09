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
                            Color.gray.opacity(1.0)
                            ProgressView()
                        }
                    },
                    image: {
                        Image(uiImage: $0)
                            .resizable()
                            .scaledToFill()
                    },
                    error: { error in
                        ZStack {
                            Color.gray.opacity(1.0)
                            VStack {
                                Text("No Image")
                                    .foregroundColor(Color.white)
                                    .font(.custom("Gilroy-Regular", size: 16))
                                    .multilineTextAlignment(.center)
                            }
                        }
                        
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