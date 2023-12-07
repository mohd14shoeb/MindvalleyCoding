//
//  HomeView.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 02/12/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var newApisodeViewModel = NewEpisodesViewModel()
    @ObservedObject private var categoryViewModel = CategoriesSectionViewModel()
    @ObservedObject private var channelViewModel = ChannelsViewModel()
 
    var body: some View {
        NavigationView {
            ZStack {
                Color.homeScreenBackGroundColor
                    .ignoresSafeArea()
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        titleView
                        if let newEpisodes = newApisodeViewModel.newApisodesArray, !newEpisodes.isEmpty {
                            NewEpisodesGridLayoutView(title: NewEpisodesResponse.newEpisodeTitle,
                                                      movies: newEpisodes,
                                                      gridItemLayout: NewEpisodesResponse.gridItemLayout)
                        }
                        if let channels = channelViewModel.channelsArray, !channels.isEmpty {
                            SeriesCourseCarouselView(channelsArray: channels)
                        }
                        if let categories = categoryViewModel.categories, !categories.isEmpty {
                            CategoriesSectionListView(title: CategoriesResponse.categoryTitle,
                                                      gridItemLayout: CategoriesResponse.gridItemLayout,
                                                      categories: categories)
                        }                    }
                }
                //progressCircleView
            }
            .navigationBarTitle("")
            .navigationBarHidden(false)
           .preferredColorScheme(.dark)
  
        }.task {
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
        DispatchQueue.global().async {
            self.newApisodeViewModel.getNewEpisodesList()
            self.channelViewModel.getChannelSeriesAndCourseList()
            self.categoryViewModel.getCategoryList()
        }
       
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
