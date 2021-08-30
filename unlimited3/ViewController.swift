//
//  ViewController.swift
//  unlimited3
//
//  Created by Felix Jungo on 29.08.21.
//

import UIKit
import RealityKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
let locationManager = CLLocationManager()
    
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            
            //print(location.coordinate)
            let coordinate1 = CLLocation(latitude: 47.407862, longitude: 8.550523)
            let coordinateNow = location
            let distanceInMeters = coordinate1.distance(from: coordinateNow)
            print(distanceInMeters)
            if(distanceInMeters <= 15)
             {
             print("less than 15m")
                // Load the "Box" scene from the "Experience" Reality File
                let asif5Anchor = try! Experience.loadAsIf5()
                // Add the box anchor to the scene
                arView.scene.anchors.append(asif5Anchor)
             }
             else
            {
             // out of 1 mile
             }
            
            print(distanceInMeters)
            
        }
    }
}


