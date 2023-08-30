//
//  ViewController.swift
//  LocationManager
//
//  Created by Tony Chen on 23/2/2023.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    private let coordinateLabel: UILabel = {
        let coordinateLabel = UILabel()
        coordinateLabel.text = "This is a test label"
        coordinateLabel.textColor = .black
        coordinateLabel.font = .systemFont(ofSize: 30)
        coordinateLabel.textAlignment = NSTextAlignment.center
        coordinateLabel.translatesAutoresizingMaskIntoConstraints = false
        return coordinateLabel
    }()
    
    let locationManager = CLLocationManager()
    //let locationInit = LocationService()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(coordinateLabel)
        initializeLocationServices()
        
        NSLayoutConstraint.activate([
            coordinateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            coordinateLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            coordinateLabel.widthAnchor.constraint(equalToConstant: 300),
            coordinateLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        // Do any additional setup after loading the view.
    }
}

extension ViewController: CLLocationManagerDelegate {
    
    private func initializeLocationServices() {
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
    
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            print("not Determined")
        case .restricted:
            print("retricted")
        case .denied:
            print("denied")
            Alert.showLocationRequiredAlert(on: self)
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()           
        @unknown default:
            print("unknow")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lat = locations[0].coordinate.latitude
        let lon = locations[0].coordinate.longitude
        print("\(lat) | \(lon)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}


