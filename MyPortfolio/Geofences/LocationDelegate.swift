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
            manager.startUpdatingLocation()
        } else {
            manager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        debugPrint("Location updated: \(String(describing: locations.last?.coordinate))")
    }
    
    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        debugPrint("Did start monitoring: \(region.identifier)")
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        debugPrint("Exit region: \(region.identifier)")
        self.isInRegion = false
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        debugPrint("Enter region: \(region.identifier)")
        self.isInRegion = true
    }
    
}
