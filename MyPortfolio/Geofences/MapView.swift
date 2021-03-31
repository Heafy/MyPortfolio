//
//  MapView.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 30/03/21.
//

import MapKit
import SwiftUI

struct MapView : UIViewRepresentable {
        
    var place: Place
    var radius: CLLocationDistance
    var color: Color = .purple
    
    final class Coordinator: NSObject, MKMapViewDelegate {
        
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if overlay is MKCircle {
                let circle = MKCircleRenderer(overlay: overlay)
                circle.strokeColor = UIColor(self.parent.color)
                circle.fillColor = UIColor(self.parent.color).withAlphaComponent(0.1)
                circle.lineWidth = 1
                return circle
            } else {
                return MKOverlayRenderer(overlay: overlay)
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        view.showsUserLocation = true
        // Crea una region con centro en la coordenada recibida
        let region = MKCoordinateRegion(center: place.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        view.setRegion(region, animated: true)
        // Crea el punto central
        let annotation = MKPointAnnotation()
        

        annotation.title = self.place.name
        annotation.coordinate = place.coordinate
        view.addAnnotation(annotation)
        // Crea el ciruclo
        let circle = MKCircle(center: place.coordinate, radius: self.radius)
        view.addOverlay(circle)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(place: Place(name: "Facultad de Ciencias", latitude: 19.324378435363094, longitude: -99.17893055616717), radius: 20)
    }
}
