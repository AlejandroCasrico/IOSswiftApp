//
//  SumViewController.swift
//  Ejemplo
//
//  Created by Alejandro Casillas on 26/01/23.
//

import UIKit

class SumViewController: UIViewController {

    @IBOutlet weak var txtField2: UITextField!
    @IBOutlet weak var txtField1: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Suma de dos num"

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sumNumbers(_ sender: Any) {
        let firstNumber = Double(txtField1.text
                                 ?? "0.0") ?? 0.0
        let secondNumber = Double(txtField2.text
                                  ?? "0.0") ?? 0.0
        
        let sum = firstNumber + secondNumber
        print("la suma es\(sum)")
        
        let alert = UIAlertController(title: "Suma", message:"El resultado de la suma es:\(sum)", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil ))
            
        self.present(alert, animated: true,completion: nil)
        
        
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake{
            txtField2.text = ""
            txtField1.text = ""
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

}
