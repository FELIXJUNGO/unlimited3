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
    
    
    private lazy var placeAsIf1: Void = {
            print("place As If 1")
            // Load the "backsteinlampe" scene from the "Experience" Reality File
            let asif1Anchor = try! Experience.loadAsIf1()
            // Add the backsteinlampe anchor to the scene
            arView.scene.anchors.append(asif1Anchor)
    }()
    
    private lazy var placeAsIf5: Void = {
            print("place model 1")
            // Load the "backsteinlampe" scene from the "Experience" Reality File
            let asif5Anchor = try! Experience.loadAsIf5()
            // Add the backsteinlampe anchor to the scene
            arView.scene.anchors.append(asif5Anchor)
    }()
    
    private lazy var placeBacksteinlampe: Void = {
            print("place Backsteinlampe")
        // Load the "Backsteinlampe" scene from the "Experience" Reality File
        let backsteinlampeAnchor = try! Experience.loadBacksteinlampe()
        // Add the backsteinlampe anchor to the scene
        arView.scene.anchors.append(backsteinlampeAnchor)
    }()
    
    

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            
            //europaallee:
            let coordinatesAsIf5 = CLLocation(latitude: 47.37912798974054, longitude: 8.531448212342552)
            
            //vor der seebahnstras 177:
            let coordinatesBacksteinlampe = CLLocation(latitude: 47.375780322007174, longitude: 8.518149204910936)
            
            //vor der dörflistrasse:
            let coordinateAsIf1 = CLLocation(latitude: 47.407820431552096, longitude: 8.550692567599848)
            
            //vor der wäscherei dörflistr:
            let coordinate4 = CLLocation(latitude: 47.40758653521285, longitude: 8.550496480638742)
            
            //vor der dorflinde:
            let coordinate5 = CLLocation(latitude: 47.40746677430508, longitude: 8.549735834229686)
            
            //vor dem coop dorflinde:
            let coordinate6 = CLLocation(latitude: 47.407550943418755, longitude: 8.549182924998787)
            
            //paola:
            let coordinate7 = CLLocation(latitude: 47.407550943418755, longitude: 8.549182924998787)
            
            //paola:
            let coordinate8 = CLLocation(latitude: 40.20330934276662, longitude: 18.248761356020466)
            
            
            //europaallee:
            //47.37912798974054, longitude: 8.531448212342552
            
            //vor der seebahnstras 177:
            //47.375780322007174, longitude: 8.518149204910936
            
            //vor der dörflistrasse:
            //47.407820431552096, longitude: 8.550692567599848
            
            //vor der wäscherei dörflistr:
            //47.40758653521285, longitude: 8.550496480638742
            
            //vor der dorflinde:
            //47.40746677430508, longitude: 8.549735834229686
            
            //vor dem coop:
            //47.407550943418755, longitude: 8.549182924998787
            
            //paola:
            //40.20346787708908, longitude: 18.24852402248381
            
            //paola2
            //40.20330934276662, longitude: 18.248761356020466
            
            
            
            //calculations:
            let coordinateNow = location
            
            let distanceToAsIf5 = coordinatesAsIf5.distance(from: coordinateNow)
            var locationsArray = [distanceToAsIf5];
            let distanceToBacksteinlampe = coordinatesBacksteinlampe.distance(from: coordinateNow)
            locationsArray.append(distanceToBacksteinlampe)
            let distanceToAsIf1 = coordinateAsIf1.distance(from: coordinateNow)
            locationsArray.append(distanceToAsIf1)
            let distanceToModel4 = coordinate4.distance(from: coordinateNow)
            locationsArray.append(distanceToModel4)
            let distanceToModel5 = coordinate5.distance(from: coordinateNow)
            locationsArray.append(distanceToModel5)
            let distanceToModel6 = coordinate6.distance(from: coordinateNow)
            locationsArray.append(distanceToModel6)
            let distanceToModel7 = coordinate7.distance(from: coordinateNow)
            locationsArray.append(distanceToModel7)
            let distanceToModel8 = coordinate8.distance(from: coordinateNow)
            locationsArray.append(distanceToModel8)
           
            print(locationsArray);
            
            

        
            //print(distanceToAsIf5)
            
            
            if(distanceToAsIf5 <= 10)
             {
                _ = placeAsIf5
             }
            if(distanceToBacksteinlampe <= 10)
             {
                _ = placeBacksteinlampe
             }
            if(distanceToAsIf1 <= 10)
             {
                _ = placeAsIf1
             }
            if(distanceToModel4 <= 10)
             {
                _ = placeBacksteinlampe
             }
            if(distanceToModel5 <= 10)
             {
                _ = placeAsIf5
             }
            if(distanceToModel6 <= 10)
             {
                _ = placeAsIf1
             }
            if(distanceToModel7 <= 10)
             {
                _ = placeBacksteinlampe
             }
            if(distanceToModel8 <= 10)
             {
                _ = placeAsIf5
             }
            
        }
    }
}


