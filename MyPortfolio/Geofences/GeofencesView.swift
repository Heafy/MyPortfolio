//
//  GeofencesView.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 29/03/21.
//

import MapKit
import SwiftUI

struct GeofencesView: View {
    
    // Lista de lugares para mostrar
    // Por definición solo observa un geofence
    var places: [Place]
    // Radio de la geofence
    var radius: CLLocationDistance

    @State private var locationManager = CLLocationManager()
    @StateObject private var managerDelegate = LocationDelegate()
    
    var body: some View {
        VStack {
            
            GroupBox {
                if managerDelegate.isInRegion {
                    Text("Está en la Geofence")
                        .foregroundColor(.green)
                } else {
                    Text("No está en la Geofence")
                        .foregroundColor(.red)
                }
            } //: GroupBox
            .padding()
            .multilineTextAlignment(.center)
            
            MapView(place: places.first!, radius: self.radius)
                .ignoresSafeArea()
            
            .navigationBarTitle("Geofences", displayMode: .inline)
        } //: VStack
        .onAppear(perform: {
            
            guard let place = places.first else {
                debugPrint("Can't get place")
                return
            }
            
            locationManager.delegate = managerDelegate
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            
            let circularRegion = CLCircularRegion(center: place.coordinate, radius: self.radius, identifier: place.id.uuidString)
            circularRegion.notifyOnExit = true
            circularRegion.notifyOnEntry = true
            locationManager.startMonitoring(for: circularRegion)
        })
    }
}

struct GeofencesView_Previews: PreviewProvider {
    static var previews: some View {
        GeofencesView(places: [
            Place(name: "Facultad de Ciencias", latitude: 19.324378435363094, longitude: -99.17893055616717),
        ], radius: 200)
    }
}
