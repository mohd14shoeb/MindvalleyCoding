//
//  HomeView.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 02/12/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var newApisodeViewModel = NewEpisodesViewModel(networkManager: HomeServiceManager())
    @StateObject private var categoryViewModel = CategoriesSectionViewModel(networkManager: HomeServiceManager())
    @StateObject private var channelViewModel = ChannelsViewModel(networkManager: HomeServiceManager())
    
//    init() {
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor (Color.navigationTitleColor)]
//    }
//    
    var body: some View {
        NavigationView {
            ZStack {
                Color.homeScreenBackGroundColor
                    .ignoresSafeArea()
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        if let newEpisodes = newApisodeViewModel.newApisodesArray {
                            titleView
                            NewEpisodesGridLayoutView(title: "New Episodes", movies: newEpisodes, gridItemLayout: newApisodeViewModel.gridItemLayout)
                        }
                        if let channels = self.channelViewModel.channelsArray, !channels.isEmpty {
                            SeriesCourseCarouselView(channelsArray: channels)
                        }
                        if let categories = categoryViewModel.categorySectionArray, !categories.isEmpty {
                            CategoriesSectionListView(title: "Browse by categories", gridItemLayout: categoryViewModel.gridItemLayout, categorySectionArray: categories)
                        }
                    }
                }
                //progressCircleView
            }
            .navigationBarTitle("")
            .navigationBarHidden(false)
           .preferredColorScheme(.dark)
//            .navigationBarTitle("Channel", displayMode: .automatic).foregroundColor(.navigationTitleColor)
            //.border(.yellow)
            
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
