//
//  ViewController.swift
//  locationDemo
//
//  Created by Kevin on 2021/12/5.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    @IBOutlet var altitudeLabel : UILabel!
    @IBOutlet var angleLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //locationManager.distanceFilter = 100
        
        locationManager.requestAlwaysAuthorization()
        if (CLLocationManager.locationServicesEnabled()){
            locationManager.startUpdatingLocation()
            locationManager.startUpdatingHeading()
            print("Start...")
        }
        
        // Do any additional setup after loading the view.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currentLocation:CLLocation = locations.last!
        print("altitude" + String(currentLocation.altitude))
        altitudeLabel.text = ("altitude:" + String(currentLocation.altitude))
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        print("ohheading")
        guard newHeading.headingAccuracy > 0 else {
            return
        }
        
        let direction = newHeading.magneticHeading
        let angle = direction / 180*Double.pi
        print("angle" + String(angle))
        angleLabel.text = ("angle" + String(angle))
    }


}

