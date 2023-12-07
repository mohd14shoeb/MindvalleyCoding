//
//  ChannelSectionHeaderView.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 03/12/23.
//

import SwiftUI
import CachedAsyncImage

struct ChannelSectionHeaderView: View {
    private let channel: Channels?
    
    init(channel: Channels?) {
        self.channel = channel
    }
    var body: some View {
        HStack {
            CachedAsyncImage(
                url: channel?.iconAsset?.thumbnailURL ?? "",
                placeholder: { progress in
                    ZStack {
                        Color.gray.opacity(1.03)
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
                        Color.gray.opacity(1.03)
                        VStack {
                            Text("No Image")
                                .foregroundColor(Color.yellow)
                                .font(.custom("Gilroy-Regular", size: 13))
                                .multilineTextAlignment(.center)
                        }
                    }
                    
                }
            )
            .clipShape(Circle())
            .frame(width: 54, height: 54)
            footerTitle
        }
    }
    
    private var footerTitle: some View {
        VStack {
            Group {
               Text(channel?.title ?? "")
                Text(self.getSerisEpisodeText(channel: self.channel))
                    .foregroundColor(Color.newApisodesTitleColor)
            }
            .frame(maxWidth:.infinity, alignment: .topLeading)
            .foregroundColor(Color.listSectionTitleColor)
            .font(.custom("Gilroy-Bold", size: 18))
            .padding([.leading, .trailing], 4)
        }
    }
    
    func getSerisEpisodeText(channel: Channels?) -> String {
        if (channel?.series?.count ?? 0) > 0 {
            String("\(channel?.mediaCount ?? 0) series")
        } else {
            String("\(channel?.mediaCount ?? 0) episodes")
        }
    }
}

#Preview {
    ChannelSectionHeaderView(channel: ChannelsResponse.stubChannel)
        .background(Color.homeScreenBackGroundColor)
}

 
