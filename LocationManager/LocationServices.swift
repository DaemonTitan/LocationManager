//
//  LocationServices.swift
//  LocationManager
//
//  Created by Tony Chen on 2/3/2023.
//

import Foundation
import CoreLocation
import UIKit

class LocationService:  UIViewController, CLLocationManagerDelegate{
    
    let locationManager = CLLocationManager()
    
    func initializeLocationServices() {
        locationManager.delegate = self
        
        DispatchQueue.global().async {
            guard CLLocationManager.locationServicesEnabled() else {
                return
            }
        }
                
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.showsBackgroundLocationIndicator = true
    }
    
    
}
