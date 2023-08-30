//
//  AlertManager.swift
//  LocationManager
//
//  Created by Tony Chen on 28/2/2023.
//

import Foundation
import UIKit

struct Alert {
    
    private static func showBasicAlert(on vc: ViewController, with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let settingAction = UIAlertAction(title: "Setting", style: .cancel, handler: { action in
            let alert = Alert()
            alert.openSettings()
        })
        let dismissAction = UIAlertAction(title: "Dismiss", style: .default, handler: { action in
            print("Tapped Dismiss")
        })
        
        alert.addAction(settingAction)
        alert.addAction(dismissAction)
        vc.present(alert, animated: true)
    }
    
    func openSettings() {
        if let url = URL.init(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    static func showLocationRequiredAlert(on vc: UIViewController) {
        showBasicAlert(on: vc as! ViewController, with: "Need location", message: "Please go to settings")
    }
    
    static func showUnableToRetrieveDataAlert(on vc: UIViewController) {
        showBasicAlert(on: vc as! ViewController, with: "Unable to Retrieve Data", message: "There was a network error, please try again")
    }
}
