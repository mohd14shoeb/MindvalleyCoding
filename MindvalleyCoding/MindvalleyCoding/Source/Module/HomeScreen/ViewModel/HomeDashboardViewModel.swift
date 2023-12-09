//
//  HomeDashboardViewModel.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 08/12/23.
//

import Foundation
import SwiftUI
import Combine

@Observable
class HomeDashboardViewModel: ObservableObject {
    var viewModelNewEpisodes: NewEpisodesViewModel
    var viewModelChannels: ChannelsViewModel
    var viewModelCategories: CategoriesSectionViewModel
    
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
    }
    
    
    func fetchDataForViewModels() {
         DispatchQueue.global().async {
        self.viewModelNewEpisodes.getNewEpisodesList()
        self.viewModelChannels.getChannelSeriesAndCourseList()
        self.viewModelCategories.getCategoryList()
        }
        
    }
}
