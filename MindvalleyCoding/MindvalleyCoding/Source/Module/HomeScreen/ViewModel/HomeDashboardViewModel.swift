//
//  HomeDashboardViewModel.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 08/12/23.
//

import Foundation
import SwiftUI
import Combine

class HomeDashboardViewModel: ObservableObject {
    @Published var viewModelNewEpisodes: NewEpisodesViewModel
    @Published var viewModelChannels: ChannelsViewModel
    @Published var viewModelCategories: CategoriesSectionViewModel
    
    private var cancellables = Set<AnyCancellable>()
    
    let newEpisodeGridItemLayout: [GridItem] =
       Array(repeating: .init(.flexible(), spacing: 13), count: 6)
    let categoryGridItemLayout: [GridItem]  =
    Array(repeating: .init(.flexible(), spacing: 13), count: 2)
    
    init(networkManager: HomeServiceable, cancellables: Set<AnyCancellable> = Set<AnyCancellable>()) {
        self.viewModelNewEpisodes = NewEpisodesViewModel(networkManager: networkManager)
        self.viewModelChannels = ChannelsViewModel(networkManager: networkManager)
        self.viewModelCategories = CategoriesSectionViewModel(networkManager: networkManager)
        self.cancellables = cancellables
        
//        viewModelNewEpisodes.newApisodesArray.publisher.sink {  in
//            <#code#>
//        } receiveValue: { <#Self.Output#> in
//            <#code#>
//        }

        
        
//        self.newEpisodeGridItemLayout = newEpisodeGridItemLayout
//        self.categoryGridItemLayout = categoryGridItemLayout
    }
    
//    init(networkManager: HomeServiceable) {
//        self.viewModelNewEpisodes = NewEpisodesViewModel(networkManager: networkManager)
//        self.viewModelChannels = ChannelsViewModel(networkManager: networkManager)
//        self.viewModelCategories = CategoriesSectionViewModel(networkManager: networkManager)
//    }
    
    func fetchDataForViewModels() {
        DispatchQueue.global().async {
            self.viewModelNewEpisodes.getNewEpisodesList()
            self.viewModelChannels.getChannelSeriesAndCourseList()
            self.viewModelCategories.getCategoryList()
        }
       
    }
    
//    var newEpisodes: [Media]? {
//        self.viewModelNewEpisodes.newApisodesArray
//    }
//    
//    var channels: [Channels]? {
//        self.viewModelChannels.channelsArray
//    }
//    
//    var categories: [Category]? {
//        self.viewModelCategories.categorySectionArray
//    }
}
