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
        MenuOption(name: "Logo Designer", systemImage: "sun.min", view: AnyView(SymbolView()))
    ]
    
    var body: some View {
        NavigationView {
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
            .navigationTitle("Design")
        } //: NavigationView
    }
}

struct DesignView_Previews: PreviewProvider {
    static var previews: some View {
        DesignView()
    }
}
