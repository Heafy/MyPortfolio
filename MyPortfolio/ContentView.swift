//
//  ContentView.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 26/03/21.
//

import SwiftUI

struct ContentView: View {
    
    var options: [MenuOption] = [
        MenuOption(name: "Face & Touch ID", systemImage: "faceid", view: AnyView(AuthView())),
        MenuOption(name: "Custom Notifications", systemImage: "bell.badge", view: AnyView(NotificationView())),
        MenuOption(name: "Geofences", systemImage: "mappin.and.ellipse", view: AnyView(GeofencesView(places: [
            Place(name: "Facultad de Ciencias", latitude: 19.324378435363094, longitude: -99.17893055616717),
        ], radius: 100))),
        MenuOption(name: "Image selector", systemImage: "photo.on.rectangle", view: AnyView(SelectImageView())),
        MenuOption(name: "Search List", systemImage: "tortoise", view: AnyView(SearchListView())),
        MenuOption(name: "VisionKit", systemImage: "doc.text.viewfinder", view: AnyView(VisionKitView())),
        MenuOption(name: "Forms", systemImage: "doc.text", view: AnyView(FormsView()))
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
            .navigationTitle("Features")
        } //: NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
