//
//  LoadingIndicatorView.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 07/12/23.
//

import SwiftUI

struct LoadingIndicatorView: View {
    
    let isLoading: Bool
    let error: NSError?
    let retryAction: (() -> ())?
    
    var body: some View {
        Group {
            if isLoading {
                VStack(alignment: .center) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.yellow))
                        .padding(.vertical, 20)
                }
                .frame(width: 30, height: 30)
            } else if error != nil {
                HStack {
                    Spacer()
                    VStack(spacing: 4) {
                        Text(error!.localizedDescription).font(.headline)
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
    LoadingIndicatorView(isLoading: true, error: NSError(domain: "hello india", code: 202), retryAction: LoadingIndicatorView.action)
    
}
extension LoadingIndicatorView {
    static var action = {
         print("hello")
     }
}
