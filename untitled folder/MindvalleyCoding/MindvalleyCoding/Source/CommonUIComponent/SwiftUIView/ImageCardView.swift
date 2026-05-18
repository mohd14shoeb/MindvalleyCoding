//
//  ImageCardView.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 03/12/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageCardView: View {
    private let imageURL: String
    private let imageWidth: Double
    private let imageHeight: Double
    @State var isLoading: Bool = true
    
    // MARK: - Initializers
    init(imageURL: String,
         imageWidth: Double,
         imageHeight: Double) {
        self.imageURL = imageURL
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
    }

    var body: some View {
        VStack {
            WebImage(url: URL(string: self.imageURL))
                .onFailure { error in
                    self.isLoading = false
                }
                .onSuccess { image, cacheType, data  in
                    self.isLoading = false
                }
                .resizable()
                .placeholder {
                    if isLoading {
                        Color.gray.opacity(1.0)
                        ProgressView()
                    } else {
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
                    
                }
                .scaledToFill()
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


