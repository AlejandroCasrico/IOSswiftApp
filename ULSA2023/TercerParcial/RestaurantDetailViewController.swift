//
//  RestaurantDetailViewController.swift
//  ULSA2023
//
//  Created by Alejandro Casillas on 04/05/23.
//

import UIKit
import MapKit
class RestaurantDetailViewController: UIViewController {
    var detailsRestaurant :restaurantModel?
    
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func call(_ sender: Any) {
        if let url = URL(string: "tel://\(detailsRestaurant?.phone ?? "")"),
           UIApplication.shared.canOpenURL(url) {
           UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func webSite(_ sender: Any) {
        if let url = URL(string: detailsRestaurant?.webSite ?? "") {
            UIApplication.shared.open(url)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = detailsRestaurant?.name
        imagen.image = UIImage(named: detailsRestaurant?.imgName ?? "")
        setPinOnMap()
    }
    func setPinOnMap() {
        let latitud = Double(detailsRestaurant?.latitude ?? "0.0")
        let longitud = Double(detailsRestaurant?.longitude ?? "0.0")
        let center = CLLocationCoordinate2D(latitude: latitud ?? 0.0, longitude: longitud ?? 0.0)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        self.mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitud ?? 0.0, longitude: longitud ?? 0.0)
        annotation.title = detailsRestaurant?.name
          annotation.subtitle = "Ubicación"
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
