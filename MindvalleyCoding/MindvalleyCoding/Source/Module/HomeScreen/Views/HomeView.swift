//
//  HomeView.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 02/12/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var newApisodeViewModel = NewEpisodesViewModel(networkManager: HomeServiceManager())
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor (Color.navigationTitleColor)]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.homeScreenBackGroundColor
                    .ignoresSafeArea()
              
                ScrollView(.vertical) {
                    VStack {
                        Spacer(minLength: 1)
//                        Text("Channel").foregroundColor(.listSectionTitleColor)
//                            .frame(maxWidth:.infinity, alignment: .topLeading)
//                            .foregroundColor(Color.navigationTitleColor)
//                            .font(.custom("Gilroy-Bold", size: 24))
//                            .padding(.leading, 16)
//                            .padding(.bottom, 16)
                        NewEpisodesCarouselView(title: "New Episodes", movies: newApisodeViewModel.newApisodesArray)
                        SeriesCourseCarouselView()
                        CategoriesSectionListView()
                        
                        //.border(.red, width: 5)
                        // containerSubView
                        //                        .frame(maxWidth: .infinity,
                        //                               maxHeight: .infinity,
                        //                               alignment: .topLeading)
                        
                    }
                }
                //progressCircleView
            }
            
            .navigationBarTitle("Channel", displayMode: .automatic).foregroundColor(.navigationTitleColor)
            //.border(.yellow)
            
        }.task {
            newApisodeViewModel.getNewEpisodesList()
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
