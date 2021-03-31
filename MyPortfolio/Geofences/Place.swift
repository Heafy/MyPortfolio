//
//  PLace.swift
//  MyPortfolio
//
//  Created by Jorge Martinez on 30/03/21.
//

import CoreLocation
import Foundation

struct Place: Identifiable {
    
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
