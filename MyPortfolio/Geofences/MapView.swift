//
//  MapView.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 30/03/21.
//

import MapKit
import SwiftUI

struct MapView : UIViewRepresentable {
    
    //@Binding var centerCoordinate: MKCoordinateRegion
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        view.showsUserLocation = true
        let coordinate = CLLocationCoordinate2D(
            latitude: 19.28575286200017, longitude: -99.12999353867754)
        let region = MKCoordinateRegion(center: view.userLocation.location?.coordinate ?? coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        view.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

extension MKPointAnnotation {
    static var example: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = "London"
        annotation.subtitle = "Home to the 2012 Summer Olympics."
        annotation.coordinate = CLLocationCoordinate2D(latitude: 51.5, longitude: -0.13)
        return annotation
    }
}
