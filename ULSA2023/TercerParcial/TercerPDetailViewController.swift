//
//  TercerPDetailViewController.swift
//  ULSA2023
//
//  Created by Alejandro Casillas on 16/05/23.
//

import UIKit
import MapKit
import CoreLocation
class TercerPDetailViewController: UIViewController, CLLocationManagerDelegate{
    var detailsStates :statesModel?
    
    let locationManager = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var imagen: UIImageView!
    @IBAction func sitio(_ sender: Any) {
        if let url = URL(string: detailsStates?.sitio_web ?? "") {
            UIApplication.shared.open(url)
        }
    }
    @IBOutlet weak var platillo: UILabel!
    @IBOutlet weak var poblacion: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Estado:\( detailsStates?.name ?? "")"
        imagen.image = UIImage(named: detailsStates?.imgName ?? "")
        platillo.text  = detailsStates?.platillo
        poblacion.text = detailsStates?.poblacion
      
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy =
            kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        setPinOnMap()
        // Do any additional setup after loading the view.
    }
    
    
 
    func setPinOnMap() {
        let latitud = Double(detailsStates?.latitude ?? "0.0")
        let longitud = Double(detailsStates?.longitude ?? "0.0")
        let center = CLLocationCoordinate2D(latitude: latitud ?? 0.0, longitude: longitud ?? 0.0)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        self.mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitud ?? 0.0, longitude: longitud ?? 0.0)
        annotation.title = detailsStates?.name
        annotation.subtitle = "\(detailsStates?.capital ?? "")"
          mapView.addAnnotation(annotation)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
