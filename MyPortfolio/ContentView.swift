//
//  ContentView.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 26/03/21.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                
                NavigationLink(
                    destination: AuthView(),
                    label: {
                        Text("Face & Touch ID")
                    })
                
                NavigationLink(
                    destination: NotificationView(),
                    label: {
                        Text("Notifications")
                    })
                
                NavigationLink(
                    destination: GeofencesView(),
                    label: {
                        Text("Geofences")
                    })
                
                NavigationLink(
                    destination: SelectImageView(),
                    label: {
                        Text("Select image")
                    })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
