//
//  ChannelSectionHeaderView.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 03/12/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct ChannelSectionHeaderView: View {
    private let channel: Channels?
    @State var isLoading: Bool = true
    
    init(channel: Channels?) {
        self.channel = channel
    }
    
    var body: some View {
        HStack {
            WebImage(url: URL(string: channel?.iconAsset?.thumbnailURL ?? ""))
                .onFailure { _ in
                    self.isLoading = false
                }
                .onSuccess { _, _, _  in
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
                                    .font(.custom("Gilroy-Regular", size: 13))
                                    .multilineTextAlignment(.center)
                            }
                        }
                    }
                    
                }
            .clipShape(Circle())
            .frame(width: 56, height: 56)
            footerTitle
        }
    }
    
    private var footerTitle: some View {
        VStack {
            Group {
               Text(channel?.title ?? "")
                Text(channel?.getSerisEpisodeText ?? "")
                    .foregroundColor(Color.newApisodesTitleColor)
            }
            .frame(maxWidth:.infinity, alignment: .topLeading)
            .foregroundColor(Color.listSectionTitleColor)
            .font(.custom("Gilroy-Bold", size: 18))
            .padding([.leading, .trailing], 4)
        }
    }
}

#Preview {
    ChannelSectionHeaderView(channel: ChannelsResponse.stubChannel)
        .background(Color.homeScreenBackGroundColor)
}

 
