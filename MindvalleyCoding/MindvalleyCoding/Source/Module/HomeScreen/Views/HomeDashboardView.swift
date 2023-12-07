//
//  HomeDashboardView.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 07/12/23.
//

import SwiftUI

struct HomeDashboardView: View {
    @StateObject private var newApisodeViewModel = NewEpisodesViewModel(networkManager: HomeServiceManager())
    @StateObject private var categoryViewModel = CategoriesSectionViewModel(networkManager: HomeServiceManager())
    @StateObject private var channelViewModel = ChannelsViewModel(networkManager: HomeServiceManager())
    
    var body: some View {
        ZStack {
            Color.homeScreenBackGroundColor
                .ignoresSafeArea()
            Spacer(minLength: 20)
            
            ScrollView(.vertical) {
                //  Spacer(minLength: 20)
                titleView
                
                if let newEpisodes = newApisodeViewModel.newApisodesArray {
                    NewEpisodesGridLayoutView(title: "New Episodes", movies: newEpisodes, gridItemLayout: newApisodeViewModel.gridItemLayout)
                }
                if let channels = self.channelViewModel.channelsArray, !channels.isEmpty {
                    SeriesCourseCarouselView(channelsArray: channels)
                }
                if let categories = categoryViewModel.categorySectionArray, !categories.isEmpty {
                    CategoriesSectionListView(title: "Browse by categories", gridItemLayout: categoryViewModel.gridItemLayout, categorySectionArray: categories)
                }
            }
            
        }.task {
            self.newApisodeViewModel.getNewEpisodesList()
            self.channelViewModel.getChannelSeriesAndCourseList()
            self.categoryViewModel.getCategoryList()
        }
        
    }
    
    private var titleView: some View {
        Text("Channel").foregroundColor(.navigationTitleColor)
            .frame(maxWidth:.infinity, alignment: .topLeading)
            .foregroundColor(Color.navigationTitleColor)
            .font(.custom("Gilroy-Bold", size: 24))
            .padding(.leading, 16)
            .padding(.bottom, 16)
    }
}

#Preview {
    HomeDashboardView()
}
