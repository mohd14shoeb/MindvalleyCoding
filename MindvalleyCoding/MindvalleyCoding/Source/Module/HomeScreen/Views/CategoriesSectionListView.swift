//
//  CategoriesSectionListView.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 02/12/23.
//

import SwiftUI

struct CategoriesSectionListView: View {
   
    private let title: String
    private let gridItemLayout: [GridItem]
   private let categorySectionArray: [Category]
    
    init(title: String, gridItemLayout: [GridItem], 
         categorySectionArray: [Category]) {
        self.title = title
        self.gridItemLayout = gridItemLayout
        self.categorySectionArray = categorySectionArray
    }
   
    var body: some View {
        LazyVStack(alignment: .leading) {
            Text(title)
                .font(.custom("Gilroy-Bold", size: 20))
                .foregroundColor(Color.newApisodesTitleColor)
                .padding([.leading,.trailing], 14)
                .padding([.top,.bottom], 24)
        }
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: gridItemLayout, spacing: 20) {
                ForEach(self.categorySectionArray) { category in
                    Text(category.name ?? "")
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.listSectionTitleColor).lineLimit(2)
                        .font(.custom("Gilroy-Bold", size: 20))
                        .padding([.leading, .trailing], 14)
                        .frame(width: 160, height: 60)
                        .background(Color.categoryBackgroundColor)
                        .cornerRadius(35)
                }
            }
            .padding([.leading, .trailing], 10)
        }
    }
}

#Preview {
    CategoriesSectionListView(title: "Browse by categories", 
                              gridItemLayout: CategoriesResponse.gridItemLayout,
                              categorySectionArray:
                                CategoriesResponse.stubbedCategorys)
}
