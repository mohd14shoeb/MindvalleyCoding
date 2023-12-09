//
//  LoadingIndicatorView.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 07/12/23.
//

import SwiftUI

struct LoadingIndicatorView: View {
    
    let isLoading: Bool
    let error: String?
    let retryAction: (() -> ())?
    
    var body: some View {
            Group {
                if isLoading, let error = error, error.isEmpty  {
                    VStack(alignment: .center) {
                        ProgressView()
                            .controlSize(.large)
                            .progressViewStyle(CircularProgressViewStyle(tint: Color.gray))
                    }
                } else if let error = error, !error.isEmpty {
                    HStack {
                        Spacer()
                        VStack(spacing: 4) {
                            Text(error).font(.headline)
                            if self.retryAction != nil {
                                Button(action: self.retryAction!) {
                                    Text("Retry")
                                }
                                .foregroundColor(Color.blue)
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        Spacer()
                    }
                }
            }
    }
}

#Preview {
    LoadingIndicatorView(isLoading: true,
                         error: "hello error",
                         retryAction: LoadingIndicatorView.action)
    //NSError(domain: "hello india", code: 202)
    
}
extension LoadingIndicatorView {
    static var action = {
         print("hello")
     }
}
