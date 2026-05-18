//
//  ViewLifeCycleModifier.swift
//  MindvalleyCoding
//
//  Created by Shoeb Khan on 17/12/23.
//

import Foundation
import SwiftUI

struct ViewLifeCycleModifier: ViewModifier {
    let didLoadAction: () -> Void
    let didAppearAction: (() -> Void)?
    @State
    private var appeared = false
    
    func body(content: Content) -> some View {
        content.onAppear() {
            if !appeared {
                self.appeared = true
                self.didLoadAction()
            } else {
                self.didAppearAction?()
            }
        }
    }
    
}

extension View {
    func onViewRenderCycle(didLoadAction: @escaping () -> Void,
                               didAppearAction: (() -> Void)? = nil) -> some View {
        modifier(ViewLifeCycleModifier(didLoadAction: didLoadAction, 
                                       didAppearAction: didAppearAction))
    }
}
