//
//  WaterViewController.swift
//  ULSA2023
//
//  Created by Alejandro Casillas on 28/03/23.
//

import UIKit

class WaterViewController: UIViewController {

    @IBOutlet weak var medidor: UITextField!
    var suma: Double =  0.0
    
    @IBAction func vaso(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .up {
            suma += 0.3
            medidor.text = "\(suma)"
        }
        
    }
    
    @IBAction func botella(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .up {
            suma += 0.6
            medidor.text = "\(suma)"
        }
    }
    
    
    @IBAction func litro(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .up {
            suma += 1.0
            medidor.text = "\(suma)"
        }
    }
    
    @IBAction func galon(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .up {
            suma += 1.5
            medidor.text = "\(suma)"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Consumo de agua"
        // Do any additional setup after loading the view.
    }
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        medidor.text = "0"
        
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
