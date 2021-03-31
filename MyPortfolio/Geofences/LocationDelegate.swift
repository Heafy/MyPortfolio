//
//  LocationFetcher.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 29/03/21.
//

import CoreLocation
import Foundation

class LocationDelegate: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var isInRegion: Bool = false
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse {
            print("Authorized")
            manager.startUpdatingLocation()
        } else {
            print("Not authorized")
            manager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Location updated: \(locations.last?.coordinate)")
    }
    
    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        print("Did start monitoring: \(region.identifier)")
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("Salio de la region: \(region.identifier)")
        self.isInRegion = false
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("Entro a la región")
        self.isInRegion = true
    }
    
}
