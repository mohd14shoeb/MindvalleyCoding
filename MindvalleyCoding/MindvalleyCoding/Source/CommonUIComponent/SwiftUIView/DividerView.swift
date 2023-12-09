//
//  DividerView.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 09/12/23.
//

import SwiftUI

struct DividerView: View {
    private let height: CGFloat
    private let color: Color
    private let padding: CGFloat
    
    init(height: CGFloat, color: Color, padding: CGFloat) {
        self.height = height
        self.color = color
        self.padding = padding
    }
    
    var body: some View {
        Divider()
            .frame(height: self.height)
            .overlay(self.color)
            .padding([.leading,.trailing], self.padding)
    }
}

#Preview {
    DividerView(height: 1.0, color: .gray, padding: 16)
}
