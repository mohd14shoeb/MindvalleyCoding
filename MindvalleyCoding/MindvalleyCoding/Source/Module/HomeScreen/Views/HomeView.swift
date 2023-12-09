//
//  HomeView.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 02/12/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var ViewModel = HomeDashboardViewModel(networkManager: HomeServiceManager())
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.homeScreenBackGroundColor
                    .ignoresSafeArea()
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        if ViewModel.isLoadingShowing {
                            LoadingIndicatorView(isLoading: ViewModel.isLoadingShowing,
                                                 error: ViewModel.error) {
                                self.getAllAPICall()
                            }.position(x: CGFloat(Int(UIScreen.main.bounds.size.width) / 2),
                                       y: CGFloat(Int(UIScreen.main.bounds.size.height) / 2) - 100)
                        } else {
                            titleView
                            if let newEpisodes = ViewModel.viewModelNewEpisodes.newApisodesArray,
                                !newEpisodes.isEmpty {
                                NewEpisodesGridLayoutView(title: NewEpisodesResponse.newEpisodeTitle,
                                                          movies: newEpisodes,
                                                          gridItemLayout: NewEpisodesResponse.gridItemLayout)
                            }
                            if let channels = ViewModel.viewModelChannels.channelsArray,
                                !channels.isEmpty {
                                SeriesCourseCarouselView(channelsArray: channels)
                            }
                            if let categories = ViewModel.viewModelCategories.categories,
                                !categories.isEmpty {
                                CategoriesSectionListView(title: CategoriesResponse.categoryTitle,
                                                          gridItemLayout: CategoriesResponse.gridItemLayout,
                                                          categories: categories)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(false)
            .preferredColorScheme(.dark)
            
        }.navigationViewStyle(StackNavigationViewStyle())
            .task {
                self.getAllAPICall()
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
    func getAllAPICall() {
        self.ViewModel.fetchHomeDashboardResponse()
    }
}

#Preview {
    HomeView()
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }
    
}
