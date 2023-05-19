//
//  MapViewController.swift
//  ULSA2023
//
//  Created by Alejandro Casillas on 27/04/23.
//

import UIKit
import MapKit
import CoreLocation
class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapa: MKMapView!
    
    @IBAction func emergencia(_ sender: Any) {
        
        
    }
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.title = "Maps"
       // mapView?.delegate = self?
        
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy =
            kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        // Do any additional setup after loading the view.
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D =
                manager.location?.coordinate else {return}
        print("locations=\(locValue.latitude)\(locValue.longitude)")
        
        if let locations = locations.last{
            let center = CLLocationCoordinate2D(latitude: locations.coordinate.latitude,
                                                longitude:locations.coordinate.longitude)
            let region = MKCoordinateRegion(center: center,span:MKCoordinateSpan(latitudeDelta:0.01,
                                                              longitudeDelta:0.01))
            self.mapa.setRegion(region,animated:true)
            
            
            let annotation = MKPointAnnotation()
            annotation.coordinate =  locValue
            annotation.title = "ULSA"
            annotation.subtitle = "CHIHUAHUA"
            mapa.addAnnotation(annotation)
        }
    }
    
    
    
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


