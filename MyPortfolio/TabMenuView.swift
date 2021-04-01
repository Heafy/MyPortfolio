//
//  TabMenuView.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 31/03/21.
//

import SwiftUI

struct TabMenuView: View {
    
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "hammer")
                    Text("Features")
                }
            DesignView()
                .tabItem {
                    Image(systemName: "pencil.and.outline")
                    Text("Design")
                }
        }
    } //: TabView
}

struct TabMenuView_Previews: PreviewProvider {
    static var previews: some View {
        TabMenuView()
    }
}
