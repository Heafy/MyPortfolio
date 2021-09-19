//
//  DesignView.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 31/03/21.
//

import SwiftUI

struct DesignView: View {
    
    var options: [MenuOption] = [
        MenuOption(name: "Onboarding", systemImage: "square.and.line.vertical.and.square", view: AnyView(OnboardingView())),
        MenuOption(name: "Logo Designer", systemImage: "sun.min", view: AnyView(SymbolView())),
        MenuOption(name: "Redacted", systemImage: "infinity", view: AnyView(RedactedView())),
        MenuOption(name: "Custom fonts", systemImage: "character", view: AnyView(CustomFontsView()))
        
    ]
    
    var body: some View {
        List {
            ForEach(options) {
                item in
                NavigationLink(
                    destination: item.view,
                    label: {
                        RowView(option: item)
                    })
            } //: ForEach
        } //: List
        .settingsBarButton()
        .navigationTitle("Design")
    }
}

struct DesignView_Previews: PreviewProvider {
    static var previews: some View {
        DesignView()
    }
}
