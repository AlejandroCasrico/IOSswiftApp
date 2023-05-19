//
//  InternationalizationyDataViewController.swift
//  ULSA2023
//
//  Created by Alejandro Casillas on 16/03/23.
//

import UIKit

class InternationalizationyDataViewController: UIViewController {

    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblAdress: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var Name: UITextField!
    
    @IBOutlet weak var direccion: UITextField!
    
    @IBOutlet weak var telefono: UITextField!
    @IBAction func send(_ sender: Any) {
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as!
        ViewDetailViewController
        let name = Name.text
        destinationVC.nameFromPreviousView = name
        let address = direccion.text
        destinationVC.directionFromPreviousView = address
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Formulario"
        lblName.text = NSLocalizedString("name", comment: "user name")
        lblAdress.text = NSLocalizedString("address", comment: "user address")
        lblPhone.text = NSLocalizedString("phone", comment: "user phone")
        // Do any additional setup after loading the view.
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
