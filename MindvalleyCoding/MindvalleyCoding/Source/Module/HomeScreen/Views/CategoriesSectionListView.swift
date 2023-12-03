//
//  CategoriesSectionListView.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 02/12/23.
//

import SwiftUI

struct CategoriesSectionListView: View {
    @StateObject private var categoryViewModel = CategoriesSectionViewModel(networkManager: HomeServiceManager())
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: categoryViewModel.gridItemLayout, spacing: 20) {
                ForEach(self.categoryViewModel.categorySectionArray ?? []) { category in
                    Text(category.name ?? "")
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.listSectionTitleColor).lineLimit(2)
                        .font(.custom("Gilroy-Regular", size: 18))
                        .padding([.leading, .trailing], 14)
                        .frame(width: 160, height: 60)
                        .background(Color.categoryBackgroundColor)
                        .cornerRadius(35)
                }
            }
            .padding([.leading, .trailing], 10)
            .task {
                categoryViewModel.getCategoryList()
            }
        }
    }
}

#Preview {
    CategoriesSectionListView().background(Color.homeScreenBackGroundColor)
}
