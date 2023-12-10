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
    
    // MARK: Observer property
    @ObservedObject var viewModelNewEpisodes: NewEpisodesViewModel
    @ObservedObject var viewModelChannels: ChannelsViewModel
    @ObservedObject var viewModelCategories: CategoriesSectionViewModel
    @Published var isLoadingShowing = true
    @Published var error = ""
    
    private var cancellables = Set<AnyCancellable>()
   
    // MARK: Initilize property
    init(networkManager: HomeServiceable,
         cancellables: Set<AnyCancellable> = Set<AnyCancellable>()) {
        self.viewModelNewEpisodes = NewEpisodesViewModel(networkManager: networkManager)
        self.viewModelChannels = ChannelsViewModel(networkManager: networkManager)
        self.viewModelCategories = CategoriesSectionViewModel(networkManager: networkManager)
        self.cancellables = cancellables
    }
    
    
    
    // MARK: fetch All API
    func fetchHomeDashboardResponse() {
        self.error = ""
        self.isLoadingShowing = true
        self.fetchNewEpisodesViewModels()
        self.fetchSeriesAndCourseViewModels()
        self.fetchCategoryListViewModels()
    }
    
    // MARK: Fetch NewEpisodesViewModels
    func fetchNewEpisodesViewModels() {
        self.viewModelNewEpisodes.getNewEpisodesList {  [weak self] isLoadingShowing, error in
            guard let self = self else { return }
            self.error = error ?? ""
            self.viewModelNewEpisodes.$newApisodesArray
                .sink { newData in
                    if let newchnageData = newData, !newchnageData.isEmpty {
                        self.isLoadingShowing = false
                    }
                }
                .store(in: &self.cancellables)
        }
        
    }
    
    // MARK: Fetch SeriesAndCourseViewModels
    func fetchSeriesAndCourseViewModels() {
        self.viewModelChannels.getChannelSeriesAndCourseList { [weak self] isLoadingShowing, error in
            guard let self = self else { return }
            self.error = error ?? ""
            self.viewModelChannels.$channelsArray
                .sink { newData in
                    if let newchnageData = newData, !newchnageData.isEmpty {
                        self.isLoadingShowing = false
                    }
                }
                .store(in: &self.cancellables)
        }
        
    }
    
    // MARK: Fetch CategoryListViewModels
    func fetchCategoryListViewModels() {
        self.viewModelCategories.getCategoryList { [weak self] isLoadingShowing, error in
            guard let self = self else { return }
            self.error = error ?? ""
            self.viewModelCategories.$categories
                .sink { newData in
                    if let newchnageData = newData, !newchnageData.isEmpty {
                        self.isLoadingShowing = false
                    }
                }
                .store(in: &self.cancellables)
        }
        
    }
    
}
