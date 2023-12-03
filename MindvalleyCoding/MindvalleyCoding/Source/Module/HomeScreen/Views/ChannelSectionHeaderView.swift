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
                url: channel?.iconAsset?.thumbnailURL ?? Channels.thumbnailImage,
                placeholder: {
                    ZStack {
                        Color.gray.opacity(0.03)
                        ProgressView()
                    }
                },
                image: {
                    Image(uiImage: $0)
                        .resizable()
                        .scaledToFill()
                }
            )
            .clipShape(Circle())
            .frame(width: 54, height: 54)
            VStack {
                Text(channel?.title ?? "")
                Text( String(channel?.mediaCount ?? 0))
                    
            }
        }
    }
}

#Preview {
    ChannelSectionHeaderView(channel: ChannelsResponse.stubChannel)
}

 
