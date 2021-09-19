//
//  SettingsViewModifier.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 22/06/21.
//

import SwiftUI

struct SettingsViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(
                        destination: SettingsView(),
                        label: {
                            Image(systemName: "gear")
                                .resizable()
                        })
                } //: ToolBar Item
            } //: Toolbar
    }
}

extension View {
    
    @ViewBuilder
    func settingsBarButton() -> some View {
        self.modifier(SettingsViewModifier())
    }
}
