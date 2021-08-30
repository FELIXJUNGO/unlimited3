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
        
    }
    
    private lazy var placeAsIf5: Void = {
            print("place model 1")
            // Load the "Box" scene from the "Experience" Reality File
            let asif5Anchor = try! Experience.loadAsIf5()
            // Add the box anchor to the scene
            arView.scene.anchors.append(asif5Anchor)
    }()
    
    private lazy var placeBox: Void = {
            print("place Box")
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
    }()
    
    

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            
            //print(location.coordinate)
            let coordinatesAsIf5 = CLLocation(latitude: 47.407862, longitude: 8.550523)
            let coordinatesBox = CLLocation(latitude: 47.407862, longitude: 8.550523)
            let coordinate3 = CLLocation(latitude: 47.407862, longitude: 8.550523)
            let coordinate4 = CLLocation(latitude: 47.407862, longitude: 8.550523)
            let coordinate5 = CLLocation(latitude: 47.407862, longitude: 8.550523)
            
            let coordinateNow = location
            let distanceToAsIf5 = coordinatesAsIf5.distance(from: coordinateNow)
            let distanceToModel2 = coordinatesBox.distance(from: coordinateNow)
            let distanceToModel3 = coordinate3.distance(from: coordinateNow)
            let distanceToModel4 = coordinate4.distance(from: coordinateNow)
            let distanceToModel5 = coordinate5.distance(from: coordinateNow)
            

            
            
            print(distanceToAsIf5)
            if(distanceToAsIf5 <= 10)
             {
                _ = placeAsIf5
             }
            if(distanceToModel2 <= 10)
             {
                _ = placeBox
             }
            if(distanceToModel3 <= 10)
             {
                _ = placeAsIf5
             }
            if(distanceToModel4 <= 10)
             {
                _ = placeAsIf5
             }
            if(distanceToModel5 <= 10)
             {
                _ = placeAsIf5
             }
            
        }
    }
}


