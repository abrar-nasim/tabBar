//
//  ViewController.swift
//  TabBar
//
//  Created by Md Abrar Nasim on 07/03/23.
//

import UIKit
import MapKit
import GoogleMaps
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var viewMAP: UIView!
    @IBOutlet weak var viewMap: MKMapView!
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        GMSServices.provideAPIKey("AIzaSyDjrTtBHfdo2ay8mlxUqZVHXO7cWjlXm44")

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else{
            return
        }
        
        let cordinate = location.coordinate
        let camera = GMSCameraPosition.camera(withLatitude: cordinate.latitude, longitude: cordinate.longitude, zoom: 9.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
              
        
        
        self.viewMAP.addSubview(viewMap)
        
        // Creates a marker in the center of the map.
        var marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: cordinate.latitude, longitude: cordinate.longitude)
        marker.title = "Mumbai"
        marker.snippet = "India"
        marker.map = mapView
        
        marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 19.0439758, longitude: 72.9504469)
        marker.title = "Mgm New Bombay Hospital"
        marker.snippet = "Near Mumbai Suburban"
        marker.map = mapView
        
        marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 18.941404637627866,  longitude: 72.82744677189032)
        marker.title = "Bombay Hospital and Medical Research Center"
        marker.snippet = "Mumbai"
        marker.map = mapView
        
        
        
    }
    
}




