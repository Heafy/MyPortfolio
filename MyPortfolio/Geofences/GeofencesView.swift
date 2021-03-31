//
//  GeofencesView.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 29/03/21.
//

import MapKit
import SwiftUI

struct GeofencesView: View {
    
    let places = [
        Place(name: "Facultad de Ciencias", latitude: 19.324378435363094, longitude: -99.17893055616717),
        //Place(name: "Oasis Coyoacán", latitude: 19.345825571951718, longitude: -99.17963082130434)
    ]
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 19.324378435363094, longitude: -99.17893055616717), latitudinalMeters: 10000, longitudinalMeters: 10000)
    
    @State private var tracking: MapUserTrackingMode = .follow
    @State private var locationManager = CLLocationManager()
    @StateObject private var managerDelegate = LocationDelegate()
    
    var body: some View {
        VStack {
            
            Group {
                if managerDelegate.isInRegion {
                    Text("Está en la Geofence")
                        .foregroundColor(.green)
                } else {
                    Text("No está en la Geofence")
                        .foregroundColor(.red)
                }
            } //: Group
            .padding()
            .multilineTextAlignment(.center)
            
            Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: $tracking, annotationItems: places) {
                place in
                MapMarker(coordinate: place.coordinate)
            }
            .navigationBarTitle("Geofences", displayMode: .inline)
        } //: VStack
        .onAppear(perform: {
            locationManager.delegate = managerDelegate
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            
            let geoFCoord = CLLocationCoordinate2D(latitude: 19.324378435363094, longitude: -99.17893055616717)
            let geoFRegion = CLCircularRegion(center: geoFCoord, radius: 500, identifier: "dsfdwfefewfw")
            geoFRegion.notifyOnExit = true
            geoFRegion.notifyOnEntry = true
            locationManager.startMonitoring(for: geoFRegion)
        })
    }
}

struct GeofencesView_Previews: PreviewProvider {
    static var previews: some View {
        GeofencesView()
    }
}
